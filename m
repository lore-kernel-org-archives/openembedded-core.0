Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC1716C44B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 15:01:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so3223719wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=FgSdoXWMnaX4Ovttret8mM6cXOooyOi5cJ63uqfy7qY=;
	b=RmoDrgEJ2bRRV28NI+w3ncaoZfG5hQ0YCOmuEPGwPVQiQkSJGxzh8zEcZrataAb9Wq
	6KpNBq0ZeqYTwdX3onzVVHknkLBWeTCMOvS+4PZHZfYaoYggEx2XjzKs5cQ6Ha7n1H9u
	dMOgM+RmiuZvBUYmAOnL6KQ4cr93jZFWQpljbAAiXq5kGFb4rnQYSqpdE+Tw0bUw/CXj
	O0sCA1sEaLl/CGlRkQrOnKKodqohdMpBFgs7gtgbVxXCtDKrOtstCEunPDlKNtUvBcOz
	mVRWtAmmf4I97sfDDU81I0rC6Xjvky85va6WbiLQIX/n0pN6NiKj11OIqvjnG8ME970J
	kljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FgSdoXWMnaX4Ovttret8mM6cXOooyOi5cJ63uqfy7qY=;
	b=fKiygpBPZIYAP3P2bwpO9sDIA9C/x2HKOqNUt2mvqO5+nR/IV5fv8za5Uguqrctu1+
	Jok9QUOv1uJ6fESOQ2PtkRrzBLZpHlVYRNSTIQ3e+dAJ/9yt66ckQAlU5Ft2O70aDu/n
	QFIB9hYgy2ePX2p50EgquIpLsRbfgJfBO+MO94RyUGMszXUVnMRpuCOS07vt8eRsiAjQ
	Wf6L75+6o6EWEy285Menner5fY5hWvSQo4btAbEpVwSpLvepbXZI+zD3RTtZtGZdelP5
	/e6cdgXStZBLqkZQUaQy+eYAVVvJblQTfOnuNjLR5CbTBdrf+sDEGXQ9INlnMi2K2dRg
	HeqQ==
X-Gm-Message-State: APjAAAXvEZ9sUTLsrSVBqH/NIehdsatEXSplYDH6H93DR39oPPgj3kP6
	8UAIE1Nh5v7sU6W67r9sUNl8kmq+vrE=
X-Google-Smtp-Source: APXvYqznD7eDWRQgiiWkUWXgKSxkSPF8smrSTVu1Uy28f+dKtk7oEeU7N5TAKjR7DevLbFW1y35XgQ==
X-Received: by 2002:a05:6000:14b:: with SMTP id
	r11mr4566641wrx.196.1562166091049; 
	Wed, 03 Jul 2019 08:01:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x20sm4465418wrg.52.2019.07.03.08.01.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 08:01:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 16:01:28 +0100
Message-Id: <20190703150128.21192-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: use clean_path for the host contamination warnings
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
X-List-Received-Date: Wed, 03 Jul 2019 15:01:31 -0000

We've a nice function to clean up absolute build paths for display, so use it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0695a044387..891d3a84218 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -874,15 +874,14 @@ def package_qa_check_host_user(path, name, d, elf, messages):
         if exc.errno != errno.ENOENT:
             raise
     else:
-        rootfs_path = path[len(dest):]
         check_uid = int(d.getVar('HOST_USER_UID'))
         if stat.st_uid == check_uid:
-            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_uid))
+            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by uid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_uid))
             return False
 
         check_gid = int(d.getVar('HOST_USER_GID'))
         if stat.st_gid == check_gid:
-            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, rootfs_path, check_gid))
+            package_qa_add_message(messages, "host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid))
             return False
     return True
 
-- 
2.11.0


