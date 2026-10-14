Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A108BCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:44:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10587.1791974633529260423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XwptelYR;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso195989f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791974632; x=1792579432; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V66pfciVSslBaM/HJQqmYYOCk62PU9UZLzAOGSPhjk=;
        b=XwptelYRNGa6Ef9EhLk2m2LA+fLbnnDL4FGQvcoXPxD9pVDT1YpOh0/cktFfCUkrix
         mt4nHiD5PuLwWRl7BxZFJ+wNkhiT8ud6DwShjHULoU0r74duZuhcbB7IPrtjTUmMM4Bw
         HbW6n6TB27l/a8dqX9KSDc9a4J2JibwVz39Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974632; x=1792579432;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V66pfciVSslBaM/HJQqmYYOCk62PU9UZLzAOGSPhjk=;
        b=WiEE1mQMkP9D4VVEhYY6ZbB2R08Cbs2F6stqyFTQJqN8JtYPyIJwWr0+dZynrA8fK3
         VCYZiKgbyhXESrM1vHqBtZBaD8Bo6dzGrqMUG2Ed3eRb46gyt+5T33KEI/IpQ1XYjzBR
         XrUcsEuZI9KCFqdkZqRJfhO+luTHoxPX2O8KCOTrVCBAY1U2BwOEKB2D4khAHGNaI1A0
         Ko1Dw0FH6RTlKXZseAQxKeaqu82/3jy/6Oo0KS8792dvRUhycSWmXHUABClQHY+m4XCJ
         NrIXSTUxFUc9uuW14zjg9kHNYuMEMoyG/7zXf4909NmEaNZwe6t2okysXkMMBO9Vw0fX
         Gntg==
X-Forwarded-Encrypted: i=1; AKwUvByCiRz4ygWz/wO2HXz9KfZfjoywOZIPHuuv79Xv3ycqMsBJ14Oy4v74SsXUFPi64z2EPsUz2szWH9hoAXU24v67SQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLurrd9iurdQRIOIAyV8p62ezWHMSjLko3c0SmjEu+ZlO/cXfE/
	QdU4NewH0LCwAU1jg02O2D8BreZscuLQRu8sLcTZCm5NQFZV1l1YHptcnX0EUT4HVfEyyKFenUz
	vRhkJdXI=
X-Gm-Gg: AYBFou0LaQofC2fbk1ORmFZV10T9Yx77pTJnS0xRSlgcpv/l7i7dr1yRoHYUJ728S4a
	YKcVCeEAHFSWbGf4zPgfxyyuu9atIlKVAmRxTKlMJO+JroEBE24Jo66kRn/xedDokjvTht9bvKl
	jNhui1s6DlJKStD+vecC4baAWPsPYPeykg8FslhPPJ0nw+BcxL0uRFie3gkkOs+JENsmMSdHh93
	S7+F2sFD2c7fMhxZ/n+Ygaghx1NFiE/tTqsymQLmtu2aFHjL0nJyRDHV4rmLYx5K5YYfUf86zlA
	BKWY6x3FD8/h9ztEaAxIXko1jEXib/+LMmptRsz0GYXo8SAr8642aBuk70SPGzmd2xEvL2l/H6y
	0BvQCPNgY7VG6Dmt51pZ9vjuoGFwH2ABV1NBvld+4hEL1Vxb7yubbbX0LNJ/66boM1O7o+WIfa/
	mzhV4GAF9JqAqiim18rcezapyOyq3pAVBig96o3F59TfMyZDwgucP98kr1fwJsgX1f0JV22jtA8
	t/RBsvL9d1EWiBD5tH/+MOs8AGEKmsxaw6F4nuI/IxI/4kMRiJtoMv57Gk=
X-Received: by 2002:a05:6000:260b:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48dba9dd11bmr31755299f8f.35.1791974631564;
        Wed, 14 Oct 2026 03:43:51 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm10909326f8f.48.2026.10.14.03.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:43:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 12:43:50 +0200
Message-Id: <DM4HZOR2X62Q.1H5GIKJ27WR6K@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] perl: Security fix for
 CVE-2026-48962
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261012174810.45428-1-rsangam@mvista.com>
In-Reply-To: <20261012174810.45428-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 10:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247754

Hello,

On Mon Oct 12, 2026 at 7:48 PM CEST, Rohini Sangam via lists.openembedded.o=
rg wrote:
> Pick patch from [1] also mentioned at Debian tracker in [2]
>
> [1] https://github.com/pmqs/IO-Compress/commit/f2db247bf90d4cc7ee2710be38=
4946081f3b4610
> [2] https://security-tracker.debian.org/tracker/CVE-2026-48962
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../perl/files/CVE-2026-48962.patch           | 168 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-48962.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-48962.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-48962.patch
> new file mode 100644
> index 0000000000..b883f8e13e
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-48962.patch
> @@ -0,0 +1,168 @@
> +From f2db247bf90d4cc7ee2710be384946081f3b4610 Mon Sep 17 00:00:00 2001
> +From: pmqs <pmqs@cpan.org>
> +Date: Sat, 16 May 2026 17:48:34 +0100
> +Subject: [PATCH] remove use of eval in globmapper. #73
> +
> +CVE: CVE-2026-48962
> +Upstream-Status: Backport [https://github.com/pmqs/IO-Compress/commit/f2=
db247bf90d4cc7ee2710be384946081f3b4610]
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + cpan/IO-Compress/lib/File/GlobMapper.pm | 52 ++++++++++++++++++++-----
> + cpan/IO-Compress/t/globmapper.t         | 52 ++++++++++++++++++++++++-
> + 2 files changed, 94 insertions(+), 10 deletions(-)
> +
> +diff --git a/cpan/IO-Compress/lib/File/GlobMapper.pm b/cpan/IO-Compress/=
lib/File/GlobMapper.pm
> +index f015b16..8936146 100644
> +--- a/cpan/IO-Compress/lib/File/GlobMapper.pm
> ++++ b/cpan/IO-Compress/lib/File/GlobMapper.pm
> +@@ -29,6 +29,11 @@ our ($VERSION, @EXPORT_OK);
> + $VERSION =3D '1.001';
> + @EXPORT_OK =3D qw( globmap );
> +=20
> ++our $BEGIN_DELIM =3D "\xFF"#########################
                             ^ that # block is new and does not look right.

Can you check?

Regards,
--=20
Yoann Congal
Smile ECS


