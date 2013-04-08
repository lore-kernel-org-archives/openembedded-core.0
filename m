Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPJ0G-0006SU-Mv
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:49:28 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so2522293eei.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 13:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kbiWrOg1s20J5DlKpUwBgZDpC09BdY6NrhcMmizP5LM=;
	b=Eo0aR1sOnFVaXKHjpdGlc2u2dlgxaVsMrQ4sliEUnpRP+xWplSCswecJ9AMpeLxPhg
	ECH8WtMsBJ8XxpproAgn2FLci+JdTssyaGtUR3I/fUmaAomdfZUkZk79fl46oJilX6YO
	8txXvE0IG9guqBkBzHd+QFnIUGKTR/AE4h+OMb8MkHnztB+BTb9gH5RM50rW+jlJ1YeF
	Uuws+1KvG+sRX0moNN1kHO/wbetPTetwMBmYeTX4rddx6oaSL9/fc+1rN65N8Ktwsg/o
	SJIl4ErUC2Vaeh3WsDK1Ffxdjy4g0IyAO+rdFaKpAMYo993L2Rk73+JB2sXmj+8xsRQS
	CKRg==
X-Received: by 10.15.43.132 with SMTP id x4mr52620123eev.31.1365453125680;
	Mon, 08 Apr 2013 13:32:05 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d49d:a01b:fdce:f41f?
	([2001:610:612:0:d49d:a01b:fdce:f41f])
	by mx.google.com with ESMTPS id bj2sm9372636eeb.1.2013.04.08.13.32.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 13:32:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
Date: Mon, 8 Apr 2013 22:32:01 +0200
Message-Id: <25B01A83-A45B-4614-97B0-CB8E434CA168@dominion.thruhere.net>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkgn1Iatke/2blV/+Ua5TPPOCx0ElNqoaV/rxq3QjoPFVxKItHJGvYwE2KHUWJ5Q2wrZVUs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 20:49:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 apr. 2013, om 18:29 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> Along with v182 upgrade udevd was moved to ${base_libdir}

By upstream, yes

> making scripts like init-live.sh to fail in finding udevd

So you should fix those scripts, not mess around with udev.

> Fixes [Yocto #4046]
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
> meta/recipes-core/udev/udev.inc    |    3 ++-
> meta/recipes-core/udev/udev_182.bb |    2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
> index e358d2d..c4d2ce4 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -40,7 +40,7 @@ EXTRA_OECONF =3D "--disable-introspection \
>                 ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
>                 ac_cv_file__usr_share_misc_pci_ids=3Dyes \
>                 --sbindir=3D${base_sbindir} \
> -                --libexecdir=3D${base_libdir} \
> +                --libexecdir=3D${base_sbindir} \
>                 --with-rootlibdir=3D${base_libdir} \
>                 --with-rootprefix=3D \
>                "
> @@ -61,6 +61,7 @@ RRECOMMENDS_${PN} +=3D "udev-utils"
> FILES_${PN}-dbg +=3D "${libexecdir}/.debug"
> FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug/"
> FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug/*"
> +FILES_${PN}-dbg +=3D "${base_sbindir}/udev/.debug/*"
> FILES_${PN}-dev =3D "${datadir}/pkgconfig/udev.pc"
> FILES_libudev =3D "${base_libdir}/libudev.so.*"
> FILES_libudev-dbg =3D "${base_libdir}/.debug/libudev.so.*"
> diff --git a/meta/recipes-core/udev/udev_182.bb =
b/meta/recipes-core/udev/udev_182.bb
> index 42b4d08..d66292e 100644
> --- a/meta/recipes-core/udev/udev_182.bb
> +++ b/meta/recipes-core/udev/udev_182.bb
> @@ -1,6 +1,6 @@
> include udev.inc
>=20
> -PR =3D "r6"
> +PR =3D "r7"
>=20
> # module-init-tools from kmod_git will provide libkmod runtime
> DEPENDS +=3D "module-init-tools"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



