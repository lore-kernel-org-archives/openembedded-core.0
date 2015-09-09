Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7849A76FF2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:10:25 +0000 (UTC)
Received: by iofb144 with SMTP id b144so21136232iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b5q6m6N3i004Vn4pSmf+WCpZqIso3oF1F5FNPemGBfw=;
	b=ivmoh2G/uWTo4KXSTyR/JTVQT2WG8Y7j1/FTtvy0dHCI7DsZcI1KwrvkHkXdCB9JbZ
	BqfZ2C8z+zmdUmCiDQiWRaoNqOXHsMlcDJF5dWiji/AXTCViUMcI+qnLRfOBM6WaN760
	Xpko5Vj8woOt4Oxs8yxa899UDF9I9t6fb5U5C3SE7A9OQKnqXpQyqvHra3ZnoF9EQSSY
	E3IPCuvBQ48Kj5er52Q1Zq2Dt4yxrGOS7afE2cZCfCkQjDGqiKTMtskOJPwKOqaJNj6o
	UM/YSTg9hnTBbkC/82d/fceD9di4lMWFMAQVl5VdVlqb+HlB6iswe6EzZ5DlSaz/9ieG
	IJ/g==
X-Gm-Message-State: ALoCoQm/a+ms51a5zm17wAexiymxyXwpGTTfi4QeXR5bpjEqPcCxO8AAwBWPRKWILr6CNBl7sYT2
X-Received: by 10.107.17.206 with SMTP id 75mr30657607ior.140.1441804225173;
	Wed, 09 Sep 2015 06:10:25 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51]) by smtp.gmail.com with ESMTPSA id
	k21sm4513409ioi.10.2015.09.09.06.10.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 06:10:24 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 15:10:45 +0200
Message-Id: <08da5db32769473be4884f87ad002fe426770a91.1441803055.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
References: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
Subject: [PATCH 3/4] initramfs-framework: support init boot parameter
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
X-List-Received-Date: Wed, 09 Sep 2015 13:10:25 -0000

It can be useful for debugging to override the default /sbin/init.
This is something typically done via the init boot parameter which
then gets interpreted by the kernel. But when using an initramfs, it
is the initramfs which must react to the option.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index a8806aa..e712ff0 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -53,7 +53,7 @@ finish_run() {
 		mount --move /sys $ROOTFS_DIR/sys
 
 		cd $ROOTFS_DIR
-		exec switch_root -c /dev/console $ROOTFS_DIR /sbin/init
+		exec switch_root -c /dev/console $ROOTFS_DIR ${bootparam_init:-/sbin/init}
 	else
 		debug "No rootfs has been set"
 	fi
-- 
2.1.4


