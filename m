Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id DACBA614EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:38:10 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m7so1117477pjs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=bw2ux9QKri6L9St7b5Oe+bUo/yrUa0oYe6DUxmi3TiU=;
	b=Uobf3XPWCN9v9Nismds6eWWzOdzQOdr/ebHqtFonwKnTlSpoku5zv2qjedHIDHxZar
	mmy2qVBbPcRYSBvpgn7Px0jEkGQnaLSezGiGknttn/iV1Ftk6dRng5ve1PwqNQzD0/hT
	M3rpJ775je6d8f17hIlQvnsNkgda0fIPCrRZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bw2ux9QKri6L9St7b5Oe+bUo/yrUa0oYe6DUxmi3TiU=;
	b=eh7KMa8McR24TuDeocK2CuR6GMR/cyHJpyU4cjsvUWWbvSSkdMLq9N13qYPNWRkzD7
	k04h0KqzL+3Hf30eZz6OeON57crE0xPmXDug9m74Vrd2zBeRoUvPrQqRe2xiUJ+RddQ3
	1Nfs884Y39j0VB3S1p287d3sqIkSMR4tonab2rU/RrMdp0rdje00PyW1Um4BEFDR5g08
	VMevjHs4tuBxmDTdszYqHTawdHh/6DobbtHQZHeH5+Hy/G0AT5/7uihSpQpNZv1oAynl
	iN9c0iZ8dc9gPADz5CJA9uvTTkxf8P/Y5oTUxZ0pe8PjD5fwkULpyNNyufU+O2WKPHip
	Qzyg==
X-Gm-Message-State: APjAAAWiOFUttk51T88/iXEFHSK/gCUbIetwgE5p8f7DU1wyqnD7VdGi
	MWGuBRk6DSaDUl7qKUqjxEioy8Q47M06CVafXwd1Tkw0HrdrInQPwa0Row9M4+eZveeePYoopLv
	Bfb6TkZJuADUOhbU1c6mrT8x1J0x8ZahZRccObO2eXmHGLg1rr5mhz3xdNmdVWA1b1c6glLyzL6
	V8DYUM88jK4Z/tu5m1HQPqQd/ucFg=
X-Google-Smtp-Source: APXvYqx0Weg3gTX0zzRDrapk08jGDSHWB8GHsOJ3UluOGF8g/OAvquiQQvfqjNl/B6s16jo6ARu0JA==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
	i7mr22825601plt.66.1582072691435; 
	Tue, 18 Feb 2020 16:38:11 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id ep2sm108603pjb.31.2020.02.18.16.38.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:38:10 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 16:38:01 -0800
Message-Id: <20200219003801.15549-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 00:38:11 -0000

Add devlink support to iproute2 recipe.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../iproute2/iproute2.inc                     | 34 +++++++++++++------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index fc31b8444e..8efc0ec589 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -15,12 +15,19 @@ inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc elf"
+PACKAGECONFIG ??= "tipc elf devlink"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
+PACKAGECONFIG[devlink] = ",,libmnl,"
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
-                ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "\
+    CC='${CC}' \
+    KERNEL_INCLUDE=${STAGING_INCDIR} \
+    DOCDIR=${docdir}/iproute2 \
+    SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)} \
+    SBINDIR='${base_sbindir}' \
+    LIBDIR='${libdir}' \
+"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -39,14 +46,18 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc \
-             ${PN}-lnstat \
-             ${PN}-ifstat \
-             ${PN}-genl \
-             ${PN}-rtacct \
-             ${PN}-nstat \
-             ${PN}-ss \
-             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+PACKAGES =+ "\
+    ${PN}-devlink \
+    ${PN}-genl \
+    ${PN}-ifstat \
+    ${PN}-lnstat \
+    ${PN}-nstat \
+    ${PN}-rtacct \
+    ${PN}-ss \
+    ${PN}-tc \
+    ${PN}-tipc \
+"
+
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
@@ -58,6 +69,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
 FILES_${PN}-nstat = "${base_sbindir}/nstat"
 FILES_${PN}-ss = "${base_sbindir}/ss"
 FILES_${PN}-tipc = "${base_sbindir}/tipc"
+FILES_${PN}-devlink = "${base_sbindir}/devlink"
 
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.17.1


