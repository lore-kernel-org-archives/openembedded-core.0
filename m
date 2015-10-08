Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F19CF60232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:27:26 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zk8Q2-0006GL-3y from Awais_Belal@mentor.com ;
	Thu, 08 Oct 2015 03:27:26 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.69]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Thu, 8 Oct 2015 11:27:25 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] mesa-demos: fix deadlock in sharedtex_mt
Thread-Index: AQHRAarg+EybWKASN0GHZHiRcXry7Z5hS0GAgAAYzcA=
Date: Thu, 8 Oct 2015 10:27:24 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD280119A897E9@EU-MBX-02.mgc.mentorg.com>
References: <1444296133-2582-1-git-send-email-awais_belal@mentor.com>,
	<56163DED.2000007@pseudoterminal.org>
In-Reply-To: <56163DED.2000007@pseudoterminal.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] mesa-demos: fix deadlock in sharedtex_mt
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
X-List-Received-Date: Thu, 08 Oct 2015 10:27:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,=0A=
=0A=
The patch submission is available at https://patchwork.freedesktop.org/patc=
h/61350/=0A=
Should I simply send a new patch with the same subject line or make it a v2=
?=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Carlos Rafael Giani [dv@pseudot=
erminal.org]=0A=
Sent: Thursday, October 08, 2015 2:57 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] mesa-demos: fix deadlock in sharedtex_mt=0A=
=0A=
Since this patch got submitted, is there a link to the submission?=0A=
Perhaps to some public bugtracker entry? Does this exist for Mesa? If=0A=
so, add it to the Upstream-Status line.=0A=
=0A=
Am 2015-10-08 um 11:22 schrieb Awais Belal:=0A=
> This patch fixes a deadlock that occurs between the main=0A=
> thread and rendering threads of the sharedtex_mt demo.=0A=
>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>   ...10-sharedtex_mt-fix-rendering-thread-hang.patch | 43 +++++++++++++++=
+++++++=0A=
>   meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +=0A=
>   2 files changed, 44 insertions(+)=0A=
>   create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex=
_mt-fix-rendering-thread-hang.patch=0A=
>=0A=
> diff --git a/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-=
rendering-thread-hang.patch b/meta/recipes-graphics/mesa/mesa-demos/0010-sh=
aredtex_mt-fix-rendering-thread-hang.patch=0A=
> new file mode 100644=0A=
> index 0000000..1aa893b=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-renderi=
ng-thread-hang.patch=0A=
> @@ -0,0 +1,43 @@=0A=
> +From 525fa9ded72d22b53c5eb366f61e2ac1d407a2db Mon Sep 17 00:00:00 2001=
=0A=
> +From: Awais Belal <awais_belal@mentor.com>=0A=
> +Date: Thu, 8 Oct 2015 13:49:31 +0500=0A=
> +Subject: [PATCH] sharedtex_mt: fix rendering thread hang=0A=
> +=0A=
> +XNextEvent is a blocking call which locks up the display mutex=0A=
> +this causes the rendering threads to hang when they try call=0A=
> +glXSwapBuffers() as that tries to take the same mutex in=0A=
> +underlying calls through XCopyArea().=0A=
> +So we only go to XNextEvent when it has at least one event=0A=
> +and we wouldn't lock indefinitely.=0A=
> +=0A=
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> +=0A=
> +Upstream-Status: Submitted=0A=
> +---=0A=
> + src/xdemos/sharedtex_mt.c | 9 +++++++--=0A=
> + 1 file changed, 7 insertions(+), 2 deletions(-)=0A=
> +=0A=
> +diff --git a/src/xdemos/sharedtex_mt.c b/src/xdemos/sharedtex_mt.c=0A=
> +index a90903a..1d503c4 100644=0A=
> +--- a/src/xdemos/sharedtex_mt.c=0A=
> ++++ b/src/xdemos/sharedtex_mt.c=0A=
> +@@ -420,9 +420,14 @@ Resize(struct window *h, unsigned int width, unsign=
ed int height)=0A=
> + static void=0A=
> + EventLoop(void)=0A=
> + {=0A=
> ++   int i;=0A=
> ++   XEvent event;=0A=
> +    while (1) {=0A=
> +-      int i;=0A=
> +-      XEvent event;=0A=
> ++      /* Do we have an event? */=0A=
> ++      if (XPending(gDpy) =3D=3D 0) {=0A=
> ++         usleep(10000);=0A=
> ++         continue;=0A=
> ++      }=0A=
> +       XNextEvent(gDpy, &event);=0A=
> +       for (i =3D 0; i < NumWindows; i++) {=0A=
> +      struct window *h =3D &Windows[i];=0A=
> +--=0A=
> +1.9.1=0A=
> +=0A=
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_8.2.0.bb=0A=
> index e451642..0094f55 100644=0A=
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb=0A=
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb=0A=
> @@ -19,6 +19,7 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/demos/$=
{PV}/${BPN}-${PV}.tar.bz2 \=0A=
>       file://0007-Install-few-more-test-programs.patch \=0A=
>       file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.pa=
tch \=0A=
>       file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \=0A=
> +    file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \=0A=
>   "=0A=
>   SRC_URI[md5sum] =3D "72613a2c8c013716db02e3ff59d29061"=0A=
>   SRC_URI[sha256sum] =3D "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221=
a9774d0952f90ba92"=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

