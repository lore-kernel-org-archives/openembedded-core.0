Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0595974051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 10:48:50 +0000 (UTC)
Received: by pabqy3 with SMTP id qy3so10509767pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 03:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vX57V6NCFWOrUy+swIisCeAixuQJgFJwN7/vxdeBgbU=;
	b=OIFuCV9meVUPgRaq8yBA5dGYgXwqLVQm30KqvgfoG0O9bYEbs5buCEiyJQiYEnmEHP
	vX4tSlI2FF58b+BJw67965peUL1x2oTiz6BY6tLCYUcOC0DuGcNwndeKtngzEWZVYXBR
	MTxfJ1yGOB3Jp800+l/5Qn6m2lX4tFtcEplBNORbjWMIwmG2eaPQ0mbAv7PVxg5KDy8E
	0HfG47Fnx3NPTSD3sqzjrb2E69sKpTmaWxs+sFW416o0LoNuhXYKvi5QGnIvXSsJ+oi5
	M3U39J7lp+lTfZNBiZK/snTrXqo4GXiMjlU8EPi2lfk2GuuqieIS5qU+YKpftGQxvvF8
	6eYQ==
X-Gm-Message-State: ALoCoQmEsKl8yZlZib/+CbZNtHRXaeyHg006iDo7QZNmcb9Q3aaMuzk7vbqJ3Xet0qOSE5wJ5Jwh
X-Received: by 10.68.112.195 with SMTP id is3mr57677100pbb.92.1434451731645;
	Tue, 16 Jun 2015 03:48:51 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id cf1sm955541pdb.41.2015.06.16.03.48.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 03:48:51 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 16:18:29 +0530
Message-Id: <1434451710-2526-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH v2][fido 3/4] runqemu-internal: add support to boot arm64 qemu target via NFS
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
X-List-Received-Date: Tue, 16 Jun 2015 10:48:52 -0000

Add required boot parameters inorder to boot arm64 qemu
target via NFS

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu-internal | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index dc0e053..fb51754 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -389,6 +389,15 @@ if [ "$MACHINE" = "qemuarm64" ]; then
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi
+    if [ "$FSTYPE" = "nfs" ]; then
+        if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
+            echo "Error: NFS mount point $ROOTFS doesn't exist"
+            cleanup
+            return 1
+        fi
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $QEMU_UI_OPTIONS"
+    fi
 fi
 
 
-- 
1.9.1


