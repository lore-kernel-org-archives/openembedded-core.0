Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C68DA7826D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 18:04:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f3so24760445wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=r0NYC/+pcBfmDETBTegoJW67LS9LbDK9wZ++Auzfz5E=;
	b=K8fC4Yndp81tbRbGr0LNSeieFMdaK/rW8rLxrWg1YKPlYlkI6iErTjZsYWtATO4RQL
	ndrXwd0Z8nOPQN9WSay3wD9+y8qmYAa5XC0JZcHZFRtYLVNWtIElqgPsTwCdbJd6Jq/O
	DKJ14IF6YmcgTnQRXXyPLgBZ/uyeMSwDnArVOt7N0ofZomtynjE9QickKYsTaUv0qwVN
	cxPxqVwv4NdvsjlQgYk5DrgbmsKAmZ/mOGVDXo+cZ9U6QveWcy5dumVyD5akr+egI3fF
	KysFPSxrRbXM78HtD1ZA0BBpsGPjfvUGfnZRhRC0/fjLTKnn0zh6c18bTwFZBl9fLvBH
	fWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0NYC/+pcBfmDETBTegoJW67LS9LbDK9wZ++Auzfz5E=;
	b=tBP841ox0TAEUZSZrGzdnrHfISS9k0eaVhPttRNNIOpTEYmMLi7EPd6HA6XkRuGp4i
	jkVrOOfJ5JOAjNZSFv8/9UusBZivCBE6HJol0cSd8D1sKKGCqOW0+q5m+7in33yvjDsk
	W3Jp+XJjMA+SXHbv+rWMUSDKeOTmmY83MfxeANH4NF54hKTa55IoZEMTuaKV1t4g2Sa/
	P0ru2/Dt51lkdMk4XwEiBy/DcEDeicheHkCvRLQltLxBKkeo3vzHatKKnnqOQU85R4DP
	UBZ9zbxOK1pncvN/4eT/bC1qI/HwHq1R8EIh3dHvdYiuDlaQVE2THSaqPQvuT4ZvNpfo
	SlWA==
X-Gm-Message-State: AKwxytdejHNFJ6u+K1BcigETtyBu9bI9wrW09KsQQ9Ufu/kWA5M2NoRW
	+6XPfOtaqdbxMbSm+MuJYYevIbz1
X-Google-Smtp-Source: ACJfBos3E8GO5suVY1Wly9pv7oM6aXObmuxBK0+X2cEWO9vnOlNK5AqtxM8Hj8er2ERX5lzKKIHs3A==
X-Received: by 10.28.27.86 with SMTP id b83mr4146560wmb.148.1516298651419;
	Thu, 18 Jan 2018 10:04:11 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	d10sm7120443wmh.15.2018.01.18.10.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jan 2018 10:04:10 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 18:03:33 +0000
Message-Id: <1516298613-28716-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssh: Disable wtmp when using musl libc
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
X-List-Received-Date: Thu, 18 Jan 2018 18:04:11 -0000

musl doesn't implement wtmp/utmp.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index 9d940d4..a2288df 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -60,6 +60,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --disable-strip \
                 "
 
+# musl doesn't implement wtmp/utmp
+EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.7.4


