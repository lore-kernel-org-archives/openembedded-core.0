Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EB61091930
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 23:52:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2043.1773964366169532941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 16:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bKESk9Ab;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c6fc2910so962675f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773964364; x=1774569164; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdQYxh6gA9+qeoV4Hz91MBcVZv2Q4vnu11Rt3Y339gM=;
        b=bKESk9Abjp8M5E5iqJTBfAuqZ/ZAfk1iqm6qI/VE2hsMS7BzFJ4xz48/mijhbtLDeO
         l3+Y6pkbLG7OPWkSnaIHLq3RHsnHPeBWc20iyexaM8vbE6CUhQAFzXp/956drvyzqe0t
         jO5ZQ5a5Gq/TdBjLa7zCbq4ytlzmz8FUemxJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773964364; x=1774569164;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LdQYxh6gA9+qeoV4Hz91MBcVZv2Q4vnu11Rt3Y339gM=;
        b=oxNxXs9/qrnpWQI+wmPImAY247E2WJge48o4zmIVa5gPiK0P538kwzf3IxSbnr287R
         oTsYwIzKLHt+nL5c2Z/S2UNkugIzOq5ux2KI7Z0isDTDdB0nkE581RPkz830g6Cp6T1k
         aEBZ5Nm7R5YwXHItfkxx80XtDCzXuqBluUjgI7i5SkHy1q71nvOcq3o7bYvrM8MSK+uz
         dA9zFVJCuM7GuBhwC17WfVktqtyCqQcMdCGPQVUXc0kjJ2LxNYAM+gP+lrQFZqwYV/lz
         GvVAL3Lbb1OK9iLECv29g2Czr3F6zFny7YWB47usUaRq+ToczjwwtrblK/rk9EqFRUjX
         74jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn/0zVRhScIDVmZ9ugttRrw9AT1qSfZZ+QvtOR7vs99BmJgntRFJqtBGOzXkaamfdkRn3px25k+Ak96yWu0LHYuA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQsyXG2Mx8O06eoLyhTOCOfgURV5IYBeBn6XCfSaJZB4NAPqAi
	MeXbUjRrkwHQGdr4n3vL2a0ZhHrWrkABcuhQ74mYI9ibu+UUwcydRVRe/TFlcuYMqaA=
X-Gm-Gg: ATEYQzxFFXCZCRyzUR2ty+I79pJ8tgw3M+NNGkthbUtDPCFrJvq/nKkhOD63oIO3s8G
	Q1VklzhXD1I/3exyu8h7rNMw9bbAujUvwwqubZP1qsfO2uEM4JCZDobf8ejnzS1rYWV1iQczxHX
	uP3AdPU2QmXk3AEwIRWSdEImEwkleNo/1Wronwn3eJSFCs9INp1X4tdsQWG3MGHEVGJce12WUY1
	Eve1ktkPDltNGxPsy/Y4IFyezL1+bq+HSWDOGCfoVqsoPTrbgiV3O3FckYSjuLxptfXF43fx6Zh
	S5VvAqiO1+ZiJRz14MNMQZgRNF3yka6PC7vM3HD5cGs8OK58r7WAPTQYTsHn4Nj8gFxvR1Jn1P7
	8EeqoIGAi2S6jUkf3QoQPEQB62zRfRi8HjvPcaVk1KUwDmS6TSExUo6/GsLufQsoViCRyH5AMux
	JxHKE5F7UNG4ADVaoFraFwfyQc3590QabWp4N2cHYWsqZiL+o4QEYfe7RO+DZv37RRnx3rye+AR
	Mhns2BdA+S/Q30=
X-Received: by 2002:a05:6000:2f84:b0:439:cbf3:4a8f with SMTP id ffacd0b85a97d-43b6428711amr1844819f8f.41.1773964364380;
        Thu, 19 Mar 2026 16:52:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae37dsm2202543f8f.2.2026.03.19.16.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 16:52:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 00:52:43 +0100
Message-Id: <DH75VU1XGMU1.177LB3T02RJF1@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH V2 1/2] vim: Fix CVE-2026-25749
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <131089.1773220389419496773@lists.openembedded.org>
 <20260311094528.2744479-1-adongare@cisco.com>
In-Reply-To: <20260311094528.2744479-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 23:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233557

On Wed Mar 11, 2026 at 10:45 AM CET, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick patch from [1] also mentioned in [2]
> [1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a=
26fa9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../vim/files/CVE-2026-25749.patch            | 63 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-25749.patch
> new file mode 100644
> index 0000000000..4236464c99
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
> @@ -0,0 +1,63 @@
> +From 04c5e03c2c638e6c82c250f7b612eab29fe7d9ba Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Thu, 5 Feb 2026 18:51:54 +0000
> +Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfil=
e'
> + option handling
> +
> +Problem:  [security]: buffer-overflow in 'helpfile' option handling by
> +          using strcpy without bound checks (Rahul Hoysala)
> +Solution: Limit strncpy to the length of the buffer (MAXPATHL)
> +
> +Github Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
> +
> +CVE: CVE-2026-25749
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b=
245108e6e9d7aa2260dd849a26fa9]
> +
> +Backport Changes:
> +- Excluded changes to src/version.c and runtime/doc/version9.txt
> +  from this backport. This file only tracks upstream version increments.
> +  We are applying a security fix, not a version upgrade. These changes
> +  were skipped to maintain current package versioning and avoid merge co=
nflicts.
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + src/tag.c                 | 2 +-
> + src/testdir/test_help.vim | 9 +++++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/tag.c b/src/tag.c
> +index 6912e8743..a32bbb245 100644
> +--- a/src/tag.c
> ++++ b/src/tag.c
> +@@ -3348,7 +3348,7 @@ get_tagfname(
> +	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)

Hello,

This patch has a weird format. The context lines starts with tabs and
not a single space as usual. While it seems like it passes tests, I'm
afraid it will break something down the line and I'd rather not take
this like this.

Can you please check?

Thanks!

> +		return FAIL;
> +	    ++tnp->tn_hf_idx;
> +-	    STRCPY(buf, p_hf);
> ++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
> +	    STRCPY(gettail(buf), "tags");
> + #ifdef BACKSLASH_IN_FILENAME
> +	    slash_adjust(buf);
> +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
> +index dac153d86..f9e4686bb 100644
> +--- a/src/testdir/test_help.vim
> ++++ b/src/testdir/test_help.vim
> +@@ -222,4 +222,13 @@ func Test_helptag_navigation()
> + endfunc
> +
> +
> ++" This caused a buffer overflow
> ++func Test_helpfile_overflow()
> ++  let _helpfile =3D &helpfile
> ++  let &helpfile =3D repeat('A', 5000)
> ++  help
> ++  helpclose
> ++  let &helpfile =3D _helpfile
> ++endfunc
> ++
> + " vim: shiftwidth=3D2 sts=3D2 expandtab
> +--
> +2.43.7
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index c730f1d0cf..044117a57f 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
>             file://disable_acl_header_check.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +           file://CVE-2026-25749.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


