Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ECCE360746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:35:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Mar 2016 11:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="940369984"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2016 11:34:44 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 70EA26A4006; Fri, 18 Mar 2016 12:22:29 -0700 (PDT)
Received: from 10.252.7.138 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 18 Mar 2016 21:22:29 +0200 (EET)
Message-ID: <51498.10.252.7.138.1458328949.squirrel@linux.intel.com>
In-Reply-To: <20160317213608.GG2553@jama>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
	<20160317213608.GG2553@jama>
Date: Fri, 18 Mar 2016 21:22:29 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Martin Jansa" <martin.jansa@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Fri, 18 Mar 2016 18:35:10 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Even with gobject-introspection-data removed from DISTRO_FEATURES I'm
> seeing
> couple recipes (our version of gst-*) failing with:
>
> | configure:22282: error: possibly undefined macro: PKG_CONFIG_SYSROOT_DIR
> |       If this token and others are legitimate, please use
> m4_pattern_allow.
> |       See the Autoconf documentation.
>
> and PKG_CONFIG_SYSROOT_DIR is added by introspection.m4 from g-i patchset.

Disabling building of introspection data will not guarantee absence of
build failures, I'm afraid. Some recipes will work just fine unchanged,
but others, including gstreamer, do need custom fixing, usually because
they have non-standard locations for m4 macros, or those macros themselves
are non-standard. So you need to rebase your recipes on top of those
available now in oe-core, and particularly this snippet will fix the
immediate problem you have above:

delete_pkg_m4_file() {
        # This m4 file is out of date and is missing
PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
        rm "${S}/common/m4/pkg.m4" || true
}

do_configure[prefuncs] += " delete_pkg_m4_file"


Alex

