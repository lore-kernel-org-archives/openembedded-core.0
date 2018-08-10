Return-Path: <daniel.gomez@silicon-gears.com>
Received: from relay.cloudcontrol.es (relay.cloudcontrol.es [93.90.30.95])
	by mail.openembedded.org (Postfix) with ESMTP id CCE4878EF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:39:54 +0000 (UTC)
Received: from Twenty.silicon-gears.com (mx1.silicon-gears.com [81.47.169.96])
	by relay.cloudcontrol.es (Postfix) with ESMTP id 8874BDBB20;
	Fri, 10 Aug 2018 16:39:52 +0200 (CEST)
Received: from [10.200.199.3] (10.200.199.3) by Twenty.silicon-gears.com
	(10.20.0.101) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Fri, 10 Aug 2018 16:39:52 +0200
Message-ID: <1533911991.20213.17.camel@silicon-gears.com>
From: Daniel Gomez <daniel.gomez@silicon-gears.com>
Reply-To: <daniel.gomez@silicon-gears.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 10 Aug 2018 16:39:51 +0200
In-Reply-To: <CAJ86T=X+0Y1QkHJkgd3ajbnwhKALNkFq5+9wpO4daYmMhs2uQA@mail.gmail.com>
References: <1532696872.1070.2.camel@silicon-gears.com>
	<CAJ86T=X+0Y1QkHJkgd3ajbnwhKALNkFq5+9wpO4daYmMhs2uQA@mail.gmail.com>
Organization: Silicon Gears
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
X-Originating-IP: [10.200.199.3]
X-ClientProxiedBy: Twenty.silicon-gears.com (10.20.0.101) To
	Twenty.silicon-gears.com (10.20.0.101)
X-ProcessControl-SpamMailControl-Information: Por favor,
	contacte con el administrador
X-ProcessControl-SpamMailControl-ID: 8874BDBB20.A58AE
X-ProcessControl-SpamMailControl: Not scanned: please contact your Internet
	E-Mail Service Provider for details
X-ProcessControl-SpamMailControl-From: daniel.gomez@silicon-gears.com
X-Spam-Status: No
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] Check libcc1 directory before disabling hardcoding of RPATHs
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
X-List-Received-Date: Fri, 10 Aug 2018 14:39:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On vie, 2018-07-27 at 12:59 -0700, Andre McCurdy wrote:
> On Fri, Jul 27, 2018 at 6:07 AM, Daniel Gomez
> <daniel.gomez@silicon-gears.com> wrote:
> > 
> > Check if libcc1 directory exits before disabling hardcode_into_libs
> > configuration because of broken libtool in gcc recipes.
> A patch for morty should either be a backport which has already been
> merged into all applicable later branches (ie if the same fix is
> needed in sumo, rocko or pyro it needs to be merged to those branches
> first) or it should explain clearly why it's only applicable to morty.
Well, I have realized about the real problem and it is only affecting to 
the gcc_4.9.bb recipe in the meta-linaro repo and not in the poky one.
Basically, libcc1 support is included in gcc versions >= 5.x but not in
older versions like 4.9.x and poky does not check the 'hardcode_into_libs'
flags in versions where libcc1 is not included.
> 
> > 
> > Signed-off-by: Daniel Gomez <daniel.gomez@silicon-gears.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc_5.4.bb | 3 ++-
> >  meta/recipes-devtools/gcc/gcc_6.4.bb | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc_5.4.bb b/meta/recipes-devtools/gcc/gcc_5.4.bb
> > index b0a523c..9da8ece 100644
> > --- a/meta/recipes-devtools/gcc/gcc_5.4.bb
> > +++ b/meta/recipes-devtools/gcc/gcc_5.4.bb
> > @@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> >  do_configure_prepend() {
> >         # Easiest way to stop bad RPATHs getting into the library since we have a
> >         # broken libtool here
> > -       sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> > +       if [ -d "${S}/libcc1" ]; then
> > +               sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> Missing fi ?
Yes! I forgot to copy it from the original patch:
https://lists.linaro.org/pipermail/openembedded/2018-March/000137.html
> > 
> >  }
> > 
> >  BBCLASSEXTEND = "nativesdk"
> > diff --git a/meta/recipes-devtools/gcc/gcc_6.4.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
> > index b0a523c..9da8ece 100644
> > --- a/meta/recipes-devtools/gcc/gcc_6.4.bb
> > +++ b/meta/recipes-devtools/gcc/gcc_6.4.bb
> > @@ -9,7 +9,8 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> >  do_configure_prepend() {
> >         # Easiest way to stop bad RPATHs getting into the library since we have a
> >         # broken libtool here
> > -       sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> > +       if [ -d "${S}/libcc1" ]; then
> > +               sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
> >  }
> > 
> >  BBCLASSEXTEND = "nativesdk"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

