Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id B49EF6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 11:56:56 +0000 (UTC)
Received: by wevl61 with SMTP id l61so2384103wev.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 03:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mc59yllDz0yUsPYwder7gwJUoTU/ZqPYz7Zj76MrZJs=;
	b=f32fJ95OCsikVQ58ZEbN37qor764DmOy1GItXZXfiHlF/CoCVp04aLw/FDwLIaSTKF
	r8o7NSPvHUoDXHvQ1sdLoiS9v30+beSahcgntEdISWkcOOUVXNjaNUlkl0febSWGWMIA
	ntonw4vit62dJ8OSLa2E109CskvZ6zFcr5K3klmVACYQBJcUrvFhx9mNhjU6Pm2vUZJi
	+uVl1Xt/K82BTtooZbmz4JOHNdS5sbUpNnN6ioqqVI2MbhxUC0DfwiMT8jb/4z4D6Xiq
	lFVOdIdICF5qj1NL9fqUCnOp2S3EsoH0m+LTnAI3MaVTTvc6PNKnNQ8CvE6IRwT8TVxp
	0BtA==
X-Gm-Message-State: ALoCoQmJW1gVWP0ePghJbXxCu6Fj+r3OKycsSxLbTEgwwwfJRn/3XdQzq7o3PwyfaQyI1W1DtvY6
X-Received: by 10.194.239.129 with SMTP id vs1mr67558390wjc.158.1425383816734; 
	Tue, 03 Mar 2015 03:56:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id p1sm2120852wib.23.2015.03.03.03.56.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 03:56:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 11:54:25 +0000
Message-Id: <1425383665-3396-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: fix tmpfiles error on images without PAM
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
X-List-Received-Date: Tue, 03 Mar 2015 11:56:58 -0000

If PAM isn't enabled then systemd-tmpfiles on boot will fail to start with the
following error message:

Failed to copy files to /etc/pam.d: No such file or directory

This is because systemd-tmpfiles is attempting to build a usable /etc from the
skeleton in /usr/share/factory but pam.d isn't present because PAM is disabled.
Fix this by not attempting to copy pam.d in non-PAM configurations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/tmpfiles-pam.patch             |   30 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/tmpfiles-pam.patch

diff --git a/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch b/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
new file mode 100644
index 0000000..a40b1b9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0802aaaa9784813d318d045c79533a044eedf542 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 3 Mar 2015 11:32:29 +0000
+Subject: [PATCH] tmpfiles.d: only copy /etc/pam.d if PAM is present
+
+If HAVE_PAM isn't set then don't attempt to copy /etc/pam.d from the factory, as
+it doesn't get installed.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ tmpfiles.d/etc.conf.m4 |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tmpfiles.d/etc.conf.m4 b/tmpfiles.d/etc.conf.m4
+index 9b0e080..ab5cd16 100644
+--- a/tmpfiles.d/etc.conf.m4
++++ b/tmpfiles.d/etc.conf.m4
+@@ -14,4 +14,6 @@ m4_ifdef(`ENABLE_RESOLVED',
+ L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
+ )m4_dnl
+ C /etc/nsswitch.conf - - - -
++m4_ifdef(`HAVE_PAM',
+ C /etc/pam.d - - - -
++)m4_dnl
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index f245239..24486f1 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
            file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
+           file://tmpfiles-pam.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
-- 
1.7.10.4


