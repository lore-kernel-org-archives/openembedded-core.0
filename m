Return-Path: <matt@madison.systems>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id E2754606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:17:00 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fi15so17995031pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rp6L4dWRX1mTDG3jUKaUXKSsrJI7t5WriqB8w0gN50U=;
	b=A9WxdBA35XLn3wAaXPAP8xcFQvQ/IyTAmWjUoZ1kdyjHfhB4/J62hjCRXOQCzA2H5t
	kw6bb5XrhhG1CKvFcKq3uj7UcOeEjWgbellBikGEDSfKQbJAznjLQKmKixCFBHsm5QKq
	dORslIUyRnSWXnMu3P+ZGcFZ+SPDlbgjxtLlO5oodATirx28Yrec1J+qddzoB/hFc0/W
	js/B+hhKJmvFR9DxLSsS6dpj8tQm0awjObGAAjCixVmvPsLcLOt4261FIixr/7CnmZaR
	x7SiRToMjBeoTY7mST4hTYrVL7ecb75b68iwvLLrrDfAh9v5xlPdgmv7iRtRt+ZGAleu
	EIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rp6L4dWRX1mTDG3jUKaUXKSsrJI7t5WriqB8w0gN50U=;
	b=bmy1YEJq86xkNT7HUHKuuHF8HiXOtDkgkgdTiRbl7Ib6S1So+TlbbATqbVvKFdaHNB
	dSVl85SR9plE4jTA4lSXrFrLLjkydWcFW3HDxvBw+cB3hsk/lRzkLSQsS1fF2gD33iWi
	OQv9nUDj3eKM2E88u1s7ISB0w7xQmKpBDclGVZouBqZnHAVLSGJ4wE+dSRkrmMOJsxVi
	RmvaSfmYjb1dwEBMKw5i8ELk527KKfmEkRggcKBPUpbkQzJY5Jb3MONndzv1nFvIhPrh
	hLK7Z47i7K7lKE+MTc+ojWpF3gEFee1mOSAVyVDWEL1x3hseBMEmdUM4Gc5Q4Z1v1c9k
	Gumg==
X-Gm-Message-State: ALyK8tL7SvbB24O8MMQzMG9IlT5VpfktcAmqUUugOq3kahLY2meNxP7l4Dp04XFiTBJ5/Q==
X-Received: by 10.67.22.137 with SMTP id hs9mr37354211pad.50.1469017020671;
	Wed, 20 Jul 2016 05:17:00 -0700 (PDT)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id i7sm4508855paf.9.2016.07.20.05.16.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 05:16:59 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 05:16:36 -0700
Message-Id: <1469016996-25783-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] package_deb.bbclass: fix Python 3 error
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
X-List-Received-Date: Wed, 20 Jul 2016 12:17:01 -0000

Don't modify an OrderedDict while walking its keys.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/package_deb.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8f9b09a..6db6933 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -232,7 +232,7 @@ python do_package_deb () {
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
-        for dep in rdepends.keys():
+        for dep in list(rdepends.keys()):
                 if dep == pkg:
                         del rdepends[dep]
                         continue
@@ -240,7 +240,7 @@ python do_package_deb () {
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
-        for dep in rrecommends.keys():
+        for dep in list(rrecommends.keys()):
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
-- 
2.7.4


