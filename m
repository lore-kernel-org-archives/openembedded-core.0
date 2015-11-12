Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7A177223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:59:36 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so2127751wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Lp/+tS8i+uMKDQwhSJD1ZlQe8uhTowIJzul+tK9r6FU=;
	b=pG5C0mL65WEJuaFuSZfE2NAC6H+/RW6PwnCgf6q3vZUKRUX8r6dUbF8paPbTObN18k
	VJPpv3AbHxOdNXCogmlvzXiKvjNOeoMZF8lhAMdd0biDfu5sZfgTtni+VaTU+31THLkW
	nKfiV+g0/dD6h3G5vEXVsbY6sRKodssoPFsavNjZC/fDiJkpGJ14x8RKe6zOgb7QE6DK
	SR0pz773uE6USkegURFhXuMLj0BRkvnUz1xrUbkAH0gY4YeZ+rk2jWQkW60nq8ymayln
	pcez2hleaqW+2BdmweisMeM1Pw2xmhcJ4MExM2nqFB1MQZun4vtRn4ocO/5cyz9loQ1u
	kw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lp/+tS8i+uMKDQwhSJD1ZlQe8uhTowIJzul+tK9r6FU=;
	b=W457ZK3ukOD9C5E8Q+WiLDQNwn8aXcZZBI3P9UXtvyiQSSl3r631IxmTj+6HxWulg2
	QhWpPFICM0iSXVfNe29cvpn5M1Byf8Oz6fHMc2XpjHeILKbyeKH3veM+xUqkj3N26ccf
	epLiZnvy6vaIcRaxcljzt9Q33tV4SbvBzzVrSTg7caodeKxf6qJEp7JzFGU+W5HmkYMc
	i0oYm/lgIlU1q5vJlSMh5RWFlgh/lrStQEapLgjUhHylep4tA3uDaE0On50Ef5JyKE/8
	DsDtPwUfqoiiIjVceSr2cTTineQUA0PKaNz+TYfH0x2rzJzHNPTPkPsU4/EX8FVs6aj+
	+KAw==
X-Gm-Message-State: ALoCoQmAka4qenmKvXitxYIQ80MtV2Xc27tmhuSvqZVpay5HAT7x4dVoQbOiXU/I63ikSCsTBI55
X-Received: by 10.28.88.205 with SMTP id m196mr20564069wmb.7.1447358376234;
	Thu, 12 Nov 2015 11:59:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v4sm6585996wjx.18.2015.11.12.11.59.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 11:59:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 19:51:14 +0000
Message-Id: <1447357874-13594-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gstreamer1.0: fix install race
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
X-List-Received-Date: Thu, 12 Nov 2015 19:59:36 -0000

The install hook needs to be a data hook not an exec hook (because automake),
the explicit dependency upstream added to fix the ordering results in
install-helpersPROGRAMS executing twice and potentially racing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  | 24 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.6.1.bb                |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
new file mode 100644
index 0000000..ed75cf8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
@@ -0,0 +1,24 @@
+This needs to be a install-data-hook not an install-exec-hook as the helpers are
+installed into helperdir which is considered data (only path variables with
+"exec" in are considered executables).
+
+The explicit dependency on install-helpersPROGRAMS was an attempt at solving
+this, but this causes occasional races where install-helpersPROGRAMS can run
+twice in parallel (once via install-all, once via the hook's dependency).
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=758029]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/libs/gst/helpers/Makefile.am b/libs/gst/helpers/Makefile.am
+index 0ae9ab0..2530a34 100644
+--- a/libs/gst/helpers/Makefile.am
++++ b/libs/gst/helpers/Makefile.am
+@@ -23,7 +23,7 @@ gst_ptp_helper_CFLAGS = $(GST_OBJ_CFLAGS) $(GIO_CFLAGS)
+ gst_ptp_helper_LDADD = $(GST_OBJ_LIBS) $(GIO_LIBS) $(CAP_LIBS)
+ endif
+ 
+-install-exec-hook: install-helpersPROGRAMS
++install-data-hook:
+ if HAVE_PTP
+ if HAVE_PTP_HELPER_SETUID
+ 	- chown root $(DESTDIR)$(helpersdir)/gst-ptp-helper
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
index 2359249..9618eaf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
+    file://fix-install-hook.patch \
 "
 SRC_URI[md5sum] = "e72e2dc2ee06bfc045bb6010c89de520"
 SRC_URI[sha256sum] = "973a3f213c8d41d6dd0e4e7e38fd6cccacd5ae1ac09e1179a8d5d869ef0a5c9c"
-- 
2.1.4


