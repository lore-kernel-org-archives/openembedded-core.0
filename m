Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 30F407F4C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 16:16:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o18so3698590wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/dmjJnotcPfFL5pJ9EwnyCmYnNoV1OUTzQINd+jetc4=;
	b=eFx9m7Vdvwg7XbkAM7Y2iJhpTpCwJsIO9pkTl8KmZkC5oNEfYt+HQirWpZSYU70hgS
	79ahDIY0RAhuCi6eC7zxQ6yKP4nXZRhB7PdAszEc8Dk9OaAIR/CU8gb/YVE76eMwMsn2
	dAzJ0Pr2bTMcq08VugIULZRW2BVHSNhFe81Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/dmjJnotcPfFL5pJ9EwnyCmYnNoV1OUTzQINd+jetc4=;
	b=Xxab40Yb1lFMMj1uoXUlfYuB/ajUhBT0suJMjYK880JCwTRwdci8vXhnPNuJHy17Qg
	vllMTo1o+QPdC0emSIHQ592FxggWhu+b+v+f94Zwpuoyce/z5OS+gGOQN5GYVhahyIMh
	VfmevodRXFOqIzFDTbc+3SLQp37mS1IN3S9mO2VvoBgjDmBm4OVWqaFoScB6EkLDdIbI
	iCMlczbIutNumz3wyzcxiRWtbRi46VF6Wr5QhKxF+7ScCb/7cuYGXmuOlzzlNMMt7jRr
	38WULn3TujX/1fp9H47NIx6u1sCPwqWO4ZZoIvJ5/tGmKZQ2wtbjuEBkdRlPr8LIEmII
	+RVw==
X-Gm-Message-State: APjAAAW2ba/3UGP84Ch0CxprUcA9kjEhwf07lUUhEKLg7jsIsZ9Iu67s
	wHYoq0GlN/fbr915VvKPuFJ004AtQb0=
X-Google-Smtp-Source: APXvYqytmlBaldb+IbLz4kejswwWBABppXaMtqUCtLXvw7Ghi1PVx4vvyLdlIPa9gAdtZij/01IBoQ==
X-Received: by 2002:adf:f306:: with SMTP id i6mr3786557wro.196.1570637765523; 
	Wed, 09 Oct 2019 09:16:05 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i11sm3194592wrq.48.2019.10.09.09.16.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 09:16:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 17:16:03 +0100
Message-Id: <20191009161603.11746-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] scripts/gen-lockedsig-cache: Don't list paths which don't exist
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
X-List-Received-Date: Wed, 09 Oct 2019 16:16:05 -0000
Content-Transfer-Encoding: 8bit

This avoids failures seen on the autobuilder when generating eSDKs
and release sstate copies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/gen-lockedsig-cache | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 48cb67112fd..9bfae9d8323 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -24,6 +24,8 @@ def extract_sha(filename):
 # a map from hash to list of file with that hash
 def map_sha_to_files(dir_, prefix, sha_map):
     sstate_prefix_path = dir_ + '/' + prefix + '/'
+    if not os.path.exists(sstate_prefix_path):
+        return
     sstate_files = os.listdir(sstate_prefix_path)
     for f in sstate_files:
         try:
-- 
2.20.1


