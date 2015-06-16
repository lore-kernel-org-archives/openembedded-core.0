Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id ED2A274051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 10:48:46 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so11848930pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 03:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AhKnc3+EsOZWg+Di8cjKxndwmMzlsyMhBHXzG71xGpY=;
	b=CyB0wqvVXaYBuf7nIwq7CoAritO99fIKKKCJGYt8uLX3Zf229KVM9WImLqlOFHW+lQ
	HZqR3D0+E8E2n6pW8omK3uMgJy5Da3aEquBd0LZMebG1KYD6u0kXlhZ5ona1lft1FC1A
	rKMbf7fDEeDh+YCRbMbleT0+Ei72wrQ/msITADqrB+jht0Bp5IvP6ebaFQlhaJErIW/5
	SwS3vhYEe3XNojV3h0uT8RYPidNny4zlHWodAybmFueO8CwW+8ew6msKpd2xRlm+5uui
	XfPVjTM/KKPMz58Zi6nQHNlylbmWa/q0vOGLATORHPmSt09l498L5VwcZRKIFsVYlRMK
	k5FA==
X-Gm-Message-State: ALoCoQmeDICk0trXDgurR9Mcge4ouZhdMFGObfjXkqglVTF5dNtPVWSKMk5hUbVkVIKoTEm8FEXa
X-Received: by 10.68.218.231 with SMTP id pj7mr46938310pbc.155.1434451728069; 
	Tue, 16 Jun 2015 03:48:48 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id cf1sm955541pdb.41.2015.06.16.03.48.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 03:48:47 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 16:18:28 +0530
Message-Id: <1434451710-2526-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH v2][fido 2/4] runqemu-script: define console for qemuarm NFS booting
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
X-List-Received-Date: Tue, 16 Jun 2015 10:48:47 -0000

Add console=ttyAMA0,115200 as one of the boot parameters
for qemuarm, in order to print bootlog messages on the
console.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2db5566..dc0e053 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -368,7 +368,7 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
             cleanup
             return 1
         fi
-        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
+        KERNCMDLINE="root=/dev/nfs nfsroot=$NFS_SERVER:$NFS_DIR,$UNFS_OPTS rw console=ttyAMA0,115200 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
         QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} --no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$MACHINE" = "qemuarmv6" ]; then
-- 
1.9.1


