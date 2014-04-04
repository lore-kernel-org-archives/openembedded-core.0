Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28FCD6E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:43:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2014 03:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,794,1389772800"; d="scan'208";a="514391498"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2014 03:43:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 04 Apr 2014 11:43:40 +0100
Message-ID: <2125965.84qy4KnggG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <533E4C85.2030509@windriver.com>
References: <cover.1395194072.git.Chong.Lu@windriver.com>
	<533DC530.1030400@linux.intel.com> <533E4C85.2030509@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Fri, 04 Apr 2014 10:43:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 04 April 2014 14:09:09 Chong Lu wrote:
> On 04/04/2014 04:31 AM, Saul Wold wrote:
> > On 03/18/2014 07:00 PM, Chong Lu wrote:
> >> If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest
> >> package
> >> is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES.
> >> This
> >> issue will increase size for most small images.
> >> This patch fixes this problem.
> >> 
> >> [YOCTO #5702]
> >> 
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >> 
> >>   meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb =>
> >> 
> >> dbus-test_1.6.18.bb} | 0
> >> meta/recipes-core/dbus/dbus.inc | 4 +++-
> >> 
> >>   2 files changed, 3 insertions(+), 1 deletion(-)
> >>   rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb =>
> >> 
> >> dbus-test_1.6.18.bb} (100%)
> >> 
> >> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> >> b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
> >> similarity index 100%
> >> rename from meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> >> rename to meta/recipes-core/dbus/dbus-test_1.6.18.bb
> >> diff --git a/meta/recipes-core/dbus/dbus.inc
> >> b/meta/recipes-core/dbus/dbus.inc
> >> index 677ff78..6059e7c 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -6,9 +6,11 @@ LICENSE = "AFL-2 | GPLv2+"
> >> 
> >>   LIC_FILES_CHKSUM =
> >> 
> >> "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> >> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a97453
> >> 8bb3c">> 
> >>   DEPENDS = "expat virtual/libintl"
> >> 
> >> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest',
> >> 'dbus-ptest-ptest', '', d)}"
> >> 
> >>   RDEPENDS_dbus_class-native = ""
> >>   RDEPENDS_dbus_class-nativesdk = ""
> >> 
> >> +PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest',
> >> 'dbus-ptest', '', d)}"
> >> +ALLOW_EMPTY_dbus-ptest = "1"
> >> +RDEPENDS_dbus-ptest = "dbus-test-ptest"
> > 
> > Seems like this is still causing some issues
> > 
> >> ERROR: Nothing RPROVIDES 'nativesdk-dbus-test-ptest' (but
> >> virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-i
> >> ntel-gpl/build/meta/recipes-core/dbus/dbus_1.6.18.bb RDEPENDS on or
> >> otherwise requires it)
> >> NOTE: Runtime target 'nativesdk-dbus-test-ptest' is unbuildable,
> >> removing...
> >> Missing or unbuildable dependency chain was:
> >> ['nativesdk-dbus-test-ptest']
> >> ERROR: Required build target 'nativesdk-qt4-tools' has no buildable
> >> providers.
> >> Missing or unbuildable dependency chain was: ['nativesdk-qt4-tools',
> >> 'nativesdk-dbus', 'nativesdk-dbus-test-ptest']
> > 
> > As seen in this AB Failure:
> > http://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds
> > /30/steps/BuildImages/logs/stdio
> 
> I built core-image-sato-sdk after applied my patch. I didn't see error.
> Can you tell me how to reproduce your building errors?

You'd need to try to build nativesdk-dbus - "bitbake nativesdk-dbus" should be 
able to reproduce this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

