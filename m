Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E39374940
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:14 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id o4so706327iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YF7lbgGDv/TXhZTq+MGmQ328i4fuJkf2DXYUDfx/Q10=;
	b=i2mGCit9jWNoDw2uD9apASDnFLQbtQAg+Jcb4LsjRyWfkKK8Dor4nYvADawzFqxWn2
	uB3ESquTpt1ArW90zCZNZoIkXhVQwknJ2C0EhQMrgmgpddCAwrQwt87tJ7m8vpjXeyJd
	yY790Daqgb9jUEGPLeUXOi6GlHSfT0lp+Jg3AGnMo340e+sTi5xMcMrdx2KtemifktLz
	butLoy6fK/m3f3JJ4fq48VkeuwpVq+kuseocGWNAXkThJsyedegR4vtHPU/c9dWfGfvD
	gx/vUDl9Xbi5nLxPXEDNIQnZxzft/81dvFz4IO+IY7gUPSB4YCKsIfEcs1kR2XgGc7fp
	ipzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YF7lbgGDv/TXhZTq+MGmQ328i4fuJkf2DXYUDfx/Q10=;
	b=bZx2OnWDDfLRu+QXjTIvHU1KJTrO8VjJd8f/w8uLrpyMSuiiOm9o5M6AUmIlMtXIQx
	9PNK+r8QLNEjx4C4IqA1Y6eYWJR6B8O+P2whtr+ftg5EctgnEHiatfbSJhdu1hofeSoh
	mHo0EfcJwt0+awLIL2lqer6tjSaIf+9VgbFeWHUKhw72AkxNiyHHGOEa11uK95iotUpo
	Sb9hsGO/gv9HOmP4fhYzAPYv12RBOafUIDRUaAa7asWX/2G61teSggwvIMQFobSp06Ps
	Qnl2jTn1EcaEZ0lL1g1hskhEzzaSroAyeYgFrjfU4Aqj0SiJfrTuZpP5W3V3r1mE7kdM
	Ug1Q==
X-Gm-Message-State: ALQs6tCJPcfOq7hTLlnM/jCwRhiB2A++hAVpWZ6ecs442NGTE88I+/rQ
	TEcjswHMezmGf+6TovrhHzr0aLi0
X-Google-Smtp-Source: AIpwx49oPnRWUY+DenSWFvQF6YmclSJkecburPkbMk6zPm/TLVF69n3IQ35X4uPGlbRv4do27shDcQ==
X-Received: by 10.107.15.100 with SMTP id x97mr3036731ioi.38.1523413335924;
	Tue, 10 Apr 2018 19:22:15 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:59 -0500
Message-Id: <20180411022200.22277-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 6/7] icecc.bbclass: Improve error reporting
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:15 -0000

Improve reporting when the icecream environment cannot be created by
assigning the flock call a specific error number when the lock fails so
it can be distinguished from environment creation errors.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index aea1095f5fb..1b58d1f5e52 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -366,14 +366,20 @@ set_icecc_env() {
 
         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
-        if flock -n "${ICECC_VERSION}.lock" \
-            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
-        then
+        exit_code=0
+        flock -n -E 10 "${ICECC_VERSION}.lock" \
+            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}" || exit_code=$?
+        if [ "$exit_code" -eq 0 ]; then
+            touch "${ICECC_VERSION}.done"
+        elif [ "$exit_code" -eq "10" ]; then
+            if [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]; then
+                # locking failed so wait for ${ICECC_VERSION}.done to appear
+                bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
+                return
+            fi
+        else
+            bbwarn "Could not create icecc environment: $exit_code"
             touch "${ICECC_VERSION}.done"
-        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
-        then
-            # locking failed so wait for ${ICECC_VERSION}.done to appear
-            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
             return
         fi
     fi
-- 
2.14.3


