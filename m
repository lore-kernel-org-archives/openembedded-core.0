Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E89EE36AB
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:57:56 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49971.1770915472191475608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R76Cfkti;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e57973dbfso17047e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:57:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770915470; cv=none;
        d=google.com; s=arc-20240605;
        b=RVyjd+hI5Al051zttFP6o6vkQrVr5IXNYmUe4ZZjTD+bGe/eghMwIv33PU6X0Ho5qz
         FAJzTnYDpNNPuzHMZGzA6LoGV3VBbgSu4EjJZBb0yI4MqMPYl+oX31ukgJXaKUlSBCMs
         OO1VfCk0bIKVMDxIw0cIAbOMDVzVaZs3yA21HqE4gFeyzQjRD6QpYxybuBg48pU/BuXc
         ujWAQ23pLGIL1d1KZ4j/K+TReRCrSRZZzTjT8l0bpoOKCyQMZIJyIMTncZhy8IGYogvs
         19eT5TbCDHlPyckqLXxA33+MEnDxMObPGJz2h+xQJZJ+6KHyfcLN4S0VvTob7ZaNundX
         K6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+mipi+vQUjWfhHjNAtl/SaKHvXEPc1OFKM3h+Ag5Y94=;
        fh=28hdYE+OLaBgBefCycbWZI+cj8p2mU+vOndX0atMzcE=;
        b=K42IT5NRs6FTVT17WJUiaSebJ9Eb4cPFjDIZvfitnm63OGwdvwL8+mHyDR5Pd+iHS/
         YwDc/0s3yCu9meiq6TkEtNC9d4NiR/c+y5TFHiir3dMfZJnsTMLEZEfgUoPfWf7YG3Ss
         INzpjv14qvNcCu5zTBQzwBau4/sqwCgo7s3Fh73x0nh8vTQdVteVdGsVmiSAOI+WJuof
         qfWVYv+Jmeca8oG6HTcvdnDM2iD73qIzYhSDazWTK/ByMPp5n27kJwiQQdgfxDOGYUKH
         0HEOn9wZDVu4qa8+YJ5UnjP3JenrtVfhxj21Ei4uh9piTsulACkMZenDIvzZ31VexTsw
         9JkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915470; x=1771520270; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mipi+vQUjWfhHjNAtl/SaKHvXEPc1OFKM3h+Ag5Y94=;
        b=R76CfktiKkNVC7/ULWs4gcWIthb9rxnjfWgbStisCa3+/mbiXcqCGcwldA4rm9d0R8
         KqPyM46ls4jQSs4iRJtKdvprU/lddKyyqBjcz9QdqSMfCUlPRY2qLkE5vPPrGCbPNmNI
         9j8zYbWZAijCT31+G+k/L0CGl/qy/3sW+LFS07x/THzzELvEIwNP+pIclJI7RpEYmlO5
         +OjPYaPnXa/vWUHGCmwJbuDd0KtcdvHk2CacQec0Ljsoij12QokdeCoD6cr/wtdN29z7
         sZd9ImT6XbmOINgNvRbQLwq+0c79uUj74ljz8kXi0sRKP4WODtxoIzo8VXdUg/vfpSMs
         YpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915470; x=1771520270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mipi+vQUjWfhHjNAtl/SaKHvXEPc1OFKM3h+Ag5Y94=;
        b=MfHzM581vCJCrgIYj1UCQosEbtSYEvE65+Zi5yC4ehqRHP2KF+1E1018aPYUjV2K7g
         e+2d931Zv7e5/uKBRhw+R1GbnRsgpWaQ46mtsMZf5cRp5YM8Uyl14/6/eIsfkgmFUXSW
         XC4smUNY6YPNU3XqyyUrTljEvNbLcWMNwJtzfC+pIlFeAPkUC55tD+amgAD7bt5d3H8t
         aiNzsvAZ6CqkQT237lttJDqYRgnHEN5wysHhbHF18DezQA48ooo9RTp9YBK0zx7tyLU/
         LdjC2/uA31f2ABkwy3eJ0pnUCoaF7Er9tPtjBtrIT6NJ38UjOJW30psXmPRzwvfEnTif
         rbrQ==
