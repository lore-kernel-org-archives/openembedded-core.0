Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTIps-0006lY-8K
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 20:50:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2011 11:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,561,1315206000"; d="scan'208";a="88614918"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 23 Nov 2011 11:43:51 -0800
Message-ID: <4ECD4CF7.60409@linux.intel.com>
Date: Wed, 23 Nov 2011 11:43:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322028165.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322028165.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/9] The patches to run gtk over directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2011 19:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2011 10:47 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Hi Richard&  all,
>
> I fixed some problems found at previous submitting and use PACKAGECONFIG to get mutual configuration between directfb and x11. I hope this submitting isn't a horrible mess :).
>
> One previous problem about what happen when user want to have both directfb and x11 in DISTRO_FEATURES?
>
> I think directfb and x11 can't be defined in DISTRO_FEATURES at the same time because directfb and x11 are the lowest level library for GUI with different mechanism.
> x11 and directfb should be mutual in DISTRO_FEATURES. User may use file "meta-yocto/conf/local.conf.sample.extended" to select the mode they want to need.
> but directfb can work in an image with x11. for example, "directfb" and "direcrfb-examples" can be added to task-core-x11-sato.bb. you can run df_andi, a demo based on directfb, on matchbox term running on core-image-sato with x11. So directfb and x11 can exist in the same image but not be defined in DISTRO_FEATURES at same time.
>
> If you have any suggestion, I will fix them again.
>
Please double check PR bumps, I noted that some recipes changes have PR 
bumps and other do not.  Also double check all the other recipes that 
rely on directfb (I think you have most of them here) and ensure that PR 
bumps are made as appropriate.

Sau!

> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/gtk+-directfb
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk+-directfb
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (9):
>    qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
>    gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
>    gtk.inc: add directfb DISTRO_FEATURE
>    gtk+: add demos to the configuation of gtk+
>    cairo: add directfb DISTRO_FEATURE
>    pango: add directfb DISTRO_FEATURE
>    directfb-examples: add package directfb-examples to OE-core
>    task-gtk-directfb.bb: Add task list to run gtk over directfb
>    core-image-gtk-directfb.bb: add an image for gtk over directfb
>
>   meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 +-
>   meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    4 ++-
>   meta/recipes-gnome/gtk+/gtk+.inc                   |   20 ++++++++++++---
>   meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    7 ++++-
>   meta/recipes-graphics/cairo/cairo.inc              |   12 +++++++--
>   .../directfb/directfb-examples_1.2.0.bb            |   18 +++++++++++++
>   .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++
>   meta/recipes-graphics/pango/pango.inc              |   19 +++++++++++---
>   meta/recipes-graphics/tasks/task-gtk-directfb.bb   |   26 ++++++++++++++++++++
>   9 files changed, 115 insertions(+), 16 deletions(-)
>   create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
>   create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
>   create mode 100644 meta/recipes-graphics/tasks/task-gtk-directfb.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


