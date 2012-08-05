Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70o-0004l8-07
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:18 +0200
Received: by wgbds1 with SMTP id ds1so903173wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Ofa0RM5qyUsnPuYHpmWpSUqZezTika/Qx1hsRBncmnA=;
	b=MjlU21yge/knaxzDiD2TgIwr3eM+ZVJGpgnNJJu0CwzZtsJ8zqj9Y4HZ/GSs47gkIV
	iON6G9G10GlmIxQpA309WxnO05mstYLoxUTk0Lf3E8IGapKvS5VsRwhPufvwJGra1lxE
	66yQy3MrrUGUMzvYPUGcPQDV/Cz1CAsMvISjfaVHwJRR91dBit2sB0Ec+Dp5XoRjpGu5
	pfD+WQ2wnBjMMiHEwQ7DiJIoFnIhfngEd8w+f2zgVUeXfzIpXo+s1Vi5TvFrGLSuwBeR
	tM9oA8xYXHDSpF+/6CpXk6nSWE5b60NB3Y0mS24QPPqInLt1mvdOwAwMUowssUrkrqR2
	5U6Q==
Received: by 10.180.83.106 with SMTP id p10mr12312507wiy.21.1344196174327;
	Sun, 05 Aug 2012 12:49:34 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:33 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:30 +0200
Message-Id: <1344196136-7643-3-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmANONaGCstCt5LKcPcA7EtAiv75pFHZAYo4hENWWPBmh4In7ShBYDH1P1K3yzZGX8SHN7J
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 02/28] alsa-state: use ${sbindir} instead of /usr/sbin for packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 20:01:18 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 83c9faa..a9cc04c 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "0.2.0"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   file://asound.conf \
@@ -46,9 +46,9 @@ FILES_alsa-states = "${localstatedir}/lib/alsa/*.state"
 pkg_postinst_${PN}() {
 	if test -z "$D"
 	then
-		if test -x /usr/sbin/alsactl
+		if test -x ${sbindir}/alsactl
 		then
-			/usr/sbin/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
+			${sbindir}/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
 		# INITSCRIPT_PARAMS changed, so remove the old and
 		# install the new setting.
-- 
1.7.7.6



