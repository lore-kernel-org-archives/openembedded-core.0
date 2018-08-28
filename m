Return-Path: <marco.oman@innovatrieste.it>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Aug 2018 11:52:44 UTC
Received: from mailserver.innovatrieste.it (mailserver.innovatrieste.com
	[147.123.5.60])
	by mail.openembedded.org (Postfix) with ESMTP id 7692678DEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 11:52:44 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mailserver.innovatrieste.it (Postfix) with ESMTP id C1C141E3804B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:44:10 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mailserver.innovatrieste.it C1C141E3804B
Authentication-Results: mailserver.innovatrieste.it;
	dmarc=fail (p=none dis=none)
	header.from=innovatrieste.it
Authentication-Results: mailserver.innovatrieste.it;
	spf=fail smtp.mailfrom=marco.oman@innovatrieste.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=innovatrieste.it;
	s=default; t=1535456650;
	bh=VDPYsMnURgYlNGJt9S4EX8lT5F8PCBDaSRwDr1QCfvY=;
	h=To:From:Subject:Date;
	b=i4wj2k1grA5zHxSgyOQPYXZoFuOPUHMkWpqiSCR1CGo63ZwafYr1C8m815mSNv5mJ
	946WTgXe7/fOaMKUqADNt0+vyHY2BjgtmkYlmnGYennTrC5h+KZWGiVo6fdSOmp7M/
	tcky5wUUrQMCe5bS0DRNla2puyV+BoOR8Hjv8qIc=
X-Virus-Scanned: Mailserver - Amavis
Received: from mailserver.innovatrieste.it ([127.0.0.1])
	by localhost (mailserver.innovatrieste.it [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ryPtj2FR40KM
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:44:08 +0200 (CEST)
Received: from [192.168.244.34] (unknown [192.168.244.34])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(Client CN "Marco Oman", Issuer "INNOVA S.p.A." (verified OK))
	by mailserver.innovatrieste.it (Postfix) with ESMTPSA id 53BF71E3804A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=innovatrieste.it;
	s=default; t=1535456648;
	bh=VDPYsMnURgYlNGJt9S4EX8lT5F8PCBDaSRwDr1QCfvY=;
	h=To:From:Subject:Date;
	b=FA2k0ujPjdv1I1aUYqDDxxvrRvUG95zgmQgcUgBedaxZOUOuVnu0CeWWT8P1GspSf
	wGbYe5NG8Y6JwNztKVWVF5LPpE0r2KZ+YlWvFJ1Bo7FSTlf0ksIy/jLdusgR8/gumN
	Yf5O9H+In8bMGvKa30jCwmcsL59ERfONNp0w5zh8=
To: openembedded-core@lists.openembedded.org
From: Marco Oman <marco.oman@innovatrieste.it>
Message-ID: <2f3b7c17-9233-5159-59bb-73e6858eebca@innovatrieste.it>
Date: Tue, 28 Aug 2018 13:44:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Subject: devtool recipe not working outside workspace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 11:52:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: it-IT

Hi to all,

I am trying to build a recipe for pm2 (process manager for nodejs 
tasks). I have followed what described here:
https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM, section "NPM 
projects in Development" (projects under git)

So I gave the command

  devtool add https://github.com/Unitech/pm2.git

and then

bitbake pm2

Then added a patch. Everything is OK. At the end I moved the recipe 
under my layer (sources/meta-mycompany/recipes-devtools/pm2)
and issued the command

devtool reset pm2

But from here on nothing seems to work. For example I have the following 
error while applying a patch (that exists, and I can apply a .txt 
version of it by a python do_patch_append).  Without the patch I get a 
different error (pm2-3.0.4+gitAUTOINC+5a8dd7dd4f-r0 do_populate_lic: QA 
Issue: pm2: LIC_FILES_CHKSUM points to an invalid file: 
/home/user/yocto/build/tmp/work/armv7at2hf-neon-fslc-linux-gnueabi/pm2/3.0.4+gitAUTOINC+5a8dd7dd4f-r0/npmpkg/GNU-AGPL-3.0.txt). 


It looks like it is pointing to the wrong place, the overall impression 
is of a basic underlying flaw that pops out in different forms. Any hint 
or debugging suggestions?

Excerpt from the error log:

ERROR: pm2-3.0.4+gitAUTOINC+5a8dd7dd4f-r0 do_patch: Command Error: 
'quilt --quiltrc 
/home/user/yocto/build/tmp/work/armv7at2hf-neon-fslc-linux-gnueabi/pm2/3.0.4+gitAUTOINC+5a8dd7dd4f-r0/recipe-sysroot-native/etc/quiltrc 
push' exited with 0  Output:
Applying patch 0001-Removed-openrc-deps.patch
can't find file to patch at input line 14
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 5cb1a8599eca3588d62da4619e82f7356ee6cefb Mon Sep 17 00:00:00 2001
|From: xxx
|Date: Tue, 28 Aug 2018 11:18:04 +0200
|Subject: [PATCH] Removed openrc deps
|
|---
| lib/templates/init-scripts/openrc.tpl | 52 
-----------------------------------
| 1 file changed, 52 deletions(-)
|
|diff --git a/lib/templates/init-scripts/openrc.tpl 
b/lib/templates/init-scripts/openrc.tpl
|index 2f6d8bd..8b13789 100755



