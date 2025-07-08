Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FC0C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 22:18:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.548.1752013097992309427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 15:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IF3SnUVr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so2388862f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752013096; x=1752617896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8luITsdRTj3vGHOY8TKVcDISqMh34sb4xQft8ToTfh8=;
        b=IF3SnUVrYvDzEBT0nFMPTD8PBk2Zg6uL45vC3FGHzVVCKjRMFrRTw0pCB2ysd3AEHm
         /Q4dBBBpNX9INjkibV365ifU1oeW8VXWkuZgalvtENek4CZ1bAIBJChasZLDs7j6HBuj
         3mUGvjwBFtk0YrXmm9aF3UNHLJ1DlfqL52J7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752013096; x=1752617896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8luITsdRTj3vGHOY8TKVcDISqMh34sb4xQft8ToTfh8=;
        b=Y9tR60ucyxCpDdnwtKPcgF8l1JkNdYfrQ3VLZNbG54aI+9tptb6tr95c3VsLF/Uh2H
         KN5fZF+xTWHFkQOnwGLGXzB5bE1UGMW32Gti4lEpQWz9C0WUEk96QsQgTsfj0feUjUV4
         0lAw7W4XAO+2JGT2x4m65I5+nSlmg5wmBoPLdG46ow/7Dd2xsFdQdJQF4YwkGkeAGO20
         QH/Zu86Ki8i9ZUzMCG9Z+Tmw6VA2+WH5J8b7z5kxz7KzEIGqb+ChQmA76cdb7h/prYfE
         TBX276FdZKPesXjPyDcnqJMJnuOwi93F9ps7PcaS0wxxs250WaEh8tN7WSdjpYFY8zAy
         rfTg==
X-Gm-Message-State: AOJu0YxIwVEYc8Sadu9hPHzxbcXkGrivy7qF0zWY5QPpjge7QOSSuK/P
	wOWI4nbfB9cv3/Vcory6ijod4AvwIF+LfYxNuLRprSizB3CX2PgdpohJfWT+gsIp9GRinDOXOnE
	leiTe
X-Gm-Gg: ASbGncvo1q4+0JIW1diDUAR6pUbl2agFyvqz4K/gu++LYzcOG2WIH8cvcxzjR2iuHo5
	jg6icAKEMlmRdrSmycGlclekVKBHJ09KrTyOAM2UK0CAnpTIfoPjwQ0ZnCh0TovdleiMOWaad+Z
	y4F46IfNeyUSiUa+ws2BPurmsx5b5+pPG8v1zKOVClg4yQByq7foNqgeBvNOhyIyzBzP4FRBfRY
	5fFdDwUHTmh9JNapQlmKry5d/xQMmnYlUlnEWPKQ3IbPP0E7DgCdoU8CCsSpvBICK5dLoz0RZaR
	QmXxPRbQ0SSXdu1YDh+Bt46aO8SxdpVF8YPfovR+0baxDv+yQbXvV1vG64vkKRsjXDDqx+r9u+Q
	KIW/8BD9De2DDWOQ=
X-Google-Smtp-Source: AGHT+IEtCN32GNX+ltabu/h3jS62V6yC6isfjkmbtpWxv+H0vW7tjtrdNmpllDznZq9JacoUZA+7PA==
X-Received: by 2002:a05:6000:23c5:b0:3a8:3105:1d49 with SMTP id ffacd0b85a97d-3b5dde93507mr3064404f8f.45.1752013095715;
        Tue, 08 Jul 2025 15:18:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:14f0:8cff:fd74:911d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd4dsm13833007f8f.7.2025.07.08.15.18.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 15:18:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Add sanity test for 'bad' gcc installs on ubuntu 24.04
Date: Tue,  8 Jul 2025 23:18:14 +0100
Message-ID: <20250708221814.791307-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 22:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220053

Installing emacs on Ubuntu 24.04 pulls in emacs-gtk which leads to libgcc-14-dev
despite gcc being 13. This breaks libcxx-native and compiler-rt-native builds.
We've tried various ways of addressing this buit they don't work. Instead, detect
this situation and tell the user to either install or remove a package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1044ed9cc69..d875a022db0 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -672,6 +672,8 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
     return testmsg
 
 def check_sanity_version_change(status, d):
+    import glob
+
     # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
     # In other words, these tests run once in a given build directory and then 
     # never again until the sanity version or host distribution id/version changes.
@@ -703,6 +705,11 @@ def check_sanity_version_change(status, d):
     if not check_app_exists('g++', d):
         missing = missing + "C++ Compiler (g++),"
 
+    # installing emacs on Ubuntu 24.04 pulls in emacs-gtk -> libgcc-14-dev despite gcc being 13
+    # this breaks libcxx-native and compiler-rt-native builds so tell the user to fix things
+    if glob.glob("/usr/lib/gcc/*/14/libgcc_s.so") and not glob.glob("/usr/lib/gcc/*/14/libstdc++.so"):
+        status.addresult('libgcc-14-dev is installed and not libstdc++-14-dev which will break clang native compiles. Please remove one or install the other.')
+
     required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES')
 
     for util in required_utilities.split():

