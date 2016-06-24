Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB42B6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 15:30:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a66so5858474wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 08:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=evOkCkt/Ytcfscp+FU2szDDjJ+qO+n8UAbWFjews7IE=;
	b=earnBB0R7gcWB5BG0RqjNsful4a0xCTHnWq66f7I9oWQWgxJ8LHvrE6yYgaeN9dak+
	cVFhbb/I77qWYf5OwR99I4n9mleqVfsEjhWHPjUHrgL7QwpOQv6KmS0RqjeRLRMIrhv1
	Z5qXEesbAnwJc8/q9ApG2Db3n+6nqkttwkHRtcupIIMxMDE8adaF/T8mdbkCGIZP32J8
	8j5PAzGPjXdujf6UMEnVusHZc59yaewjFahSg7LshG42VCcjYjjQfaxQIAEq2ITcmRKa
	pi9E13Wb7L9VAlLQEsfC4mtP1+qr/duqJjJBCFoxxOoKv49CBnjLp1966JLNeWeVKvx6
	u57A==
X-Gm-Message-State: ALyK8tI/txYJM/MsmxmT4Kd4z9cHR7AcW9y3kuP3gdgFrK470r4wrYmolJ4hEsGNQfKSAg==
X-Received: by 10.28.97.4 with SMTP id v4mr6625465wmb.71.1466782213513;
	Fri, 24 Jun 2016 08:30:13 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	ue1sm5621739wjc.44.2016.06.24.08.30.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 08:30:12 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 16:30:11 +0100
Message-Id: <1466782211-23234-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765671-22371-4-git-send-email-git@andred.net>
References: <1466765671-22371-4-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4 v2] uclibc: re-enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 15:30:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

uClibc-ng swapped the meaning of V=1 and V=2 in 2015 before
the 1.0.3 release.

Before that, V=2 printed the full commands while V=1 printed the
abbreviated versions.

This recipe was never updated to follow the change and we since
see brief build output only.

At the same time, convert V from an environment variable to
a make variable by adding to EXTRA_OEMAKE, so as to be in
line with how things are done in other recipes that use
kbuild.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 71d4bdd..57f87fa 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -52,13 +52,11 @@ EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
                 'HOSTCC=${BUILD_CC}' \
                 'HOST_CFLAGS=${BUILD_CFLAGS}' \
                 'CC=${CC}' \
-                ARCH=${UCLIBC_ARCH}"
+                ARCH=${UCLIBC_ARCH} \
+                V=1"
 
 EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 
-# enable verbose output:
-export V="2"
-
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-- 
2.8.1


