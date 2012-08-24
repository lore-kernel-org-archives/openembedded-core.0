Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T4y8e-0001S7-JL
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 19:57:44 +0200
Received: from mail21-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Aug 2012 17:45:36 +0000
Received: from mail21-ch1 (localhost [127.0.0.1])	by mail21-ch1-R.bigfish.com
	(Postfix) with ESMTP id 4B83DA006D;
	Fri, 24 Aug 2012 17:45:36 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1432I4015Izz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail21-ch1 (localhost.localdomain [127.0.0.1]) by mail21-ch1
	(MessageSwitch) id 1345830334237813_28739;
	Fri, 24 Aug 2012 17:45:34 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.254])	by mail21-ch1.bigfish.com (Postfix) with ESMTP id
	2F04F4E0043;	Fri, 24 Aug 2012 17:45:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Aug 2012 17:45:33 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Fri, 24 Aug 2012 12:45:32 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] distutils/steuptools: Fix files layout and
	unbreak builds
Thread-Index: AQHNgiBBtVaeUjBwbUKK0mk83LuX7w==
Date: Fri, 24 Aug 2012 17:45:31 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6164E7@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
In-Reply-To: <1345824924.14369.82.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 17:57:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <11FF9E9EB176BA4594049C17D8AE8843@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 11:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The last two distutils changes progressively broke the builds. Firstly th=
ey
> moved things from the site_packages directory to being higher up the tree
> which introduced package QA warnings as a side effect. Secondly, it inter=
acts
> badly with setuptools which passes in --root=3D${D} itself.
>
> This patch restores the original directory layout, hence fixing the QA
> warnings and also passes extra options to setuptools to deal with the
> --root option it passes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbcl=
ass
> index 52a1aa8..c73b24f 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -38,7 +38,7 @@ distutils_do_install() {
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install -=
-install-lib=3D${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install -=
-install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} ||=
 \
>          bbfatal "python setup.py install execution failed."
>
>          for i in `find ${D} -name "*.py"` ; do \
> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bb=
class
> index ced9509..ba9cf13 100644
> --- a/meta/classes/setuptools.bbclass
> +++ b/meta/classes/setuptools.bbclass
> @@ -5,4 +5,5 @@ DEPENDS +=3D "python-setuptools-native"
>  DISTUTILS_INSTALL_ARGS =3D "--root=3D${D} \
>      --single-version-externally-managed \
>      --prefix=3D${prefix} \
> +    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
>      --install-data=3D${datadir}"

Looks good... stuff is packaged properly for the libdir =3D /usr/lib64

Thanks,
M

>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



