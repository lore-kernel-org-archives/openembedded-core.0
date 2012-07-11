Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SozC1-0006Nc-DJ
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 17:51:09 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2012 08:39:55 -0700
Received: by wibhr14 with SMTP id hr14so1017152wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 08:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=79Pzd1cAXQzPDra19YCagMr5xDqfwaC24oeVKE4dm+o=;
	b=H0sipQUcrTkpkVAjOe+JGl34pMVKctp2vK7g7RMM1UePLD/ubdHeSenZktJT104ae/
	8o4YjZvJXf6Fp7yR8TsWN8jSxK9xF3+lHpfSmQw9eL6iGCMPeFGbMmGhbzff8kJCWV71
	mA1sgfV1skq8+2UzGT8m/VO78Ve1PBva00Ikv2VEq6HXrum6eRx5fk2vX10iVnaEqooA
	+nJGA51WzXccgMpRGI9Z5rK1FSZ+ojzL5hNnAM2C6Yk30XwQPHfVQWYNb7A7YZUeuzT8
	RjpCsXovSiewLMjeiQ18/iMbksBWTAkusBJfFUPc32cauIBumcvuq9jGgjWDsoKoZ+QU
	b8EQ==
Received: by 10.180.86.226 with SMTP id s2mr48194191wiz.9.1342021193968;
	Wed, 11 Jul 2012 08:39:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fu8sm34904072wib.5.2012.07.11.08.39.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 08:39:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 16:39:43 +0100
Message-Id: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn53KKa2xDa5Qv+M+xjoKwGN++QnZqwkSwMthr+i0k6wNvfDn3EInrWhJGid8FW3UgrtfSw
Subject: [PATCH] connman: fix build with automake 1.12
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
X-List-Received-Date: Wed, 11 Jul 2012 15:51:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 12378e9..bb6f532 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -72,6 +72,10 @@ do_install_append() {
 
 	# We don't need to package an empty directory
 	rmdir ${D}${libdir}/connman/scripts
+
+	# Automake 1.12 won't install empty directories, but we need the
+	# plugins directory to be present for ownership
+	mkdir -p ${D}${libdir}/connman/plugins
 }
 
 # These used to be plugins, but now they are core
-- 
1.7.10



