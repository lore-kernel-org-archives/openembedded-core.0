Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJEs-00019n-KG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:38:22 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:27:36 -0700
Received: by wgbdr13 with SMTP id dr13so5054529wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=USB29GSg+ON8qqgg+juVmgtwMqljtQ04j/BLZI0Et64=;
	b=ZyHVuM+UTEhoW4YCsJcqcf0o8CJDTNtlV3tppKgxTsOebvp8lperoV/LW0gOf7uFM6
	t6epiYFVDWXTajqnO6Fxr46ao682AWw+rPc/oQDIPjNqM9rbYuxj8PtTqAEB6hZAoTr7
	iOtRdoIlC00LtFy/vWwmpBZkDANvHGGBG+SRXSFkbqBlDb5kLMbuFBw5rtRSlL03tf7I
	fESh11gQDUhJxiMmQtHf7oKD3XfFCdKo9WmRmHHidsXNuLzjRc+RoSe2hhNcAY1wu9QV
	hKBq5RsP4x4yJIxuu0PFsPQtT2OxJd6Fk8OsqjZbGkCb50GtT9ubOvzvszChk5lD/WLU
	7lgA==
Received: by 10.180.78.197 with SMTP id d5mr11373128wix.7.1340191655016;
	Wed, 20 Jun 2012 04:27:35 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fo7sm38528660wib.9.2012.06.20.04.27.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:27:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:27:19 +0100
Message-Id: <ab2ff667b79be4f69d9b2d5f56f43b0ce4a10c08.1340191527.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
	<715f2b8f8d165641f28a3eceea55570491e2f9b5.1340191527.git.ross.burton@intel.com>
In-Reply-To: <cover.1340191527.git.ross.burton@intel.com>
References: <cover.1340191527.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl/IHpSZHGg47TnAm3gETTEmlZE8JuMpqLTpUrcoTeyCLtnUjAR7+u2mHnf/cq3eR8E1H5w
Subject: [PATCH 2/6] connman: add compat RPROVIDES for older packaging
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
X-List-Received-Date: Wed, 20 Jun 2012 11:38:22 -0000

wifi, bluetooth and 3g used to be plugins so were packaged separately, but not
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 7a10615..7215f25 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -74,13 +74,26 @@ do_install_append() {
 	rmdir ${D}${libdir}/connman/scripts
 }
 
+# These used to be plugins, but now they are core
+RPROVIDES_${PN} = "\
+	connman-plugin-loopback \
+	connman-plugin-ethernet \
+	${@base_contains('DISTRO_FEATURES', 'bluetooth','connman-plugin-bluetooth', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'wifi','connman-plugin-wifi', '', d)} \
+	${@base_contains('DISTRO_FEATURES', '3g','connman-plugin-ofono', '', d)} \
+	"
+
+RDEPENDS_${PN} = "\
+	${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+	${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+	${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
+	"
+
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 python populate_packages_prepend() {
 	depmap = dict( pppd="ppp",
-	               wifi="wpa-supplicant",
-	               bluetooth="bluez4",
-	               ofono="ofono" )
+				 )
 	packages = []
 	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-- 
1.7.7.6



