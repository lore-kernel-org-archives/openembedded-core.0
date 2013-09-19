Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D00AE6C978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 15:03:24 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so7902300wgh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 08:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Br1i4o9grhSLfuWrmNQHL0ADZ+4lYGaJxiS93NCHTdU=;
	b=B9ayHMZAAsBUXYxiOx7rgAYMuxq3+BPU4ydYQczUv9gJjcjfoKO0pG0sIWs7Q2wCg4
	x50N7zOAey32LUygwLZ4kS0fivGhBONXX6qp23VSqFZmoZytQhbUPm2X/tC64U9TGVLx
	qduA78omHW6vEn11C85Urq6uuftQizDxLuJewk5khYV7StJqwE6RIw2evifbrD5V5o5m
	wuA5bvQl++NGL544gKy9CEoydxguKfsV0j9W24QvBpfdDtGZ1c0nY2qUeEuBjyn0nNdg
	7NLqev5gdRKtQ7OTEXDqqoZe8XVyt3eu0a7xvcMCKpZp9rS+cOK79d9pdGeJebIK5uSa
	DkYA==
X-Gm-Message-State: ALoCoQn4AJX8YfCocEGpSsiQ78dctzHde+pAVSKE6PME4n1/M8Q6R0+gHOGDGUIjYuj1D2y8JWQz
X-Received: by 10.180.210.243 with SMTP id mx19mr11850082wic.35.1379603005968; 
	Thu, 19 Sep 2013 08:03:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e5sm19518559wiy.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 08:03:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 16:03:21 +0100
Message-Id: <1379603001-6995-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpam: only use pam_systemd.so if systemd is enabled
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
X-List-Received-Date: Thu, 19 Sep 2013 15:03:25 -0000

So that sysvinit images don't warn on every login only add it to common-session
if systemd is a DISTRO_FEATURE.

[ YOCTO #3805 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pam/libpam/pam.d/common-session |    2 --
 meta/recipes-extended/pam/libpam_1.1.6.bb             |    4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session b/meta/recipes-extended/pam/libpam/pam.d/common-session
index 7fd61fe..a4a551f 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/common-session
+++ b/meta/recipes-extended/pam/libpam/pam.d/common-session
@@ -17,5 +17,3 @@ session	requisite			pam_deny.so
 session	required			pam_permit.so
 # and here are more per-package modules (the "Additional" block)
 session	required	pam_unix.so
-# Register with logind to make screen/tmux/etc work
-session	optional	pam_systemd.so
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 448a67b..f7493c5 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -102,6 +102,10 @@ do_install() {
 
 	# The lsb requires unix_chkpwd has setuid permission
 	chmod 4755 ${D}${sbindir}/unix_chkpwd
+
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
+	fi
 }
 
 python do_pam_sanity () {
-- 
1.7.10.4


