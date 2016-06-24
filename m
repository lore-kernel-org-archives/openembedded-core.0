Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD4E70018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:42:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c82so3904268wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bwts/N+eG/LUJWdar6VsuA0uvMh9ge9x7iG2zPoOWmI=;
	b=K5B7YayBsP9IY28OpBbvUNkedy+COWdF7ddb+wX2XQLhi3JAwgRnUBJItRYOF7EY0q
	sA+X1SUd7B3CoQ9AimgYsyzxFb+eGwjVwMToFqJH7q5qeSmCLAzQ7A/dDp0aFEJTxP2v
	GqlVnPPrRKZ2RMyRTVjVfMs09UtJjnDYjSX9wrtwHtiCuUZpqvhkoL3nwQUJA9GjLQ1u
	K3qt/kfsf/kBI6S/9UwM3cg/Sws5+brHwspvV9/fIDLv3ueRHujNWcnF3F/JziVtqw2d
	OWdKkncqSdp/LCXuNk5NEuLLJQHixnDTo6OAIG4eaho1nb3CEW3A90EjigA+MzU7xdST
	89gQ==
X-Gm-Message-State: ALyK8tKnR3YYM/a1mz5wk+qrTiN1MRaKNPc1CklDaEXDYG10oBe45ld8DMF3PjRdvBIbaw==
X-Received: by 10.194.216.106 with SMTP id op10mr3591389wjc.178.1466764956298; 
	Fri, 24 Jun 2016 03:42:36 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	p76sm2516569wmd.10.2016.06.24.03.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 03:42:35 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 11:42:32 +0100
Message-Id: <1466764953-20079-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] classes/kernel: fix symlink creation in DEPLOYDIR for bundled initramfs
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
X-List-Received-Date: Fri, 24 Jun 2016 10:42:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

If multiple kernel image types have been specified, only the very first
one would receive a symlink in DEPLOYDIR.

The reason is that we're looping over the list of image types and check
if a bundled initramfs images exists using a relative path. As part of
the loop we're changing the current directory, hence all additional
iterations fail to see the files we're looking for, and hence no symlinks
are being created.

Fix by not changing the directory and adjusting the ln invocation instead.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 59bbbe8..3127590 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -586,8 +586,7 @@ kernel_do_deploy() {
 			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
 			initramfs_symlink_name=${type}-initramfs-${MACHINE}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
-			cd ${DEPLOYDIR}
-			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+			ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
 		fi
 	done
 }
-- 
2.8.1


