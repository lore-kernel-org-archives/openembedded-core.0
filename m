Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.3394.1609841911668644456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 02:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kwjQ5-0002zr-SW; Tue, 05 Jan 2021 12:18:30 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kwjQ5-000Bri-R5; Tue, 05 Jan 2021 12:18:29 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [dunfell][PATCH] glib-2.0: add patch for CVE-2020-35457
Date: Tue,  5 Jan 2021 12:18:20 +0200
Message-Id: <20210105101820.44432-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: -1.7 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210105101820.44432-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream has disputed CVE-2020-35457 claiming it's not exploitable but
the patch is simple to add.

https://security-tracker.debian.org/tracker/CVE-2020-35457

"https://gitlab.gnome.org/GNOME/glib/-/commit/63c5b62f0a984fac9a9700b12f54fe878e016a5d
https://gitlab.gnome.org/GNOME/glib/-/issues/2197
Upstream position is that it is not realistically a security issue."

For master branch this CVE is not reported by CVE checker:

NOTE: glib-2.0-2.66.4 is not vulnerable to CVE-2020-35457

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 ...econdition-to-avoid-GOptionEntry-lis.patch | 41 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
new file mode 100644
index 0000000000..17dcada613
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
@@ -0,0 +1,41 @@
+From 63c5b62f0a984fac9a9700b12f54fe878e016a5d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <withnall@endlessm.com>
+Date: Wed, 2 Sep 2020 12:38:09 +0100
+Subject: [PATCH] goption: Add a precondition to avoid GOptionEntry list
+ overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the calling code adds more option entries than `G_MAXSIZE` then
+there’ll be an integer overflow. This seems vanishingly unlikely (given
+that all callers use static option entry lists), but add a precondition
+anyway.
+
+Signed-off-by: Philip Withnall <withnall@endlessm.com>
+
+Fixes: #2197
+---
+ glib/goption.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+CVE: CVE-2020-35457
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/63c5b62f0a984fac9a9700b12f54fe878e016a5d]
+Comment: adjusted offset by -5 to fix patch fuzz warning
+
+diff --git a/glib/goption.c b/glib/goption.c
+index 9f5b977c4..bb9093a33 100644
+--- a/glib/goption.c
++++ b/glib/goption.c
+@@ -2417,6 +2417,8 @@ g_option_group_add_entries (GOptionGroup       *group,
+ 
+   for (n_entries = 0; entries[n_entries].long_name != NULL; n_entries++) ;
+ 
++  g_return_if_fail (n_entries <= G_MAXSIZE - group->n_entries);
++
+   group->entries = g_renew (GOptionEntry, group->entries, group->n_entries + n_entries);
+ 
+   /* group->entries could be NULL in the trivial case where we add no
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
index 09d253fbfb..0ad14a0878 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://tzdata-update.patch \
+           file://0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.20.1

