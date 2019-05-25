Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2B67E42F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 20:18:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d9so13126183wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z+Fnlp5crmQn88bmWfSIVNfg+jmvZDP9NuYy45zRbAs=;
	b=CEq8cm9ej39q2j6QcK/IUytWEqNgD+asUmpmiKDQtZpTGzkL6w97qSDzMO86adDMWz
	zhtpYKmIrdi/SWtdtxVTrul60usRItqJjM78vmUK2bZEPmLYfbavflV52VhpPWgLfE9w
	GcLTzo+UPBFTm3wf/CFD0cGipvwa7/ltwgWrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z+Fnlp5crmQn88bmWfSIVNfg+jmvZDP9NuYy45zRbAs=;
	b=Q+hG9j/8bATgnTtuz1VoQNTT6GqAcYTTzHhy+4XAMptSIyf2FAYjM79mTWAYFurX2z
	y+BrCBeNfIocWtUDH3kBSI0dweNamwGcCZJatEvJCEIXqFZ5mYI+dHuMNJpKrnErD42+
	BLs/Hs6B/chTSDL27cvzWUyHUwLb5wY3dWrVgjQqk+6JjNkWJzknu/9oZIwhRTwWc4Zu
	HrqgacwVoqO8oxWhQ5MuYkBKfU2vYHlu/9WV7miyNyRZ0Qm9VkAiwIv4CsfEB74xEx0f
	tBv1TMFfNExHJvw4ex1GAfuZ1Njo3km/7mXHuXduvyFm3/HeXsRmu8nQZEDsNGdNSzT+
	ulWg==
X-Gm-Message-State: APjAAAU0iDblattL0PB1RtJY3kaIPZPl2v4UJn9P/ZTKuINlkFBbFg3Q
	TZ/wT0EkACFI8/gV6zBO8UAmeSYuN6Q=
X-Google-Smtp-Source: APXvYqzKL8t2hM1dcA19po2oG6HTE6bfJDj3EZ5sQqCpF6cqKqM6mepLkUEMyXPJSnBn0AS+wQwgdw==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr5158992wrm.147.1558815533943; 
	Sat, 25 May 2019 13:18:53 -0700 (PDT)
Received: from hex.int.rpsys.net ([85.255.236.98])
	by smtp.gmail.com with ESMTPSA id
	k184sm14790956wmk.0.2019.05.25.13.18.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 25 May 2019 13:18:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2019 21:18:50 +0100
Message-Id: <20190525201851.23732-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] layer.conf: Whitelist lttng-tools->lttng-modules dependency
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
X-List-Received-Date: Sat, 25 May 2019 20:18:53 -0000
Content-Transfer-Encoding: 8bit

The API between lttng-tools and lttng-modules is safe, whitelist it as
the dependency fixes tools failures. This needs a hack in the multilib
class as right now there is no way to know if a given recipe is a kernel
module or not. This needs to be revisited.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_global.bbclass | 3 +++
 meta/conf/layer.conf                 | 1 +
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 649cc096b76..19ce1a50915 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -118,6 +118,9 @@ def preferred_ml_updates(d):
             d.renameVar(prov, provexp)
 
     def translate_provide(prefix, prov):
+        # Really need to know if kernel modules class is inherited somehow
+        if prov == "lttng-modules":
+            return prov
         if not prov.startswith("virtual/"):
             return prefix + "-" + prov
         if prov == "virtual/kernel":
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 6590e80700a..5ecb93651e5 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -77,6 +77,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->weston \
   weston-init->kbd \
   connman->xl2tpd \
+  lttng-tools->lttng-modules \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
-- 
2.20.1


