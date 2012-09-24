Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGFEb-0008Ky-UO
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:26:30 +0200
Received: from mail83-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 20:13:40 +0000
Received: from mail83-va3 (localhost [127.0.0.1])	by mail83-va3-R.bigfish.com
	(Postfix) with ESMTP id CCE103C00BF	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 20:13:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371I1432Id6f1izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ahbe9i1155h)
Received: from mail83-va3 (localhost.localdomain [127.0.0.1]) by mail83-va3
	(MessageSwitch) id 1348517618721136_22175;
	Mon, 24 Sep 2012 20:13:38 +0000 (UTC)
Received: from VA3EHSMHS031.bigfish.com (unknown [10.7.14.242])	by
	mail83-va3.bigfish.com (Postfix) with ESMTP id A2B4E60046	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 20:13:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS031.bigfish.com
	(10.7.99.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 20:13:36 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 15:13:35 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] libx11: fix nativesdk build on older
	distros
Thread-Index: AQHNmpET+brGPjerY06d7Y9qKwsk7g==
Date: Mon, 24 Sep 2012 20:13:36 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A2E00@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
In-Reply-To: <1348516546-26005-2-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
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
X-List-Received-Date: Mon, 24 Sep 2012 20:26:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4BB2480D12701B40AFD29366FCEBF382@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 2:55 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> makekeys-makekeys.o: In function `main':
> makekeys.c:(.text+0x85): undefined reference to `__isoc99_sscanf'
> makekeys.c:(.text+0xa7): undefined reference to `__isoc99_sscanf'
> collect2: ld returned 1 exit status
> make: *** [makekeys] Error 1
>
> Older libc do not have this defined, we can use the -D_GNU_SOURCE
> to the compiler to prevent generating calls to this function and
> make linking work
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../xorg-lib/libx11/use_host_cc_for_utils.patch    |   12 ++++++++++++
>  meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for=
_utils.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.=
patch b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
> new file mode 100644
> index 0000000..08ba39a
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/use_host_cc_for_utils.patch
> @@ -0,0 +1,12 @@
> +Index: libX11-1.5.0/src/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.5.0.orig/src/Makefile.am
> ++++ libX11-1.5.0/src/Makefile.am
> +@@ -420,6 +420,6 @@ ks_tables.h: $(KEYSYMDEFS) $(top_builddi
> +       mv ks_tables_h $@
> +
> + $(top_builddir)/src/util/makekeys$(EXEEXT): force
> +-      cd util && $(MAKE)
> ++      cd util && $(MAKE) CC=3Dgcc CCLD=3Dgcc LDFLAGS=3D CFLAGS=3D-D_GNU=
_SOURCE

I kicked off a build right after testing on one machine, and this is
not quite right. Mostly I think I Need more CFLAGS to build 32 or 64
bit native binaries so they can run on the target system properly.
E.g. if I don't have:

/lib/ld.so.1: No such file or directory

-M

> +
> + force:
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.5.0.bb
> index 94e2051..3e00dd8 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> @@ -1,11 +1,12 @@
>  require libx11.inc
>  inherit gettext
>
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  SRC_URI +=3D "file://keysymdef_include.patch"
> +SRC_URI_append_virtclass-nativesdk +=3D "file://use_host_cc_for_utils.pa=
tch"
>
>  SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
>  SRC_URI[sha256sum] =3D "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1=
e697f75502bd4d86"
> --
> 1.7.9.7
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



