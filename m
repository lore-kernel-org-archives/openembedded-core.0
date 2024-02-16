Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD6C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 00:12:36 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.7779.1708042349522525154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 16:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZK6oVEa3;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: jatedev@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1561234276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708042348; x=1708647148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6POaMK1RCkCCb/Li7a4iDtkT6EECcAuf4vspi+BX0c=;
        b=ZK6oVEa38u6vHT0ST13VoJvmnQ7zRf4oP/MemGEGML8IQBLxnvfS/70dphsl6rPAut
         wawOfvevpvNtV+7zJHsL5pnGxeJeS0UmC92yiAWUEfmPC0vpEIc9gNfBfCkJltk26aoC
         TBoBcTuAS6oOhHoMpCTyL6uQE57r0Aa/be/z4Z0zo0pzJeIicPjgeP6E+6ZTz6rJaM+M
         dT1AW/Z+uM62PhJn+zK7tIdUqI8q/NZH7OHLBt4dRIomAFb8Fe7V5rzXMQeQKfXtwv0u
         SkwSzdL3cJtOx0IOdyRdsjOJ6eUeDIPwBLFw/JZve6mOkHVNuFHt7XzhmgWhwuA3AWEU
         OQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708042348; x=1708647148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6POaMK1RCkCCb/Li7a4iDtkT6EECcAuf4vspi+BX0c=;
        b=JmUVOmvd/tog7M/mfogh8Bgvn2+xfR/js/EO0AwuHCDWNlO1KROhvfRrlaOd1O6jv7
         RIHglgv3EJRyLW/RTEISrpV/9VykdMayvI5+RpYzVBAkhUOn/0mhVYimQjjOMCyMFKnA
         AdtoWH1b47f5zit01SxvZfULQ8zqwWa+r6Xt+rzIelL91yzZFgsi1eE9drL3PnduUCV4
         PjN3i6QWJWgt2bioM2K11zFdjnOuk0nO9iSo8mKTqFbEE7ZtZfsBt5SGmnfgQAMD6TN+
         QhBVxroZPx60HilJoktHVxVf2dZC2Dyj5IXTkl4L401KLuaP/g/9VGbUlAXVCVy487//
         Msyg==
X-Gm-Message-State: AOJu0Yy2kK0pVcJQkbDptwH8nSZX0eL+I0rjz2Hb5FvNyIugZwhB8EaB
	rXXk0yjUHdv7R20tas6ZoLSxLphlZafpv87pr2Ks0j9ZyyzrWLu8m87QPCci
X-Google-Smtp-Source: AGHT+IGd4aSIhUx9qZRgS3MSpFl7yH1VBg6IkdJAHPQNWY1TQIIXavXE4cVlCrs7uD8HRJw2LwSFpw==
X-Received: by 2002:a25:b904:0:b0:dc7:8c3a:4e42 with SMTP id x4-20020a25b904000000b00dc78c3a4e42mr3039946ybj.30.1708042347900;
        Thu, 15 Feb 2024 16:12:27 -0800 (PST)
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id e193-20020a25d3ca000000b00dcd307dc310sm94931ybf.56.2024.02.15.16.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:12:27 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jate Sujjavanich <jatedev@gmail.com>
Subject: [OE-core][dunfell][PATCH 1/1] sstatesig: Allow exclusion of the root directory for do_package
Date: Fri, 16 Feb 2024 00:12:25 +0000
Message-Id: <20240216001225.3744-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 00:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195732

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The package task references WORKDIR at it's top level and we can't
easily make the timestamp for that determnistic due to writes to files
there and in other subdirs. We could try and force it to a specific value
but it is easier to just remove it from the package task, we don't need
it there or care about it in this case.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
(cherry picked from commit 9cceeb906527f90d8dd3aad75aa3a8805e2a1df5)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aeceb100d7..65bb4efe25 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -480,8 +480,10 @@ def OEOuthashBasic(path, sigfile, task, d):
     if "package_write_" in task or task == "package_qa":
         include_owners = False
     include_timestamps = False
+    include_root = True
     if task == "package":
         include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
+        include_root = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
@@ -592,7 +594,8 @@ def OEOuthashBasic(path, sigfile, task, d):
                 update_hash("\n")
 
             # Process this directory and all its child files
-            process(root)
+            if include_root or root != ".":
+                process(root)
             for f in files:
                 if f == 'fixmepath':
                     continue
-- 
2.25.1


