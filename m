Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaSAa-0000ds-MF
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 16:50:09 +0200
Received: by mail-pd0-f174.google.com with SMTP id u10so2050342pdi.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ZH5M+hB/gFxLrlWLKCTYVm+bym3IU1JZlVPCi6hBmMM=;
	b=gvxGlQikyvP261oX2Du2ZB1SFthNcoUQ3OVwrzJbMTS7WAnHIUfzezHlQzHMjDM655
	tTXgE8UsOFEPjiK2MUEJuTeramKZquGSynrGGjMic7PCu1OSOXkKYHYbWm4WNSAAGzuh
	5XCvrCJ3BCRWoT6pDfPaEaf2qzzLE/HyL6joWJ9TXvb1LtSqZo7a3Mwh33QIMdi/C/Fr
	K8Hc5+0yqbmrzx/dVP4cFbufUEO7PtGPhrLa1rGHEwSm+x9+vlXi9WTEWDIMvqCbY4Y3
	2YAIH+onxjYAxCoEYGKh9Ed+l5wn1qlokjK0wm+MrlTCDYH6vCCmnU/0hKV6ZukRxQ34
	iGxw==
X-Received: by 10.68.220.106 with SMTP id pv10mr12976695pbc.52.1368109923989; 
	Thu, 09 May 2013 07:32:03 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id hp1sm3955408pac.3.2013.05.09.07.32.02
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 07:32:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 07:32:03 -0700
Message-Id: <A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
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
X-List-Received-Date: Thu, 09 May 2013 14:50:34 -0000
Content-Type: text/plain; charset=windows-1252
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

ah too early. I think you should spin out libpthread into separate =
package and then RDEPEND_libpthread =3D "=85"
and don't use nptl we do not have any other option now a days.


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



