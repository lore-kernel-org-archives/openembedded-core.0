Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F6ACCF2CB
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:24:57 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5942.1792189488922913963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hga6mrci;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afbd2c386so140599f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792189487; x=1792794287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JUq74mhUXwkjAyCIII5NPPS6JvYZmwowB7rTL/aHSbc=;
        b=Hga6mrciRnlppSflIA98Suv2GMPNPPrV2tCWz0tMfTLAWg0O+KTSZu3PcIdsngdqL9
         QhVBN/8NZqWMQQHYliW5Cz1RVzrw8pCUE+dKytF58Dc4p2B2WKajN05W50VVKZ+2GC2p
         XwucxtFWPTTe2vvXEk4VaJOxcOVAQX6X8cdPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189487; x=1792794287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JUq74mhUXwkjAyCIII5NPPS6JvYZmwowB7rTL/aHSbc=;
        b=T84FZ416J3+or3I4gBC+0oGr69/R14ChZHMh58VWcevrKCnmBSLAl4WEB1BLKDiZRY
         fJ+3D9vTw4N+UE02IPBeuHMypCXgcHgk6ewAfFCRqA+DGKoS7+k2GFexeNOZkxHQ4wjb
         Tg7faUaccKDnO5rJmuZ81xGdBZFUVOIF27pll6oSBMvbsvbFIsyjyLHM4+bdzXBmF5X4
         8AUWVBYunPSv6qzsMrJGuaRoNCc71T4ttXSyPGsFTE+x+61PV8Vd4WfLcsBDGtP4aoi3
         Ee3xpnKrlb+jnvjfMIc1x9ltMh4ujUtXN7lE0zkGpxEm290a0ovCFVxowe5WrOzNNjVp
         /tVA==
X-Gm-Message-State: AFq9FYIXysd6jp4U8Tl8jOip35g906ZS1aA8+eCwbW4c/lpohBelMnDd
	UfeBZkygTcuG2ZXF7iYbNNsuaseSp8bovoNHxzR1SluL2afUFBqj4eIfSq/n8JFCfmcVFkwhLfT
	O6WyI/So=
X-Gm-Gg: AYBFou2xk3OqEyRohm2xGZDZErDLt+ekL/Jf3Zhcy8lFecNDD+RwOZwy0I8CZFTsfNH
	XS4WXko1l93p7ZKFK6TVjtuRrmG5J2DGpwc5P91SgJOw97dLy/JWgQh4abxK4I8sBFy71TGm2n7
	LdsDvvRbsBEUJwdITXb8ZqeVpdCgXjHx14XjYYBfVckaFvDVFgwrgYnwFcpSLI8DBj6V2UyWC71
	HFCPiNuqS+exAlCaq98bYjGKum/zime1WWIFtjjpzmHpEDlG0fqulPwTCVfwv7C8B1GGj/GtOb8
	tZmBBi9eUOXf9cJJ8hCHj6JmHRrbtiX2VOnXnmmWZPFjJeF2wi3he8CY0tgqGT1MdPcC0o2hIDu
	7kzVmKQIFZA2cfFUKkwJZytj7A1S8kRR6LQgLfLqtGe1iXVA/LIXbGXmO4hVbS5dF4Cf11WLqBx
	6XfMgqX9uhGjNsFzP0WrsirQG/pHEdqk9CT4EXOAMLj/ZIGbkmJwTk3yb+31KQhZHOa+LMIntAt
	Tw+gCOC2ZoQXiPieqqmp1WzGRB5jKt2qrIYKzutXueUNyNSCO8+X9PQoJuvQc83130/V6kTGQ==
X-Received: by 2002:a5d:56c4:0:b0:487:27f6:a4e9 with SMTP id ffacd0b85a97d-48e07fb9465mr1261400f8f.57.1792189486966;
        Fri, 16 Oct 2026 15:24:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm7639515f8f.46.2026.10.16.15.24.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:24:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 11/17] kea: Upgrade 3.2.0 -> 3.2.1
Date: Sat, 17 Oct 2026 00:24:13 +0200
Message-ID: <0bae05a15b0425ab1201729e6fb9316a6380dd2d.1792189264.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792189264.git.yoann.congal@smile.fr>
References: <cover.1792189264.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248061

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ReleaseNotes: https://gitlab.isc.org/isc-projects/kea/-/wikis/Release-Notes/release-notes-3.2.1

The following summarizes the changes since the previous release:

