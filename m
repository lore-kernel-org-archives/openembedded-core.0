Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 406CC77C41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2TAMPbO005493; 
	Wed, 29 Mar 2017 11:22:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7ggGSM6WBzTr; Wed, 29 Mar 2017 11:22:25 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2TAMN5i005490
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 11:22:24 +0100
Message-ID: <1490782943.13980.306.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:22:23 +0100
In-Reply-To: <2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 10:22:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 10:16 +0200, Peter Bergin wrote:
> I agree that it is nice and encouraged to group configurations
> together and make them selectable as a group. A good example from 
> busybox_1.24.1.bb is:
> 
>             ${@["", 
> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 
> 'busybox')]} \
>             ${@["", 
> "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 
> 'busybox-mdev')]} \
> 
> In the example above, configuration fragments are added based on some
> configuration in your build. The configuration fragments that I
> removed with my patch was always added and in that situation I think
> it is better that they are added to the defconfig file. The situation
> now force me to do workarounds to avoid having these default
> configurations in my busybox .config.
> 
> Ideas for better solutions are welcome and I hope we can find a
> solution that make it possible to provide your own busybox defconfig
> file that is only changed due to configurations in your build.

I don't think its difficult to make something which would improve
things and be configurable from other layers. How about something like:

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 6246c95..cb20207 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -15,6 +15,11 @@ SECTION = "base"
 # Whether to split the suid apps into a seperate binary
 BUSYBOX_SPLIT_SUID ?= "1"
 
+BUSYBOX_FRAGMENTS = "login-utilities"
+
+def busybox_fragment(name, d):
+    return bb.utils.contains('BUSYBOX_FRAGMENTS', name, "file://" + name + ".cfg", "", d)
+
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 41fc641..a0ef17b 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
+           ${@busybox_fragment("login-utilities", d)} \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \

Obviously I just used login-utilities as an example...

Cheers,

Richard


