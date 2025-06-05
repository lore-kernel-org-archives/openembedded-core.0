Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C71C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:08:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3711.1749118098246903825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 03:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UfK1nkmR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso7211725e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749118096; x=1749722896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSsw6Wtho1Ydqm2BVeONUyghvTnB7lp45Hu6oYG/8po=;
        b=UfK1nkmRJh8r+OYYf+2JK3i5VNMvQldgL79p7LJ4hxOjJ7qzFFcKNXfXr3zABen70m
         N5CjtdfKRuvtfAmQp8n8YyHa/MKznqz6Ol4TNKd9ZtcBq4O9URX5cp2Eul2y3d1mZa+g
         Pj+Pxy2WF0d74+7gm7yZFtk6Pb8qONZ0JEhXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118096; x=1749722896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSsw6Wtho1Ydqm2BVeONUyghvTnB7lp45Hu6oYG/8po=;
        b=fkpViQC5hurprYa0htNGBkAvYRpgrYfAD3hqOaGPALsHY7bdj3+uxSBduh0lMxfH7o
         kIppxyGW3gE7L6NmTqMKTnGu4w/1Glf3XekbsW4tKpNwenqDvw5VORB2/sJ06ck8XCj8
         4vcplWnU5VsE7SExeg/hnShr0lLIvJUZLfw4vqsXX+wIqsf4Yj6p4guehDsfXhEsT6Bo
         ioNqeNf/zMNNv/wTz900m52t5SLlRG7NbD+dk34u+Uc2NKSLN54Q8+be2Fv4xf5fj+3v
         c2oWDbbPdNyVJoQxoNE8aUDEc5hs7c9+luZ40li+k+g/F1PzGJ2EIqY1SCtb1rxQIkq3
         wbjQ==
X-Gm-Message-State: AOJu0YwGhs33vPuJbXohmZ4jpqpd2azVdyEIzkEXTrfADcv1X6OmueCk
	jDYkB0CsyYAAizfWlkdtdszRAs7jbv4cggDiZiNXnFnPmA8WKHQ++g7nxa/NumwDeAcLSO4aAuh
	80gDltmA=
X-Gm-Gg: ASbGncu3wEp4IguXLre31UBe91r1+828adpb9FNS8PVmBlHHaa+/J1yCoLOV1jGvGPi
	VPOVlzE6+DMj/GBZ10igYGFXHtc20fL30q3RxIZaqtip4LnK8VmkyjMOe1SubNnps4zKVqnz4wP
	IgERglstV/4pivIRB/s3UUNh581I433eWddBTsTidH2iavHkYSMCzlISEyO6y81NYQQiXUiyhyG
	rYQwS5NXd3Ed+uTmtOJyXSkkNpMUqnKdCAYzmVSQZvO32V8XM5qkTjevqfweoy9WHmY+T7pQsiA
	2hnYvJfZRBaN6c9YK7rDwd3j5Re75RbAH850bxKEQVGM7lQ0cnH+waod1zYyMLmcJj+o81RAqX4
	szXc=
X-Google-Smtp-Source: AGHT+IELuhvnrraH5CNwKhSqXaYs7iWN5oBK0S7epl+H3nl9uMgndvEziBpm12JmA1KnzHodYx40Jw==
X-Received: by 2002:a05:6000:40e1:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a51d95a465mr5856938f8f.27.1749118095928;
        Thu, 05 Jun 2025 03:08:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:33af:62c:15cc:322e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe758besm24292901f8f.51.2025.06.05.03.08.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:08:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] update-alternatives: Simplfy variable dependency logic
Date: Thu,  5 Jun 2025 11:08:14 +0100
Message-ID: <20250605100814.3973430-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 10:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218000

When looking at bitbake parsing speed issues, I noticed a lot of weird looking
variables from the update-alternatives class. It is possible this was written
before variable dependencies could handle flags. It can handle flags now so
simplfy the code to take advantage of that and avoid the indirection variables.

The win here is a significant reduction in the number of variables, which
in turn significantly reduces the looping bitbake's taskhash calculation code
needs to do.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../update-alternatives.bbclass               | 34 ++++++-------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index b153e1b2973..5f40dc23ea3 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -73,24 +73,6 @@ UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_
 
 PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
 
-def gen_updatealternativesvardeps(d):
-    pkgs = (d.getVar("PACKAGES") or "").split()
-    vars = (d.getVar("UPDALTVARS") or "").split()
-
-    # First compute them for non_pkg versions
-    for v in vars:
-        for flag in sorted((d.getVarFlags(v) or {}).keys()):
-            if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
-                continue
-            d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(v, flag, False)))
-
-    for p in pkgs:
-        for v in vars:
-            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or {}).keys()):
-                if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
-                    continue
-                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s:%s' % (v,p), flag, False)))
-
 def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
         d.appendVar('DEPENDS', ' virtual/${MLPREFIX}update-alternatives')
@@ -112,9 +94,6 @@ python __anonymous() {
     if not update_alternatives_enabled(d):
         return
 
-    # compute special vardeps
-    gen_updatealternativesvardeps(d)
-
     # extend the depends to include virtual/update-alternatives
     ua_extend_depends(d)
 }
@@ -124,13 +103,20 @@ def gen_updatealternativesvars(d):
     pkgs = (d.getVar("PACKAGES") or "").split()
     vars = (d.getVar("UPDALTVARS") or "").split()
 
+    # First compute them for non_pkg versions
     for v in vars:
-        ret.append(v + "_VARDEPS")
+        for flag in sorted((d.getVarFlags(v) or {}).keys()):
+            if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
+                continue
+            ret.append(v + "[" + flag + "]")
 
     for p in pkgs:
         for v in vars:
-            ret.append(v + ":" + p)
-            ret.append(v + "_VARDEPS_" + p)
+            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or {}).keys()):
+                if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
+                    continue
+                ret.append('%s:%s' % (v,p) + "[" + flag + "]")
+
     return " ".join(ret)
 
 # Now the new stuff, we use a custom function to generate the right values