```
2511.	[bug]		tmark
	Related name change requests (NCRs), are now
	sent by kea-dhcp4 and kea-dhcp6 in a single
	message to kea-dhcp-ddns.  This ensures that
	kea-dhcp-ddns processes them in the order they
	were received.
	(Gitlab #4806, #3005)

2510.	[bug]		tmark
	Modified kea-dhcp-ddns to avoid starting a
	transaction for a request if there is already
	a transaction for the request's FQDN or ip address.
	Prior to this it used the DHCID to guard against
	concurrent work.
	(Gitlab #4805,#4585)

2509.	[func]		tmark
	Modified kea-dhcp4 and kea-dhcp6 to avoid
	scheduling unnecessary DDNS entry removals
	when renewing leases.
	(Gitlab #4804, #4794)

2508.	[bug]		fdupont
	Made lexical analyzers more robust with null characters
	in input, e.g. in server or agent configuration files.
	(Gitlab #4795,#4739)

2507.	[build]		fdupont
	Added OpenSSL 4.0.x support.
	(Gitlab #4756, #4673)

2506.	[bug]		tmark
	Improved handling of special characters
	in values written to memfile lease database.
	(Gitlab #4787, #4393)

2505.	[bug]		razvan, fdupont
	Fixed bugs related to out of bound container access which can
	cause Kea to crash if -D_GLIBCXX_ASSERTIONS flag is used at
	compilation time. This affected perfdhcp, host_cache hook
	library, kea-dhcp4, kea-dhcp6, kea-dhcp-ddns and kea-netconf.
	Thank you to Joseph Bisch (joseph.bisch@gmail.com) for reporting
	this issue.
	(Gitlab #4783,#4741,#4708)

2504.	[bug]		fdupont
	Made parsing of DHCPv6 relayed messages stricter:
	now truncated RELAY-FORW and RELAY-REPLY headers
	cause the whole message to be dropped. Thank you to
	Qifan Zhang from Palo Alto Networks for reporting
	the issue.
	(Gitlab #4752,#4560,#4735)

2503.	[bug]		fdupont
	Set the broadcast flag in DHCPNAK responses to relayed
	DHCPREQUEST queries as required by RFC 2131 4.3.2.
	Thank you to Florian Krieger from Frauscher Sensor Technology
	Group GmbH for reporting the issue.
	(Gitlab #4751,#4424)

2502.	[bug]		razvan,tmark
	Corrected MLM_MYSQL_FETCH_FAILURE to 1 so MySQL
	selectQuery and host lookups detect mysql_stmt_fetch
	errors instead of silently ignoring them.
	(Gitlab #4754,#4658)

2501.	[bug]		fdupont,tmark
	Fixed an issue in debug-level logging of dropped packets
	that could cause the server to crash under heavy load.
	Applies to both kea-dhcp4 and kea-dhcp6.
	(Gitlab #4750,#4755,#4719,#4748)

2500.	[bug]		fdupont,tmark
	Removed spurious DHCP_RECEIVE4_UNKNOWN and
	DHCP_RECEIVE6_UNKNOWN warnings sent for instance
	when a command is received. This bug was introduced
	in 3.2.0 release.
	(Gitlab #4749, #4674)

2499.	[build]		razvan
	The library version numbers have been bumped up for the Kea 3.2.1
	stable release.
	(Gitlab #4811)

2498.	[bug]		tmark
	Improved handling of special characters
	in values written to memfile lease database.
	(Gitlab #4787,#4393)

 - Drop 0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch as change is part of release
 - Refresh the existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac5263766fac6ee9715589a23ab6f5a45428b656)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-qualifiers-to-OpenSSL-X509-pointers.patch | 49 -------------------
 ...se-a-runtime-safe-interpreter-string.patch |  8 +--
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |  2 +-
 ...er_unittest_support.cc-do-not-write-.patch |  2 +-
 .../kea/files/fix-multilib-conflict.patch     |  2 +-
 .../kea/{kea_3.2.0.bb => kea_3.2.1.bb}        |  3 +-
 6 files changed, 8 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch
 rename meta/recipes-connectivity/kea/{kea_3.2.0.bb => kea_3.2.1.bb} (96%)

diff --git a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch b/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch
deleted file mode 100644
index 987890f4ff1..00000000000
--- a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 82d28b1be73bbc00e73e59d0c59c51a1e76519a5 Mon Sep 17 00:00:00 2001
-From: Simo Sorce <simo@redhat.com>
-Date: Mon, 27 Apr 2026 17:49:56 -0400
-Subject: [PATCH] Add const qualifiers to OpenSSL X509 pointers
-
-Added const qualifiers to the X509_NAME and X509_NAME_ENTRY pointers when
-retrieving subject and issuer names from TLS certificates. This ensures const-
-correctness and maintains compatibility with newer OpenSSL versions, which
-return const pointers from these getter functions.
-
-Signed-off-by: Simo Sorce <simo@redhat.com>
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4673]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/lib/asiolink/openssl_tls.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/lib/asiolink/openssl_tls.h b/src/lib/asiolink/openssl_tls.h
-index 57c3323..52a969b 100644
---- a/src/lib/asiolink/openssl_tls.h
-+++ b/src/lib/asiolink/openssl_tls.h
-@@ -175,9 +175,9 @@ public:
-         if (!cert) {
-             return ("");
-         }
--        ::X509_NAME *name = ::X509_get_subject_name(cert);
-+        const ::X509_NAME *name = ::X509_get_subject_name(cert);
-         int loc = ::X509_NAME_get_index_by_NID(name, NID_commonName, -1);
--        ::X509_NAME_ENTRY* ne = ::X509_NAME_get_entry(name, loc);
-+        const ::X509_NAME_ENTRY* ne = ::X509_NAME_get_entry(name, loc);
-         if (!ne) {
-             ::X509_free(cert);
-             return ("");
-@@ -209,9 +209,9 @@ public:
-         if (!cert) {
-             return ("");
-         }
--        ::X509_NAME *name = ::X509_get_issuer_name(cert);
-+        const ::X509_NAME *name = ::X509_get_issuer_name(cert);
-         int loc = ::X509_NAME_get_index_by_NID(name, NID_commonName, -1);
--        ::X509_NAME_ENTRY* ne = ::X509_NAME_get_entry(name, loc);
-+        const ::X509_NAME_ENTRY* ne = ::X509_NAME_get_entry(name, loc);
-         if (!ne) {
-             ::X509_free(cert);
-             return ("");
--- 
-2.53.0
-
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 20a68e5e564..e3ab78525b4 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From 312f5b7e8286c306502bed348fe5da765c20f98d Mon Sep 17 00:00:00 2001
+From 8f832387e2e31683dca5df092c464ad655a417d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -44,10 +44,10 @@ index 5fc5ee9..6485ce2 100644
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
 diff --git a/meson.build b/meson.build
-index f3ef0ea..11a41cf 100644
+index 4e9ce4b..3cd8987 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -648,9 +648,13 @@ link_args = []
+@@ -655,9 +655,13 @@ link_args = []
  # Also, Meson might use it by default, but might not use it on all systems, so lots of variables...
  # EXECUTABLE_RPATH = f'$ORIGIN/../@LIBDIR@'
  # HOOK_RPATH = '$ORIGIN/../..'
@@ -62,7 +62,7 @@ index f3ef0ea..11a41cf 100644
  
  # Add rpaths for NETCONF dependencies.
  if NETCONF_DEP.found()
-@@ -769,7 +773,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
+@@ -776,7 +780,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
  report_conf_data.set('LD_ID', cpp.get_linker_id())
  link_args += get_option('cpp_link_args')
  report_conf_data.set('LD_ARGS', ' '.join(link_args))
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
index beee04e1593..38703edba91 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From 97599e59234b8d79748eb7b1cdd451c91e94152f Mon Sep 17 00:00:00 2001
+From 9389b17972f09a6629d5a5fe5d869df6614c3109 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 22a26f345dd..2a0db44e61b 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 39281b6199b1307b6b70f3163a70ab9ce4f445d0 Mon Sep 17 00:00:00 2001
+From 98e5871081dec4953d7f92992a8167feb4fe8fa1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index c1ac4854254..e78e7792626 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 5180d1866b99125d3353f76151e84644a5791e3d Mon Sep 17 00:00:00 2001
+From 414842987006bf8f1b6e447901360c230966a908 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-connectivity/kea/kea_3.2.1.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_3.2.0.bb
rename to meta/recipes-connectivity/kea/kea_3.2.1.bb
index 38b24eed1f0..3e98e334335 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.1.bb
@@ -19,9 +19,8 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
-           file://0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch \
            "
-SRC_URI[sha256sum] = "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a176a4b8e9aade3df"
+SRC_URI[sha256sum] = "3478220be62b3aa361a2c7f97d5d2989b934f7864e82d4bd17056e1e208b9735"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even python3-dir
 

