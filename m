Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3F8600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 04:32:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 18 Apr 2016 21:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,505,1455004800"; d="scan'208";a="87716889"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2016 21:32:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Mark Hatle <mark.hatle@windriver.com>, Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 19 Apr 2016 16:32:03 +1200
Message-ID: <36528216.Z4AUpNFdWd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <57152C67.1030508@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<57152C67.1030508@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 04:32:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mon, 18 Apr 2016 13:50:15 Mark Hatle wrote:
> On 4/18/16 9:16 AM, Andreas M=FCller wrote:
> > On Mon, Apr 18, 2016 at 3:55 PM, Burton, Ross <ross.burton@intel.co=
m>=20
wrote:
> >> On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com> w=
rote:
> >>> If sysroot is required, override DEBUG_FLAGS to remove
> >>> -fdebug-prefix-map
> >>=20
> >> We should probably get this in the release notes, as many people d=
o
> >> indeed
> >> want remote debug to work.
> >>=20
> >> Can you tell gdb the base path to use when looking for symbols?  I=
've not
> >> done remote GDB for some time but wouldn't "set substitute-path /
> >> //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
> >>=20
> >> If gdb can't be told then instead of having to replace all of DEBU=
G_FLAGS
> >> it would be neat if the prefix mapping variables where in another
> >> variable that could just be unset.
> >>=20
> >> Ross
> >=20
> > OK I think I could live with removing -fdebug-prefix-map for now.
> >=20
> > A thought: We have the setting IMAGE_GEN_DEBUGFS - I have not yet
> > tested. As far as I understand it creates an unstripped sysroot and=

> > does not affect target rootfs - is that correct? Does the sysroot
> > created by IMAGE_GEN_DEBUGFS contain the sources? If yes we could s=
et
> > that as sysroot for gdb.
> >=20
> > I think one of the problems we have here is that there is no refere=
nce
> > way documented (or it is outdated) how remote debugging is meant to=
 be
> > performed.
>=20
> Remote debugging is setup to always assume the remote side has access=
 to a
> debugable sysroot.  This isn't the project's sysroot, since that is
> transient, but a REAL matching sysroot to the main image.
>=20
> The easiest way to do this is to add the following to your local.conf=
:
>    IMAGE_GEN_DEBUGFS =3D '1'
>=20
> After this, look in your deploy directory and you will see the image =
to
> deploy to the target, and also a matching 'debug' chunk that you keep=
 on
> your local host.  This way you -know- they are always in sync.
>=20
> There is class material from the various Yocto Project Dev Day classe=
s on
> using this.

I thought I'd seen this go into the manual but I can't seem to find it;=
 I also=20
can't find said Dev Day class material online. Mark, would you be able =
to work=20
with Scott R to get this documented both within the variable reference =
and in=20
a task-oriented manner?

In the mean time, Jefro - is the recent dev day material available some=
where?=20
I can only find 2014 (ELCE Dusseldorf) under "Training" on the YP websi=
te.

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

