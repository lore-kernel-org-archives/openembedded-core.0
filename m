Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C42E9DE60
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:30:23 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127461.1775723422362399717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vW2Ycar/;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43d5ec211abso163266f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775723421; x=1776328221; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gDS5Jd7mJP4UfZHA3ApHj3FnVJY1et9UN8mXFCvUOo=;
        b=vW2Ycar//YwjaVOqLP5pV8f18+g7bXuMtVnzOjRjPyVlUYjs9IhKtA3fmwWtEI6i9F
         BXIsf/CDJPk2BQ8agepR7wt7UhDwSnV2906N05ZD1ix7T8GJen+C91pu8AnADKWHr9i/
         3U6DdZ4JE86Vr63yKjxMRmi0hU7heWdTaL2ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723421; x=1776328221;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gDS5Jd7mJP4UfZHA3ApHj3FnVJY1et9UN8mXFCvUOo=;
        b=cLHQb5INZ5IxapDkMJRnN9yjcJ9FEf3idNVfCC/bINh1q84qHInLumvDH9sUYlpxJ6
         f8J2QPqdmsGUv9GHQjtCIHDgxmNoSH7nOsVtLaHmNOVMsqqP/ijwRB/PHc7xg/FX4aQi
         c97KSlxIuF2Vr+/xYTbAZri4g7NjTTjKy3zUaYK3TRuMvgvTFYf6R6hIa0ydbMMbElQp
         cCfwfeGOmcxR+gGj4W93L4WcK/JMcobchFiufoyCmuSllqVU9Sr6VTekiOMC8XizY3ty
         BG7DX7g15mHAQZXgUPVqlLkCZ95m/jJf7cEa/GGAoAXbyBA4rlfLfeVxeSEedWxu4N4g
         2tqw==
X-Forwarded-Encrypted: i=1; AJvYcCUTbN64NPWYqOAUc49G1dVmqxl5Gjq1X9CgpEcEEUn0BXAss25rSY8UG82C2p0DlejGnPX6J1V0poHMF5zvuFATeA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHB9eeUzV/btlU8/y/2GQmavPNxU6LXgeQ+J06wFEnJoYu4uId
	mEOqiBACkCciZPEHqEQbhvo6hgGHgU0UODTu6vuTINZsldyAodM6QW8onsu7zZ7WClv4hlX2YiY
	sGVrUARveqoyd
X-Gm-Gg: AeBDieuNtSRNLd1GLEAEytWgCbl7rPUVPeuPXLBWO8DyGbvPYT+B/dpLlG1V5kwCYyy
	qnLEDHMlew+3ttkAtDX4uJwsaa3EjEA7wEDnlt9+vHAC5oUhw/tHYpl6cuYlAxfFjwi8MkFrxGC
	CbSTTY+sVUFcfERt23Xvc/b9J53PP/azXpxZ2KGBhj15/CveQcWAzoKQ0GVkFRSdTgULgt36TDp
	3rS2MHsT8W2quoYGRmxHIBEzqwobRay2ypuwqRCCTxMuNjVNhAjZroaTkBdEL2h4dHfOnxybhJU
	a6E+fVNexIuvBf7Li7OMu8nOjZjqrzcTE1c7ClRXPSmDwUBY4Er+2veRy7T/6kdHQa5kLd4KAp0
	asAxDeVQOnXa1hnJj9EUfGxJhvDu6Ne7v0rToyFf3nK5pZVZNlvBbLdQOzWKftAzvdcEsiR6Jmn
	Z6hrjtpGdYcxcIm+RARpkGEAD17Qdu1OI0wpZ/rbhGSTYMyaEzzZqCrr5GiTDhw+MQRgAZbyYGG
	8del8vjbaGJhV8=
X-Received: by 2002:a05:6000:1a8d:b0:43d:3ce:ecc1 with SMTP id ffacd0b85a97d-43d292e2501mr33151085f8f.43.1775723420553;
        Thu, 09 Apr 2026 01:30:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f7d4esm57685454f8f.34.2026.04.09.01.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:30:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:30:19 +0200
Message-Id: <DHOHF1H8G3WD.UP4M83OEJ4QI@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] vim: Fix CVE-2026-25749
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260408112654.1029664-1-hprajapati@mvista.com>
In-Reply-To: <20260408112654.1029664-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234893

On Wed Apr 8, 2026 at 1:26 PM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick patch from [1] also mentioned in [2]
>
> [1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a=
26fa9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

I'm sorry but this patch (and the other vim patches sent after this one)
is too late to make it into the last kirkstone release.
See: End of kirkstone LTS support
https://lore.kernel.org/yocto/DH8I3C005I7I.EAFAABGT2FJL@smile.fr/T/#u

Regards,

>  .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-25749.patch
> new file mode 100644
> index 0000000000..8b04379b9b
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
> @@ -0,0 +1,64 @@
> +From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
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
> + 	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf =3D=3D NUL)
> + 		return FAIL;
> + 	    ++tnp->tn_hf_idx;
> +-	    STRCPY(buf, p_hf);
> ++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
> + 	    STRCPY(gettail(buf), "tags");
> + #ifdef BACKSLASH_IN_FILENAME
> + 	    slash_adjust(buf);
> +diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
> +index dac153d86..f9e4686bb 100644
> +--- a/src/testdir/test_help.vim
> ++++ b/src/testdir/test_help.vim
> +@@ -222,4 +222,13 @@ func Test_helptag_navigation()
> + endfunc
> +=20
> +=20
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
> +--=20
> +2.43.7
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index fc9b4db055..fa63689ef1 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
>             file://CVE-2026-33412.patch \
> +           file://CVE-2026-25749.patch \
>             "
> =20
>  PV .=3D ".1683"


--=20
Yoann Congal
Smile ECS


