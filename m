Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFABC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 20:40:25 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web08.3256.1642452023792400706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 12:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@collabora.co.uk
 header.s=mail header.b=Kw15aQ9b;
 spf=pass (domain: collabora.co.uk, ip: 46.235.227.227,
 mailfrom: andrew.shadura@collabora.co.uk)
Received: from [IPV6:2a01:c846:1980:2500:c895:7533:8856:c063] (unknown
 [IPv6:2a01:c846:1980:2500:c895:7533:8856:c063])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 56F9E1F41C0B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 20:40:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1642452021;
	bh=tMz72T25UduepGjxAU4UX3hPSo2WerGHYfpNtopIz2E=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Kw15aQ9bBz3blsdAPjgLjCxd7G3KnVBn1fqRg8CMgnfSLCUUJCkk4WwLLIkvmg7Go
	 Pj80zzM/G/j+f4paH7xjkDxbW2z04ibjIjsDLvi1GOjMPKS1qhfpj9b0vkaI/R1a55
	 gUOfGQdoRo6BuUyyd6LGCJb/3Baa3PLvHX2PtskRVnRlXnw1KZPq/NVnWuEEH9qWKC
	 SpQ/BvvV/qYkCNtKXGAfCulMhuPGhxkZUy5gMWhvzoKrjO99lNMHMpNhisprumvCj+
	 v4VU260ws7rBl8OyKel8QP4flaLRgmvoASZ2/DkoddzFN7tr6Bvuqg2tZ0LRTSou6A
	 YkamteHnULKBg==
Message-ID: <58981b08-9c14-aaae-f061-04f2467135e2@collabora.co.uk>
Date: Mon, 17 Jan 2022 21:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: pseudo gets confused by tar and aborts
Content-Language: en-GB
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
References: <2172f744-2094-0bdf-335d-b68d70102531@collabora.co.uk>
Organization: Collabora
In-Reply-To: <2172f744-2094-0bdf-335d-b68d70102531@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 20:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160662

On 17/01/2022 21:25, Andrej Shadura wrote:
> Hi,
> 
> Helmut Grohne reported a bug in pseudo, which, upon further 
> investigation, happens when tar (at least v1.34) is extracting a file.
...
> # tar -C /lib -c -f /tmp/test.tar .
> # tar -C /tmp/foobar -xv -f /tmp/test.tar
> ./
...
> ./linux-sound-base/
> abort()ing pseudo client by server request. See 
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> Check logfile: /tmp/state/pseudo.log

A bit more with extra verbosity:

chown /tmp/foobar/udev/hwdb.d [18745405]: incoming: 
'/tmp/foobar/udev/hwdb.d'+ [18745405]+
owner 0:0 completed chown.
open /tmp/foobar/udev/hwdb.d [18745405]: incoming: 
'/tmp/foobar/udev/hwdb.d'+ [18745405]+
completed open.
stat /tmp/foobar/udev/hwdb.d [18745405]: incoming: 
'/tmp/foobar/udev/hwdb.d'+ [18745405]+
stat, ino 18745405 (old mode 040700): mode 040700
completed stat.
chmod /proc/self/fd/5 [18745405]: incoming: '/proc/self/fd/5'- [18745405]+
path mismatch [2 links]: ino 18745405 db '/tmp/foobar/udev/hwdb.d' req 
'/proc/self/fd/5'.
completed chmod.

I understand this is related to the latest commit to pseudo:
https://git.yoctoproject.org/pseudo/commit/?h=oe-core&id=300d7570720bc1

-- 
Cheers,
   Andrej

