Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A524B783B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:04:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t138so8708264wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j6YAWRhY3I0wo42Rx9dszT1qmWFuv1kJz/4jbO95XS4=;
	b=Mt/FbSHFxn6ishttx/40nFGrcQCKYU0F1COoNf9XfXgF8CuzQeixat7iOSTXJ6hpwy
	WjdObEwrdnsXQPem5c2WFwESR9eLn8F/o1VNpLpYuEJvpDiHRSgZwxo//GWgp8Rv+Y2I
	VGgqSIP1l2wH00j1gCYGxWTQvQ5u7SBlKOoKRrKGOVwzriW1JLy3KrzwJMcW004sZooH
	ib7ph2FVycoagj6ZpL+4nhf3ZWnOPZDNuWJ+g2H6B+IV7jP6Y8AEHc+AsAoWU4Zg+79P
	wLVHEgcPHPAmYk6CE0Xz3tYSSRXu+r1LSCNqzjMwtlS0PuZVBAt6xEhGwL1hZ03hfZd8
	zavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j6YAWRhY3I0wo42Rx9dszT1qmWFuv1kJz/4jbO95XS4=;
	b=b4sD4itvOOPQr0d1SInujRRh1vvUmvG8HDzGdq55FwOYssVL3Yl4wW8F6ly+cc3LZ5
	FaZZ350Afkj60rWTO/0TKMGt5e6TwTQmzJ2iFsdhffIGdmct9XRncAHMiVvIOAMOIucU
	2mt1/WB0lm7QjXfTyNSTSteeEHOYVSN5DAi4dtWqx0y6futzau/2dbfw5RnIAKjs+mRI
	QbsK9vXxjw1DsAuqDg5tUn15FVCWLZCnClzjH4WGiW+DwOPmLi5UidDdczfZ9uZxWxWF
	5XdOKVGxI6lX1lgpPnlq4LtNUDRDpZ4dl3PFN2NB/c7b4hep/pDEBPzvBurhggvYA1u+
	46dw==
X-Gm-Message-State: AIVw111L/ObxWXa2YbHouvOmmHRCzhyliHxauH2z5/B6mtTUqY+wb9Fj
	k91e99ZivvqxFSwf
X-Received: by 10.80.165.45 with SMTP id y42mr6574315edb.64.1501250682015;
	Fri, 28 Jul 2017 07:04:42 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.6]) by smtp.gmail.com with ESMTPSA id
	b10sm10373675edl.74.2017.07.28.07.04.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 07:04:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:04:27 +0200
Message-Id: <1501250667-7258-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] rootfsdebugfiles.bbclass: add a optional parameter to choose file mode
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
X-List-Received-Date: Fri, 28 Jul 2017 14:04:41 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This is in case that sometimes the copied target files might be
expected to have a desired mode, for instance, the ssh keys should not
be too open, otherwise the users will get a "Permission denied" error.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/rootfsdebugfiles.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
index a558871..e2ba4e3 100644
--- a/meta/classes/rootfsdebugfiles.bbclass
+++ b/meta/classes/rootfsdebugfiles.bbclass
@@ -15,6 +15,10 @@
 #    ROOTFS_DEBUG_FILES += "${TOPDIR}/conf/dropbear_rsa_host_key ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ;"
 # 2. Boot the image once, copy the dropbear_rsa_host_key from
 #    the device into your build conf directory.
+# 3. A optional parameter can be used to set file mode
+#    of the copied target, for instance:
+#    ROOTFS_DEBUG_FILES += "${TOPDIR}/conf/dropbear_rsa_host_key ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key 0600;"
+#    in case they might be required to have a specific mode. (Shoundn't be too open, for example)
 #
 # Do not use for production images! It bypasses several
 # core build mechanisms (updating the image when one
@@ -27,10 +31,11 @@ ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
 rootfs_debug_files () {
    #!/bin/sh -e
-   echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target; do
+   echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
       if [ -e "$source" ]; then
          mkdir -p $(dirname $target)
          cp -a $source $target
+         [ -n "$mode" ] && chmod $mode $target
       fi
    done
 }
-- 
2.7.4


