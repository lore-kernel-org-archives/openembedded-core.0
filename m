Return-Path: <ross@burtonini.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 69B2560EA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:29:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so3028483wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i4x8wbES4jjbhUAI2Hwq01TVfRCrjzP8dfGpjFK1fGI=;
	b=FfIsUkoN1+VIhevE19SLmYEJQv5KH2TVHUuUY6841ude6fuxNiUl3ReNnCWKsvgjaS
	h7lKgoDuIPBGmMGSJxik0CId9I5G8DbRKuW0ezIbpTTcw4OAkWONi5NT9v9efGTxcX6W
	FXdtqk1CV1svP+E8Z7EUYUcXtOs2uXiiq1I583w0BRFA3Vmj37r5R7irW68L+AcuNgSH
	PckD6EpYrDR33BfuSQroCaaOCITn8AVrzBPLXOmWgtvYOVT5f3QsmW50JwZJzLO+iHm3
	f+TOJhLVRE6lRdz4q2ULEhJlvlLqAjfMUN6AqIZBRMQtVWcvCRHGHUWtTXVMMPSEnskV
	rFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i4x8wbES4jjbhUAI2Hwq01TVfRCrjzP8dfGpjFK1fGI=;
	b=A6CYhQ5poOxdEGHbXqDoY3yprZfvE9Wiw7Na9JxEAPECtkhYVeJX1qVd4GBh4dWge+
	niBVbi1pbghcYcua3t5sQcQZfQf88V3ttHlHGzvpKydEVqIY+olGwDFeYy9kzzA5GtcW
	FWs5GVDhZ+o7UfNxZqkeQU8zMNoyah8NJRzj1JDfrZjNVKeoSLRaJY1TpbWOFHJKb17G
	/1IaNNpzau7QwtwwfRUX2FhlUmVv1xaXqq2jdVX17PWztwEMTad+Tnj0FvbmLcDovTJy
	1U8cWdx0gp19TWbTGx2iu02obqaR9DtGl9P6bimgcJluXQZDhrKevkvJNTULptNFUSTq
	4H3A==
X-Gm-Message-State: APjAAAWh0sHh1Hh48OgWT0Ie45qAGpuUaEd2ihY2gwkF9VzMA+xJEATX
	vEw56k7zH+p/3cqKkyOjRudpQynGc4PEkRV7
X-Google-Smtp-Source: APXvYqx10F9VFDbT9T5aXUZIMnpMjIyXN+wtCkEwImsBMsz0JK3MgPVXJ1MqB+XOozXPP4Wwqlx9Ug==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr4861602wme.133.1581085770719;
	Fri, 07 Feb 2020 06:29:30 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e1sm3619134wrt.84.2020.02.07.06.29.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:29:30 -0800 (PST)
From: Ross Burton <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:29:28 +0000
Message-Id: <20200207142928.13703-1-ross@burtonini.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sudo: specify where target tools are
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
X-List-Received-Date: Fri, 07 Feb 2020 14:29:30 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

sudo uses AC_PATH_PROG to find target paths, which means at best
potential host-contamination (and reproducible issues) and at worst it
thinks sh is at /your/build/path/hosttools/sh.

Solve this by explicitly passing the correct paths to configure.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc       | 2 +-
 meta/recipes-extended/sudo/sudo_1.8.30.bb | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 67815fa8584..3b314dd4a9b 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -26,7 +26,7 @@ PACKAGECONFIG[pam-wheel] = ",,,pam-plugin-wheel"
 
 CONFFILES_${PN} = "${sysconfdir}/sudoers"
 
-EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
+EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 
 EXTRA_OECONF_append_libc-musl = " --disable-hardening "
 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.30.bb b/meta/recipes-extended/sudo/sudo_1.8.30.bb
index 6ea06a90409..9d014d294b3 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.30.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.30.bb
@@ -13,8 +13,15 @@ SRC_URI[sha256sum] = "a35ad3ddc7465703e04190d3ff0b8d78ded9246749becf9a014dcb9c31
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
+CACHED_CONFIGUREVARS = " \
+        ac_cv_type_rsize_t=no \
+        ac_cv_path_MVPROG=${base_bindir}/mv \
+        ac_cv_path_BSHELLPROG=${base_bindir}/sh \
+        ac_cv_path_SENDMAILPROG=${sbindir}/sendmail \
+        ac_cv_path_VIPROG=${base_bindir}/vi \
+        "
+
 EXTRA_OECONF += " \
-             ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
              --with-vardir=/var/lib/sudo \
-- 
2.20.1


