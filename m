Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B55D7F37A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:58 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y8so6214748plr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fpvTBlerZZxbQcfY1IDZwlTtsK1RaHlP99HlUZWGd14=;
	b=A8o+VqEbsYPnuUGYwAtszL9NjIxrEX4AIhvD3BhKgcRfcJwvfNCAiCPZ3NrRIGDo9n
	/5RAlrMv9XU0RauVnNcdFZb/8naWe6HtsMIru8M89A1UezHz0uhtThYwUNG0oxHGwFjh
	KcqaqH7MXlNctlbbeqrCvlG2RQEtyTk103yJ31GZKxgEd/gRbNkzdEOmqBd+7LMdc+m8
	sLk4NpmMpzbFnJA2joPx34Q/joYu8eX5oh2BIBY1D/B7xvHlr7OR3FvleFKqwP+nsb8j
	lVChlQj/LoKajdtf+VHMHuL7Rj64+RKEBVpWievbjZvCv42hUdzN+PXdNWc5ay7ekWVM
	o94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fpvTBlerZZxbQcfY1IDZwlTtsK1RaHlP99HlUZWGd14=;
	b=EOJIaGV0BOz5kuzT8sQVnEqeX+V1/Do9Wfn8VIrXeSDfU+yG0Q4CJKkXlkK3MTN9XT
	vPO1rjnUQY4fouSM4WChHTanIPdt3K1kf3pr3DlDv0/OT2r8vuvxSTfiGfbROTGbGhB5
	cHf/A1b9UBx2obbVUrwGvRq8LushFZ4s2sBXQ+T5KSRGbMrh7l3UExIqBZ8M/nnqVSL5
	Qs98O4C1KzdDTOedP/T2dknfbKjznbLR14NbfarxL9FRsWThJdsdMC0GAktfUPcKrgKg
	zV3wqH/4Q9HYdyd2OIh9UQ04YSC611Rl3YBvsSq4eZmz8PhayHrqDVtp0HHlIvVN89Zm
	0FsA==
X-Gm-Message-State: APjAAAU9P2cDsr1Z0A/i35RLhpEsvt1MfsrXphoW/7v2DhaxjA6xtCzM
	49HBi4EXvV9qezl2GDV+rVZIUcm6
X-Google-Smtp-Source: APXvYqz/GpdsXON7RFNChMEzauBUBYe6QU2SuYhfFwZWwvLvh2OfLKnQ/yG9jfR0hkd+uv9KWWKcyA==
X-Received: by 2002:a17:902:4401:: with SMTP id
	k1mr6883635pld.193.1566593580052; 
	Fri, 23 Aug 2019 13:53:00 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:41 -0700
Message-Id: <1566593504-21918-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 10/13] update-rc.d.bbclass: support VIRTUAL-RUNTIME_init_manager == busybox
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
X-List-Received-Date: Fri, 23 Aug 2019 20:53:00 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/update-rc.d.bbclass | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 1366fee..bf86bfa 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -1,6 +1,13 @@
 UPDATERCPN ?= "${PN}"
 
-DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' update-rc.d initscripts', '', d)}"
+def get_target_depends(d):
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        return 'update-rc.d initscripts'
+    if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox':
+        return 'update-rc.d'
+    return ''
+
+DEPENDS_append_class-target = " ${@get_target_depends(d)}"
 
 UPDATERCD = "update-rc.d"
 UPDATERCD_class-cross = ""
@@ -50,7 +57,6 @@ if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 fi
 }
 
-
 def update_rc_after_parse(d):
     if d.getVar('INITSCRIPT_PACKAGES', False) == None:
         if d.getVar('INITSCRIPT_NAME', False) == None:
@@ -62,7 +68,12 @@ python __anonymous() {
     update_rc_after_parse(d)
 }
 
-PACKAGESPLITFUNCS_prepend = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'populate_packages_updatercd ', '', d)}"
+def get_packagesplit_funcs(d):
+    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox':
+        return 'populate_packages_updatercd'
+    return ''
+
+PACKAGESPLITFUNCS_prepend = "${@get_packagesplit_funcs(d)} "
 PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
 
 populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_postinst"
-- 
1.9.1


