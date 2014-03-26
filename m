Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 182E06BC9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:04:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2014 03:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,734,1389772800"; d="scan'208";a="507035567"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2014 03:03:55 -0700
Date: Wed, 26 Mar 2014 12:03:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Mats =?iso-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Message-ID: <20140326100354.GA32501@lpalcu-linux>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A5F1C@post.tritech.se>
	<39D03392-2417-45CF-BD80-D160E8C466EE@gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B3A652E@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A652E@post.tritech.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SDK build refers to existing installed SDK
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
X-List-Received-Date: Wed, 26 Mar 2014 10:04:35 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 07:40:26AM +0000, Mats K=E4rrman wrote:
> On Wednesday, March 26, 2014 4:23 AM, Khem Raj wrote:
> > > Hi,
> > >
> > > I just ran into an unexpected error while doing some multitasking.
> > > Project is based on OE-core Dora "distroless".
> > >
> > > While my build machine was busy building a new SDK using "-c populate=
_sdk" I simultaneously deleted an older SDK that was installed under /usr/l=
ocal and installed a different one. This resulted in the build stopping wit=
h the following error:
> > >
> > > | x86_64-oesdk-linux-gcc  --sysroot=3D/home/makr/projects/xxx/svn/mai=
n/trunk/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux -DHAVE_CONFIG_H =
-I../ncurses -I/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86=
_64-nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses -=
isystem/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x86_64-=
nativesdk-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/u=
sr/include -D_GNU_SOURCE -DNDEBUG -I. -I../include -I/home/makr/projects/xx=
x/svn/main/trunk/oe/build/tmp/work/x86_64-nativesdk-oesdk-linux/nativesdk-n=
curses/5.9-r15.1/ncurses-5.9/ncurses/../include -I/usr/local/oecore-x86_64/=
sysroots/x86_64-oesdk-linux/usr/include -isystem/home/makr/projects/xxx/svn=
/main/trunk/oe/build/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oe=
core-x86_64/sysroots/x86_64-oesdk-linux/usr/include -O2 -pipe  --param max-=
inline-insns-single=3D1200 -fPIC -c /home/makr/projects/xxx/svn/main/trunk/=
oe/build/tmp/work/x86
>  _64-
> > > nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses=
/base/lib_beep.c -o ../obj_s/lib_beep.o
> > > | cc1: error: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/us=
r/include: Permission denied
> > >
> > > The offending directory is given with an include directive which seem=
s strange, building a new SDK should not poke around in an old one...
> > >
> > > Config & log files available on request.
> >=20
> > Was the installed SDK in your path that fed into the OE build env which=
 was generating new SDK ?
>=20
> No, it was not.
> I have saved the output of "bitbake nativesdk-ncurses -e" if you're inter=
ested.
I had a quick look at the generated Makefile for nativesdk-ncurses and,
apparently, it seems to have -I${includedir} added to the compilation
flags. This doesn't look like the right thing...

laurentiu

>=20
> BR // Mats
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

