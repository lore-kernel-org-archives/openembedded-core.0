Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A39E78511
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:32:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 09:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; 
   d="scan'208";a="1508530"
Received: from $_hostname.zpn.intel.com (HELO lsandov1-mobl2.zpn.intel.com)
	([10.219.128.134])
	by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2017 09:32:09 -0800
Date: Tue, 14 Nov 2017 11:42:39 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20171114114239.66b7d58e@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <1510675768.5979.9.camel@intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1510647870.5979.4.camel@intel.com>
	<20171114100939.12d4c1df@lsandov1-mobl2.zpn.intel.com>
	<1510675768.5979.9.camel@intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Tue, 14 Nov 2017 17:32:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Nov 2017 17:09:28 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Tue, 2017-11-14 at 10:09 -0600, Leonardo Sandoval wrote:
> > On Tue, 14 Nov 2017 09:24:30 +0100
> > Patrick Ohly <patrick.ohly@intel.com> wrote:
> >  =20
> > > On Mon, 2017-11-13 at 10:17 -0800,
> > > leonardo.sandoval.gonzalez@linux.intel.com wrote: =20
> > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.c =
=20
> > > > om> =20
> > > >=20
> > > > The main idea is to isolate the oe-selftest execution so neither
> > > > the
> > > > current build dir nor the configuration data is touch/polluted.
> > > > This
> > > > approach uses a wrapper script (which is the one presented on
> > > > this
> > > > commit) which creates a unique directory and inside it copies all
> > > > scripts and metadata, re-initializes the enviroment (re-sources
> > > > oe-
> > > > init-build-env) and finally launches the oe-selftest-internal
> > > > (which
> > > > used to be oe-selftest) command, passing command arguments to the
> > > > latter.=C2=A0=C2=A0 =20
> > >=20
> > > This mode of operation may or may not be desirable. Can it be made
> > > optional? =20
> >=20
> > good idea. However, you can call the oe-selftest-internal for the
> > this purpose. =20
>=20
> While doable, it feels wrong to rename something as "internal" and then
> still expect people to call it directly.
>=20
> A command line parameter for the new oe-selftest which controls this
> behavior and just calls oe-selftest-internal directly when requested
> feels cleaner and more discoverable.
>=20
> Is oe-selftest-internal even going to be in the default PATH? It
> probably shouldn't be, once it truly becomes an implementation detail.

where can we placed it besides the scripts folder?

>=20
> > > In refkit CI testing, several selftests run tests on build
> > > artifacts
> > > (primarily the images) produced during the previous build and only
> > > build them if needed, i.e. they run "bitbake some-image" and that
> > > is
> > > usually fast because the image already exists. Reusing sstate and
> > > download dir also is important for speed. =20
> >=20
> > oe-selftest creates a new build/conf folder, with the same conf files
> > as the ones present in your current build/conf, so this means that
> > you can set there DL_DIR and SSTATE_DIR (for example) on your main
> > local.conf and these will be used by oe-selftest, effectively reusing
> > these folders. =20
>=20
> Instead of leaving it to the developer to figure this out, should the
> oe-selftest have --[no-]reuse-download and --[no]-reuse-sstate options?

sounds good. By default, we will let reuse download/sstate.

Good input. I will send a v3.




>=20
> > >  =20
> --=20
> Best Regards, Patrick Ohly
>=20
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>=20
>=20

