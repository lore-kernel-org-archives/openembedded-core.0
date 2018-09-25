Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFE6793F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3-v6so11597656wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HhvBxcGua8YhMBOocBbKZcQfPn1NXl6QMZFnxLSxJcQ=;
	b=uQMR+WJR9q6CHXCuTzAt54kB64yuJH0QG7hhzsbyDBrU5IH24cbdnsNiD6E7JyEM/9
	xaMZYeHgDKF3fSDx7cQWYN8POKDcHyTFU9kSBmgzCBC2OA3aVfw04gno1kimLR+u3XAy
	iqeItTxkhWPX3XcoixUyqj+H3H1QXbj4vG/dUBVJRk9S/HUIk5XwRCWRLPeTe/ix/4/L
	oI6TAbdz+53SV1/xEF6yqnno9W5bFPokzwdBeL02uD7p/F9C5SzNDnv+sD9GB1bxlZPl
	kp2ycqruBAyO37mmrmHiX4PJh0wO22tW386BA2GU1tfWyugW4IbcMjVoFw/H3js79pqB
	YGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HhvBxcGua8YhMBOocBbKZcQfPn1NXl6QMZFnxLSxJcQ=;
	b=VxuZ4ziFzqJ5ACbvpAN4oB1k9qpJNEjh9kmgoxlG3dt+VUi7nHnmE/nOlTdVeIu4v6
	wDDHUOyN0x4V3R4AMuz2Ues8I3nOQgpdp6g7vFAoe3JMYXo2vEb4Xyq2KJ3qcXZpNG5n
	o3xfZUPN5T9tKpRr4qvQLUK48PKGoHrbpL9WpdPI7OjPVkMBa63qKGX/ozy7JC12Jdzv
	VP4JgaMvxDqCW30g9whZIot9B6x1/CzUMBD5av6bm0ausFdY+edaqLzuY/16sFi0B9hJ
	4q199iwjc+2qPRWAZnL83L7+RNcmgxF6XZGAJCvDuJb08Nucd5Kp+JjWVO6k9H/fshd8
	cR5w==
X-Gm-Message-State: ABuFfohg99CbHnBSB/WHGCnkke0b1QfHGzH/IMSBcehMJsD5aius2Dnr
	VWpRXHtLmiZBeVingL/R0hXG7jC36Uk=
X-Google-Smtp-Source: ACcGV63IL3WrPXBxz1wVpG2yu/6ewTWV/8b7L0ZVtWNuP/VW/Molr/UEJMQ4ZZqutZnVCJpwZvJ5Eg==
X-Received: by 2002:adf:e792:: with SMTP id
	n18-v6mr1127667wrm.136.1537883035795; 
	Tue, 25 Sep 2018 06:43:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:45 +0100
Message-Id: <20180925134348.5562-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180925134348.5562-1-ross.burton@intel.com>
References: <20180925134348.5562-1-ross.burton@intel.com>
Subject: [PATCH 3/6] meson: pass correct endian in the cross file
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
X-List-Received-Date: Tue, 25 Sep 2018 13:43:56 -0000

Meson doesn't care for the value of the endian field, but packages may want to
use it and Meson master now validates the value.

Use siteinfo to obtain the endianism and write the correct value.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e3b452786d8..07322cf7865 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,4 +1,4 @@
-inherit python3native
+inherit siteinfo python3native
 
 DEPENDS_append = " meson-native ninja-native"
 
@@ -31,10 +31,6 @@ MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
 MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
 MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 
-# both are required but not used by meson
-MESON_HOST_ENDIAN = "bogus-endian"
-MESON_TARGET_ENDIAN = "bogus-endian"
-
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
@@ -59,6 +55,16 @@ def meson_cpu_family(var, d):
     else:
         return arch
 
+def meson_endian(prefix, d):
+    arch, os = d.getVar(prefix + "_ARCH"), d.getVar(prefix + "_OS")
+    sitedata = siteinfo_data_for_machine(arch, os, d)
+    if "endian-little" in sitedata:
+        return "little"
+    elif "endian-big" in sitedata:
+        return "big"
+    else:
+        bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
+
 addtask write_config before do_configure
 do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
 do_write_config() {
@@ -86,13 +92,13 @@ gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 system = '${HOST_OS}'
 cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
 cpu = '${HOST_ARCH}'
-endian = '${MESON_HOST_ENDIAN}'
+endian = '${@meson_endian('HOST', d)}'
 
 [target_machine]
 system = '${TARGET_OS}'
 cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
 cpu = '${TARGET_ARCH}'
-endian = '${MESON_TARGET_ENDIAN}'
+endian = '${@meson_endian('TARGET', d)}'
 EOF
 }
 
-- 
2.11.0


