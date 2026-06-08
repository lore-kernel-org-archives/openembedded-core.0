Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE76CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:46:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55050.1780926400716571164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 06:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dSkAtD8k;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-460166910e6so2201278f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780926399; x=1781531199; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL14eWjbHl59DRqZLbjOjoapMWcmrLy2rgoEhMe8r3U=;
        b=dSkAtD8kK7o+Uc/oGxEYjubguQC1QgzLP2/FnRt/WisHo1ILkdV78As31j0I2LDQGS
         hBmTnhMO0iSmS6jOdGCtUfO3MdZASmJo5bdHvCHRIdSlzme5ksM0InxCKBt1nG53vQ+t
         J53DcZEtEVKD7c4w0ISUxIWzOJkaMX/RVNcng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926399; x=1781531199;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OL14eWjbHl59DRqZLbjOjoapMWcmrLy2rgoEhMe8r3U=;
        b=mV32YiLvn4UJRIethUsoeuOZkmk0yz4JG6ev253W39DUjxkuyVgVLMgOqGAY9rybpe
         IfeBkce8C1otM3/oX8O3m2iOHwnejPr6xnkzGKk55p+alED6tA8A3XwnQq0+cxh3nrs1
         zW+o2URKbub+4q6Gfrhko7SOtnf26SirViVNPUMQf2DvOOJHuTrGIC6F4MOIi/q9hCQA
         1iV2peOi/2oHPParf4vWHBh1ewYunWv54fEyO/DiZy1ZfAvQt6qVhlzp68jTL+iTWbmn
         6QHf7Eup0bOkS290eOwuZmPscrEwCTyAAsbwtdjyBV2jJ5UOOzwrZ2RHCINys+TzGETk
         OV2w==
X-Forwarded-Encrypted: i=1; AFNElJ96rzQK7jK7X0W8iDa3BLcS9EIr98wk+G9R5hl6lOWLkKL0ngih3v+5k/SfdOpMPDKBbqPdSIMfC+Wbx/QUpnC+IQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/0j4iQwyNG7W16FCXYIT/Oa8di+SnfYSBnQy096HMbWa7rZ4o
	eO/Q5KiBn9og/ITyVKAWzt4VXwIcDOSbiTPdP+agqtAINfsMqKbMVSTX7dINWYy1sQ==
X-Gm-Gg: Acq92OHdusBKM30Mwi5IlQq/y5g8WccGYPJIOpo8EPfHktPB1ru8XGpZHz6qTJ9Eh7y
	mX+7XGt50kOA1hSxez0wKSRqCjewRPXEN+FeiJXUBB+WPQiCenyX46omtfAnlWrjRWYHZvO2DEI
	DyAbZjWeIemFWVHn6JMzJftRlKBMrAKPnfPnnw5IkUeU5BX8NEirseAV0OF5gnfiJJBT5ZPApNu
	RDvQWDJiwAdxWSxnncYUkPdyLP6kP+wn3g7cBLTPNiLy6Jb0WERmo0SDA4x+UrgE6TxCbAiq0hC
	XS4MBCBkI8X7gJHNdLR5p19SCrzTOSZc9zrABsJzDXvw6tTGiKmiIoYKucdFkyqzMpPs+QfCCpP
	57WyfBFH0l2dmRC/j6yLVAtEXNfdCRrInj3T8xE3IXqbdcEUn8bo6iBzUT2OOAP5cvXlSNW8K3s
	MNL+qxFuf8xghRIV3+7KZljalWiDkU+A1D/8JafrFN2h4=
X-Received: by 2002:a05:6000:18a5:b0:460:1967:abed with SMTP id ffacd0b85a97d-4603063c55dmr23643817f8f.39.1780926398981;
        Mon, 08 Jun 2026 06:46:38 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm54520923f8f.28.2026.06.08.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:46:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 15:46:38 +0200
Message-Id: <DJ3PPWNF0RPG.1GCYMK7HLSU0D@smile.fr>
Cc: <hsimeliere.opensource@witekio.com>
Subject: Re: [OE-core] [wrynose][PATCH] perl: patch CVE-2026-8376
From: =?utf-8?q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
To: <tgaige.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260528120100.1801387-1-tgaige.opensource@witekio.com>
In-Reply-To: <20260528120100.1801387-1-tgaige.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238241

Hello Theo

from what I see, this CVE also affects master (same version of Perl as
in wrynose)

I couldn't find a similar patch for master. Please submit one before we
can backport on stable branches

Regards
J=C3=A9r=C3=A9my

