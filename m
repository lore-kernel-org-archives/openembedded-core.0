Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE2E7E3F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=LR3qsqbhWpoFhGGRpGN7/RyByx+vWMlwDW+6Re7OZKs=; 
	b=sNC4OgHGzo57y/zWuDD0NFr6y2VtbaWMOMNIt6XUUzqYi5gIF/b8Q+OMyKxQZxja4jEOGrOtHAOgt/sPJ396bvxZwdvxWgx3RZR/Z0sHhrFW0Y2U5zr2u5HHKNx6q73Dhm7oNL3f8aq0LoRshsmU3TJBBAwgMhPDaOymLQHikczJVaP7q28oiiD7WsiEkmvAXbS1HMU/eqj5t/UJfnnIWDHMuP1XJHJ96bYdoo8KSGlnl5DwscxmlHdJnAUSEPyTK6rXoUFtOR9Sw9G6AtTwQwDpuAxdMMSTR605aJNKi4VP1bJYk5QAIVvjtt/oG1KDdXc+VjH8hNnZrdC5HB9m6g==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=localhost.localdomain) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hWLP6-0003Q1-SO; Thu, 30 May 2019 15:47:37 +0200
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 14:47:02 +0100
Message-Id: <20190530134703.16094-2-philn@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530134703.16094-1-philn@igalia.com>
References: <20190530134703.16094-1-philn@igalia.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] p11-kit: Enable nativesdk and trust-paths option
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
X-List-Received-Date: Thu, 30 May 2019 13:47:36 -0000
Content-Transfer-Encoding: 8bit

This is required before enabling p11-kit support by default in gnutls.

Signed-off-by: Philippe Normand <philn@igalia.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
index 54455da1bb..c4ed7c34f3 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "trust-paths"
 PACKAGECONFIG[trust-paths] = "--with-trust-paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-certificates"
 
 # This recipe does not use the standard gtk-doc m4 macros, and so the ./configure flags
@@ -44,3 +44,5 @@ FILES_${PN} += " \
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP_${PN} = "dev-so"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.20.1


