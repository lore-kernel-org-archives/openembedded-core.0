Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 24E7C772B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:15 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so79727217pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jngrMKdjArFzQ/pkRtV7nHi/kYGXWcF/VY4W1ems8ug=;
	b=UxwVP/p7/wHwOYQVKcrtRzeBxp6UKLEesDryxzC0r5UiQcQ7kqRaQh3uqCxNSLUwH3
	bkXazjz+Zq3OS9HD+WzKHQlx9xhhkt6yl51If06xo+dTU9Kie+KI69ZxkjwoVxLxZAJl
	AzIHfv5UXpWHZ6IUmck9dYdXev/18sHdHAbf+pP5HajmtZRWjCXjr8NuvwekOP/gx9wh
	1fEiqZgdWdjPl+rKPhcnfZpcZHgqCUn5l0Ohm1nXAlipggV7aM6Cww2fjR9lnMhRli/V
	TBj9sO13rxQZB95jfh59//PKRDGdJiqkmcRwhipZAjoxWtE0QtCzm/TNnoucdYzqEFBJ
	eHqQ==
X-Received: by 10.68.219.40 with SMTP id pl8mr26972669pbc.136.1447371675697;
	Thu, 12 Nov 2015 15:41:15 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:14 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:38 -0700
Message-Id: <25235c4c941f0db5e08dbdea09244fb1ed743630.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 7/7] nativesdk-perl: set PERL5LIB based on wrapper path
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rather than relying on OECORE_NATIVE_SYSROOT, we can operate relative to the
wrapper binary location.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/perl/perl_5.22.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 9df8d04..ea0677a 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -244,9 +244,11 @@ do_install() {
         ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
 }
 
+REL_PERLLIB = "${@os.path.relpath('${libdir}', '${bindir}')}/perl"
+
 do_install_append_class-nativesdk () {
         create_wrapper ${D}${bindir}/perl \
-            PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
+            PERL5LIB='$PERL5LIB:`dirname $realpath`/${REL_PERLLIB}/site_perl/${PV}:`dirname $realpath`/${REL_PERLLIB}/vendor_perl/${PV}:`dirname $realpath`/${REL_PERLLIB}/${PV}'
 }
 
 PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
-- 
2.2.1


