Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0860578C2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:07:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c14-v6so2318236wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=XHGbSDlyliysp9HVSrbLT9ppz66lLewksrd5d80b+Io=;
	b=IQYgjPkleCchWKpyJt+4Sv8AclfFFmDknPvA/JtST/URKYxwi0YC8aVV4bawfQFUWW
	HIXr0ufnBUKmBoBCcKgrS//SiEG1vtHMe8uzWMqTrt2EOgr48JiyPgYygbsBUgTmh789
	xjfzZxTlxdb4fD4pylRYVC0nmRUOZ0qYMc/0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XHGbSDlyliysp9HVSrbLT9ppz66lLewksrd5d80b+Io=;
	b=pitHpntdzmmyj35a/0pFWECLlmzeVbqJP549NgoXNQAo97BeUJGc3eV9vb3Eqqp9lG
	89Ki3oC7BF2DHlHRahXc7xZVpskz5oBTGoFNYG6l3hXNDrJjKN+dQIvsfoQ0VzDIzqSj
	oGE/t92CUV0KWPZ6wV9PHhds7YN7nGPu+Udu3zZpQ1x0he2HGBqcB9u/s0IKMZoozaVk
	xZHgVT3zZnP4rzyE33zkrU7cyebwphaQ8XN4rUkiSlgOG30f/iOaXoUlMY1nIbiqv89v
	DjD2yYrr8INw397GR6Rvsg3S/y1blNqYzgvjmajdX1yEgM3s8E/mXRMPSJbvQXTl79GY
	iHPQ==
X-Gm-Message-State: AOUpUlEvo+m5AKJAtAL3SShS/c6m2Xg14gnN4b9P1LnK4VCjsh9Wy8xP
	BeFsHhH0xhorvNw4lkU5t5jtvWw0E9qgzQ==
X-Google-Smtp-Source: AAOMgpcpCZ6qaFj/r1IyH6T0YA/7/jEN/YhwUx/h865hr2oliv9ZWjPFvVWxDjmNDZhL44LlqCnaxw==
X-Received: by 2002:a1c:64c:: with SMTP id 73-v6mr1757507wmg.7.1532617675460; 
	Thu, 26 Jul 2018 08:07:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n14-v6sm1221231wmc.14.2018.07.26.08.07.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 08:07:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 16:07:53 +0100
Message-Id: <20180726150753.2760-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/loader: Ensure invalid test names don't trigger a traceback
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
X-List-Received-Date: Thu, 26 Jul 2018 15:07:55 -0000

oe-selftest -r <invalid test name>

currently triggers a traceback. Ensure this doesn't happen and the user gets a
sensible error message.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 98fc0f696a1..6070bf53105 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -44,6 +44,8 @@ def _built_modules_dict(modules):
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
         m = re.match(r'^(\w+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
+        if not m:
+            continue
 
         module_name, class_name, test_name = m.groups()
 
-- 
2.17.1


