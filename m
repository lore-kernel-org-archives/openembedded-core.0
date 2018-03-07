Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF7278A02
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:42:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so22802593wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=1XqJUt7wvD0du6oamcIw5kt7bRQ4I/VZ4sC6dWYiZEk=;
	b=VYWZdivH5JxG/TQbpITe41IC5bbxC/PYY5l39P+KkxXeYIptqDZEzRby0AFX+zRJFS
	ojNHSQ9Q1JFBO92b7iQkfRP7ufqXnzgLxRtOj6HMsVAES356f2y3LWjU5YXP0PE7I4vm
	PoUesOQ2VxpnFqWOqo9yVcKoDmBUeOlgqla+1wS9oES2bgSMWNWsRI/WuBcoO/gLAzQg
	A99zwow8iagSif491JLAuqpikPJvVKDWLq8bLiXvuY2Pj5izmOVEcfosyj092Z/qk0lG
	ETP5D7chVL73KDQI028KJctMvuwl2P/ixO5i2myPjHaUggblWL8EmXD5aiBmmoTupmCL
	jWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1XqJUt7wvD0du6oamcIw5kt7bRQ4I/VZ4sC6dWYiZEk=;
	b=V5BrBtawksHR/q8lL4Fg+WtHSQcxEvsFNedX+EaEFrie3dOWb5dugoWqJg2q1myUJh
	6vhvb5K0bFVHuUKKt2winMcwuWrkHBbYzemyZEjGm5jsMn0rqDPALl4KDtR8DMtGHjDj
	vZq8hzOqyqiootAGhIkj2/bh+QvuwS50WO1shKq1OywHhoUxdmkZjfH9LpbQT9Bd9AFq
	oNt7EyTG4jC/zXwK07medbJoS8mfIvMmlVwwuCMpY/wpHg2X0z91LMzqPI6sbreLB9at
	zCyiuwTGr4/93NRyNsDpCxtuyHJBxuXhjU/DoJSxlbyAnSGrXFZZdZ90pIVwic8vdDUp
	KyZg==
X-Gm-Message-State: AElRT7Eb88AieOcQtatscvyECffdhT46aDQzFCAjXyn5D8JIhnkv73uk
	8n1wa8BJpuyqjKz8+qNupQg/m3RL
X-Google-Smtp-Source: AG47ELvaWKNK38YGrFCai49tss5N4/R1CBXSim3rLBqTxu1W/xcR8tEMjqpVGzeWDin1tOZ2Y+zHyA==
X-Received: by 10.28.136.18 with SMTP id k18mr15465710wmd.111.1520430135729;
	Wed, 07 Mar 2018 05:42:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	10sm26288152wrv.95.2018.03.07.05.42.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 05:42:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2018 13:42:13 +0000
Message-Id: <20180307134213.24763-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk-doc: inherit classes only if gtk-doc is enabled
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
X-List-Received-Date: Wed, 07 Mar 2018 13:42:15 -0000

Respect GTKDOC_ENABLED when inheriting python3native and DEPENDing on
qemu-native, as they're not needed when disabled.

python3native is required as otherwise the host Python is most likely used which
may or may not have python3-six installed (a requirement of gtk-doc).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 5201c7151c6..b8db4280bcd 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -18,27 +18,27 @@ EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'Tru
 EXTRA_OECONF_prepend_class-native = "--disable-gtk-doc "
 EXTRA_OECONF_prepend_class-nativesdk = "--disable-gtk-doc "
 
-DEPENDS_append_class-target = " gtk-doc-native qemu-native"
-
 # Even though gtkdoc is disabled on -native, gtk-doc package is still
 # needed for m4 macros.
-DEPENDS_append_class-native = " gtk-doc-native"
-DEPENDS_append_class-nativesdk = " gtk-doc-native"
+DEPENDS_append = " gtk-doc-native"
 
 # The documentation directory, where the infrastructure will be copied.
 # gtkdocize has a default of "." so to handle out-of-tree builds set this to $S.
 GTKDOC_DOCDIR ?= "${S}"
 
+export STAGING_DIR_HOST
+
+inherit ${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', 'python3native', '')}
+
+inherit pkgconfig qemu
+DEPENDS_append = "${@oe.utils.ifelse(d.getVar('GTKDOC_ENABLED') == 'True', ' qemu-native', '')}"
+
 do_configure_prepend () {
 	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
 }
 
-inherit qemu
-
-export STAGING_DIR_HOST
-
 do_compile_prepend_class-target () {
-
+    if [ ${GTKDOC_ENABLED} = True ]; then
         # Write out a qemu wrapper that will be given to gtkdoc-scangobj so that it
         # can run target helper binaries through that.
         qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
@@ -64,7 +64,5 @@ if [ \$? -ne 0 ]; then
 fi
 EOF
         chmod +x ${B}/gtkdoc-qemuwrapper
+    fi
 }
-
-
-inherit pkgconfig
-- 
2.11.0


