Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3266810706E7
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 16:02:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12518.1773504126959124748
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 09:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=js+vk3J7;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4855dbfc129so9235105e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773504125; x=1774108925; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0q30l6JYoYwFOGesF9K0QmQiA0nsz4wKaoMYcy1tos=;
        b=js+vk3J7nkVGfRJkiVD9pGb0mEiA8WApfsg76iR6t9DP++wjKCIA6cpPAaZP0yAvji
         WhzVVmZj816XP6zbl+pYKTN4GYF2CylxyDY6rBuH81J0lb0S4bE0u9L0sQ/TSM5qu1kb
         Fh0nEONkwoLtfCarKjI8jir1Yj/nVTMTPzMB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504125; x=1774108925;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0q30l6JYoYwFOGesF9K0QmQiA0nsz4wKaoMYcy1tos=;
        b=SkfLItL9V5i8kPNcQq3LmsdUo+5eI9TlCdzpvKLsgtb0Ag/SkGmktoCgXVhRs5LINS
         mdbTbz2vrEFsa/bFL9qqVIXodn62BGRmUKgy95mPMwF2KVy7XNw20lXRJ1QJ6VVaF462
         ZQDb18g7Px+YAo+ogdKhLk5SSg+hdYBGg2D07n6PbbT/ozo6NIYGZvYpMqfj7OMgJjdU
         MAL2Pe1NKAWbq0eNyqSch/wDNuSdqNTaM058VpzuaX7wJXtshOHq9l2SSqRj8Ow2r4FN
         UocLkpFV5Mz2PXDxf142C0lvGEYU0oM1RPH8sONQMxbI7ngTp/s2QiA4cGIWw2+9mIOx
         dAIA==
X-Forwarded-Encrypted: i=1; AJvYcCUMrthjrHIdEh2Ov3Udbgf5VIJDRqhEaVQ1R/8TQEbv5oUQdefdpFDXOj+mYlM/k06ogDMBtnGzWfR9wSGeMaDkLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+rVj+JEoIzmXpIhgUixy0LX/kCJb/SzeJgsXSePRXEnBtxOQi
	t2hA4bmBaqzSwCyJfxvoxze+u7N5Mx6djBfzuQm2/ht4MJHfs+9ItMzGRugA0qAL6u6X6VHtP5K
	turdW
X-Gm-Gg: ATEYQzzH50FmMDz6GJYOTG8lMTxKX7x49Nir8bPNjQaXQxVNiThoY6eEuSS5fjWqyUj
	hZcvaHhFYxU+RqO692OIigNu4v0Bsyf2cyvPNsBE6T9SdfzrTaPne66rSE+uCJPpxudY34PlVg0
	JwED/QyEhufL4uy1YoVK6RdoyNNHifhlRZBPBpVvf+4Rm+C/Cvn3Gakk3ax4LH1pBm4Hbr8sg2M
	t4Q0vSQEXyaMPJQxbuW9vnGLz82FW2JXj2idkOXDKuDfRoB7LSqGv/SPTeVJarV5DnkWJMoXlB7
	rR9ZkoMjrj2D4eX43VcYuhXkC/L6NiTHZU5OJwqU0NsDmGUvCLaaO4SfWK1vYVmYP5Zgd7JgAIX
	2PeiWCzm7CogODoksFq46DW+7CCmL5WVceeQP6996N9js8sI2l/t0CVatt+N0V/Y1F2C469PIgH
	no/UtJfv50pCodHfBPcT8aJTW104NLLaclDATNBSahxgCDMeVRM2g/DXBVK5bvbrGiC0C2xVU4v
	/2xAmfywo3pe/E=
X-Received: by 2002:a05:600c:3b98:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-48556707127mr123344375e9.23.1773504124784;
        Sat, 14 Mar 2026 09:02:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6e25bsm45368555e9.27.2026.03.14.09.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 09:02:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 17:02:03 +0100
Message-Id: <DH2MQQRN46UP.32FYBDWM15C6I@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] perl: fix CVE-2025-40909
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260227083801.544222-1-hprajapati@mvista.com>
In-Reply-To: <20260227083801.544222-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 16:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233089

Hello,

