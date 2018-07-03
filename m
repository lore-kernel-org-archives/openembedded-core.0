Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9937889F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:04:17 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 69-v6so2190681wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qR81l8ZnEmAHZVFcVmlJmvsgOjk/1pg1H6lIYyH7SJg=;
	b=woMNV01abe172L9UslsOr5kVUncGmDoQYTb7SyqU70uF7NyaojsaWxIAntGGnj0dKA
	Fd0GXZkVeOA3p9XRJltbVX3Xf7N3x+fxWnQwVmsXOG92PTLb3mnrqV5QIyFvFCRRd/b9
	V6Gqtxntydx9/uxOvT945/E64b/AUnEVdqeIJKv6V7Qw1bj26lkJ/Zmu5zYexGNeDVTv
	qi+ARbZpe505fz0FAHtxxat8cWHEN4DIe8noRs5raHo1gWV4rLGecu/nN/PcDX3AJGSO
	I4ySx7HvZ59XNUw75N9oaM/o3LjxjXLkWN3be/Rx6KI3yzIY3rnoNmyp3vpnfceEP9Ds
	cGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qR81l8ZnEmAHZVFcVmlJmvsgOjk/1pg1H6lIYyH7SJg=;
	b=AOA7ztTBsvXtoVrUxAv1NIhEAbc+DoAthH8sYJu0eWdjv5Gqq2Tg9iiyf2SjW/B6Ht
	M/sLBQhO80WFJB03KjdkhO7qfSBoVfoPp9G1EBchylJnATkUpIARI0xDa0vzzuU6bmFA
	9iUevClshfhwkyUhYBf7y2lUYx1JFCjCrE43unyLN5nbacMFlUr59UeNHeC5avBKuuCW
	azD6LmtEBq+DXT88SPGEQ//Zdz4tnAnX8y6qTKupwZaETXkDPULg4YXbbwKpOHiZbxXL
	g+VpjMarpIRXbs9Q4pK/DGxi+KgONeFk5X+nX59+vn/Tbmd8+DSNj5/igArG8gbAUYNs
	Ra5g==
X-Gm-Message-State: APt69E1xkAmSs0Q2v/esFa72SrvMGzDS77tN6eHXBFGYHIsF0Wgit9TR
	dYiKSP/Oa5B2mo/Lp9WU6CgScJI3
X-Google-Smtp-Source: AAOMgpeKb57EphRj8xhNwNC4QoybAL3VR3A+KorY22NJjBOqHpn/96LZCTqcPdYjpZ56sR3wR/wuzw==
X-Received: by 2002:a1c:9350:: with SMTP id
	v77-v6mr11175799wmd.146.1530623057723; 
	Tue, 03 Jul 2018 06:04:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm1863006wrr.52.2018.07.03.06.04.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:04:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:04:09 +0100
Message-Id: <20180703130412.26102-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] meson: various class improvements
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
X-List-Received-Date: Tue, 03 Jul 2018 13:04:17 -0000

- Ensure that the PACKAGECONFIG arguments are always in EXTRA_OEMESON

- Log the arguments that are being passed in do_configure.

- Do verbose builds so the compile logs are useful for debugging build problems

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e572344bd20..c36b634b43d 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -35,7 +35,7 @@ MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 MESON_HOST_ENDIAN = "bogus-endian"
 MESON_TARGET_ENDIAN = "bogus-endian"
 
-EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
+EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
@@ -85,6 +85,7 @@ EOF
 CONFIGURE_FILES = "meson.build"
 
 meson_do_configure() {
+    bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
         cat ${B}/meson-logs/meson-log.txt
         bbfatal_log meson failed
@@ -118,11 +119,11 @@ meson_do_configure_prepend_class-native() {
 
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
-    ninja ${PARALLEL_MAKE}
+    ninja -v ${PARALLEL_MAKE}
 }
 
 meson_do_install() {
-    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
+    DESTDIR='${D}' ninja -v ${PARALLEL_MAKEINST} install
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.11.0


