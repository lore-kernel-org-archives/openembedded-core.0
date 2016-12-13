Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F03460116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 06:29:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2016 22:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="1098389695"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.7])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2016 22:29:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 13 Dec 2016 19:29:39 +1300
Message-ID: <7884104.xbYfD5GGaH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <10c5001f-1209-acd7-dc7a-7c64792b36b2@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<3281082.n0HP4LhUSl@peggleto-mobl.ger.corp.intel.com>
	<10c5001f-1209-acd7-dc7a-7c64792b36b2@windriver.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, "Limon,
	Anibal" <anibal.limon@intel.com>, "Lopez,
	Mariano" <mariano.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] oeqa/sdkext/devtool.py: remove workspace/sources before running test cases
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
X-List-Received-Date: Tue, 13 Dec 2016 06:29:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 13 Dec 2016 13:56:05 Robert Yang wrote:
> Hi Paul,
> 
> Thanks for reply, please see my comments inline.
> 
> On 12/13/2016 12:45 PM, Paul Eggleton wrote:
> > On Wed, 16 Nov 2016 22:19:31 Robert Yang wrote:
> >> Fixed:
> >> MACHINE = "qemux86-64"
> >> require conf/multilib.conf
> >> MULTILIBS = "multilib:lib32"
> >> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> >> 
> >> $ bitbake core-image-minimal -cpopulate_sdk_ext
> >> [snip]
> >> ERROR: Source tree path
> >> /path/to/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdk
> >> ex
> >> t/tc/workspace/sources/v4l2loopback-driver already exists and is not
> >> empty\n' [snip]
> >> 
> >> This is because the test case will run twice
> >> (environment-setup-core2-64-poky-linux and
> >> environment-setup-x86-pokymllib32-linux), it would fail in the second
> >> run, 'devtool reset' can not remove sources, so remove it before running
> >> test cases.
> >> 
> >> [YOCTO #10647]
> >> 
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >> 
> >>  meta/lib/oeqa/sdkext/devtool.py | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/meta/lib/oeqa/sdkext/devtool.py
> >> b/meta/lib/oeqa/sdkext/devtool.py index 65f41f6..f101eb6 100644
> >> --- a/meta/lib/oeqa/sdkext/devtool.py
> >> +++ b/meta/lib/oeqa/sdkext/devtool.py
> >> 
> >> @@ -15,6 +15,9 @@ class DevtoolTest(oeSDKExtTest):
> >>          self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir,
> >> 
> >> "myapp_cmake") shutil.copytree(self.myapp_cmake_src,
> >> self.myapp_cmake_dst)
> >> 
> >> +        # Clean sources dir to make "git clone" can run again
> >> +        shutil.rmtree(os.path.join(self.tc.sdktestdir,
> >> "tc/workspace/sources"), True) +
> >> 
> >>      def _test_devtool_build(self, directory):
> >>          self._run('devtool add myapp %s' % directory)
> > 
> >>          try:
> > It seems to me that's what's missing here is a proper teardown process
> > like we have for oe-selftest, so that tests clean up after themselves
> > whether they succeed or fail. I'm unsure as to whether that is part of
> > the plan for the new QA refactoring though.
> 
> There is already a 'devtool reset' which can do the cleanup, but it
> can't remove sources as I said in the commit log.

devtool reset not deleting the source tree is intentional - I don't want 
people accidentally losing changes to their source. In any case though it's 
not about what we do here but where we do it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

