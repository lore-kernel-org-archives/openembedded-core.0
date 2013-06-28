Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE63608BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:22:47 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so2755693pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=KXFEbGL8ItoZRYkLW3pBApD3QY+Izo72pHUH8Agw+9g=;
	b=kxXE7A91uPsgK6Cuw9dwsIczX8GEN4mENPl0bQYHgelvU/GngCMaaxyDuIMEvcBIyD
	xMSduhWutiBTWutq841NP02lQbUBxiOEhjz88xMr043UfQZOSnq6gBHN3uZ+wqbbzaHS
	kc2VmShVmeuXeIavY5dNIzVq5JeEuuWgYCI7RBLJS2/raCXCt48ps6iTBOAwCwwSOJpS
	ZfSr+oV0th95iMwsp0bohqbUfolYW7PtFCJQ9GcQAiNbAOx1LiqWlZJAXWr6h4Ts7w/7
	L81BMJrJ4PYokYrX8Ot6iOGySth0sXLh0JcpYTVgeZt1SeBxHKoM5Qa9PZpp8a0hHYFO
	r5iA==
X-Received: by 10.66.246.133 with SMTP id xw5mr13254616pac.114.1372458168502; 
	Fri, 28 Jun 2013 15:22:48 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id p2sm10755519pag.22.2013.06.28.15.22.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:22:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372457299-8340-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 28 Jun 2013 15:22:45 -0700
Message-Id: <0DD42095-18E6-42E9-A246-D465FE449B43@gmail.com>
References: <1372457299-8340-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] security_flags: Add the compiler and linker flags that enhance security
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jun 2013 22:22:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 28, 2013, at 3:08 PM, Saul Wold <sgw@linux.intel.com> wrote:

> These flags add addition checks at compile, link and runtime to =
prevent
> stack smashing, checking for buffer overflows, and link at program =
start
> to prevent call spoofing later.
>=20
> This needs to be explicitly enabled by adding the following line to =
your
> local.conf:
>=20
> require conf/distro/include/security_flags.inc
>=20
> [YOCTO #3868]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/conf/distro/include/security_flags.inc | 26 =
++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
> create mode 100644 meta/conf/distro/include/security_flags.inc
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> new file mode 100644
> index 0000000..7a7ab52
> --- /dev/null
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -0,0 +1,26 @@
> +SECURITY_CFLAGS =3D "-fstack-protector-all -pie -fpie =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_LDFLAGS =3D "-Wl,-z,relro,-z,now"

these should be weak assignments (?=3D) I think

> +
> +# Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
> +# to CPPFLAGS it gets picked into CFLAGS in bitbake.
> +#TARGET_CPPFLAGS_pn-curl +=3D "-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-curl =3D "-fstack-protector-all -pie -fpie"
> +SECURITY_CFLAGS_pn-ppp =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-eglibc =3D ""
> +SECURITY_CFLAGS_pn-eglibc-initial =3D ""
> +SECURITY_CFLAGS_pn-zlib =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-gcc-runtime =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-libgcc =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-tcl =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-libcap =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-python-smartpm =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-python-imaging =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-python-pycurl =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-kexec-tools =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +
> +# These 2 have text relco errors with the pie options enabled
> +SECURITY_CFLAGS_pn-pulseaudio =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +SECURITY_CFLAGS_pn-ltp =3D "-fstack-protector-all =
-D_FORTIFY_SOURCE=3D2"
> +
> +TARGET_CFLAGS_append =3D " ${SECURITY_CFLAGS}"
> +TARGET_LDFLAGS_append =3D " ${SECURITY_LDFLAGS}"
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


