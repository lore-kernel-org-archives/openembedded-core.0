Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 488047D39B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 01:59:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id z3so448836pln.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2019 18:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wpQAl3zckDcFP9T8tLrhVkmXNeBt7/sbSnyNxtQwdXo=;
	b=L6dntEuEm43i4VEBoaDKrLWogLXI+csx3i6HmKLuwaF9KOH4VsZn71bFeeV/gQdmco
	EBjqBL9LLqIWq1DYFk2T+p1jROoOoem5Azokq8OA5oJqdqBC21t4r3OEoKaMt8cKWubC
	w8Yb4JTZG7+hwd+twDfrwAJk3jVH4aKM1aNZFpYc0rwFt/lO8O6n2hUnp+ztAZ8CoHTR
	8igsKqpUWkqS4vbVlB7LUBG94eTQ122UKNK+iJsNxgYiQemPFmYiU+uy8hkM3QdGFod7
	BAfypzDu66HDvPlruEzwwyHvxKJ+0O9tFcEzOWNdOJqGRKb86GvMoOYUIUY/NnR5ne8A
	seJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wpQAl3zckDcFP9T8tLrhVkmXNeBt7/sbSnyNxtQwdXo=;
	b=RoVi9M6vrrE+CgAjd1O3Zbx0KVk3jRdUAwhdN+87yxcYDMFfTtVlG0RvVlfnU0/tkM
	kwfZ7IxrKjWMCfji6vznqwPNbVmeA1gl3I/4it4bKV3qv7Hhy427t7dhsSGDR4ojYNkM
	vyFdGB9XbIl67A9PutBWV1SBZ09GoAiHPq66CSavc2JrB07+2YAWMCaCgGwerHGy2uvj
	d6kHURcy0fvsOQYICFRH4DG5iH2XM02ndUUZUWHwYy5lVMAI6FpHHa02gVRG8jfELBvA
	8gHPtSH1exvJufy5w/dFjG+eitQULC0SLj8lKD4k0MP9saT/2rkSdm67uUx82HakERTE
	9GQA==
X-Gm-Message-State: APjAAAXor9zWF0QP/EjriLRu7et4wnsyHTcdKY7oC+6H8l/71GxFF3Mf
	uCMDkMOAZiq6feAoKqOEBl5e0ekBw2U=
X-Google-Smtp-Source: APXvYqz37zdddK9yZWIqpoSraVmTlXDP7HSI7PicLKIMEugbSICZ/aduAb9HhqF6OJ+kskqeurLssg==
X-Received: by 2002:a17:902:ba81:: with SMTP id
	k1mr10768614pls.213.1565575197798; 
	Sun, 11 Aug 2019 18:59:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c12sm13859687pfc.22.2019.08.11.18.59.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 11 Aug 2019 18:59:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Aug 2019 18:59:45 -0700
Message-Id: <20190812015945.40086-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] oeqa/parselogs: grep for exact errors list keywords
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
X-List-Received-Date: Mon, 12 Aug 2019 01:59:57 -0000
Content-Transfer-Encoding: 8bit

Given grep expression looks for error strings regardless of the
semantics and this ends up it flagging things like

***********************
Log: /mnt/a/yoe/build/tmp/work/raspberrypi3_64-yoe-linux-musl/yoe-qt5-wayland-image/1.0-r0/target_logs/weston.log
-----------------------
Central error:                EGL_KHR_create_context_no_error EGL_KHR_fence_sync
***********************

here EGL_KHR_create_context_no_error is an API, therefore the check
should be tightened a bit so explicitly look for error words so such
false positives don't show up

This helps in fixing wrong matches e.g. on rpi3 dmesg have strings like
above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index eb2ebb1958..19c9c52a0a 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -292,7 +292,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd = 'grep '
         grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += error + '|'
+            grepcmd += '\<' + error + '\>' + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
-- 
2.22.0


