Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A314C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:25:57 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web09.17854.1665559554178956812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pianon.eu header.s=mail20151219 header.b=vdobZ6ig;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id B27045C0096;
	Wed, 12 Oct 2022 09:25:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:user-agent:subject:subject:from:from:date:date
	:content-transfer-encoding:content-type:content-type
	:mime-version; s=mail20151219; t=1665559551; x=1667373952; bh=Le
	CnSkCrrEm3bEIHAtefxihD0bFlYSR7Yr7zmg0T8QI=; b=vdobZ6igYOgC0XQRt4
	dbXpWD0+1cR/FtrLcS1wxdeZFaY0XP7rK/o66pYtdiWldhhCdLMHHpotFqweIGPX
	Npt2kP4Rxsxl+E+dMupD0N4qlNS+yBuHTdz0MQqGadBXVl+2p1zhnzu2C1VVkWUP
	ZYMugPVABUYNV1tuTYlamQOcI=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HvxD_1ONBnH3; Wed, 12 Oct 2022 09:25:51 +0200 (CEST)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id 012585C0095;
	Wed, 12 Oct 2022 09:25:50 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Oct 2022 09:25:50 +0200
From: Alberto Pianon <alberto@pianon.eu>
To: openembedded-core@lists.openembedded.org
Cc: marta.rybczynska@linaro.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, 'Carlo Piana' <carlo@piana.eu>
Subject: severe issue in CVE checker
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171653

All, Marta, Richard,

while implementing stats aggregation for CVE metadata in the Oniro 
project, I encountered a severe issue in Yocto's CVE checker, apparently 
due to this: 
https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81

It appears that when cve-update-db-native fails to fetch some years of 
NIST CVE db, it just issues a warning but goes on anyway.

The result is that in some builds, randomly (depending on NIST webserver 
timeouts or other connection problems), CVE db is not complete, so the 
CVE check returns false negatives (i.e. no vulnerabilities found in some 
components even if such vulnerabilities do exist)

I ran into such problem because in Oniro we need aggregate data from 
different builds for a large target matrix; I added a check to check 
that CVE metadata for each component are the same in all builds, and it 
failed, so I tried to figure out the cause and I found this:

- in a build where cve-check found a vulnerability for acl:
     $ sqlite3 build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
     sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
     CVE-2009-4411
     sqlite>

- in another build where cve-check did not found any vulnerability for 
the very same version of acl:
     $ sqlite3 build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
     sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
     sqlite>

so I listed both CVE db files in those two builds and this is what I 
got:

     $ ls -ll build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db 
build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
     -rw-r--r-- 1 ubuntu ubuntu 215093248 Oct 11 10:56 
build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
     -rw-r--r-- 1 ubuntu ubuntu     28672 Oct 11 10:00 
build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db

The two CVE db files were fetched just about 1h apart, but the second 
file is apparently incomplete.

I checked the log for the second build, and I found this:

     WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE 
data ([Errno 99] Cannot assign requested address)
     NOTE: recipe cve-update-db-native-1.0-r0: task do_fetch: Succeeded

Fetch fails, but do_fetch task succeeds.

So I looked into the recipe's code, and I found this: 
https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81

It iterates over NIST CVE db years, but if some year fail to download, 
it goes on anyway, and it still merges the successful downloads into 
nvdcve_1.1.db, without returning error.

IMHO this is a severe issue because it may silently lead to false 
negatives in the CVE check. If some downloads fail due to timeouts or 
other connection problems, cve-check should retry a number of times, and 
if any download still fails, cve-update-db-native do_fecth should fail, 
and it turn all do_cve_check tasks should fail, since doing a CVE check 
against a corrupted/incomplete CVE database is clearly useless

Regards,

Alberto

