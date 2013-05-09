Received: from mail-pd0-f180.google.com ([209.85.192.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaS4J-0008Ry-Kf
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 16:43:45 +0200
Received: by mail-pd0-f180.google.com with SMTP id t10so2050707pdi.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Fz8OS0Shg1Ddv5TR3zSZ2cLuRyHlNxqjVyuCJA/sVhA=;
	b=GrJhub5Omdn0+imzsz+9xL8nbCyoWpTjppC1RgFUu5cIdT2AGNBz+9yrHKbJLikWxF
	gDKTsGVp/e6PT7lFiJ3anO5Um9A9t4hoTB8vcD2DslvSlkbuojkAUfK3Ffie+AScHROL
	0ZYBLKdKLs45yWBSKSuQfAie0slD/+uO6REPH1tkH43TUZxD8mCKWJQbgR1wfGEjuQzx
	s/lfD2u7zaOxR/grUeUI+jork8jlR8qwZF1kPT1AdCFZV5SwDJysMlcfXAWEdgsBel+7
	ZKdgZz6hj0qwdvYZrt/Yg+tUkFW9vfY6lSKHjipVGAQCxJlWFW6gciSgn/Z+f1KQbU6P
	eG4Q==
X-Received: by 10.66.248.68 with SMTP id yk4mr13492752pac.137.1368109535075;
	Thu, 09 May 2013 07:25:35 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id 7sm3259857pbl.32.2013.05.09.07.25.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 07:25:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 07:25:34 -0700
Message-Id: <FEEEBB6F-4848-4C86-AF1F-C2AF58D1D085@gmail.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 14:43:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 9, 2013, at 5:55 AM, Bogdan Marinescu =
<bogdan.a.marinescu@intel.com> wrote:

> libpthread needs libgcc to function properly. Without libgcc I get
> the following error:
>=20
> root@qemux86:~# tclsh
> % exit 0
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
> root@qemux86:~#
>=20
> This patch fixes the above issue and similar ones by adding a
> runtime dependency of libgcc to eglibc when threads are enabled.
>=20

Looks OK=20

> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
> meta/recipes-core/eglibc/eglibc.inc |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc.inc =
b/meta/recipes-core/eglibc/eglibc.inc
> index 1e04197..24fb05b 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -35,7 +35,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
> # nptl needs unwind support in gcc, which can't be built without =
glibc.
> DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers =
virtual/${TARGET_PREFIX}libc-initial"
> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect =
this
> -#RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> +RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> PROVIDES +=3D "virtual/libintl virtual/libiconv"
> inherit autotools
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



