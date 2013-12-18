Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A0C7260E65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:21 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so7761844wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ryFqm7qDyvpUdYPG37gOj9cQshpiGpGjtiMGXNGDuvg=;
	b=DQeaqoyYajWeAkpxIgEIERAXYtVqtw32DszUrRbo+qEohkifW/cuSGgdPthS2fBVbb
	UuFwLixkbwlF5dJ5DkF9zl4qHaNYkOtLjEoDsqyfWChon8IFZKWat27wEdaoPP1x7zhT
	7dEV45/UiIGLEESmyWIw6frFaLAaqt8G36p9+NcMdFHs4/+RzXTsYqNJehSI9etWHcQM
	8VVdWz6auc4VTMDKJHF12zTOsOrQ1P9WQ5nrzaAuWYDRFt+M3su4ndalLmoYAQoL7/si
	3QgMj8LGzo7mjPrmjJOXUgnFRgSgcfGDYZH3cX+aS5Ing7SlKYYouxlgToNfIk2cfYr8
	qpng==
X-Gm-Message-State: ALoCoQnLWLaPLlU8O3vpVSXhv39W8fyx9cSoJaPmbh6WGcxTOdpCMzJbBBztpSUukf25TPkdADse
X-Received: by 10.194.2.79 with SMTP id 15mr372558wjs.90.1387383622194;
	Wed, 18 Dec 2013 08:20:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:07 +0000
Message-Id: <1387383607-4005-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
References: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/6] systemd: delete files that end up in /var/volatile
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:22 -0000

${localstatedir}/log/journal is created by tmpfiles.d on boot, and the README
just causes warnings that /var/volatile isn't empty when mounting on top of it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_208.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index c1f8d77..372e73d 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -97,9 +97,6 @@ do_install() {
 	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
 	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
 
-	# Create dir for journal
-	install -d ${D}${localstatedir}/log/journal
-
 	# Create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
@@ -113,6 +110,9 @@ do_install() {
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
 	fi
+
+        # Delete journal README, as log can be symlinked inside volatile.
+        rm -f ${D}/${localstatedir}/log/README
 }
 
 do_install_ptest () {
-- 
1.7.10.4


