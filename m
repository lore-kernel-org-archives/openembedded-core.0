Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1013679A43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 10:06:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id q8-v6so1357734wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eW3vIIspQXLIwjJ/4CBK6ESWhzJt5UmC97rAX5n2aRo=;
	b=kQGvME4F0XzZ20JwdBhTC6AW95D/BtZn0szN7uEQt3jGdVYnMuarYE1Kg/9wjEZHm5
	jZD5pwQ4NhGtvNZ4RVf+wGZcCkM0M5ZCA+hB353aN2fBKHgbWWsTMheOnspKFIOw1ci6
	cfCBZULWxXI2+CxwSgGB10GEiC+6bmfc19GqPEvKKxm2j1bLq9ZgugI3advuhmM5Fltl
	CyiT8mXTozC25O7U6wccMFDvxrt1paRRCp8oKBl8v2P8hVphVXX+d8uuMnOEQcK8qnG9
	9W5Rr+amdXoPlZVKIDGBxFpN64TYfclRQSQsBSLSKbCo9RrAq3m7UP/Sz+352c9KIhqR
	zbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eW3vIIspQXLIwjJ/4CBK6ESWhzJt5UmC97rAX5n2aRo=;
	b=BRXeugNbSYJI5v2j8O+m2kgtYFvCxAQk4nMlfycQFJnD51gPvc3oqLZrfMGcjL4+IH
	2b5waXoPy5I1YZprqik0FX6mVNQ8ui3BMBznWpZwqqXfG4fJDG6yCmB5I73Wb7r5+Ru7
	OjOShZsYVojnL7h1qhD4+7TMuZzHdHeTYV+mWx5XZxR6AYppePecMjds5blwAR186skp
	Zejm274wOw6o7Y14u7aL2vWEQ7N1litEd7prxNFIiNF24RGm5g522MQWdb3bDFyi+SRj
	naJ6Wz4iljHn4pmRBql6QctFLoZOzYNSsoxHpQvMxZ4wx9T+NV+Sc7YvDMqIZS0JWUBX
	pwBQ==
X-Gm-Message-State: ABuFfoiSE/Bu8nYosn1Ly2kjv03z89Asz8H5XoZPM876/ruF6G86i9rn
	RIpiFSH1VpLst6lBjMiZQwwTDAtg
X-Google-Smtp-Source: ACcGV63K2xLwDrSdFqhLPDFU4byJD/9YSsuj9q26e9jSKCtwudRUAZDOVCOO1eaGz6ljPstgfPjP1g==
X-Received: by 2002:a1c:5d8c:: with SMTP id
	r134-v6mr6981922wmb.147.1538733998554; 
	Fri, 05 Oct 2018 03:06:38 -0700 (PDT)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	e142-v6sm4810560wmf.20.2018.10.05.03.06.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Oct 2018 03:06:37 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 12:05:18 +0200
Message-Id: <20181005100518.12412-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20181005100518.12412-1-max.krummenacher@toradex.com>
References: <20181005100518.12412-1-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][Patch 2/2] util-linux: : use update-alternatives for fsfreeze, nsenter
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
X-List-Received-Date: Fri, 05 Oct 2018 10:06:38 -0000

busybox may also provide a fsfreeze and nsenter implementation,
so use u-a to allow installing them side by side.
If one installs both, busybox and util-linux, one gets the following error
(seen on a populate-sdk run):

| ERROR: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
| then please place them into pkg_postinst_ontarget_${PN} ().
| Deferring to first boot via 'exit 1' is no longer supported.

And the coresponding do_populate_sdk extract:

| ...
| update-alternatives: Error: not linking ...sdk/image/usr/local/oecore-x86_64/sysroots/armv7at2hf-neon-angstrom-linux-gnueabi/usr/sbin/fsfreeze
|     to /bin/busybox.nosuid /bin/busybox.nosuid since ...sdk/image/usr/local/oecore-x86_64/sysroots/armv7at2hf-neon-angstrom-linux-gnueabi/usr/sbin/fsfreeze
|     exists and is not a link
| ...

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c2e02e847a..45e2203a64 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -205,9 +205,12 @@ do_install_append_class-native () {
 
 ALTERNATIVE_PRIORITY = "80"
 
-ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset fallocate"
+ALTERNATIVE_${PN}  = " \
+    dmesg kill more mkswap blockdev pivot_root switch_root \
+    hexdump last lastb logger mesg renice wall unshare \
+    setsid chrt flock utmpdump eject nologin taskset fallocate \
+    fsfreeze nsenter \
+"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -219,6 +222,7 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
-- 
2.13.6


