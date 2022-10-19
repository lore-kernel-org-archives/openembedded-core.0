Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE0DC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 15:41:03 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web08.9845.1666194054976937417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 08:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pianon.eu header.s=mail20151219 header.b=y/dZ4tBg;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id 08E235C0096
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 17:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:user-agent:subject:subject:from:from:date:date
	:content-transfer-encoding:content-type:content-type
	:mime-version; s=mail20151219; t=1666194051; x=1668008452; bh=6W
	W30yVdPxje4CIV2kCKCKeRxNvyDb8YmM3wNesvwv0=; b=y/dZ4tBg0wyCogvNcJ
	jPwHJpsamReN/nElU0q4A2kTUbrxjerkxjd2bjP5bpa4M0TJ1D1Zj1o9gm1hhkfm
	UOydL+QIhedlqp8+aPRmwmDbuizjnRI/T6aiSC0WAj4Oe3J7i30tOZ3GuMezygNz
	9D/J9TRHbytzPvaO8IK+KDHK0=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ugPXZwv2yuBh
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2022 17:40:51 +0200 (CEST)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id 5BB725C0095
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 17:40:51 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Oct 2022 17:40:51 +0200
From: Alberto Pianon <alberto@pianon.eu>
To: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: getPatchedFiles in oe.patch doesn't correctly handle filenames with
 spaces
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <9b185ae6cf064eacc0f7c4b2d5d12e5d@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 15:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171972

Hi All,

by using Tinfoil together with methods found in oe.* to do software 
composition analysis, I encountered an error: when parsing python3 
recipe, I found patch file 
[0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch](https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch?h=kirkstone) 
which refers to a filename with spaces:

+++ b/Misc/NEWS.d/next/Core and 
Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst

when using function oe.recipeutils.get_recipe_patched_files(d), the file 
above is returned as "b/Misc/NEWS.d/next/Core", missing the whole part 
after the space.

The problem lies in [function 
patchedpath]((https://git.yoctoproject.org/poky/tree/meta/lib/oe/patch.py?h=kirkstone#n126) 
within the static method getPatchedFiles in poky/meta/lib/oe/patch.py, 
which assumes that there are no spaces in filenames

filepth = patchline.split()[1]

Even if spaces in filenames are bad practice, my understanding is that 
they are allowed by git diff and should be supported.

To solve this issue, the above line may be modified as follows

filepth = patchline[4:]

Should I submit a patch for that?

Regards,

Alberto



