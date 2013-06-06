Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C1FF96A8BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:53:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2013 09:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,816,1363158000"; d="scan'208";a="313294044"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by azsmga001.ch.intel.com with ESMTP; 06 Jun 2013 09:52:59 -0700
Message-ID: <51B0BE6A.7080407@linux.intel.com>
Date: Thu, 06 Jun 2013 09:52:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] GTK+ 3 updates
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
X-List-Received-Date: Thu, 06 Jun 2013 16:53:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2013 08:05 AM, Ross Burton wrote:
> Hi,
>
> Another revision of my GTK+ 3 branch, minus the test changes that need Python
> 2.7 and with some more fixes, mainly backports to ensure the Wayland backend
> works under Weston 1.1.
>
> Ross
>
> The following changes since commit ea281d3b8e5f2ae21b37ea2ad4d440bf9c6427ff:
>
>    bitbake: Added distroy signal to information dialogs (2013-05-31 08:25:40 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/gtk
>
> for you to fetch changes up to 125c91479244db72a603b9857949645bdaf5c5e0:
>
>    gtk+3: fix repainting under Weston 1.1 (2013-05-31 16:04:27 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (11):
>        gdk-pixbuf: upgrade to 2.28.1
>        at-spi2: add -core and -atk, for GTK+ 3.8

There has been a number of issues with this patch, therefore I am going 
to wait for Ross to come back and fix the issues, each ARCH seems to 
need some additional changes in their site files, some have been 
provided, but more are needed for other arches, I also found some 
missing dependencies, which I have put a fix in for.

Looks like this also need a Dependency on intltool-native, I tried a 
clean build of just at-spi2-core and got a failure.

Please rebuild this against all arches and re-submit.

Thanks
	Sau!


>        gtk+3: update to 3.8.2
>        gtk+3: explicitly disable introspection
>        gtk+3: respect x11 and wayland DISTRO_FEATURES
>        gtk+3: add dependencies for gtk+3-demo
>        gtk+: remove spurious libgcrypt dependency
>        gtk+3: register GSetting schemas
>        gtk+3: split into .bb/.inc
>        gtk+3: clean up libtool link creation to avoid errors in configure log
>        gtk+3: fix repainting under Weston 1.1
>
>   .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
>   .../configure_fix.patch                            |    0
>   .../extending-libinstall-dependencies.patch        |    0
>   .../hardcoded_libtool.patch                        |    0
>   .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
>   meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
>   .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
>   meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
>   .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
>   meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |   42 +++
>   meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   17 ++
>   meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
>   meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
>   13 files changed, 149 insertions(+), 340 deletions(-)
>   delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
>   rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
>   delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
>   create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
>   create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
>
> Ross Burton (11):
>    gdk-pixbuf: upgrade to 2.28.1
>    at-spi2: add -core and -atk, for GTK+ 3.8
>    gtk+3: update to 3.8.2
>    gtk+3: explicitly disable introspection
>    gtk+3: respect x11 and wayland DISTRO_FEATURES
>    gtk+3: add dependencies for gtk+3-demo
>    gtk+: remove spurious libgcrypt dependency
>    gtk+3: register GSetting schemas
>    gtk+3: split into .bb/.inc
>    gtk+3: clean up libtool link creation to avoid errors in configure
>      log
>    gtk+3: fix repainting under Weston 1.1
>
>   .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
>   .../configure_fix.patch                            |    0
>   .../extending-libinstall-dependencies.patch        |    0
>   .../hardcoded_libtool.patch                        |    0
>   .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
>   meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
>   .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
>   meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
>   .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
>   meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |   42 +++
>   meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   17 ++
>   meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
>   meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
>   13 files changed, 149 insertions(+), 340 deletions(-)
>   delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
>   rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
>   rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
>   delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
>   create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
>   create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
>

