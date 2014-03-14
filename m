Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 055B66F626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 10:12:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2014 03:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,653,1389772800"; d="scan'208";a="499768162"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.62])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2014 03:12:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 14 Mar 2014 10:12:23 +0000
Message-ID: <232470057.ZuPMps2Ccl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <5322C873.6020709@windriver.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
	<5322C873.6020709@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Fri, 14 Mar 2014 10:12:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 14 March 2014 17:14:27 Chong Lu wrote:
> On 03/13/2014 06:01 PM, Paul Eggleton wrote:
> > On Thursday 13 March 2014 17:54:03 Chong Lu wrote:
> >> On 03/06/2014 06:04 PM, Burton, Ross wrote:
> >>> On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
> >>>> +PACKAGES += "dbus-ptest"
> >>>> +ALLOW_EMPTY_${PN}-ptest = "1"
> >>>> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES',
> >>>> 'ptest-pkgs',
> >>>> 'dbus-test-ptest', 'dbus-test', d)}"
> >>> 
> >>> Clearly I wasn't thinking clearly last week.  You can't check
> >>> IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
> >> 
> >> Do you have any suggestion about this issue?
> >> If we don't check IMAGE_FEATURES, I have no way to resolve this problem
> >> that only build but not install ptest. I'm very confused.
> > 
> > This should check DISTRO_FEATURES, not IMAGE_FEATURES. Assuming ptest is
> > in
> > DISTRO_FEATURES, even if ptest is not in IMAGE_FEATURES it doesn't matter
> > if the dependency between dbus-ptest and dbus-ptest-ptest exists because
> > dbus- ptest itself shouldn't be in the image, so dbus-ptest-ptest
> > shouldn't be pulled in either. Does that make sense?
> > 
> > Cheers,
> > Paul
> 
> Hi Paul,
> 
> Thanks for your reply!
> But I still have a question.
> 
> I try to following way:
> 
> # git diff
> diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> index bc260de..50dfe54 100644
> --- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> +++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
> @@ -9,6 +9,7 @@ DEPENDS = "python-pygobject dbus dbus-glib"
> 
>   RDEPENDS_${PN} += "make"
>   RDEPENDS_${PN}-dev = ""
> +ALLOW_EMPTY_${PN} = "1"
> 
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch \
> diff --git a/meta/recipes-core/dbus/dbus.inc
> b/meta/recipes-core/dbus/dbus.inc
> index 677ff78..ba7f3cb 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb
> 3c" DEPENDS = "expat virtual/libintl"
> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest',
> 'dbus-ptest-ptest', '', d)}"
> +RDEPENDS_dbus = "dbus-ptest"

The line above is the problem. You *cannot* do this or dbus-ptest (and 
therefore dbus-ptest-ptest) will always be installed whether you want it or 
not. You need to remove this line.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

