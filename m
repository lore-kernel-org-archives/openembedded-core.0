Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4529E771CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:50:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 24 Feb 2016 08:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="53994983"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2016 07:47:19 -0800
Message-ID: <1456328833.13465.103.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Alex Franco <alejandro.franco@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <56CCDAAF.6080303@linux.intel.com>
References: <1456218868-36139-1-git-send-email-alejandro.franco@linux.intel.com>
	<1456218868-36139-3-git-send-email-alejandro.franco@linux.intel.com>
	<1456262420.13465.101.camel@linux.intel.com>
	<56CCDAAF.6080303@linux.intel.com>
Organization: Intel Corporation
Date: Wed, 24 Feb 2016 09:47:13 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Subject: Re: [PATCHv2 2/2] testimage.bbclass: reuse generic test suites
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
X-List-Received-Date: Wed, 24 Feb 2016 16:50:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-23 at 16:18 -0600, Alex Franco wrote:
> I tested this with builds in my workstation and (local, internal)
> autobuilder, where TEST_SUITES is *not* specified in local.conf, so
> the
> TEST_SUITES are taken from the DEFAULT_TEST_SUITES variable for each
> image, which makes the tests work for the variables defined.
> 
> If TEST_SUITES includes "auto", then the testimage task for some
> images
> will still fail, but that's why I opened a new bug # 9129
> 
Thanks, good info.
> - Alex Franco
> 
> On 02/23/2016 03:20 PM, Benjamin Esquivel wrote:
> > Hi Franco, how did you test this? what is the behavior you get with
> > these defaults instead of how's behaving now?
> > 
> > See comments below.
> > 
> > On Tue, 2016-02-23 at 09:14 +0000, Alex Franco wrote:
> > > Modify existing default test suites to reuse the new
> > > generic test suites.
> > > 
> > > Related to [YOCTO #8410]
> > > 
> > > Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> > > ---
> > >  meta/classes/testimage.bbclass | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/classes/testimage.bbclass
> > > b/meta/classes/testimage.bbclass
> > > index 791cce3..e77bb11 100644
> > > --- a/meta/classes/testimage.bbclass
> > > +++ b/meta/classes/testimage.bbclass
> > > @@ -37,17 +37,19 @@ MINTESTSUITE = "ping"
> > >  NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog"
> > >  DEVTESTSUITE = "gcc kernelmodule ldd"
> > > 
> > > -DEFAULT_TEST_SUITES = "ping auto"
> > > -DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
> > > +DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
> > > +DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
> > >  DEFAULT_TEST_SUITES_pn-core-image-minimal-dev =
> > > "${MINTESTSUITE}"
> > >  DEFAULT_TEST_SUITES_pn-core-image-full-cmdline =
> > > "${NETTESTSUITE}
> > > perl python logrotate"
> > >  DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
> > >  DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam
> > > parselogs ${RPMTESTSUITE}"
> > > -DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman
> > > syslog
> > > xorg scp date parselogs ${RPMTESTSUITE} \
> > > +DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE}
> > > connman
> > > xorg parselogs ${RPMTESTSUITE} \
> > >      ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '',
> > > d)}"
> > > -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df
> > > connman
> > > syslog xorg scp date perl ldd gcc kernelmodule python parselogs
> > > ${RPMTESTSUITE}"
> > > +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE}
> > > connman xorg perl python \
> > > +    ${DEVTESTSUITE} parselogs ${RPMTESTSUITE}"
> > >  DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam
> > > perl python parselogs ${RPMTESTSUITE}"
> > > -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "ping buildcvs
> > > buildiptables buildsudoku connman date df gcc kernelmodule ldd
> > > pam
> > > parselogs perl python scp ${RPMTESTSUITE} ssh syslog logrotate"
> > > +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE}
> > > buildcvs buildiptables buildsudoku \
> > > +    connman ${DEVTESTSUITE} pam perl python parselogs
> > 
> > These lots of declarations seem to be suited for a .inc file
> > instead of
> > living in the bbclass.
> > > ${RPMTESTSUITE}"
> > >  DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
> > > 
> > >  # aarch64 has no graphics
> > > --
> > > 2.6.2
> > > 
> 

