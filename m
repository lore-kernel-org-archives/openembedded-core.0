Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29E3C02196
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.42620.1738416042485961211
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gNymT+rO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283d48so21692445e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738416040; x=1739020840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rc03qZxnuIVup3LM+GhtzQ1uBD+jy+00MZN0POJlBBA=;
        b=gNymT+rOdZygNqxDR59zEN5KYLGJm8eZlJyU7kjYMMgPd+Z0LQ9YXGNmmbwJ3Fh/GL
         k62Ev52naNkRCDGh2poo3bOw8Cd7jyg9j9VK3NX0e97p4mm2yldHkaxOlgfDTWdljLlQ
         vIAzkyXdwdFyAEl6Bo+IM2T3kJDEeNDeNZ7Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738416040; x=1739020840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rc03qZxnuIVup3LM+GhtzQ1uBD+jy+00MZN0POJlBBA=;
        b=Cy36mAdHLsg/TbOW5/2rv75eiE2gz4/ECgRwTRnsphNCI28KPzRGzX50bb44LsFNjF
         Fc0YXrD0X7+PHrNMDGo4oUiVOPVnt+NaM230nDiV9ww5ti7Hkg8OMOnxX8CkUDd95EiY
         DvuaogTNRTnfzDH6PFggQXsmAvB9sPtmmEN4dOF0Hf2Oqp/u067CGmVYtA0Aaptk3jPG
         rQgGZMwkepdDmYuyViLaheWBEmG6hp/ir/kAL18ohoo0fA2CbbjmviFdy+xKBGFWvASQ
         JGJ37PjdNZ4iVwxLLw4vB3Xw/x8nUB0J0LCqaF1DSzUQ8xtlyvdINUXLjaiEq3EphywQ
         aXnA==
X-Gm-Message-State: AOJu0YxncR+AVKGeARFqcc5VIjoe1n9w4N6ABc02mV34E7kmS4eKgn8K
	Bpgk1RRFarW0Gm6ygtvsUHzcYpp+hYL1qJMqFmy0t5Ca5dZN3I2U4/KFxg9Bn8NQqV2JdOBPAKz
	j
X-Gm-Gg: ASbGncs6RlqymsLgWEM7LN9RJYIE7JrSBW06UkxLj+eOalU+z3g9qHaocFIOSXL7pzH
	E+dEX5DzMuYQedD1xFkQnC6a4K0gjOTzqQGHCsdT1cf1vEY4Ms0bEJvbEJZfPCrk4dz8i1B1Rn2
	2Q9ZJ/SK+cUIABLZMyTIZquHR38lRFt2Elg9K6RqlkfVJsQ5OOfSogrwt1FsaDHtjYWFeH296+A
	G5qAlcY9ZX0NsM4vQkwLGiyWLL018wXYQSX7steL+LM3y1ylQCLMM9zrR8aE2+L+6u0MnDmEpS4
	To7lfh9HmeDZ0jcRL7BUYH02GaBQW/IqaKPwxWU6gYBB
X-Google-Smtp-Source: AGHT+IGzj0b7OjfxtWYExTPC1habXsaTIC/2wJyhEUhGT5JC8h9Vaa2t4E9V153kQ4PiOhcOVPUxOA==
X-Received: by 2002:a05:600c:5250:b0:438:ad4d:cf01 with SMTP id 5b1f17b1804b1-438dc3c2393mr140974715e9.7.1738416040253;
        Sat, 01 Feb 2025 05:20:40 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d54e:ac44:1af7:8635])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81d74sm122661355e9.37.2025.02.01.05.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 05:20:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk/context: Improve multilib handling
Date: Sat,  1 Feb 2025 13:20:38 +0000
Message-ID: <20250201132038.3174641-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210508

Rather than hiding the multilib logic in the package tests, move the
multilib setting to the init function of the class so the logic is
clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/context.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 77e6a98f391..d968cfa2be9 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -23,6 +23,13 @@ class OESDKTestContext(OETestContext):
         self.target_pkg_manifest = target_pkg_manifest
         self.host_pkg_manifest = host_pkg_manifest
 
+        # match multilib according to sdk_env
+        self.multilib = ""
+        multilibs = self.td.get('MULTILIB_VARIANTS', '').split()
+        for ml in multilibs:
+            if ml in os.path.basename(self.sdk_env):
+                self.multilib = ml
+
     def _hasPackage(self, manifest, pkg, regex=False):
         if regex:
             # do regex match
@@ -41,13 +48,7 @@ class OESDKTestContext(OETestContext):
 
     def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
-            stripped_sdk_env = os.path.basename(self.sdk_env)
-            if stripped_sdk_env.startswith('environment-setup-'):
-                # match multilib according to sdk_env
-                mls = self.td.get('MULTILIB_VARIANTS', '').split()
-                for ml in mls:
-                    if ('ml'+ml) in stripped_sdk_env:
-                        pkg = ml + '-' + pkg
+            pkg = self.multilib + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):

