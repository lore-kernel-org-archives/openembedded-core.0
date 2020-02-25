Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC7E60FFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 17:51:14 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p11so80122plq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/e0apBKB/3hN/V41MLcLlxFA0V3GIsKv/+LjNr+eFPs=;
	b=hqlCI/KRkQetU4UjUGQuC4Bbc94JGXfXhEHZ141YmMvxKbPeO3wkU6fn4O31PW0+gd
	jaoBjZJmEuWmH232KiAh0Rh02jZSAneA/lph1O/itFZutjh9LzKHvRwEUq9MlIJyefyC
	1i9mHH1tvu5eR5gurkjp63SsZngtpY8Dxb0mjdFfhp1uKuQWcby/6DKaYdf+8PxgZaP+
	lCQfqLP4UXjeNVRTzFGcMmgYmmeiMe1UOvTVVdAsvf60K4H8PhZhztv/j8lTdPZsUnWW
	VZvcQpyNxnYzB0hShaTB5vPmO6L/BvbN5LCHAAEkPhyVhqYbLPh+/AFSjZKJ0hVUjqf4
	ExVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/e0apBKB/3hN/V41MLcLlxFA0V3GIsKv/+LjNr+eFPs=;
	b=rD6lzhMfk5+pwQv3nBMAbvVGUboFAUbIemVslO4hNTOZ9lIPH45tMBjORKXRD3M9P9
	M75qDdbr8mtk9dzc3BkJ4MpcIbyeI+OWci9HfLydDGTgXDcqj7RpJCwJJphkwrM7c5TA
	NGVUMAbKQGp2c5jvYTSQ1HtFciv8U0YTtLC0w3v5Lg+iZdqjGfy6DqfDv7bVP9Oc2Tjb
	6LKxernV9AVEvCBEtSWiKf3KRBq7hx4B9DTsfObZD/ymkYD0KCtjkLEqoPQxEcm7ImMD
	KURIcm46258xu9NBDes8neHHUDazeU3YVVrXZLwOapgPds5SKpB7Kh7fT13lEVAhk0yh
	gYwg==
X-Gm-Message-State: APjAAAWglTByTzi3XzANhr51DRU+kKGb/AF/8CJAuJW7OYF5eeF30SFg
	3t/yEMlm7XCj4HfoLRAh4UxRvL136EM=
X-Google-Smtp-Source: APXvYqy8I2ybQteI46jnLF5lca2Q1R/UdqDnF0hdXwFfLrZ1rzTEmLdiV5OwAztuGNRu2tMLk7434w==
X-Received: by 2002:a17:90a:c214:: with SMTP id
	e20mr151056pjt.98.1582653074722; 
	Tue, 25 Feb 2020 09:51:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	t11sm4044581pjo.21.2020.02.25.09.51.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 09:51:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 09:51:26 -0800
Message-Id: <20200225175126.3764629-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH V2] layer.conf: Consider shared-mime-info and desktop-file-utils siggen safe
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
X-List-Received-Date: Tue, 25 Feb 2020 17:51:14 -0000
Content-Transfer-Encoding: 8bit

These are added as dependencies by mime class, which could be inherited
along with allarch and dependencies silently go into target specific
recipes and which then can result in sstate hash signature mismatches
when the allarch recipes are reused for another arch

[YOCTO #13805]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 07d9a9e32d..1d159c5fd0 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -44,6 +44,8 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   opkg-utils \
   gstreamer1.0-meta-base \
   ca-certificates \
+  shared-mime-info \
+  desktop-file-utils \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-- 
2.25.1


