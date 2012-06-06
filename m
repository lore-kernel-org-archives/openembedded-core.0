Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ScHtm-0002oF-TX
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:11:51 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Jun 2012 08:01:23 -0700
Received: by mail-wi0-f178.google.com with SMTP id hn6so4202513wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=WL7W5yf9kJCEAUbWMFPQBeKYYGI3mmJb7zunWRMmm6s=;
	b=hYZH9+/vLteh4hqlXoGR2JVhNgMOIWyvqpC8Xmi/a3zDM+3x5E4tbHBIbei2E1UJYz
	55+5+CoPEi8x2PZeFY68yTNWAJ6g0A5Fz/c8fBd+EhqAeALVP78Q3J3Y9bcOzaHG6PdB
	OnMaZbc5xykalPck13FMj3mVulIlUpZ3Gs756umvk+/5Nk7Gpnr4MdJlUP6nu2boGApo
	STBEOOnVz9P29SsEzEKEiMuMIfAuP6oz/u7K6+svDGLIFXIV3Zm0/6cDOarzva9C1DjO
	lEdMr1Jfx/2sBVvpqsPsAE5Lb/nROHRNReQaBqHCaNYkcWaU6tRe1ROpOV++X3StJeHm
	QiCQ==
Received: by 10.216.211.8 with SMTP id v8mr16007754weo.176.1338994883331;
	Wed, 06 Jun 2012 08:01:23 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id db7sm2935212wib.6.2012.06.06.08.01.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:01:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 16:00:42 +0100
Message-Id: <d02fa7c53e5a5d93b738d6ab2147ed54f4e96e3a.1338994282.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1338994282.git.ross.burton@intel.com>
References: <cover.1338994282.git.ross.burton@intel.com>
In-Reply-To: <cover.1338994282.git.ross.burton@intel.com>
References: <cover.1338994282.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnuRtrS4S2PJt/kImCLIup8NB6+9Vo5l7vkxQawfH5TA804MZlGOYCI+xdSjAM1AFTtNk0f
Subject: [PATCH 2/3] connman: Document the ACL-breaking sed
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
X-List-Received-Date: Wed, 06 Jun 2012 15:11:51 -0000

---
 meta/recipes-connectivity/connman/connman.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 58e3f56..4fb7b43 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,6 +53,9 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
+# This allows *everyone* to access ConnMan over DBus, without any access
+# control.  Really the at_console flag should work, which would mean that
+# both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
 }
-- 
1.7.7.6



