Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 26A916FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 16:38:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 18 Oct 2016 09:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="891269258"
Received: from jlock-mobl1.ld.intel.com ([10.103.239.41])
	by orsmga003.jf.intel.com with ESMTP; 18 Oct 2016 09:38:23 -0700
Message-ID: <1476808702.14120.6.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 17:38:22 +0100
In-Reply-To: <9db9997c-9e77-e545-859c-492e83057937@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<88ed2fc1a30df53f6c94192966c00c5c41de3869.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1476688132.2604.8.camel@linux.intel.com>
	<9db9997c-9e77-e545-859c-492e83057937@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/9] selftest: skip two bbtest tests depending on distro
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
X-List-Received-Date: Tue, 18 Oct 2016 16:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-17 at 11:04 -0500, Leonardo Sandoval wrote:
> 
> On 10/17/2016 02:08 AM, Joshua Lock wrote:
> > 
> > On Fri, 2016-10-14 at 11:40 -0500,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > 
> > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.c
> > > om>
> > > 
> > > There are two bbtests that just makes sense on certain distros:
> > > test_bitbake_g cannot be done on poky-tiny and test_non_gplv3
> > > just makes sense on poky and poky-tiny. Skip these when
> > > necessary under the latter conditions.
> > > 
> > > [YOCTO #8525]
> > > 
> > > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linu
> > > x.in
> > > tel.com>
> > > ---
> > >   meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/bbtests.py
> > > b/meta/lib/oeqa/selftest/bbtests.py
> > > index baae1e0..9b11cd9 100644
> > > --- a/meta/lib/oeqa/selftest/bbtests.py
> > > +++ b/meta/lib/oeqa/selftest/bbtests.py
> > > @@ -114,6 +114,9 @@ class BitbakeTests(oeSelfTest):
> > >   
> > >       @testcase(167)
> > >       def test_bitbake_g(self):
> > > +        if self.distro == 'poky-tiny':
> > > +            self.skipTest('core-image-full-cmdline is not
> > > buildable
> > > with poky-tiny')
> > > +
> > This test is still valid for poky-tiny, it's just that the image
> > the
> > test builds isn't buildable with poky-tiny, right?
> > 
> > I think it would be better to change the test to a different,
> > smaller,
> > image that can also be built for poky-tiny (core-image-minimal?).
> > We'd also need to change the target the test checks for the
> > presence of
> > in pn-buildlist.
> Good idea. Which image and pn-buildlist package check do you suggest?

It doesn't really matter and will depend on which image you decide to
build for the test. 

The goal of the test appears to be to validate the output of `bitbake
-e`. Hopefully we can find an image and recipe combination which is
buildable across distros but I don't know what that would be off the
top of my head.

Regards,

Joshua

> > 
> > Regards,
> > 
> > Joshua
> > 
> > > 
> > >           result = bitbake('-g core-image-full-cmdline')
> > >           for f in ['pn-buildlist', 'pn-depends.dot', 'package-
> > > depends.dot', 'task-depends.dot']:
> > >               self.addCleanup(os.remove, f)
> > > @@ -229,6 +232,10 @@ INHERIT_remove = \"report-error\"
> > >   
> > >       @testcase(1119)
> > >       def test_non_gplv3(self):
> > > +        supported_distros = ['poky', 'poky-tiny']
> > > +        if not self.distro in supported_distros:
> > > +            self.skipTest('Test considers only %s distros' %
> > > ','.join(supported_distros))
> > > +
> > >           data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
> > >           conf = os.path.join(self.builddir, 'conf/local.conf')
> > >           ftools.append_file(conf ,data)
> > > -- 
> > > 2.1.4
> > > 
> 