X-Gm-Message-State: AOJu0YyhyUa5F44xN5cCI+bsVFnYxQjCXR3eid3ytgNVokYtE2pGNDac
	fuqug0Up4Y1bVE/0imO4R1iVsMqdmR04PYCZAbXgQ01eEyplbVdlcHmKdaTqBLmhpmj6EU9hA6Y
	nK4tQTH/4oKLcPndWY1gKnO7NtJP1Vx/uvQVX
X-Gm-Gg: AZuq6aIQjC7OSXl9rZ2bCV0hb5i9mW/g0j7b1VqrMHJUnOXvWFHCMFWiOX0+9ufOZeQ
	LY/3vvu9/bFZIcWzEmFro+swIwhNTeSx5JMJMD26E7Rbl8tuQ2Oc5zbZA7y6/ye9PwvV3SrPYR9
	hvD1ji4sjh4+tvfDRxnMBdcAhCIqxgiskOS+OJpegKSAy7crJqrn7/qJAF0Ge95z7CRE5D0lVXy
	O9WetKXhtoRQbFx1MkoA2qaRk0wQdK9J9qILR30NIlkW//Zp93upRdiPUlcL0wI1fHf440fW/Gt
	Y6WL2W9mEg==
X-Received: by 2002:a05:6512:118d:b0:59e:5f52:7b5a with SMTP id
 2adb3069b0e04-59e64954714mr1078012e87.17.1770915469990; Thu, 12 Feb 2026
 08:57:49 -0800 (PST)
MIME-Version: 1.0
References: <39c95a51-e40c-6d9c-a111-67fe556b11cd@crashcourse.ca>
In-Reply-To: <39c95a51-e40c-6d9c-a111-67fe556b11cd@crashcourse.ca>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Feb 2026 17:57:36 +0100
X-Gm-Features: AZwV_Qgnv3_derq0AnlonG-Z6QOGcNhVn84qmjpNHRGjmNB_aYXxKzg5Ok_dwq4
Message-ID: <CA+chaQf_87DENGp=i52vgk26RDEhaydg4b_3EuBoX=tJBWeAgg@mail.gmail.com>
Subject: Re: [OE-core] error about "allarch packagegroup" for a NOT allarch packagegroup
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231049

Set PACKAGE_ARCH before the inherit.

On Thu, Feb 12, 2026 at 5:42=E2=80=AFPM Robert P. J. Day via
lists.openembedded.org <rpjday=3Dcrashcourse.ca@lists.openembedded.org>
wrote:
>
>
>   re-organizing an existing build into using packagegroups (walnascar
> OE/YP release), and i defined the following packagegroup to collect
> all the TPM/TSS stuff:
>
>   SUMMARY =3D "TPM, TSS stuff"
>
>   inherit packagegroup
>
>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>   RDEPENDS:${PN} =3D " \
>     tpm2-tools \
>     tpm2-openssl \
>     libtss2 \
>     libtss2-tcti-device \
>     libtss2-tcti-mssim \
>     tpm2-abrmd \
>     tpm2-totp \
>     tpm2-tss \
>     tpm2-tss-engine \
>   "
>
> during the build:
>
>   ERROR: packagegroup-tpm-1.0-r0 do_package_write_deb: An allarch
>   packagegroup shouldn't depend on packages which are dynamically
>   renamed (libtss2-tcti-device to libtss2-tcti-device0)
>
>   ERROR: packagegroup-tpm-1.0-r0 do_package_write_deb: An allarch
>   packagegroup shouldn't depend on packages which are dynamically
>   renamed (libtss2-tcti-mssim to libtss2-tcti-mssim0)
>
> but as you can see, i don't define an "allarch" packagegroup and
> explicitly set:
>
>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> and yet, i get that error. nevertheless, the build finishes and
> creates an image.
>
>   i'm confused.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231040): https://lists.openembedded.org/g/openembedde=
d-core/message/231040
> Mute This Topic: https://lists.openembedded.org/mt/117777298/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

