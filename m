Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCA7C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:16:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38907.1787843801536352020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W19iTyc3;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so21361425e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787843800; x=1788448600; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqDSSXi4dv6ZJIZn3ZPImQrMdXdhZppy2Jadw+dss7Y=;
        b=W19iTyc3mf13t03hRr+8vZ7CYkJGtx3qdpGZOv+OSPPouA/eIwS4u5HfrgOqDdBKDT
         jobSTUIMCErcXqBebrbkQt2ZP6jybJx6bwpTkhlftGG/RVbIIWfnmzSvU7tpY/j9Y5Ny
         7XOHvBHZKAUprWKSC2tLJBJrlQ5d7DtWR/qCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843800; x=1788448600;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqDSSXi4dv6ZJIZn3ZPImQrMdXdhZppy2Jadw+dss7Y=;
        b=kW2FdetxEXo4ZFiAUsMkq4Zpg9yqJdlea7J5x1jJSQeKQFe5yGgyaOsB5Li0co+jG2
         AW1SQ0risKqlLJBTmHnnVa4z+j35vXIav68dQcJIQN/CFyn/cJvJxsr51nWKrOUuistI
         u+MNshnrrrbCTdOgYRQUBgzZ1T69/PczZ8oTK7vQSJdqomamf86pJvSeKCK9+Fi6YfJ/
         /TFTTlgxFAH9Rq/4XKZcZHTPEWeO/XzB1sWUkFjXQzWt6qibYiFinyOCWKlEXOJpSIBU
         hNhQQOJFRCfk4Rq+Zf5+OU9sFEP/YqTYXWtdlR+8EN5cGWs9QciCbMM2UCnhfreF4eWc
         1ZKA==
X-Forwarded-Encrypted: i=1; AHgh+RqicSA+h8kCBygTsV4uqQ0Ryy7GCR+3tLWgi+rmVF+o7FLhf5m1m6rUdHEmDPJl5U/jyJ5yjJHKxRQ21kQUFQKuKw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lSy4bUn815NX4bIaAfUNwam2+sB9yYqSzkY55zgfzotstrZCjS
	CSWXcqeXoKdaqxOEcEy1h81+k16n3/HiD+isaQM2epvQegFeBDjbbp4/ObV+UHiHwSs=
X-Gm-Gg: AR+sD10U4HOcxf2x8At/Jennc/FfQj922MaZyVjRbEkCHPqoZf++EiT6qOWiOPcmjFu
	Md3cRAAVKbC6nzPqWP3H2Gtvy3R/dzwfuZbzNZDSasuVmsKfqpfmsBpZcuHjo+2eJsOj+Jo+J1T
	SyMtmnGt0xRFk2Cpp/25ySUk0Yzx8w2fE5C72SEciBIwGzddsFxuQ93RsRxBQDjVGKIfMO2FsbD
	TLYH6+p1d+JyAV5Zja98fVgP2l6Dz7tiD0GCjGMjC5qmFAH39GN4JTts1kl+Urcb/5AViTLne8o
	tvWE5iYrCDpi3UYEdX/ex0DtEjtEI0jVmryw866reidUdbSg2rdx2Ho98Uy6t+YSpV/NGl8LO9H
	Ni9SbZSsRy/facml1+VLWEGPxWoqyo6WmKMnSRziL4quKOJufY+h4XSSVZnzLV2bmosEn7rpxg1
	FN0oozGQ+LhojZcGOv0UA+1clg8v8nJBHBjNb3/0ahVHeTj6X0loYKjAX/eAypp4tTeXvoLSyFR
	FYTBwM2mo9yZTCHPBxvQSIDDzRqEG2jOVMaFLpfrNS/x0ooEma5ubCgBCKp4us=
X-Received: by 2002:a05:600c:1d89:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49b9161dc05mr11120175e9.14.1787843799567;
        Thu, 27 Aug 2026 08:16:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8499sm10182444f8f.26.2026.08.27.08.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 08:16:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 17:16:38 +0200
Message-Id: <DKZTQEMBB4X3.20JXBADJEQJIJ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] classes-global/license: create
 -lic package from PKGD, not D
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <roman.nazarenko@leica-geosystems.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260827140542.669897-1-roman.nazarenko@leica-geosystems.com>
In-Reply-To: <20260827140542.669897-1-roman.nazarenko@leica-geosystems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244497

On Thu Aug 27, 2026 at 4:05 PM CEST, roman.nazarenko via lists.openembedded=
.org wrote:
> From: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
>
> do_package and do_populate_sysroot are siblings - both are only ordered
> "after do_install" - so they run concurrently. With
> LICENSE_CREATE_PACKAGE=3D1, perform_packagecopy:prepend wrote the
> LIC_FILES_CHKSUM texts straight into ${D}${datadir}/licenses/${PN}/,
> mutating the very tree do_populate_sysroot stages with find|cpio:
>
>   | DEBUG: Executing shell function sysroot_stage_all
>   | cpio: ./licenses/libmodule/LICENSE: Cannot stat: No such file or dire=
ctory
>   | WARNING: exit code 2 from a shell command.
>
> copy_license_files() removes and re-links an already existing
> destination, so a file can be listed by find and gone by the time cpio
> stats it.
>
> Write into ${PKGD} from a perform_packagecopy:append instead. By then
> ${D} is complete and untouched, and ${PKGD} is a private copy that
> do_populate_sysroot never reads. Package contents, on-target paths and
> ownership are unchanged - do_package is a fakeroot task, so the
> os.chown() in copy_license_files() still applies. As a side effect the
> license texts stop being staged into every target recipe's sysroot,
> which they had no business being in.
>
> The stale comment about do_install:append goes away with the change,
> taking the find_license_filesa typo with it.
>
> This changes perform_packagecopy, so do_package basehashes change for
> every recipe; expect a one-time repackage.
>
> Signed-off-by: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>
> ---
>  meta/classes-global/license.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass
> index 6e0de5f414..f2d83c227c 100644
> --- a/meta/classes-global/license.bbclass
> +++ b/meta/classes-global/license.bbclass
> @@ -45,14 +45,15 @@ python do_populate_lic() {
>  }
> =20
>  PSEUDO_IGNORE_PATHS .=3D ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') =
or '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE'=
) + '/meta/COPYING').split())}"
> -# it would be better to copy them in do_install:append, but find_license=
_filesa is python
> -python perform_packagecopy:prepend () {
> +# Write into PKGD, not D: do_populate_sysroot stages D concurrently and =
races
> +# with the remove-then-relink in copy_license_files().
> +python perform_packagecopy:append () {
>      enabled =3D oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
>      if d.getVar('CLASSOVERRIDE') =3D=3D 'class-target' and enabled:
>          lic_files_paths =3D find_license_files(d)
> =20
> -        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot=
 be used to join D and LICENSE_FILES_DIRECTORY
> -        destdir =3D d.getVar('D') + os.path.join(d.getVar('LICENSE_FILES=
_DIRECTORY'), d.getVar('PN'))
> +        # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot=
 be used to join PKGD and LICENSE_FILES_DIRECTORY
> +        destdir =3D d.getVar('PKGD') + os.path.join(d.getVar('LICENSE_FI=
LES_DIRECTORY'), d.getVar('PN'))

Hello,

It looks like this patch could apply to master (at a really quick
glance).

We have a "master-first" policy which prevent me from merging anything
to scarthgap if there is no wrynose&master equivalent.

Depending on the situation, you will need to send master&wrynose patches
before I can review this patch.

Regards,
>          copy_license_files(lic_files_paths, destdir)
>          add_package_and_files(d)
>  }
--=20
Yoann Congal
Smile ECS