On Thu May 28, 2026 at 2:01 PM CEST, Theo Gaige via lists.openembedded.org =
wrote:
> From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
>
> Backport patches from [1]
>
> [1] https://github.com/Perl/perl5/pull/24433
>
> Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio=
.com>
> ---
>  .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
>  .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
>  meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
>  3 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.pat=
ch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.pat=
ch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/me=
ta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
> new file mode 100644
> index 0000000000..2b5d27147a
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
> @@ -0,0 +1,62 @@
> +From 6ad242ce86b16b74437e6815d507bc003e77a948 Mon Sep 17 00:00:00 2001
> +From: Tony Cook <tony@develop-help.com>
> +Date: Tue, 12 May 2026 14:47:31 +1000
> +Subject: [PATCH 1/2] perl/perl-security#147: test cases
> +
> +The suggested case from the ticket and an alternative.
> +
> +(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
> +
> +CVE: CVE-2026-8376
> +Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efda=
fe7c51a687a4907e4887988fe6a025ef]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + t/re/pat_psycho.t | 18 ++++++++++++++++--
> + 1 file changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
> +index 336039521d..73a7992372 100644
> +--- a/t/re/pat_psycho.t
> ++++ b/t/re/pat_psycho.t
> +@@ -10,7 +10,7 @@
> + use strict;
> + use warnings;
> + use 5.010;
> +-
> ++use Config;
> +=20
> + sub run_tests;
> +=20
> +@@ -31,7 +31,7 @@ BEGIN {
> +=20
> + skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
> +=20
> +-plan tests =3D> 15;  # Update this when adding/deleting tests.
> ++plan tests =3D> 17;  # Update this when adding/deleting tests.
> +=20
> + run_tests() unless caller;
> +=20
> +@@ -211,6 +211,20 @@ EOF
> +=20
> +=20
> +     }
> ++
> ++  SKIP:
> ++    { # sec #147
> ++        $Config{ptrsize} =3D=3D 4
> ++          or skip "these only fail on x32 and use too much memory on x6=
4", 2;
> ++        local $::TODO =3D "This crashes";
> ++        # original case
> ++        fresh_perl_like('/\x{10000}{1073741824}/',
> ++                        qr/Regexp out of space/, {}, "ssize_t overflow"=
);
> ++
> ++        # synthesized but similar case
> ++        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
> ++                        qr/Regexp out of space/, {}, "ssize_t overflow =
again");
> ++    }
> + } # End of sub run_tests
> +=20
> + 1;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/me=
ta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
> new file mode 100644
> index 0000000000..a1fef66119
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
> @@ -0,0 +1,49 @@
> +From 0fc9c70ccc0fea260326e08baa60d92797f8a79b Mon Sep 17 00:00:00 2001
> +From: Tony Cook <tony@develop-help.com>
> +Date: Tue, 12 May 2026 14:51:00 +1000
> +Subject: [PATCH 2/2] perl/perl-security#147: test against the actual cha=
racter
> + lengths
> +
> +(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
> +
> +CVE: CVE-2026-8376
> +Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119e=
b2bb1181be908701f22bf7068e722f1c]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + regcomp_study.c   | 7 +++++++
> + t/re/pat_psycho.t | 1 -
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/regcomp_study.c b/regcomp_study.c
> +index 9106452dd5..05f1b017b1 100644
> +--- a/regcomp_study.c
> ++++ b/regcomp_study.c
> +@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
> +                                                (U8 *) SvEND(data->last_=
found))
> +                                 - (U8*)s;
> +                         l -=3D old;
> ++
> ++                        if (l > 0 &&
> ++                            (mincount >=3D SSize_t_MAX / (SSize_t)l
> ++                             || old > SSize_t_MAX - mincount * (SSize_t=
)l)) {
> ++                            FAIL("Regexp out of space");
> ++                        }
> ++
> +                         /* Get the added string: */
> +                         last_str =3D newSVpvn_utf8(s  + old, l, UTF);
> +                         last_chrs =3D UTF ? utf8_length((U8*)(s + old),
> +diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
> +index 73a7992372..9fd764fd5e 100644
> +--- a/t/re/pat_psycho.t
> ++++ b/t/re/pat_psycho.t
> +@@ -216,7 +216,6 @@ EOF
> +     { # sec #147
> +         $Config{ptrsize} =3D=3D 4
> +           or skip "these only fail on x32 and use too much memory on x6=
4", 2;
> +-        local $::TODO =3D "This crashes";
> +         # original case
> +         fresh_perl_like('/\x{10000}{1073741824}/',
> +                         qr/Regexp out of space/, {}, "ssize_t overflow"=
);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-dev=
tools/perl/perl_5.42.0.bb
> index cf28067bab..1833b7a352 100644
> --- a/meta/recipes-devtools/perl/perl_5.42.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
> @@ -16,6 +16,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
>             file://0002-Constant-Fix-up-shebang.patch \
>             file://determinism.patch \
>             file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
> +           file://CVE-2026-8376-01.patch \
> +           file://CVE-2026-8376-02.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://perl-configpm-switch.patch \


