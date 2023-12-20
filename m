Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3F8C41535
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:33 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.13141.1703038704316748210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yAS6atxR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9f7af8918so4431550a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038703; x=1703643503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sv9XcYvKxFpqCORI4uNypTNU6QajM1q7A+fOEZUImwg=;
        b=yAS6atxRLzgiM9s6NfrITowBubRPqNJ2UEFUbkjvn9blUMrDXRyx780kyBZLYDb2T7
         GFywftbMPFOfCec8HkB+dHYMmd6B1sUQ6R7JmoAOHbeZgH3FHPcpI7Ge9flxh1jNYbyy
         Y0+BUzWr+IDERkyJt9S3ct9FVhKqqK2airV7CLfdsjBOJMFxBQeKcnp4evoVh6VNj5jS
         Pp+tmefZGlVQeWuNEX3QDun3rHqL4NzXL6M9fit10LR/un5gKlx+gFsTNUox7t9Hz4AZ
         amx053vYeBewlAxpua2yATnwXKKYB2VE9MT8N1S8LRSeaRZkH/nl5P9U9hdyqkTnOnwR
         IVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038703; x=1703643503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv9XcYvKxFpqCORI4uNypTNU6QajM1q7A+fOEZUImwg=;
        b=oTwAc705PVyI5BxLJnjS5V+mLd0XZGWmag7YMz5h3Gh8tNwe8GN9UA3PSQTCaZ5YM7
         PIsM73WBCnxPXBhoIGC8pXvaSLyIBHChROWrh7ni4JtNRVjUfi4hl1zj1u7APik3YWig
         7cIqzRmf+yTx1+AEjK9yZQOIO/cmbWv57LG4pSo1SN3QLP8aoe4/uCpKK30L/cK+2TaU
         smn8jIogO5w/I5QtnC1m2uF4pRAYitJiYzhf9moJrAaKBznP81Gwi9tTfkp5k/NZusnJ
         IcOo6J3LcaKwtyh7EohINUKNzzIjTlc9vAJHzeMUeDe4Vmgyyo8hKHAdu1UcOULiRlXa
         TPqA==
X-Gm-Message-State: AOJu0YwMQdLJJhyseDrp7/mpQnmpOo/GMA5k9Wpb7Bqqic8xg6Eyod35
	2IXICFqU+UsRddKl2BDCKD28RVK+7Tk3QjNet0ExEw==
X-Google-Smtp-Source: AGHT+IHySIec2FVfvbUQmGYekSMvLMfUl0nyEiteFniSruGZqHywQGweb26MeDdZ2yvB4sjtz+s4JA==
X-Received: by 2002:a05:6808:17a6:b0:3b9:de62:3738 with SMTP id bg38-20020a05680817a600b003b9de623738mr24692397oib.26.1703038702882;
        Tue, 19 Dec 2023 18:18:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 9/9] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
Date: Tue, 19 Dec 2023 16:17:59 -1000
Message-Id: <34f2f67055a9a29765629abef28ffa6b66c8ed41.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703038443.git.steve@sakoman.com>
References: <cover.1703038443.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192768

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Building perf without security_flags.inc being included in one's
distro results in the buildpaths warning

WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
package perf contains reference to TMPDIR

because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
that from CFLAGS, but the perf recipe explicitly unsets that.

Now ${SELECTED_OPTIMIZATION} of course contains more than just
${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
adds its own optimization flags (-O6 for odd reasons), so for those
including the -O2 or -Og doesn't change anything. But looking at the
.o.cmd files show that there are some TUs which currently get built
without any -O flag. So for those adding the distro's
SELECTED_OPTIMIZATION seem to be the right thing to do.

(cherry-picked from Oe-Core rev: aa01c9122ef4a2159df503ef6ed25e802277f13a)

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/security_flags.inc | 1 -
 meta/recipes-kernel/perf/perf.bb            | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 2972f05b4e..d97a6edb0f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -69,4 +69,3 @@ SECURITY_LDFLAGS:pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 TARGET_CC_ARCH:append:pn-binutils = " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gcc = " ${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:append:pn-gdb = " ${SELECTED_OPTIMIZATION}"
-TARGET_CC_ARCH:append:pn-perf = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 675acfaf26..a392166e73 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -73,6 +73,15 @@ SPDX_S = "${S}/tools/perf"
 # supported kernel.
 LDFLAGS="-ldl -lutil"
 
+# Perf's build system adds its own optimization flags for most TUs,
+# overriding the flags included here. But for some, perf does not add
+# any -O option, so ensure the distro's chosen optimization gets used
+# for those. Since ${SELECTED_OPTIMIZATION} always includes
+# ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
+# ensures perf is built with appropriate -f*-prefix-map options,
+# avoiding the 'buildpaths' QA warning.
+TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION}"
+
 EXTRA_OEMAKE = '\
     V=1 \
     VF=1 \
-- 
2.34.1


