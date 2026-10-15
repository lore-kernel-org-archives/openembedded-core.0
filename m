Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6405CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32818.1792040623802594365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CcLDCFfR;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3878833f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040622; x=1792645422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hQFRKkh6eXDPNGP2NPwcv7QOPQ5daOk1jOJHk79PL6w=;
        b=CcLDCFfRDUC8w2icFXhQZlsdqPRaS+YuQh1GAnptowsqceDXmWKVjxSxJGDGIG/rIC
         DlIjK20uT+bOV1fJiZawK8JkKwJQxOnXtiHYeuiRMNueo3tiHteYWb4l9GL+N2hCstyN
         YojEdPSXbz1oU/aXUcORgkDdkEp4eoo+o2u9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040622; x=1792645422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hQFRKkh6eXDPNGP2NPwcv7QOPQ5daOk1jOJHk79PL6w=;
        b=tzY7YHhH+OTCrawZqXQPu6hteMx3/Gk6tGHFThWH7hx0jSpfn2/NmqEH8De2nWKtoI
         0KnV3aPQ/O435SZ07XUm+4vDSFnEgoMrgWN6pLwhRMaTylrCgVz/qMQ9YKfjfuGVm20O
         DV4o2tKUQFyl/ZHt/vbmfC3EE2ysW84jNa9Q2mHWnXTmz0rk+BPm7m/urHWz+L2O0BRk
         MxenYQQf664kw8WITHvp2607Ec9Q4ql3yqSyd5Ls6H6uvbZFFmK2pKGl/hlvtAASIOpR
         856wkAXUHbJMkEG1LOmnXFkFNdrlwA6w+eVxe1LF/d34V784Bs+giC+33etEihSpAuZy
         BI/Q==
X-Gm-Message-State: AFq9FYITLK69UntddmUlhDih3q9JpTBzZ+KCYmHK0YaIpvjzzZGk9RTo
	cIdR+f6NvDIvKAiEjY3v4mDQaBF2PaFnK4l/1l5s44aYgWZce6slIm+QT4hIWK9+SsRyrb4Z/O4
	zrTnd63c=
X-Gm-Gg: AYBFou0dCpLbh3NP/A05MMEFrWVTeTvMFqgDxQ06IKJ6YgrgeX1/M1eweG7VRuiWts1
	2Dqk3+brhhCuNvRcKKMDcAWJgasS9KxzF+MpFCRhQQtISgTfBUVuEQ/UVP1Nx/ORa14wWlqujeo
	emfClFgU3pWn5uQOVKlYacaXcp0LIlEbpmVLDMhnoyz1gVcGqkCrHyl+MkN8lr+eFEXZADBmFq/
	YEJjQOzaemmIpMIiupYEljxg7rcwBXkbhEeq5vurgaOXOhy7LsqGzNLxcAXpv3Ohm72eqGxzI4d
	s7BP2mWnt4MRAmsxlAIDMvkr/rRLNPBpIjU6xS0jS3OTYNQM2FI21SKVMCfip+QEXanVpGf9fOT
	n2MhodiMTCr4PNnD0dFOm7DKe2fSVlxY2NZzPg1dRzLzwAJqttc3VsKA4gng36lF0++XrjVKxUn
	gNcEEKf8T2auIQl9NE3fSB8K204LGY8NLQcLJBCLa7msu22UlQJUueY7JA+YKzzBOZTFg1I2FoX
	S/HU6KmJM2tmex7Weovc7pIxHkMk7MGqFUy1aLt5vVsBmJnr4fuIyS4LXnG0+zSISh4t5q33Q==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr326531865e9.15.1792040621914;
        Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/55] devtool: standard: fix update-recipe/finish --initial-rev override
Date: Thu, 15 Oct 2026 07:02:31 +0200
Message-ID: <ea008fd0d08e13a408e88f54347aee0f8c23fd9c.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247806

From: Babanpreet Singh <bbnpreetsingh@gmail.com>

Since 900129cbdf ("devtool: add support for git submodules") the
--initial-rev option of update-recipe and finish has been broken: the
parse loop in _get_patchset_revs() deliberately skips the recorded
"# initial_rev ." entry from the workspace bbappend when an override
is passed, but the override value itself is never inserted into the
initial_revs dict. For a recipe without submodules the dict therefore
ends up empty and update-recipe/finish fails in patch mode with:

  ERROR: Unable to find initial revision - please specify it with
  --initial-rev

i.e. passing --initial-rev produces the very error message that
instructs the user to pass --initial-rev. Before 900129cbdf the passed
value simply took precedence over the one recorded in the bbappend.

Seed initial_revs with the override before parsing so the option
behaves as documented again; recorded values are still used for
submodules and for the main repo when no override is given.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62abb60b899e63ea6db5c745f4b1b6af0d4b40f1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e1e519ce5b6..d5313921f2d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1254,6 +1254,10 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     commits = {}
     patches = []
     initial_revs = {}
+    if initial_rev:
+        # A user-specified override applies to the main repo ("."); the
+        # parse loop below leaves it in place of the recorded value
+        initial_revs["."] = initial_rev
     with open(recipe_path, 'r') as f:
         for line in f:
             pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'

