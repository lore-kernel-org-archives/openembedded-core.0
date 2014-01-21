Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCA66E70F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 11:01:34 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4182462wib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 03:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/q46jNw0ZYmPtjJsfSnKcCspruY0zJX1a1QpRDS0Epc=;
	b=NqLb1UQhab3cHS7BroUbue6njeKsXTN19VRoHHmN6ZW6JtPUSQk7RvAEcP6KVnnTaH
	IJIRxx5i52capQH6grJKAnZ6I8sAvLNW/5J+5/Gm3TpZ8+OiKE/Y1qju5wDGkgq2YAre
	xnerPyOXeSxVkalfHNgNAm+msTXRRHIg1eaqUyQgE9y23tKF7/w60nrW6y940y2sk1jt
	0C4TYN9wNtnzByiow+YyDmVSDSXqcFIvfnF32tprtKz13ptXYi09c4C6R14UZfGKZJyv
	uRqDONaDLdzfylCLTngd+uo2oR5KMg339Vlfr+qan+SHc782ZG1xh+I7vGpLXDyqYBL9
	8+3g==
X-Gm-Message-State: ALoCoQkrec4F8z90fU6MNYj59hb3m+ThPqCMc0KqhGzDt+86616lyeRwA2en68wD4hdgUTckQ1xm
X-Received: by 10.194.62.111 with SMTP id x15mr1562312wjr.55.1390302093460;
	Tue, 21 Jan 2014 03:01:33 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id dd3sm7070677wjb.9.2014.01.21.03.01.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 03:01:32 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 12:01:21 +0100
Message-Id: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Tue, 21 Jan 2014 11:01:34 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Apps testing for systemd config get confused when both /usr/lib/systemd and /lib/systemd exist. This fixes (among other things) dracut systemd detections.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 6590235..710624c 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -113,6 +113,12 @@ do_install() {
 
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
+
+	# fix up libdir confusion
+	if [ -d ${D}${libdir}/systemd ] ; then
+		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
+		rm -rf ${D}${libdir}/systemd
+	fi
 }
 
 do_install_ptest () {
-- 
1.8.4.2


