Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S5ud1-0008Sw-17
	for openembedded-core@openembedded.org; Fri, 09 Mar 2012 08:52:43 +0100
Received: from mail123-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Mar 2012 07:13:46 +0000
Received: from mail123-va3 (localhost [127.0.0.1])	by
	mail123-va3-R.bigfish.com (Postfix) with ESMTP id C5B0A1A03BE	for
	<openembedded-core@openembedded.org>;
	Fri,  9 Mar 2012 07:13:46 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail123-va3 (localhost.localdomain [127.0.0.1]) by mail123-va3
	(MessageSwitch) id 133127722556916_15657;
	Fri,  9 Mar 2012 07:13:45 +0000 (UTC)
Received: from VA3EHSMHS026.bigfish.com (unknown [10.7.14.251])	by
	mail123-va3.bigfish.com (Postfix) with ESMTP id 08D203A0049	for
	<openembedded-core@openembedded.org>;
	Fri,  9 Mar 2012 07:13:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS026.bigfish.com
	(10.7.99.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Mar 2012 07:13:39 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.5]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 9 Mar 2012 01:13:39 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] packagedata.py: Fix get_subpkgedata_fn
	for multilib
Thread-Index: AQHM/cQm77sTkxl7vUqGKgEi9CsIeA==
Date: Fri, 9 Mar 2012 07:13:38 +0000
Message-ID: <CAEsOVNftMbooqYnuWgGm7aQUyX_uumuVf6LnjMgdg9uckxOnxw@mail.gmail.com>
References: <1331245413-30310-1-git-send-email-msm@freescale.com>
	<1331274040-22494-1-git-send-email-msm@freescale.com>
In-Reply-To: <1331274040-22494-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] packagedata.py: Fix get_subpkgedata_fn for multilib
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
X-List-Received-Date: Fri, 09 Mar 2012 07:52:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <51E4E3129FDFB244BF6122FFC3017E0D@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Ugh this is supposed to be v3.

-M

On Fri, Mar 9, 2012 at 12:20 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> =A0meta/lib/oe/packagedata.py | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index a7a40f0..5759fe6 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -27,6 +27,14 @@ def read_pkgdatafile(fn):
>
> =A0def get_subpkgedata_fn(pkg, d):
> =A0 =A0 archs =3D d.expand("${PACKAGE_ARCHS}").split(" ")
> + =A0 =A0mlarchs =3D bb.data.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
> +
> + =A0 =A0if mlarchs:
> + =A0 =A0 =A0 =A0for mlarch in mlarchs.split(" "):
> + =A0 =A0 =A0 =A0 =A0 =A0if "_" in mlarch:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prefix, split, new_arch =3D mlarch.parti=
tion("_")
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0archs.append(new_arch)
> +
> =A0 =A0 archs.reverse()
> =A0 =A0 pkgdata =3D d.expand('${TMPDIR}/pkgdata/')
> =A0 =A0 targetdir =3D d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



