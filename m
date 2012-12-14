Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrd-0001Ai-AF
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:07:49 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:11 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so2723352eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=HkAVTk1tCHIhaJkgMuJYrolhzrpAlxjxuKpI+Qlixy8=;
	b=AbRZLrMjFScbjXDHjouGst/UqJjZQNCVS4Ikmj2OyZx4HtuK0atwvhOe6/99JTYeYQ
	KuHzQyKTPiSA8d7BK28LQx+IYIHI2BVI6Td/H++WFh5UH/L21CJW8d0aQMEUCmkwsD3F
	ZwLgFFGJgTa+rOSNeu1cQWjHk2OPT9Oy66Mo/8+6dth3CPgLQhbkfmswKzZCTAkG5Hzr
	cgTFj9lGEejlFgVjxMFTrycA+dObuAlikKZRHciJR42n+MENohJ1rQNyhDY5+bH1eWYA
	yFoUR1BvMDfVaRbG5eOV4jniz1qo2P2stAuGWVE9AonwxozihifwVxQzkXOM1JZXbghI
	kXHw==
Received: by 10.180.88.70 with SMTP id be6mr3107635wib.14.1355496789930;
	Fri, 14 Dec 2012 06:53:09 -0800 (PST)
Received: by 10.180.88.70 with SMTP id be6mr3107624wib.14.1355496789860;
	Fri, 14 Dec 2012 06:53:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:17 +0000
Message-Id: <1355496684-1498-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmbXDdkYYDCSzCFizbj9kxBF4dmD76YgIrbInsoZYU/EPIXYU3zw66DZ7LdEJlRhaqAswLx++hirAFTmMsbltJajZcfWDH7WQiK+nrSfHL6ouqxlTKfahg1B44sg82slz8G0bi2XJL8tAKDouYlnN4GEa6rqbgp0uFHM27MxGb5KkULp68U/a105Xd6IELX7BfYOvVY
Subject: [PATCH 2/9] apr: fix out-of-tree builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:07:50 -0000
X-List-Received-Date: Fri, 14 Dec 2012 15:07:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 896f79f..b7220e0 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -33,9 +33,8 @@ FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
 do_configure_append() {
-	cd ${S}
-	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' build/libtool.m4
-	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' build/apr_rules.mk
+	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' ${S}/build/libtool.m4
+	sed -i -e 's/LIBTOOL=\(.*\)top_build/LIBTOOL=\1apr_build/' ${S}/build/apr_rules.mk
 }
 
 do_install_append() {
-- 
1.7.10



