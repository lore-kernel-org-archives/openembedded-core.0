Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THFAt-0008Mt-B3
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 16:34:47 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2012 07:21:54 -0700
Received: by weyt44 with SMTP id t44so672670wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 07:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=PxV/XCZqlSl/QRk7ovhmJ4JTF+s1OaakKvu+AZ/NT0I=;
	b=gRWbI+hBGt1OQbXP6hnah2QISFtOC/O5WzxpIeVOjui7NvLUlr6Gcq4vHimP/EGwY8
	BXJnLwbnZ5yZsbFNREc9ZDv1R9783CDDH/NR8fjSdVOoXrRlAX+OFWxtX7+WiklRshv+
	1VcpOzTST9xT9q+n+v/yzKIyJwLRmx6pq02xe9Y0fVUogxLlKA1myeYbgHzH20ZiC1/A
	hSsbRuRWMKucp+vg5OnjBaEpndCaWkA31ljbX6CNWHmo0S6ZtPToMzEnzB7kXzhFXf4T
	a2uNvItDOH3fIgYsydyvoCBWuKfjwOtpftEdrBIEIY0hEBMfn+5Wr/v9efEJZY+WIFgL
	AVeA==
Received: by 10.180.81.165 with SMTP id b5mr37005021wiy.17.1348755711971;
	Thu, 27 Sep 2012 07:21:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm13426611wix.6.2012.09.27.07.21.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 07:21:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 15:20:50 +0100
Message-Id: <20043bb7087432cc241e5d1eaa1059f787701cc4.1348755513.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1348755513.git.ross.burton@intel.com>
References: <cover.1348755513.git.ross.burton@intel.com>
In-Reply-To: <cover.1348755513.git.ross.burton@intel.com>
References: <cover.1348755513.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkvJQJL91FTKQfDJ9fMT3Hn8dqEG2HtLQwwvPtr61RhZ1UBpYJT2o+kCrSfg1gAZD81cyr/
Subject: [PATCH 1/2] initrd: Spawn an emergency shell when something goes wrong
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 14:34:47 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

set -e allows to exit if a command fails. We install a trap and execute
emergency_shell() when either the init script exits or when ctrl-c is
typed (say if we are stuck somewhere and we want to debug it).

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 3fba7dc..fb7af31 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -2,6 +2,17 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
+emergency_shell()
+{
+    echo "Bug in initramfs /init detected. Dropping to a shell. Good luck!"
+    echo
+    sh
+}
+trap "emergency_shell" 0 2
+
+# exit immediately if a command fails
+set -e
+
 ROOT_MOUNT="/rootfs/"
 ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
-- 
1.7.10



