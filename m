Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1B9375F17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:46 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so16712936wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mrkc8Vkzx+dJNOBJ6DMYQjEoTkD89IC3fhQKmp5axfY=;
	b=GOxCQ6Q6CT6WH+fHuBCj6NxwOfFGOWN3dZdBtQtdTfK1SY9ZRzb+Vv//CTNBd53wOB
	HqS1BVWKOgi6aHGCcvVS6AdiFT12k4A6aSUPl88EIqKRifVNsbgqfRvUnnQeYoMHrZo1
	AvT0LptIGlGeYYBj0GQo4JvNZzjMGH2ROs9PAUrryh4FhqwArzM/WgJnHBNZIAeBLeFI
	W8SCXCiBvpklmNYjyhqVXQTg1LxhFrtRQjHzosPArrROTR9dvqOHelPksXG/S03FPsTr
	yy6cbm0Rk5xZEcur4g04igoVQ6zk8w0oQtu7Pnn+m1WRH7z4gYFgm80HncZtk78ie04C
	fUkQ==
X-Gm-Message-State: ALoCoQlWljuAficwglXvTWD47zF0m1qfNPOdRbLRGPkzSpzZ4PujBW1o7wV36bIZYUYhJcZmxpLp
X-Received: by 10.194.192.166 with SMTP id hh6mr76750835wjc.127.1436885806319; 
	Tue, 14 Jul 2015 07:56:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:51:03 +0100
Message-Id: <1436885463-4577-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 7/7] guile: Add explicit directories to guile_cross_config
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:49 -0000

guile_cross_config() was using relative paths which mean it depends on exactly
what directory it starts in.  To clarify the code, always use absolute paths.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index d1578e0..621fa0f 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -81,16 +81,16 @@ guile_cross_config() {
 	        # Create guile-config returning target values instead of native values
 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
-			> guile-config.cross
+			> ${B}/guile-config.cross
 	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
 			-e 's:",[ \t]*": . ":' \
 			-e 's:" *}, *\\:"):' \
 			-e 's:^.*cachedir.*$::' \
 			-e '/^  (/p' \
-			< libguile/libpath.h >> guile-config.cross
-	        echo '))' >> guile-config.cross
-	        cat meta/guile-config >> guile-config.cross
-	        install guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
+			< ${B}/libguile/libpath.h >> ${B}/guile-config.cross
+	        echo '))' >> ${B}/guile-config.cross
+	        cat ${B}/meta/guile-config >> ${B}/guile-config.cross
+	        install ${B}/guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
 	fi
 }
 
-- 
2.1.4


