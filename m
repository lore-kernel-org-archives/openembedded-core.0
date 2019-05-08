Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id A71567DE64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 15:57:49 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id f7so17576099wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+WG6++7RkWrgWwQnhFHxY3u+cDzYuWtEI1bhf51lrbE=;
	b=pHoWcQGl2XJDKaYLnTOXaK71c+REdgxBljc5g4zHCVq7ERqHw6e6R8+YmtEP1MgL1k
	jVWU1gehKRV6OkiT7EqPRLXGcV7iyexnFnN0AKdf9pfGXaRJuTWxzOPIQeU9MY7zTpkc
	x/DhNmBhdl+9Aqz9/3+gqUl8Gk4/QyVZxyfYahOSuEiUkBwymU/Xbntef55f32bbk/eh
	PCvey07iZsc/ejaaqtlpqaEJjb0akiaf2Kr57NvCPggR609xLBnMoKeIAvkN1MZYG2XO
	FODYR5YFnmw3pWUISiYDc7wSHYdOwsxGCMbCio37TjEl/M+SeDd8LnQ+hKYfx3v/wgL9
	kXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+WG6++7RkWrgWwQnhFHxY3u+cDzYuWtEI1bhf51lrbE=;
	b=Pzy4vxBNn6SGOd1YcSjjpUNBcViSZ2EELwohRMp0skFfHXy8lW9ycVPT7Bew6K2Ylz
	OXrBR4xYtm74O8y8vzHdb/x5hXlv2/InAti17ah0P0CAtQOAHAacuKnfawIr7QYJ+VpI
	G8XfMSi8V/dIp/KmifVQSXgKzyQPlYfNm4ei3tfMRz45+q5cSxOEtHD+wdiWrTpGl7Zw
	OjZv0krtx2AyD9Ym0kfvbtkeV2Vv0eBAXDURKrtqe52CQDtww/c8fLANmpqzAJRdpj9B
	cBikOrB5oYhCAYHPaWE2XWPprLFEa/fTNnCd3Ol+B+KQJFF59B0ypGFEvRx5ZnQiq7bN
	s7Uw==
X-Gm-Message-State: APjAAAUVKszxNqICeQYDVeT8XXu+Izp1pdiQXQOCZjIKxuaAaPPAmoJj
	Hf5mrjEuZXNzN6WipMlCIWLc41D5
X-Google-Smtp-Source: APXvYqw19OTCl4du+Htj5aVl2A+8VInJsQ4iLS1efyxk8OR5g/cC/U0Bqj/IqJ/VW/b6v5iLdrHW/g==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr29330138wrq.122.1557331070242;
	Wed, 08 May 2019 08:57:50 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id m6sm4027175wmc.32.2019.05.08.08.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 08:57:49 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:57:28 +0100
Message-Id: <20190508155728.66729-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508155728.66729-1-alex.kiernan@gmail.com>
References: <20190508155728.66729-1-alex.kiernan@gmail.com>
Subject: [PATCH v2 3/3] systemd: Restore mask and preset targets, fix instance creation
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
X-List-Received-Date: Wed, 08 May 2019 15:57:49 -0000

Ensure that anyone who sets SYSTEMD_AUTO_ENABLE_${PN} = "mask" (or
"preset") retains the previous behaviour. In addition fix "enable" so it
can (again) create instance units out of templates.

Remove over-zealous quoting of SYSTEMD_SERVICE_ESCAPED as it's already
safely escaped (and can be multiple arguments).

Reported-by: Paul Barker <paul@betafive.co.uk>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- restore mask and preset targets, fix instance creation

 meta/classes/systemd.bbclass | 37 +++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 3935685c18cb..d1cb17dc8db3 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -16,18 +16,36 @@ python __anonymous() {
     # from doing any work so that pure-systemd images don't have redundant init
     # files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        d.appendVar("DEPENDS", " systemd-systemctl-native")
+        d.appendVar("PACKAGE_WRITE_DEPS", " systemd-systemctl-native")
         if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
             d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
 if type systemctl >/dev/null 2>/dev/null; then
+	OPTS=""
+
+	if [ -n "$D" ]; then
+		OPTS="--root=$D"
+	fi
+
+	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+			case "${service}" in
+			*@*)
+				systemctl ${OPTS} enable "${service}"
+				;;
+			esac
+		done
+	fi
+
 	if [ -z "$D" ]; then
 		systemctl daemon-reload
-		systemctl preset "${SYSTEMD_SERVICE_ESCAPED}"
+		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
 
 		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-			systemctl --no-block restart "${SYSTEMD_SERVICE_ESCAPED}"
+			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
 		fi
 	fi
 fi
@@ -36,9 +54,9 @@ fi
 systemd_prerm() {
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop "${SYSTEMD_SERVICE_ESCAPED}"
+		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 
-		systemctl disable "${SYSTEMD_SERVICE_ESCAPED}"
+		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
 	fi
 fi
 }
@@ -162,10 +180,7 @@ python systemd_populate_packages() {
                 else:
                     bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
 
-    def systemd_create_presets(pkg):
-        action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
-        if action not in ("enable", "disable"):
-            bb.fatal("SYSTEMD_AUTO_ENABLE_%s '%s' is not 'enable' or 'disable'" % (pkg, action))
+    def systemd_create_presets(pkg, action):
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
@@ -179,7 +194,11 @@ python systemd_populate_packages() {
             systemd_check_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg):
                 systemd_generate_package_scripts(pkg)
-                systemd_create_presets(pkg)
+                action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
+                if action in ("enable", "disable"):
+                    systemd_create_presets(pkg, action)
+                elif action not in ("mask", "preset"):
+                    bb.fatal("SYSTEMD_AUTO_ENABLE_%s '%s' is not 'enable', 'disable', 'mask' or 'preset'" % (pkg, action))
         systemd_check_services()
 }
 
-- 
2.17.1


