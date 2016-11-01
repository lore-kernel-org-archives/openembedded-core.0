Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 543A171A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:06:57 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u144so16081981wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4uhFe3CPr6eXzyZms0cYyK6lPoLTkMcLEic17y5tzc4=;
	b=yMbml7Iu8OZmsnlL01ebWqssIMytXdoLUIMi83PQmh+N7Hq72JxUkJ5wsAKDgZZz05
	65QT/R3U2yGewgYGjKlUD179S3T1Ickqs8ahz7UrbWqfPJS0bph6RYGxI+hopSme+ADM
	tlVCLk+T+Bxqqia+pwLSAL2SevLakHk/iDf0yqnakmX3VImfGol2tyGYhH2cjhCJIQKG
	dzR+aq9hdfWLibIn2tFDrik3v0Qs36hHm2ImACxSg5w3QIQVIVPqYDrIF5rXJPq+PKf+
	SE/YHKLP7s9Gk3Jspo6xhVS7VUk5Q6oNFPaPxSda4fWoNU4sGBNuu047fZPZZM3lI/xy
	N9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4uhFe3CPr6eXzyZms0cYyK6lPoLTkMcLEic17y5tzc4=;
	b=k6NeP6GtiBQao1G5o52ZbhQK60A7mqXkzaI1MTCk2GYSETmNckMtD98Gb7yCUiq3Vp
	FMKjM1LUK6+LICMSEPWF/B+8RNEFA3nGCgac+18V/FEEPSM1z9D2E0Y4A9MPahxWiqlq
	uQyimMgeaCDojMilMbg8xkJV0H1ZZhuZiO5/MA9A5k8yuK5UMdPPIm4zhyXCS1Mina7J
	5ES79TSERCrUOWP5V6LNEbj4tXUf/E1jWJRv7ZXmune3QJubbgVCarZsNaaMiLXpHkjS
	tEC/EM0O7HJ111FZ8vKpEfwAjdP2woCwuNgI5WrT3YJCOvIOxq+J8WOYgU5aB6lQ1WwN
	Jy9A==
X-Gm-Message-State: ABUngvf7luGHB9qgn88cQBffciWPy0SL+LIg5kHbjqGryPzdah0xk5f2bi/pQIFQlUU2YIJF
X-Received: by 10.28.215.6 with SMTP id o6mr1902322wmg.124.1478012818541;
	Tue, 01 Nov 2016 08:06:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c198sm30954467wme.24.2016.11.01.08.06.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 08:06:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 15:06:52 +0000
Message-Id: <1478012813-7913-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] util-linux: add su.1 to update-alternatives
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
X-List-Received-Date: Tue, 01 Nov 2016 15:07:00 -0000

The su binary is handled by alternatives but the man page wasn't, so
installing both util-linux-doc and shadow-doc produces errors.

Also use d.expand() to neaten the code.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c635502..70cba6b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -271,9 +271,11 @@ BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
     if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
-        alt_name = "su"
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.getVar('base_bindir', True), alt_name))
-        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt_name)
+        d.appendVar(d.expand('ALTERNATIVE_${PN}'), ' su')
+        d.appendVar(d.expand('ALTERNATIVE_${PN}-doc'), ' su.1')
+
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su", d.expand('${base_bindir}/su'))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', "su.1", d.expand('${mandir}/man1/su.1'))
 }
 
 python populate_packages_prepend() {
-- 
2.8.1


