Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYDVZ-0004uy-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 10:09:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB792uFO010470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 01:02:56 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 7 Dec 2011 01:02:56 -0800
Message-ID: <cover.1323246565.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 7 Dec 2011 16:29:25 +0800
Date: Wed, 7 Dec 2011 16:58:17 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 00/10]gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Wed, 07 Dec 2011 09:09:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>


I re-split up gtk.inc to two patches according  to Saul's suggestion. 

The previous description:

I got many comments about previous submitting patches to run gtk+ over directfb. thank koen to give me many suggestions. The main problem query is as follow:
Question:
Why removing x11 for running gtk over directfb?  x11 doesn't infect directfb and they can co-exist in the same image. also if have x11 in image, it could be better in many respects.
Answer:
Yes, it is. Both x11 and directfb can co-exist in an image. gtk can run in an image including x11. I also test gtk over directfb in an image based on x11. it can work well.

As far as I know many engineers make Directfb part of their product in embedded field. It is enough for person to finish their designing with directfb because they don't need complicated graphic and perhaps it is more important for them to save more memory.  So x11 is not neccessary in these products if have directfb.

So removing x11 in an image based on directfb can meet some engineers' requirement. They can get this image without wasting too much time if they want to develop their product with Yocto.
Also there is still no test program and application for directfb at current status. If have this image, directfb can be tested by directfb-example. gtk-demo based on directfb will be a good application.


More description:
x11 and directfb can't be set in DISTRO_FEATURES at the same time. They  are mutually exclusive in  DISTRO_FEATURES because gtk run over either  x11 or directfb in current version. But if x11 is defined in  DISTRO_FEATURES, then directfb can be compiled by other methods. for  example, directfb can be compiled by dependence relationships or be  included in a task list like task-core-sato.bb. They can  co-exist in an  image with above methods.

Moore:
X11 and directfb are exclusive since only one backend is enabled at a time. at 3.0 version of gtk they could co-exist by setting --enable-x11-backend and --enable-directfb-backend (Thank Phil ). So the configuration is either --with-gdktarget=x11 or --with-gdktarget=directfb at current version. I will modify configuration when gtk is updated to 3.0.  
 



Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (10):
  qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
  gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
  gtk.inc: ship gtk-demo to independent package
  gtk.inc: add feature based on directfb
  gtk: add demos to the configuation of gtk+
  cairo: add directfb DISTRO_FEATURE
  pango: add directfb DISTRO_FEATURE
  directfb-examples: add package directfb-examples to OE-core
  task-core-gtk-directfb.bb: Add task list to run gtk over directfb
  core-image-gtk-directfb.bb: add an image for gtk over directfb

 meta/recipes-bsp/qemu-config/qemu-config.bb        |    4 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    6 +++-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   20 ++++++++++++---
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    6 +++-
 meta/recipes-graphics/cairo/cairo.inc              |    9 +++++-
 .../directfb/directfb-examples_1.2.0.bb            |   20 +++++++++++++++
 .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   20 ++++++++++++---
 .../tasks/task-core-gtk-directfb.bb                |   26 ++++++++++++++++++++
 9 files changed, 116 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.2.0.bb
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb
 create mode 100644 meta/recipes-graphics/tasks/task-core-gtk-directfb.bb



