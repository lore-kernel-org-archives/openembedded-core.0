Return-Path: <josh@mechbits.com>
Received: from cdptpa-cmomta03.email.rr.com (cdptpa-outbound-snat.email.rr.com
	[107.14.166.229])
	by mail.openembedded.org (Postfix) with ESMTP id 22F527C3A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 14:48:09 +0000 (UTC)
Received: from snapy.mechbits.com ([98.29.227.47]) by cmsmtp with ESMTP
	id rkyGgSsaKZ3EkrkyIg8vk4; Thu, 07 Feb 2019 14:48:10 +0000
Received: from josh by snapy.mechbits.com with local (Exim 4.89)
	(envelope-from <josh@mechbits.com>)
	id 1grkyF-0007K2-VH; Thu, 07 Feb 2019 09:48:08 -0500
From: Joshua DeWeese <josh.deweese@gmail.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 09:48:05 -0500
Message-Id: <20190207144805.28073-1-josh.deweese@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <9a5432388d2f7cc7b3f8ec52814516a53df72b53.camel@linuxfoundation.org>
References: <9a5432388d2f7cc7b3f8ec52814516a53df72b53.camel@linuxfoundation.org>
X-CMAE-Envelope: MS4wfP1ZaQKEztolQZi46khRA1mhk16hcqEjsRR2NVpABHu5QyGBZSwMhhHk1COjt9vRIubBEUAtR0vl1aAnzbD4Ch4ljVBMZNu/ILDp/2j9OTxa9Xvwyd4E
	UVd+7SW44E6g+bBff+JHjHEdeG90PScn2mPBlYN3XyN6oagFQTSepbO+zr9xKqX61EQcGekbTIq0mIRYl8Nsesa2gC2Jmj0veOfG9r6pFOYR6pxX8ZiqKa4R
	RqrMSmchHeHV6lVz97c8fw==
Cc: Joshua DeWeese <jdeweese@hennypenny.com>
Subject: (No subject)
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
X-List-Received-Date: Thu, 07 Feb 2019 14:48:10 -0000

Here it is, updated to work with wpa-supplicant_2.6.bb.

-- >8 --
From 12d39342b00a1ad5536b105e23b9ea732bba5489 Mon Sep 17 00:00:00 2001
From: Joshua DeWeese <jdeweese@hennypenny.com>
Date: Tue, 5 Feb 2019 10:08:37 -0500
Subject: [PATCH] wpa_supplicant: Changed systemd template units

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
 .../wpa-supplicant/wpa-supplicant_2.6.bb           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
new file mode 100644
index 0000000000..a476cf040e
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
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index aa4c4c2da0..c92ed4ab93 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://key-replay-cve-multiple7.patch \
            file://key-replay-cve-multiple8.patch \
            file://wpa_supplicant-CVE-2018-14526.patch \
+           file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
 SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
 SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
-- 
2.11.0


