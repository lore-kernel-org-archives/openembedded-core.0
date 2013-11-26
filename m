Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7276D2A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 06:27:41 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so7017152pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 22:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/HTZcYzZsYRnptADknK/kkb3Cxu9Ojw8q5K2IDk1tGs=;
	b=D8SeTRfhkD09y2jFwFA4A1qinTSi8dVGZBk/ovyhoyd/HvPZ+pcwaUe6RD77jfO7pY
	VNzLd195RnrU36btxWcmOVloMQc/5SxO9aZycWdl4dCmpN8vx3/tskp+/+HcFxzJJRgN
	cUsuK0QqCbgGTtyAaKyno4jV+IbaDQHNMIOnuQ/kG805zuIsDKIdiYa6c9FkHJ5ZYYZG
	JLm+avoHSUGRFDznq5fwp0shptiaVfxBbHMErQdulkrn31y8bhl0kZmxZLgLgjoVxaEd
	5W0fCk8KdYTeY7vV05n26jCZPCFXLCIfKal7oOrbcl+a9jkP6mgkWdhcgvgMUVq8bpXK
	oO0g==
X-Received: by 10.67.4.136 with SMTP id ce8mr6436668pad.158.1385447260199;
	Mon, 25 Nov 2013 22:27:40 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id
	sd3sm77938326pbb.42.2013.11.25.22.27.37 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Nov 2013 22:27:39 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 17:26:46 +1100
Message-Id: <1385447206-30966-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libav: install libraries to right directory when multilib is enabled
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
X-List-Received-Date: Tue, 26 Nov 2013 06:27:41 -0000

Explicitly set libdir and shlibdir to ${libdir} in EXTRA_OECONF. Otherwise, default library path of ${prefix}/lib is used which is incorrect in a multilib build.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index eefee66..9f82423 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -55,6 +55,8 @@ EXTRA_OECONF = " \
     --sysroot="${STAGING_DIR_TARGET}" \
     --enable-hardcoded-tables \
     ${EXTRA_FFCONF} \
+    --libdir=${libdir} \
+    --shlibdir=${libdir} \
 "
 
 do_configure() {
-- 
1.7.9.5


