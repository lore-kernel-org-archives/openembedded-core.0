Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6197ACD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:24:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21057.1779197061208176740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 06:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FW9jgrB4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27DEC1A35BB;
	Tue, 19 May 2026 13:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFE2C5FFC8;
	Tue, 19 May 2026 13:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31225107E8F91;
	Tue, 19 May 2026 15:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779197058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kfB4FmaswFW7MGozhMsZzUIlEAjH6PIbMtXoJEABUug=;
	b=FW9jgrB4+yNxo9cfpgyMblyz0peG2tM4JqZAo3Nq3fAMCqaimBiZbqPUoSEGrmz6ayh0n/
	MHAwjEzkTUUAMAuIrAnTXMmGHem9EBSoSFANW+/9QlUNTL8fjtI4vap+GV41Q+kXG5lPZH
	f98yh3u73mgWXlVLBzEf4iCBIA2hJrPyTpAlMzF6M5C2Vt20j36K4Oj3Jc9hfazvzX3yLt
	Ytd5rEdgzONR4K86GaZqSS+S0uduR1euckSIFWtSIeu5/SAPbuzzetZ8Ge5M/PzSrk5dSD
	08ZK/N4+MAny2ZT6ztvqj05vG6nj3O/WMN/TmpDz+i1HSB22ZhyJzqzUxVVvUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:24:16 +0200
Message-Id: <DIMOPW6NLN7I.1BWOG6HU8GX6N@bootlin.com>
Subject: Re: [OE-core] [PATCH] perf: disable BUILD_BPF_SKEL when rust in
 kernel feature is enabled
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260519114152.903563-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260519114152.903563-1-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237324

Hi,

On Tue May 19, 2026 at 1:41 PM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Enabling the Rust in-kernel feature pulls in clang-native as a
> dependency for the kernel build. During the perf build, the presence of c=
lang
> causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf =
attempt
> to build bpftool as part of its build process and make build to fail.
>
> Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 du=
e to missing
> clang dependency.
>
> Error:
> | make[3]: *** ../bpf/bpftool: No such file or directory.  Stop.
>
> As a workaround currently disabling BUILD_BPF_SKEL to make perf to build.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index c3ef25fd99..9fc100e961 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -438,3 +438,9 @@ perf_fix_sources () {
>  		fi
>  	done
>  }
> +
> +python () {
> +    kernel_features =3D d.getVar('KERNEL_FEATURES')
> +    if 'rust' in kernel_features:
> +        d.appendVar('EXTRA_OEMAKE', ' BUILD_BPF_SKEL=3D0')
> +}

I believe this could be done as:

EXTRA_OEMAKE +=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'BUILD_B=
PF_SKEL=3D0', '', d)}

This is the standard approach done in various places in OE-Core. Unless the=
re's
a particular need for an anonymous Python function.

And since this is a workaround, a comment in the file explaining the reason=
 for
it would be nice, I think, so we keep track of why we are doing this in the
first place.

Antonin

