Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6991873D45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:44:44 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so77656827ied.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 08:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/hly3rveTw93jDdS89znRwQNdmnQj7LrnJk5F/HywSk=;
	b=CZ8aZpslRFd+QVr0BJNrAH2b3o2rZaCqYBquq0msOHecw8LKg5xG6HdkeFy2Y9ZxXy
	btZu9N3xxUNQLfvwKQSh4e4+I19wqdX5khAS/WKhzrdxkDPwX3zKx6DmH86/zfKnLrgg
	WaPO70MOC9M/CfAmrx1KCqG5II1XDip+MB4/+shhiyELe92lshOmlolya4ygA8WtH77c
	rwIbYbYqZMD3ZmtazLTXSjtC9k5k12/9T0KxA1qQKyw9U7NjU7mq0ucAO3BrFRZ7pj/l
	TRR7AoIV3WMxKAGvDFuAokNwJPRJ2vxFog0w/HNjC0JOQYdvunO4LmblVbbdnhtqizxc
	bGDA==
X-Gm-Message-State: ALoCoQm+m8am+tXiCB1AM1i73jBEf727g7kCg6YCPWidMkouZ3j4L0OSHUliuFU3MFlwhpijy3xp
X-Received: by 10.107.160.212 with SMTP id j203mr22342871ioe.43.1428939885983; 
	Mon, 13 Apr 2015 08:44:45 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8EF5F.dip0.t-ipconnect.de.
	[93.232.239.95])
	by mx.google.com with ESMTPSA id h15sm5135011ioh.27.2015.04.13.08.44.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 08:44:44 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 08:44:38 -0700
Message-Id: <e03e02a4abdec92544b1f32e759ce378c80bf2c5.1428939671.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1428939671.git.patrick.ohly@intel.com>
References: <cover.1428939671.git.patrick.ohly@intel.com>
Subject: [PATCH 1/1] rootfsdebugfiles.bbclass: quick-and-dirty installation of additional files
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
X-List-Received-Date: Mon, 13 Apr 2015 15:44:45 -0000

The main motivation for this class was the observation that
a) a core-image can hang under qemu when the kernel does not
   have enough entropy to generate the ssh host key
b) ssh complains about changing ssh host key files when
   rebooting the same machine with different images

For debugging it is okay to reuse an ssh host key generated on the device
before. There may be also similar use cases, so the class is generic enough to
also copy more than one file or directory, with dropbear_rsa_host_key given as
example.

The documentation and naming of the class makes it clear that it
should not be used for production images.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rootfsdebugfiles.bbclass | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/classes/rootfsdebugfiles.bbclass

diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
new file mode 100644
index 0000000..a558871
--- /dev/null
+++ b/meta/classes/rootfsdebugfiles.bbclass
@@ -0,0 +1,36 @@
+# This class installs additional files found on the build host
+# directly into the rootfs.
+#
+# One use case is to install a constant ssh host key in
+# an image that gets created for just one machine. This
+# solves two issues:
+# - host key generation on the device can stall when the
+#   kernel has not gathered enough entropy yet (seen in practice
+#   under qemu)
+# - ssh complains by default when the host key changes
+#
+# For dropbear, with the ssh host key store along side the local.conf:
+# 1. Extend local.conf:
+#    INHERIT += "rootfsdebugfiles"
+#    ROOTFS_DEBUG_FILES += "${TOPDIR}/conf/dropbear_rsa_host_key ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ;"
+# 2. Boot the image once, copy the dropbear_rsa_host_key from
+#    the device into your build conf directory.
+#
+# Do not use for production images! It bypasses several
+# core build mechanisms (updating the image when one
+# of the files changes, license tracking in the image
+# manifest, ...).
+
+ROOTFS_DEBUG_FILES ?= ""
+ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
+
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
+rootfs_debug_files () {
+   #!/bin/sh -e
+   echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target; do
+      if [ -e "$source" ]; then
+         mkdir -p $(dirname $target)
+         cp -a $source $target
+      fi
+   done
+}
-- 
1.8.4.5


