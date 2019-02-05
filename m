Return-Path: <josh@mechbits.com>
Received: from cdptpa-cmomta02.email.rr.com (cdptpa-outbound-snat.email.rr.com
	[107.14.166.227])
	by mail.openembedded.org (Postfix) with ESMTP id A986C7C310
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 16:26:59 +0000 (UTC)
Received: from snapy.mechbits.com ([98.29.227.47]) by cmsmtp with ESMTP
	id r3YngXpZtyuFWr3Yqg8GNR; Tue, 05 Feb 2019 16:27:00 +0000
Received: from josh by snapy.mechbits.com with local (Exim 4.89)
	(envelope-from <josh@mechbits.com>)
	id 1gr3Yn-0006Va-EC; Tue, 05 Feb 2019 11:26:57 -0500
From: Joshua DeWeese <josh.deweese@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 11:26:44 -0500
Message-Id: <20190205162644.24971-1-josh.deweese@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CMAE-Envelope: MS4wfKPUPPC1ccTbxoD1p6y/TgzBNRjXhHqno7rZnOY9Ig60uu3hNHmkUKO2wgyywcskg9RyFdqLZGBo1mthSqngjsKDTuIjXFGG/UsCs8rzLVQYHbaarLhH
	7jFBQJO/srV6KHrmzCPwmqbu6AOWkrRLEn3yieGtySvOk9kZOewiLf7hUoyuxU/oZ9fKgQ9h4PKCTfj1/mPZ5kKCJ6VclFvcAuI=
Cc: Joshua DeWeese <jdeweese@hennypenny.com>
Subject: [PATCH] wpa_supplicant: Changed systemd template units
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
X-List-Received-Date: Tue, 05 Feb 2019 16:26:59 -0000

From: Joshua DeWeese <jdeweese@hennypenny.com>

https://www.freedesktop.org/software/systemd/man/systemd.unit.html#WantedBy=

When building root filesystems with any of the wpa_supplicant systemd
template service files enabled (current default is to have them disabled) the
systemd-native-fake script would not process the line:

Alias=multi-user.target.wants/wpa_supplicant@%i.service

appropriately due the the use of "%i."

According to the systemd documentation "WantedBy=foo.service in a service
bar.service is mostly equivalent to Alias=foo.service.wants/bar.service in
the same file." However, this is not really the intended purpose of install
Aliases.

All lines of the form:

Alias=multi-user.target.wants/*%i.service

Were replaced with the following lines:

WantedBy=multi-user.target

Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>
---
 ...place-systemd-install-Alias-with-WantedBy.patch | 52 ++++++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.5.bb           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
new file mode 100644
index 0000000..a476cf0
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
@@ -0,0 +1,52 @@
+From 94c401733a5a3d294cc412671166e6adfb409f53 Mon Sep 17 00:00:00 2001
+From: Joshua DeWeese <jdeweese@hennypenny.com>
+Date: Wed, 30 Jan 2019 16:19:47 -0500
+Subject: [PATCH] replace systemd install Alias with WantedBy
+
+According to the systemd documentation "WantedBy=foo.service in a
+service bar.service is mostly equivalent to
+Alias=foo.service.wants/bar.service in the same file." However,
+this is not really the intended purpose of install Aliases.
+
+Upstream-Status: Submitted [hostap@lists.infradead.org]
+
+Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>
+---
+ wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in | 2 +-
+ wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in   | 2 +-
+ wpa_supplicant/systemd/wpa_supplicant.service.arg.in         | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
+index 03ac507..da69a87 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant-nl80211.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-nl80211-%I.conf -Dnl80211 -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant-nl80211@%i.service
++WantedBy=multi-user.target
+diff --git a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
+index c8a744d..ca3054b 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant-wired.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-wired-%I.conf -Dwired -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant-wired@%i.service
++WantedBy=multi-user.target
+diff --git a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
+index 7788b38..55d2b9c 100644
+--- a/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
++++ b/wpa_supplicant/systemd/wpa_supplicant.service.arg.in
+@@ -12,4 +12,4 @@ Type=simple
+ ExecStart=@BINDIR@/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-%I.conf -i%I
+ 
+ [Install]
+-Alias=multi-user.target.wants/wpa_supplicant@%i.service
++WantedBy=multi-user.target
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index a4160e1..0d97f76 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://0001-Reject-psk-parameter-set-with-invalid-passphrase-cha.patch \
            file://0002-Reject-SET_CRED-commands-with-newline-characters-in-.patch \
            file://0003-Reject-SET-commands-with-newline-characters-in-the-s.patch \
+           file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
 SRC_URI[md5sum] = "96ff75c3a514f1f324560a2376f13110"
 SRC_URI[sha256sum] = "cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"
-- 
2.7.4


