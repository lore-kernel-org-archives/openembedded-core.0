Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAPt3-00061T-2G
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:03:53 +0100
Received: from mail159-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE007.bigfish.com (10.43.70.57) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Mar 2012 17:54:52 +0000
Received: from mail159-ch1 (localhost [127.0.0.1])	by
	mail159-ch1-R.bigfish.com (Postfix) with ESMTP id BC8C84405AC	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:54:51 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail159-ch1 (localhost.localdomain [127.0.0.1]) by mail159-ch1
	(MessageSwitch) id 133235249080246_22057;
	Wed, 21 Mar 2012 17:54:50 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail159-ch1.bigfish.com (Postfix) with ESMTP id
	060D44018F for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:54:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Mar 2012 17:54:49 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 21 Mar 2012 12:54:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf/sstate.bbclass: Change PATH
	when installing sstate files to avoid issues
Thread-Index: AQHNB4u5blAnmg2J7kS03RUMxVYD5w==
Date: Wed, 21 Mar 2012 17:54:55 +0000
Message-ID: <CAEsOVNcy6kwQQ0oank6gO4yOSuUM6NNG0fYk752sQvYWy+9GDA@mail.gmail.com>
References: <1332326683.9740.136.camel@ted>
In-Reply-To: <1332326683.9740.136.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 18:03:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0E4A5BBB7D9CBE4981E8EBD6CA662FBF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 5:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This resolves issues related to pigz-native when installing from sstate t=
hat people
> have been seeing. It also gives us a way to solve issues like the gzip-na=
tive race
> during sstate package creation covered in Yocto #1774.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0d16d11..1570654 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -153,6 +153,12 @@ def sstate_installpkg(ss, d):
> =A0 =A0 =A0 =A0 bb.mkdirhier(dir)
> =A0 =A0 =A0 =A0 oe.path.remove(dir)
>
> + =A0 =A0# We're adding binaries into the sysroots, we don't want to exec=
ute them
> + =A0 =A0# whilst they're half installed or being installed so we need to
> + =A0 =A0# remove the sysroots from PATH
> + =A0 =A0savedpath =3D d.getVar("PATH")
> + =A0 =A0d.setVar("PATH", "${ORIGPATH}")
> +
> =A0 =A0 sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % ss['nam=
e'])
> =A0 =A0 sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + "=
.tgz"
>
> @@ -190,6 +196,8 @@ def sstate_installpkg(ss, d):
> =A0 =A0 =A0 =A0 # conflict with another writer
> =A0 =A0 =A0 =A0 os.remove(fixmefn)
>
> + =A0 =A0d.setVar("PATH", savedpath)
> +

So we always use the host tar and gzip here? Isn't there a reason we
build tar-native explicitly? Could be fine if it's not needed for
sstate-cache...

> =A0 =A0 for state in ss['dirs']:
> =A0 =A0 =A0 =A0 prepdir(state[1])
> =A0 =A0 =A0 =A0 os.rename(sstateinst + state[0], state[1])
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d4357d1..145a9a2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -401,6 +401,7 @@ EXTRA_IMAGEDEPENDS =3D ""
> =A0# Toolchain info.
> =A0##################################################################
>
> +ORIGPATH :=3D "${PATH}"
> =A0PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:=
${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_D=
IR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native=
}:"
> =A0export PATH
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



