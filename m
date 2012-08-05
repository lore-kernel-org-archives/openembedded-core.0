Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sy4LR-0001eN-Ov
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 19:10:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2012 09:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="log'?scan'208";a="181809989"
Received: from unknown (HELO [10.252.121.31]) ([10.252.121.31])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2012 09:58:40 -0700
Message-ID: <501EA63F.9090304@intel.com>
Date: Sun, 05 Aug 2012 19:58:39 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
	<CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
In-Reply-To: <CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sun, 05 Aug 2012 17:10:26 -0000
X-Groupsio-MsgNum: 26953
Content-Type: multipart/mixed; boundary="------------000404030702050609050708"

--------------000404030702050609050708
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/04/2012 10:51 PM, Khem Raj wrote:
> On Sat, Aug 4, 2012 at 12:37 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>> And less than 3min on overo with the patches we sent (and my xfce
>> image is full of gtk-icon-update). Don't misunderstand me: I agree on
>> doing things like this on host if possible. But for me the main time
>> waiting on a new image is do_rootfs and I just suggest to think about
>> having these tasks run only once - but we can do this later or never.
>> A bit off topic: As far as I can remember there were times when it was
>> a no-go having gtk-native in oe-core. I hope they are over...
> 
> I certainly agree with you that it should be run once. However what if
> you changed something in icons between towo do rootfs runs ?
> but I would like to know how much build time is it adding to do_rootfs ?
Short answer: *less than 2 secs*

Long answer:
In order to measure the time added to do_rootfs by the
gtk-update-icon-cache calls, I modified gtk+ recipe to create a wrapper
script, as seen in attachment [1].

I compiled core-image-sato using the following setup:

CPU: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 4 cores with HT
RAM: 8GB
Storage: SSD

The measurements are in attachment [2].

Conclusion: I would say that a delay of less than 2 seconds added to
do_rootfs is not that bad, in my opinion. Of course, we can optimize
this as much as possible but, is it worth the effort?

You could give it a test yourselves and let me know your results. I will
send a version 2 of the patchset(as soon as we all agree on the
solution), with some changes suggested by Mark and some PR bumps
suggested by Koen.

[1] - measure_time.patch
[2] - do_rootfs.log

Thanks,
Laurentiu

> sometimes over optimising is bad too.
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 

--------------000404030702050609050708
Content-Type: text/x-patch;
 name="measure_time.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="measure_time.patch"

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 878eb87..e77ecce 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -41,6 +41,18 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS_${PN}_virtclass-native = ""
 DEPENDS_virtclass-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
+do_install_append_virtclass-native () {
+    mv ${D}/${bindir}/gtk-update-icon-cache ${D}/${bindir}/gtk-update-icon-cache.real
+
+    cat << "EOF" > ${D}/${bindir}/gtk-update-icon-cache
+#!/bin/bash
+
+echo "Executing: gtk-update-icon-cache $@" >> ${TMPDIR}/do_rootfs.log
+/usr/bin/time --f "real:%e user:%U sys:%S" -o ${TMPDIR}/do_rootfs.log --append gtk-update-icon-cache.real $@
+EOF
+    chmod +x ${D}/${bindir}/gtk-update-icon-cache
+}
+
 python populate_packages_prepend () {
     prologue = d.getVar("postinst_prologue", True)
 

--------------000404030702050609050708
Content-Type: text/x-log;
 name="do_rootfs.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="do_rootfs.log"

Executing: gtk-update-icon-cache -q /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs//usr/share/icons/hicolor
real:0.05 user:0.00 sys:0.03
Executing: gtk-update-icon-cache -q /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs//usr/share/icons/hicolor
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -q /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs//usr/share/icons/hicolor
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -q /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs//usr/share/icons/hicolor
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.25 user:0.01 sys:0.15
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/hicolor
real:0.05 user:0.01 sys:0.01
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/xcursor-transparent
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.25 user:0.04 sys:0.12
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/hicolor
real:0.04 user:0.00 sys:0.02
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/xcursor-transparent
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -q /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.25 user:0.03 sys:0.13
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/hicolor
real:0.05 user:0.00 sys:0.03
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/xcursor-transparent
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.25 user:0.03 sys:0.13
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/hicolor
real:0.05 user:0.00 sys:0.03
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/xcursor-transparent
real:0.00 user:0.00 sys:0.00
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/Sato
real:0.26 user:0.04 sys:0.13
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/hicolor
real:0.04 user:0.00 sys:0.02
Executing: gtk-update-icon-cache -fqt /ssd/yocto/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato-1.0-r0/rootfs/usr/share/icons/xcursor-transparent
real:0.00 user:0.00 sys:0.00

--------------000404030702050609050708--
