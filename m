Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1E88465E3D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 10:17:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2014 03:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="553912298"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2014 03:16:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Tue, 05 Aug 2014 11:16:42 +0100
Message-ID: <11929449.z4kUDgkS6n@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <53E0ACF6.1040107@windriver.com>
References: <cover.1407227521.git.Chong.Lu@windriver.com>
	<1407232384.6981.75.camel@ted> <53E0ACF6.1040107@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] dbus: fix ptest issue
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
X-List-Received-Date: Tue, 05 Aug 2014 10:17:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 05 August 2014 18:07:50 Chong Lu wrote:
> On 08/05/2014 05:53 PM, Richard Purdie wrote:
> > On Tue, 2014-08-05 at 16:33 +0800, Chong Lu wrote:
> >> We use PTEST_ENABLED to decide whether build ptest package, so inherit
> >> ptest.bbclass in dbus.inc in order to using PTEST_ENABLED variable.
> >> Remove PACKAGES and ALLOW_EMPTY, since they have been defined in
> >> ptest.bbclass.
> >> 
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >> 
> >>   meta/recipes-core/dbus/dbus.inc | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/recipes-core/dbus/dbus.inc
> >> b/meta/recipes-core/dbus/dbus.inc index d38ba7e..6268103 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -8,10 +8,13 @@ LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \>> 
> >>   DEPENDS = "expat virtual/libintl"
> >>   RDEPENDS_dbus_class-native = ""
> >>   RDEPENDS_dbus_class-nativesdk = ""
> >> 
> >> -PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest',
> >> '', d)}" -ALLOW_EMPTY_dbus-ptest = "1"
> > 
> > I don't think you've understood what this is doing, its conditionally
> > building the separate dbus-ptest recipe, if ptest is enabled.
> > 
> > Why is it separate? dbus-ptest needs glib and glib needs dbus. Your
> > patch doesn't seem to account for any of that.
> > 
> > "fix ptest issue" is far too vague as a summary of this patch too.
> > 
> > Cheers,
> > 
> > Richard
> 
> Hi Richard,
> 
> Previously, we use DISTRO_FEATURES to decide whether build ptest, but we
> use PTEST_ENABLED now.
> PTEST_ENABLED defined in ptest.bbclass. we did't inherit ptest in dbus
> recipes, this cause we can't build dbus-ptest package.
> Based on above reason, I just send this patch to fix this issue. Or do
> you have a better way?

If you mean that you're setting PTEST_ENABLED globally, you shouldn't be doing 
that. PTEST_ENABLED is supposed to be used for recipes to *detect* whether 
ptest should be enabled, so that e.g. we can disable it for the native class.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