On Fri Feb 27, 2026 at 9:38 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Backport the patch[1] which fixes this vulnerability as mentioned in NVD =
report.
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-40909
>
> [1] https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0=
bd74aba9
>
> Backport of upstream commit 918bfff (CVE-2025-40909) introduces a new
> configuration variable "d_fdopendir" which is used by config_h.SH to
> generate HAS_FDOPENDIR.

Looks to me that this fix is needed for scarthgap and whinlatter. Can
you please send an equivalent fix there first?

> In standard Perl builds this variable is detected by Configure.
> However in Yocto the perl-native/perl builds rely on
> perlcross with pre-seeded config.sh and Configure is not fully
> executed. As a result d_fdopendir may be unset, which causes
> config_h.SH to emit an invalid preprocessor directive:
>
>     # HAS_FDOPENDIR
>
> leading to build failures.
>
> Additionally, leaving the variable unset disables the new code path
> introduced by the CVE fix.
>
> Seed d_fdopendir to "define" to match expected Linux/glibc behaviour
> where fdopendir() is available. This restores correct config.h
> generation and ensures the CVE fix is active.

I'm not really familiar with perl integration but instead of using sed
to patch a generated file, shouldn't we patch perl-cross with this
(submitted but not merged) PR?
https://github.com/arsv/perl-cross/pull/159/changes/f702c387e6940fab3801d75=
62a668b974a2b3a8f

> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../perl/files/CVE-2025-40909.patch           | 415 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.3.bb     |   2 +
>  2 files changed, 417 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2025-40909.patch b/meta=
/recipes-devtools/perl/files/CVE-2025-40909.patch
> new file mode 100644
> index 0000000000..b5cb20e112
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
> @@ -0,0 +1,415 @@
> +From 918bfff86ca8d6d4e4ec5b30994451e0bd74aba9 Mon Sep 17 00:00:00 2001
> +From: Leon Timmermans <fawaka@gmail.com>
> +Date: Fri, 23 May 2025 15:40:41 +0200
> +Subject: [PATCH] CVE-2025-40909: Clone dirhandles without fchdir
> +
> +This uses fdopendir and dup to dirhandles. This means it won't change
> +working directory during thread cloning, which prevents race conditions
> +that can happen if a third thread is active at the same time.
> +
> +CVE: CVE-2025-40909
> +Upstream-Status: Backport [https://github.com/Perl/perl5/commit/918bfff8=
6ca8d6d4e4ec5b30994451e0bd74aba9]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + Configure                      |   6 ++
> + Cross/config.sh-arm-linux      |   1 +
> + Cross/config.sh-arm-linux-n770 |   1 +
> + Porting/Glossary               |   5 ++
> + Porting/config.sh              |   1 +
> + config_h.SH                    |   6 ++
> + configure.com                  |   1 +
> + plan9/config_sh.sample         |   1 +
> + sv.c                           |  91 +----------------------------
> + t/op/threads-dirh.t            | 104 +--------------------------------
> + win32/config.gc                |   1 +
> + win32/config.vc                |   1 +
> + 12 files changed, 28 insertions(+), 191 deletions(-)
> +
> +diff --git a/Configure b/Configure
> +index 913e080..b668593 100755
> +--- a/Configure
> ++++ b/Configure
> +@@ -476,6 +476,7 @@ d_fd_set=3D''
> + d_fds_bits=3D''
> + d_fdclose=3D''
> + d_fdim=3D''
> ++d_fdopendir=3D''
> + d_fegetround=3D''
> + d_fgetpos=3D''
> + d_finite=3D''
> +@@ -13222,6 +13223,10 @@ esac
> + set i_fcntl
> + eval $setvar
> +=20
> ++: see if fdopendir exists
> ++set fdopendir d_fdopendir
> ++eval $inlibc
> ++
> + : see if fork exists
> + set fork d_fork
> + eval $inlibc
> +@@ -24329,6 +24334,7 @@ d_flockproto=3D'$d_flockproto'
> + d_fma=3D'$d_fma'
> + d_fmax=3D'$d_fmax'
> + d_fmin=3D'$d_fmin'
> ++d_fdopendir=3D'$d_fdopendir'
> + d_fork=3D'$d_fork'
> + d_fp_class=3D'$d_fp_class'
> + d_fp_classify=3D'$d_fp_classify'
> +diff --git a/Cross/config.sh-arm-linux b/Cross/config.sh-arm-linux
> +index c472b09..4b346a3 100644
> +--- a/Cross/config.sh-arm-linux
> ++++ b/Cross/config.sh-arm-linux
> +@@ -211,6 +211,7 @@ d_fd_macros=3D'define'
> + d_fd_set=3D'define'
> + d_fdclose=3D'undef'
> + d_fdim=3D'undef'
> ++d_fdopendir=3D'undef'
> + d_fds_bits=3D'undef'
> + d_fegetround=3D'define'
> + d_fgetpos=3D'define'
> +diff --git a/Cross/config.sh-arm-linux-n770 b/Cross/config.sh-arm-linux-=
n770
> +index 7b10cbf..8dc2f83 100644
> +--- a/Cross/config.sh-arm-linux-n770
> ++++ b/Cross/config.sh-arm-linux-n770
> +@@ -210,6 +210,7 @@ d_fd_macros=3D'define'
> + d_fd_set=3D'define'
> + d_fdclose=3D'undef'
> + d_fdim=3D'undef'
> ++d_fdopendir=3D'undef'
> + d_fds_bits=3D'undef'
> + d_fegetround=3D'define'
> + d_fgetpos=3D'define'
> +diff --git a/Porting/Glossary b/Porting/Glossary
> +index d28e8c5..0a98386 100644
> +--- a/Porting/Glossary
> ++++ b/Porting/Glossary
> +@@ -933,6 +933,11 @@ d_fmin (d_fmin.U):
> + 	This variable conditionally defines the HAS_FMIN symbol, which
> + 	indicates to the C program that the fmin() routine is available.
> +=20
> ++d_fdopendir (d_fdopendir.U):
> ++	This variable conditionally defines the HAS_FORK symbol, which
> ++	indicates that the fdopen routine is available to open a
> ++	directory descriptor.
> ++
> + d_fork (d_fork.U):
> + 	This variable conditionally defines the HAS_FORK symbol, which
> + 	indicates to the C program that the fork() routine is available.
> +diff --git a/Porting/config.sh b/Porting/config.sh
> +index a88cffb..6ab32ac 100644
> +--- a/Porting/config.sh
> ++++ b/Porting/config.sh
> +@@ -227,6 +227,7 @@ d_fd_macros=3D'define'
> + d_fd_set=3D'define'
> + d_fdclose=3D'undef'
> + d_fdim=3D'define'
> ++d_fdopendir=3D'define'
> + d_fds_bits=3D'define'
> + d_fegetround=3D'define'
> + d_fgetpos=3D'define'
> +diff --git a/config_h.SH b/config_h.SH
> +index 8264f91..61040b5 100755
> +--- a/config_h.SH
> ++++ b/config_h.SH
> +@@ -142,6 +142,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#undef\(.*/\)\*=
!/\*#define\1 \*!' -e 's!^#un
> +  */
> + #$d_fcntl HAS_FCNTL		/**/
> +=20
> ++/* HAS_FDOPENDIR:
> ++ * This symbol, if defined, indicates that the fdopen routine is
> ++ * available to open a directory descriptor.
> ++ */
> ++#$d_fdopendir HAS_FDOPENDIR		/**/
> ++
> + /* HAS_FGETPOS:
> +  *	This symbol, if defined, indicates that the fgetpos routine is
> +  *	available to get the file position indicator, similar to ftell().
> +diff --git a/configure.com b/configure.com
> +index df29582..0d80fa0 100644
> +--- a/configure.com
> ++++ b/configure.com
> +@@ -6211,6 +6211,7 @@ $ WC "d_fd_set=3D'" + d_fd_set + "'"
> + $ WC "d_fd_macros=3D'define'"
> + $ WC "d_fdclose=3D'undef'"
> + $ WC "d_fdim=3D'" + d_fdim + "'"
> ++$ WC "d_fdopendir=3D'undef'"
> + $ WC "d_fds_bits=3D'define'"
> + $ WC "d_fegetround=3D'undef'"
> + $ WC "d_fgetpos=3D'define'"
> +diff --git a/plan9/config_sh.sample b/plan9/config_sh.sample
> +index d4f6928..c87fc9b 100644
> +--- a/plan9/config_sh.sample
> ++++ b/plan9/config_sh.sample
> +@@ -211,6 +211,7 @@ d_fd_macros=3D'undef'
> + d_fd_set=3D'undef'
> + d_fdclose=3D'undef'
> + d_fdim=3D'undef'
> ++d_fdopendir=3D'undef'
> + d_fds_bits=3D'undef'
> + d_fegetround=3D'undef'
> + d_fgetpos=3D'define'
> +diff --git a/sv.c b/sv.c
> +index 46bf981..1fd16ca 100644
> +--- a/sv.c
> ++++ b/sv.c
> +@@ -13619,15 +13619,6 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS=
 *const param)
> + {
> +     DIR *ret;
> +=20
> +-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
> +-    DIR *pwd;
> +-    const Direntry_t *dirent;
> +-    char smallbuf[256]; /* XXX MAXPATHLEN, surely? */
> +-    char *name =3D NULL;
> +-    STRLEN len =3D 0;
> +-    long pos;
> +-#endif
> +-
> +     PERL_UNUSED_CONTEXT;
> +     PERL_ARGS_ASSERT_DIRP_DUP;
> +=20
> +@@ -13639,89 +13630,13 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAM=
S *const param)
> +     if (ret)
> + 	return ret;
> +=20
> +-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
> ++#ifdef HAS_FDOPENDIR
> +=20
> +     PERL_UNUSED_ARG(param);
> +=20
> +-    /* create anew */
> +-
> +-    /* open the current directory (so we can switch back) */
> +-    if (!(pwd =3D PerlDir_open("."))) return (DIR *)NULL;
> +-
> +-    /* chdir to our dir handle and open the present working directory *=
/
> +-    if (fchdir(my_dirfd(dp)) < 0 || !(ret =3D PerlDir_open("."))) {
> +-	PerlDir_close(pwd);
> +-	return (DIR *)NULL;
> +-    }
> +-    /* Now we should have two dir handles pointing to the same dir. */
> +-
> +-    /* Be nice to the calling code and chdir back to where we were. */
> +-    /* XXX If this fails, then what? */
> +-    PERL_UNUSED_RESULT(fchdir(my_dirfd(pwd)));
> +-
> +-    /* We have no need of the pwd handle any more. */
> +-    PerlDir_close(pwd);
> +-
> +-#ifdef DIRNAMLEN
> +-# define d_namlen(d) (d)->d_namlen
> +-#else
> +-# define d_namlen(d) strlen((d)->d_name)
> +-#endif
> +-    /* Iterate once through dp, to get the file name at the current pos=
i-
> +-       tion. Then step back. */
> +-    pos =3D PerlDir_tell(dp);
> +-    if ((dirent =3D PerlDir_read(dp))) {
> +-	len =3D d_namlen(dirent);
> +-        if (len > sizeof(dirent->d_name) && sizeof(dirent->d_name) > PT=
RSIZE) {
> +-            /* If the len is somehow magically longer than the
> +-             * maximum length of the directory entry, even though
> +-             * we could fit it in a buffer, we could not copy it
> +-             * from the dirent.  Bail out. */
> +-            PerlDir_close(ret);
> +-            return (DIR*)NULL;
> +-        }
> +-	if (len <=3D sizeof smallbuf) name =3D smallbuf;
> +-	else Newx(name, len, char);
> +-	Move(dirent->d_name, name, len, char);
> +-    }
> +-    PerlDir_seek(dp, pos);
> +-
> +-    /* Iterate through the new dir handle, till we find a file with the
> +-       right name. */
> +-    if (!dirent) /* just before the end */
> +-	for(;;) {
> +-	    pos =3D PerlDir_tell(ret);
> +-	    if (PerlDir_read(ret)) continue; /* not there yet */
> +-	    PerlDir_seek(ret, pos); /* step back */
> +-	    break;
> +-	}
> +-    else {
> +-	const long pos0 =3D PerlDir_tell(ret);
> +-	for(;;) {
> +-	    pos =3D PerlDir_tell(ret);
> +-	    if ((dirent =3D PerlDir_read(ret))) {
> +-		if (len =3D=3D (STRLEN)d_namlen(dirent)
> +-                    && memEQ(name, dirent->d_name, len)) {
> +-		    /* found it */
> +-		    PerlDir_seek(ret, pos); /* step back */
> +-		    break;
> +-		}
> +-		/* else we are not there yet; keep iterating */
> +-	    }
> +-	    else { /* This is not meant to happen. The best we can do is
> +-	              reset the iterator to the beginning. */
> +-		PerlDir_seek(ret, pos0);
> +-		break;
> +-	    }
> +-	}
> +-    }
> +-#undef d_namlen
> +-
> +-    if (name && name !=3D smallbuf)
> +-	Safefree(name);
> +-#endif
> ++    ret =3D fdopendir(dup(my_dirfd(dp)));
> +=20
> +-#ifdef WIN32
> ++#elif defined(WIN32)
> +     ret =3D win32_dirp_dup(dp, param);
> + #endif
> +=20
> +diff --git a/t/op/threads-dirh.t b/t/op/threads-dirh.t
> +index bb4bcfc..14c399c 100644
> +--- a/t/op/threads-dirh.t
> ++++ b/t/op/threads-dirh.t
> +@@ -13,16 +13,12 @@ BEGIN {
> +      skip_all_if_miniperl("no dynamic loading on miniperl, no threads")=
;
> +      skip_all("runs out of memory on some EBCDIC") if $ENV{PERL_SKIP_BI=
G_MEM_TESTS};
> +=20
> +-     plan(6);
> ++     plan(1);
> + }
> +=20
> + use strict;
> + use warnings;
> + use threads;
> +-use threads::shared;
> +-use File::Path;
> +-use File::Spec::Functions qw 'updir catdir';
> +-use Cwd 'getcwd';
> +=20
> + # Basic sanity check: make sure this does not crash
> + fresh_perl_is <<'# this is no comment', 'ok', {}, 'crash when duping di=
rh';
> +@@ -31,101 +27,3 @@ fresh_perl_is <<'# this is no comment', 'ok', {}, 'c=
rash when duping dirh';
> +    async{}->join for 1..2;
> +    print "ok";
> + # this is no comment
> +-
> +-my $dir;
> +-SKIP: {
> +- skip "telldir or seekdir not defined on this platform", 5
> +-    if !$Config::Config{d_telldir} || !$Config::Config{d_seekdir};
> +- my $skip =3D sub {
> +-   chdir($dir);
> +-   chdir updir;
> +-   skip $_[0], 5
> +- };
> +-
> +- if(!$Config::Config{d_fchdir} && $^O ne "MSWin32") {
> +-  $::TODO =3D 'dir handle cloning currently requires fchdir on non-Wind=
ows platforms';
> +- }
> +-
> +- my @w :shared; # warnings accumulator
> +- local $SIG{__WARN__} =3D sub { push @w, $_[0] };
> +-
> +- $dir =3D catdir getcwd(), "thrext$$" . int rand() * 100000;
> +-
> +- rmtree($dir) if -d $dir;
> +- mkdir($dir);
> +-
> +- # Create a dir structure like this:
> +- #   $dir
> +- #     |
> +- #     `- toberead
> +- #            |
> +- #            +---- thrit
> +- #            |
> +- #            +---- rile
> +- #            |
> +- #            `---- zor
> +-
> +- chdir($dir);
> +- mkdir 'toberead';
> +- chdir 'toberead';
> +- {open my $fh, ">thrit" or &$skip("Cannot create file thrit")}
> +- {open my $fh, ">rile" or &$skip("Cannot create file rile")}
> +- {open my $fh, ">zor" or &$skip("Cannot create file zor")}
> +- chdir updir;
> +-
> +- # Then test that dir iterators are cloned correctly.
> +-
> +- opendir my $toberead, 'toberead';
> +- my $start_pos =3D telldir $toberead;
> +- my @first_2 =3D (scalar readdir $toberead, scalar readdir $toberead);
> +- my @from_thread =3D @{; async { [readdir $toberead ] } ->join };
> +- my @from_main =3D readdir $toberead;
> +- is join('-', sort @from_thread), join('-', sort @from_main),
> +-     'dir iterator is copied from one thread to another';
> +- like
> +-   join('-', "", sort(@first_2, @from_thread), ""),
> +-   qr/(?<!-rile)-rile-thrit-zor-(?!zor-)/i,
> +-  'cloned iterator iterates exactly once over everything not already se=
en';
> +-
> +- seekdir $toberead, $start_pos;
> +- readdir $toberead for 1 .. @first_2+@from_thread;
> +- {
> +-  local $::TODO; # This always passes when dir handles are not cloned.
> +-  is
> +-    async { readdir $toberead // 'undef' } ->join, 'undef',
> +-   'cloned dir iterator that points to the end of the directory'
> +-  ;
> +- }
> +-
> +- # Make sure the cloning code can handle file names longer than 255 cha=
rs
> +- SKIP: {
> +-  chdir 'toberead';
> +-  open my $fh,
> +-    ">floccipaucinihilopilification-"
> +-   . "pneumonoultramicroscopicsilicovolcanoconiosis-"
> +-   . "lopadotemachoselachogaleokranioleipsanodrimypotrimmatosilphiokara=
bo"
> +-   . "melitokatakechymenokichlepikossyphophattoperisteralektryonoptokep=
hal"
> +-   . "liokinklopeleiolagoiosiraiobaphetraganopterygon"
> +-    or
> +-     chdir updir,
> +-     skip("OS does not support long file names (and I mean *long*)", 1)=
;
> +-  chdir updir;
> +-  opendir my $dirh, "toberead";
> +-  my $test_name
> +-    =3D "dir iterators can be cloned when the next fn > 255 chars";
> +-  while() {
> +-   my $pos =3D telldir $dirh;
> +-   my $fn =3D readdir($dirh);
> +-   if(!defined $fn) { fail($test_name); last SKIP; }
> +-   if($fn =3D~ 'lagoio') {=20
> +-    seekdir $dirh, $pos;
> +-    last;
> +-   }
> +-  }
> +-  is length async { scalar readdir $dirh } ->join, 258, $test_name;
> +- }
> +-
> +- is scalar @w, 0, 'no warnings during all that' or diag @w;
> +- chdir updir;
> +-}
> +-rmtree($dir);
> +diff --git a/win32/config.gc b/win32/config.gc
> +index af6fed9..7ae6f9b 100644
> +--- a/win32/config.gc
> ++++ b/win32/config.gc
> +@@ -198,6 +198,7 @@ d_fd_macros=3D'define'
> + d_fd_set=3D'define'
> + d_fdclose=3D'undef'
> + d_fdim=3D'undef'
> ++d_fdopendir=3D'undef'
> + d_fds_bits=3D'define'
> + d_fegetround=3D'undef'
> + d_fgetpos=3D'define'
> +diff --git a/win32/config.vc b/win32/config.vc
> +index f4625bf..8725177 100644
> +--- a/win32/config.vc
> ++++ b/win32/config.vc
> +@@ -198,6 +198,7 @@ d_fd_macros=3D'define'
> + d_fd_set=3D'define'
> + d_fdclose=3D'undef'
> + d_fdim=3D'undef'
> ++d_fdopendir=3D'undef'
> + d_fds_bits=3D'define'
> + d_fegetround=3D'undef'
> + d_fgetpos=3D'define'
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-dev=
tools/perl/perl_5.34.3.bb
> index c8475fc450..25c4e4991d 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.3.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
>             file://CVE-2023-31486-0001.patch \
>             file://CVE-2023-31486-0002.patch \
>             file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch=
 \
> +           file://CVE-2025-40909.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://perl-configpm-switch.patch \
> @@ -56,6 +57,7 @@ CVE_CHECK_IGNORE:append =3D " CVE-2023-47038"
> =20
>  do_configure:prepend() {
>      cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
> +    sed -i '1i d_fdopendir=3Ddefine' ${S}/config_h.SH
>  }
> =20
>  do_configure:class-target() {

--=20
Yoann Congal
Smile ECS


