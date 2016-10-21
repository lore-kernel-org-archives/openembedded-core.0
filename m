Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 20332605FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 15:06:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 21 Oct 2016 08:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,377,1473145200"; d="scan'208";a="1073753339"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2016 08:06:44 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<9a2f86103e33586c0587cdc62a2633768a4a6648.1476888929.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LZ==RezUpAvHxOBV5wr=yBahNj4VGtRkGgcAv5UUE1=ZQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <59714d1d-d01e-d1df-1bda-48a76d1b8def@linux.intel.com>
Date: Fri, 21 Oct 2016 18:04:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ==RezUpAvHxOBV5wr=yBahNj4VGtRkGgcAv5UUE1=ZQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/19] gnome-desktop3: update to 3.22.1
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
X-List-Received-Date: Fri, 21 Oct 2016 15:06:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2016 12:24 PM, Burton, Ross wrote:
>
>   * FILELIST: removed "/usr/lib/libgnome-desktop-3.so.12.1.0
> /usr/share/libgnome-desktop-3.0/pnp.ids" added
> "/usr/lib/libgnome-desktop-3.so.12.2.0"
> packages/corei7-64-poky-linux/gnome-desktop3/libgnome-desktop3:
> RDEPENDS: removed "libxrandr (['>= 1.5.0'])" added "libudev (['>=
> 230+git0+3a74d4fc90']) libcap (['>= 2.25'])"
>
> Can you verify the build and runtime dependencies?  If it isn't shipping
> its own pnp.ids do we need to depend on a data package to ensure they're
> present?

Found it and updated dependencies accordingly:

commit b8cbfbe06475703f333367976eae9477f229891a
Author: Bastien Nocera <hadess@hadess.net>
Date:   Wed May 20 13:07:49 2015 +0200

     pnp-ids: Use udev's hwdb to query PNP IDs

     hwdb has its own database which it compiles to binary, so that:
     1) initialisation is practically free
     See 
https://git.gnome.org/browse/gnome-settings-daemon/commit/gnome-settings-daemon/gnome-settings-manager.c?id=d8c158e74caea048dea5a38232bd87c1c7a78a70
     2) lookups are also quick, as they use a binary DB
     3) we don't have to maintain our own copy of the database
     4) allows model lookup rather than simply vendor lookup, when the
        database contains that information

     The only problem being that non-Linux OSes will need reimplement this
     section of the code. This will be on top of the usual downstream 
patches
     they ship for a number of components.

     https://bugzilla.gnome.org/show_bug.cgi?id=590059

M       configure.ac
M       libgnome-desktop/Makefile.am
M       libgnome-desktop/gnome-pnp-ids.c
D       libgnome-desktop/pnp.ids
M       libgnome-desktop/test-pnp-ids.c


Alex


