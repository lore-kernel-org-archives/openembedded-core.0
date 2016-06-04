Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D90577121
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 08:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5484TKk028712 for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Jun 2016 09:04:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BCn2-h8M7BsY
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 09:04:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5484Qrj028706
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Jun 2016 09:04:28 +0100
Message-ID: <1465027466.13979.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Jun 2016 09:04:26 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] libarchive: Add PACKAGECONFIG for lz4 to ensure determinism
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
X-List-Received-Date: Sat, 04 Jun 2016 08:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids:

WARNING: opkg-1_0.3.1-r0 do_package_qa: QA Issue: libopkg rdepends on lz4, but it isn't a build dependency, missing lz4 in DEPENDS or PACKAGECONFIG? [build-deps]

and ERROR: 

build-appliance-image-15.0.0-r0 do_rootfs: Unable to install packages. Command '/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/sysroots/x86_64-linux/usr/bin/smart --log-level=warning --data-dir=/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/rootfs/var/lib/smart install -y packagegroup-core-boot@qemux86_64 packagegroup-core-ssh-openssh@all psplash@core2_64 kernel-dev@qemux86_64 packagegroup-core-x11-base@all kernel-devsrc@qemux86_64 smartpm@core2_64 packagegroup-self-hosted@all rpm@core2_64 locale-base-en-us@core2_64 locale-base-en-gb@core2_64' returned 1:
Loading cache...
Updating cache...               ######################################## [100%]

Computing transaction...error: Can't install libopkg1-1:0.3.1-r0.0@core2_64: no package provides lz4 >= 131+git0+d86dc9167

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
index e1f0202..fe22ea5 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
@@ -29,6 +29,7 @@ PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            "



