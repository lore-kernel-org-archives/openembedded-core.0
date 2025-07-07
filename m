Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A5C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:51:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3237.1751921471146150712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W8GmMYcx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso10698635e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751921469; x=1752526269; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0WBothNz3IxYkWiFrOc78PD6DZ3P+HmMpkk93JYJPA=;
        b=W8GmMYcxoRmnEvLFe4hCgP16SHgVqTs+Y7oOYnJUIqPfuxPXMk+Z+S77N7nk7G7vSE
         VJXy1Y/bSWLLbkTNQt5r00rBVaLOmiD0nBEADcrd8sY7dZHDu7HCoqFqgRT7uKN2JLm2
         S0qsdL2L7ToSSLu7riBAKrKFSuekx1TYVBFwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751921469; x=1752526269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r0WBothNz3IxYkWiFrOc78PD6DZ3P+HmMpkk93JYJPA=;
        b=TPJ3yoJwx80XwrgQh53Pz+zfJYGoe0l9cwu507FrbDtwpqWgC1xVRkbfJCV/1nzIPI
         7gCTtpkd+8KeGlP62enXgm3q6uLYGRFqueEmk1keanP+2kbmPWqiJK65wf4oxVQZi0Y9
         cKA8UlKCi+8kdFj05Kqu/3oL/nPcNdP0qpSc3FwHmqb5MkpQYwbv2xmuVwdGAkG17VJe
         FMbItFFL2RSfMTFa6ONWMVEW2y7BKkFzQNeLHh40g/qcN2gy2NsUN66mp5eVTpbue5Jd
         exPb3kNr0fPbTaztA9o7pxRu36vzp4+mtnyvtLQPqQ7mmNmIQx1QoMQIF67aY5O/0asU
         C6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3wR055pUjqQAuxnL8sdLC/suX6Bk7lm32jiNOoA/FU2eMrvJi780afsNQPA5wl06hDU2etzptTcA3x9tRzpsvQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1IdHc4pJHbs3MfTTi441D2Y5qYIOvvJKpfMF6I1kidWhDz5YZ
	9gNun3ejQhCU5tQWLQpBrGrntvzvGruBXQmXzUjOO3w1DWGJBXxwlYtRQn3zJhKc5NA=
X-Gm-Gg: ASbGncsc+Qk+KU1Qu+cAQLLzjGj8ANgSShenQwLBPGgidZfSda60WCGI7t+CarYEHKR
	LADUNCYDbCKTOhudbDFIg8R7eGOM8Z/JO1y29yRL9GSwoX5TJlVKfS1E/fsAfjbyu0HqiuMk1EP
	7SJ3UMsx8gv1TNs/onl6S+Q9vsGR6tNs2PwW/qE0UgGN1UGqH/0j+hblts6gT7BdkPq7y9f4L+G
	OVANl7Fk6qW7JUNfpL1ZXPaG1nRND5SsJrGX6iAA9DwfyLSk7Hw78ZdInkuifsmcvBGZj17QtUF
	TxNSvqOGyZlgihkmBuDeMU0MBN+ORsmC24k3C4xrXj+bYNlxVMdjXupFPBidok8DovYCFRam3y5
	X5tT+kxjYc1cheg7c7RiXWh4/hmsX/xxiJ89ES5GDmYt3UqX0AorxMtoejIlZOw==
X-Google-Smtp-Source: AGHT+IFNETKKAdRkzs6yYhzQk95WQteltSn9GCmy8PM/O5s3rK0PTQJjH8hO4gY7q/PJY5GQlU5Hjg==
X-Received: by 2002:a05:600c:1549:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-454b3122455mr149088345e9.15.1751921469529;
        Mon, 07 Jul 2025 13:51:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f30e:ae60:b271:f9d2? ([2001:8b0:aba:5f3c:f30e:ae60:b271:f9d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd49e738sm2055175e9.32.2025.07.07.13.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:51:08 -0700 (PDT)
Message-ID: <f8cd8b24019bd823472cf407268024bfbe8c029c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: fix pseudo for devtool
 deploy-target --strip
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Mon, 07 Jul 2025 21:51:06 +0100
In-Reply-To: <20250707204255.2789178-1-adrian.freihofer@siemens.com>
References: <20250707204255.2789178-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220001

On Mon, 2025-07-07 at 22:42 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Without this fix:
>=20
> devtool deploy-target cmake-example qemu1 --strip
> ...
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr/lib/libcmake-example-lib.so.1.0.0': Operation not per=
mitted
> cp: failed to preserve ownership for ...cmake-example/1.0/devtool-deploy-=
target-stripped/usr/lib/libcmake-example-lib.so.1: Operation not permitted
> cp: failed to preserve ownership for ...cmake-example/1.0/devtool-deploy-=
target-stripped/usr/lib/libcmake-example-lib.so: Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr/lib': Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr/bin/cmake-example': Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr/bin/test-cmake-example': Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr/bin': Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped/usr': Operation not permitted
> cp: failed to preserve ownership for '.../cmake-example/1.0/devtool-deplo=
y-target-stripped': Operation not permitted
> tar: ./usr/lib/libcmake-example-lib.so.1.0.0: time stamp 2025-07-06 16:46=
:06 is 0.527890738 s in the future
> tar: ./usr/lib/libcmake-example-lib.so.1: time stamp 2025-07-06 16:46:06 =
is 0.527462566 s in the future
> tar: ./usr/lib/libcmake-example-lib.so: time stamp 2025-07-06 16:46:06 is=
 0.526732779 s in the future
> tar: ./usr/lib: time stamp 2025-07-06 16:46:06 is 0.526415655 s in the fu=
ture
> tar: ./usr/bin/cmake-example: time stamp 2025-07-06 16:46:06 is 0.5256872=
1 s in the future
> tar: ./usr/bin/test-cmake-example: time stamp 2025-07-06 16:46:06 is 0.52=
5054415 s in the future
> tar: ./usr/bin: time stamp 2025-07-06 16:46:06 is 0.524821739 s in the fu=
ture
> INFO: Successfully deployed .../cmake-example/1.0/devtool-deploy-target-s=
tripped
>=20
> With this fix:
>=20
> devtool deploy-target cmake-example qemu1 --strip
> ...
> INFO: Successfully deployed .../cmake-example/1.0/devtool-deploy-target-s=
tripped
>=20
> This is most probably related to the commit:
> =C2=A0 2502da81709f25de499277b28d33c915638c45f6
> =C2=A0 bitbake.conf/pseudo: Switch from exclusion list to inclusion list
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0meta/conf/bitbake.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b1f8ac5b117..bd186ffeecc 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -745,7 +745,7 @@ SRC_URI =3D ""
> =C2=A0PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> =C2=A0PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
> =C2=A0PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_INCLUDE_PATHS =3D "/proc,${WORKDIR}/image,${WORKDIR}/package,${WO=
RKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-pa=
ckage/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo"
> +PSEUDO_INCLUDE_PATHS =3D "/proc,${WORKDIR}/image,${WORKDIR}/package,${WO=
RKDIR}/rootfs,${WORKDIR}/sstate-build-package/,${WORKDIR}/sstate-install-pa=
ckage/,${WORKDIR}/pkgdata,${WORKDIR}/minidebuginfo,${WORKDIR}/devtool-deplo=
y-target-stripped"
> =C2=A0
> =C2=A0export PSEUDO_DISABLED =3D "1"
> =C2=A0#export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"

This is hinting we should add a devtool test covering this!

Cheers,

Richard

