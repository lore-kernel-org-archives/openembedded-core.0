Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A446E92728
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 18:44:32 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.web10.23778.1696531469606233501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 11:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=j6orfYfm;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <mac@mcrowe.com>)
	id 1qoTKl-0003gO-GG; Thu, 05 Oct 2023 18:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=EjhzUQJ/VkRPhhIvaOo3FSPid7yyiT1nKMHw7JBgUVs=; b=j6orf
	YfmGfoWQ8fZbuJU6q/XTOR6kIB6jf4/ueaiEgKCpMUfKrlAn9VPNcGG7EZxLc9EVLBZ1xb6AyvK/G
	JCsPB+hAQn6NF1afyytg/bLqnp23GVLldrnj8ETwC8bgQCejq2fD/NOwE3OiCDkhKsN5qj6rLleR4
	lu6Lcm+sId0P1Auli5hF5UrNTn8Xj3Aog4GzoyNRsQj/pgjhNuyz2PS2XGkDNCJfWvln5BjkpdVhw
	ZiT6D2JV+heez6qxDwyJBarSD7RndrAe6eHY6d4tCG0va1mIH3IJPNewDCWRjkRaNSWMlv8Len1oT
	UfSFMclroKITCqS0lVAoizvNWAsoA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1qoTKl-009x2e-0R;
	Thu, 05 Oct 2023 19:44:27 +0100
Date: Thu, 5 Oct 2023 19:44:27 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Fix CVE-2023-4911 "Looney
 Tunables"
Message-ID: <ZR8ECxFrS1JgOzfr@mcrowe.com>
References: <20231005085407.2200644-1-mac@mcrowe.com>
 <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSpxdb-qBLkj8D9afpucuB5AYqB+xjcP18HpSrUCG2AQcvEQw@mail.gmail.com>
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 18:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188727

On Thursday 05 October 2023 at 04:17:08 -1000, Steve Sakoman wrote:
> Hmmm ... does this build for you?

Yes, on top of 0111b5b152c1bcff0ab26cf8632ca9002237f070 (current HEAD of
openembedded-core dunfell branch.)

> I'm getting:
> 
> ERROR: glibc-2.31+gitAUTOINC+2d4f26e5cf-r0 do_patch: Applying patch
> 'CVE-2023-4911.patch' on target directory
> '/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2.31+gitAUTOINC+2d4f26e5cf-r0/git'
> Command Error: 'quilt --quiltrc
> /home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/glibc/2.31+gitAUTOINC+2d4f26e5cf-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch CVE-2023-4911.patch
> patching file elf/dl-tunables.c
> Hunk #1 FAILED at 187.
> Hunk #2 FAILED at 251.
> 2 out of 2 hunks FAILED -- rejects in file elf/dl-tunables.c
> Patch CVE-2023-4911.patch does not apply (enforce with -f)

Well that's strange. I can see from your work directory name that you're
using the same glibc commit as me:
2d4f26e5cfda682f9ce61444b81533b83f6381af, and I can apply the
CVE-2023-4911.patch to that commit without conflicts.

Do you have any other changes beyond
0111b5b152c1bcff0ab26cf8632ca9002237f070 in your tree that might be
applying other patches?

Mike.

