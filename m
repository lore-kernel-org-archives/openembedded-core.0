Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SohXG-0001Th-Am
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 22:59:54 +0200
Received: from mail106-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 20:46:22 +0000
Received: from mail106-va3 (localhost [127.0.0.1])	by
	mail106-va3-R.bigfish.com (Postfix) with ESMTP id D27CC160576	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 20:46:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ahbe9i)
Received: from mail106-va3 (localhost.localdomain [127.0.0.1]) by mail106-va3
	(MessageSwitch) id 134195318186083_4595;
	Tue, 10 Jul 2012 20:46:21 +0000 (UTC)
Received: from VA3EHSMHS037.bigfish.com (unknown [10.7.14.242])	by
	mail106-va3.bigfish.com (Postfix) with ESMTP id 03BD0140196	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 20:46:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS037.bigfish.com
	(10.7.99.47) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 20:46:19 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.109]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Tue, 10 Jul 2012 15:48:39 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] Fix hang issue when execute "shutdown
	now" command
Thread-Index: AQHNXt1hdBHMEqitXkaJ7jRLXkNvQA==
Date: Tue, 10 Jul 2012 20:48:38 +0000
Message-ID: <CAEsOVNf9Jx8ZNe2wZCmUwTumDjgHVxHbVd3iN+VDRR7Zt1+zGg@mail.gmail.com>
References: <1341950440-19009-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341950440-19009-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 1/2] Fix hang issue when execute "shutdown now" command
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
X-List-Received-Date: Tue, 10 Jul 2012 20:59:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BDE95F37247C6243BF107E39BC6F4B96@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Ignore this... there is one patch before this one...

-M

On Tue, Jul 10, 2012 at 3:00 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> From: Zhenhua Luo <b19537@freescale.com>
>
>     The original issue:
>     When "shutdown now" command is typed on Linux prompt, the system trie=
s to
>     shut down gracefully from runlevel 5 to 1.
>     RunLevel 1 is single-user/maintenance mode. This is the default behav=
ior
>     when no runlevel option is mentioned in shutdown command (like shutdo=
wn
>     -h now OR shutdown -r now).
>     The startup script which starts single-user mode by initiating a new
>     process is missing from /etc/rc1.d/...
>     Because of this, following error appears:
>         INIT: no more processes left in this runlevel
>     A start-up script is needed to enables the user to log into single-us=
er
>     mode when "shutdown now" command is given.
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/met=
a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 492c60c..fe1ff41 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Inittab for sysvinit"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
>
> -PR =3D "r7"
> +PR =3D "r8"
>
>  SRC_URI =3D "file://inittab"
>
> @@ -26,7 +26,8 @@ do_install() {
>      for i in $tmp
>      do
>         j=3D`echo ${i} | sed s/\;/\ /g`
> -        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${s=
ysconfdir}/inittab
> +       echo "${idx}:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${s=
ysconfdir}/inittab
> +
>         idx=3D`expr $idx + 1`
>      done
>
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



