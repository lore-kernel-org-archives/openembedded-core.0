Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id B511365CFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 05:38:01 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so5356620eei.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 22:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zw+hXp+jpssMpi09WBkmSAHD8H7219ZA0Gwf6qjDlO8=;
	b=FvZFzdzNLYBOlVx4IUKnCJ4GGIO7eyVU/RxcI0tI4x3JMY7OTPAmeMHTFop72w92RT
	6ZeUPMI0Vf0hBcIrXiKkaiBFNHmG6uOTbVNUuuM+l3Q+SBfUxQs89Sm+KeyUj4mpvBph
	WflTgqmvPWkzBnVAFFmRIzqtC4+Z7Ycz5LfUDRBbGkI62Ah0R+qDr+We++nRAjdxdlUx
	1e1j/hPupEM9Lv69Vfutvu88gMId1P+mgU0WhWQ3BVIqTUiVAW4mwON7F+faw9jDf76+
	ZsX5ZgjaeZqMXkk6rB64k18GNqFnfqTgoe50WfPtDFZ6w1viv9lGqjhljlsXEVuXIn+P
	1IRw==
X-Gm-Message-State: ALoCoQl0W/Sxwp6k5VBAYluhxL8wO8uN9JjHw/iKDUHDmTMEYBL9zN7hMkU+93540sERdN8jRKCT
X-Received: by 10.15.45.130 with SMTP id b2mr37927439eew.28.1398749881672;
	Mon, 28 Apr 2014 22:38:01 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	a42sm56147538ees.10.2014.04.28.22.38.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 22:38:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 07:37:55 +0200
Message-Id: <1398749875-32207-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1398749875-32207-1-git-send-email-koen@dominion.thruhere.net>
References: <1398749875-32207-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] xinput-calibrator: fix XDG launch
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
X-List-Received-Date: Tue, 29 Apr 2014 05:38:05 -0000

In the move from meta-oe to OE-core XDG based launched was dropped
without noting it in the commit message, so fix that regression.

Gnome-session will now launch the calibrator again.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 3f97e19..f942c55 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -25,7 +25,11 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/X11/Xsession.d/
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
+
+    install -d ${D}${sysconfdir}/xdg/autostart
+    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
 }
 
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput formfactor"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.9.0


