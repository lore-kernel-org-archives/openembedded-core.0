Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725D4C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 11:20:24 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.15510.1704280817284785523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 03:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVAvzgvX;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: philip.balister@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-680c7cf2ab3so4994326d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704280815; x=1704885615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+qkHFslO4rE3/lMZBNS6klSmlqLlbZO1U/fwQj09dng=;
        b=HVAvzgvXhuP7hpTu+PgiIh7SUT0nPr0fJn9dUBblRJhPkTl/zQ+wY/qYc5N3UtcSCs
         iTYa8NMIyMShdIUsZmqvQzh1QZ7BBF6kPRtB6l04vAQTSAUQ2gYYKwxGEs2B41BDZFbX
         TjbEtgwwJGlArx2M7QAxkGl3N+43IWJViHDJheKKpsRY/7MelNiNlum0c0rL9cok+Hax
         SHKP4CIW6pD/ifYw5lmxQZ3UtgUr54dMzLxU3XIKauh8ndT+kzpS/JH+Qnqmlle2HfmH
         /O46AXaAp4RJMrrSyTZ62S1XbWBlZ3QvpC3AJMXwwxaN4AeOEi0T09U5WwsrRRg0ldwJ
         U+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704280815; x=1704885615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qkHFslO4rE3/lMZBNS6klSmlqLlbZO1U/fwQj09dng=;
        b=nMShcZzQJSUpBH8RrS6DTjpSAvpWbmxa1xi2uSPOUYYFnYvZ5seh7M3664H3lxWI9b
         i10iQGu+F4ujNBECPtpofO9CAq/7OpWhB3aYiMGi/e5lRc8NFM+hjjg/2UaX7J7CqtDy
         AOiPYCVNzUUIz/WdblIH9r9q/q5CrjWItkC64ZGugOUcdGY/+yxtKhcD+817WGLXjGfu
         NA+jbdFDdeRAdRG02uKoSTmfONhgaE50QYZD94lBpZuEbvdflwkobtf/voYlfmm6fBk2
         zpbws2iroTunqNe1UwniBjZHx5OhLKIQEzLGXIWrOjd1E8wIkD42y90TUaSfIrD1u0pS
         g+sA==
X-Gm-Message-State: AOJu0YyKJvvxYNjDyE1B7Wzopxm+WzrinJclPzAO68sxD1E0fTkzdthV
	D4h9ygH9//6isjFCd4q9ZsV8cEvQ0sU=
X-Google-Smtp-Source: AGHT+IEmpoWjcPoIBGzf3gX/1wN8iplRmDVeBImDgAjHG5ERSNt9iSzYiVEhVyJUWJr01AfX5SlcwA==
X-Received: by 2002:a05:6214:1c8e:b0:680:b44c:1408 with SMTP id ib14-20020a0562141c8e00b00680b44c1408mr5591135qvb.124.1704280815186;
        Wed, 03 Jan 2024 03:20:15 -0800 (PST)
Received: from dublin.hsd1.va.comcast.net ([2601:5c0:c200:483f:d85e:cf85:5150:cedd])
        by smtp.gmail.com with ESMTPSA id br6-20020a05620a460600b00781892499cesm4067612qkb.133.2024.01.03.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:20:14 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [PATCH v2] sanity.bbclass: Check for additional native perl modules.
Date: Wed,  3 Jan 2024 06:20:07 -0500
Message-ID: <20240103112007.209097-1-philip@balister.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 11:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193283

Since we use the build systems native perl, we need to check that all
perl modules required for a build are installed. For a default Fedora 39
install, autoconf-native and libxcrypt both fail to build due to missing
perl modules. After taking careful notes, this commits adds checks for
File::Compare, File::Copy, open, and FindBin.

[YOCTO #14691]

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes-global/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 9b824915f2..1bd74e1935 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -532,7 +532,7 @@ def check_git_version(sanity_data):
 def check_perl_modules(sanity_data):
     import subprocess
     ret = ""
-    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
+    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper", "File::Compare", "File::Copy", "open ':std'", "FindBin" )
     errresult = ''
     for m in modules:
         try:
-- 
2.43.0


