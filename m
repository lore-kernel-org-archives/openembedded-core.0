Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F8DC00A98
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.57880.1697817135695544203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uw/U7Z1K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c9daca2b85so7750905ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817135; x=1698421935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5syXoWkkevSSOFf+sDs+nIIDJ4xb142zFpS9E3hyZuc=;
        b=uw/U7Z1Kfvktp2r6oQuaWBUs30DZ2gKonmtnqj+mUmACMzQ1H/qGZjwZ0sDjHVRj1l
         nyAfVdYDXHlAZbrnrnRvlgyFq7kQcdfKexEb3YKcrfsubrKPJ1KakbXplbW95I7oG5dt
         CKT20ZKqM4LD4OqsDkT8uttSK91FsoLZHIfg1nnKKyRb+J5PIEyeI5uCJAV9GSYRkw8X
         2fJyEiqWPsqhQzhuu+NkqttWwkQFBAX/eeyldRaIGEzVx6TWupeJQEANSTg3c5yZ8n8+
         9zVPVPU2y+J06/9+MDvVeQ43wUKLEy5+2YJL9GNtvboyl/p0GIAb0yLbaJqcLQ6qqWPQ
         eUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817135; x=1698421935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5syXoWkkevSSOFf+sDs+nIIDJ4xb142zFpS9E3hyZuc=;
        b=iYojtTKNy0I5ncotfGgGHeNqd5ktbU4Mz8H9H5dEz6ZWNFHQNlKoxsZXFaWgwJ9eYB
         T6L4i4NPdAoyanokTcpZIro/hsAnbD6Nsol0sewbteqj9ORYnsd7dWjT5UMJ65/pD51q
         vJXUYbc2GA7N1Ll4tYaR3u2W6kCmFsTdZwCmYoxdHolzob5zhi2eeQUvnTEt6WAkrvL/
         YOhz3aVDcIDLK1EddHikILnDOGFzm955wAXSfh2IJo3Y7O1O9GKXg6MO6HF2I3i45Wsr
         dxQc1/ZMHlrgXQiyypCQxBKsn4jevEGJxeqGrkY/v6MxHuBt6JtwuFHt4UlJy0s2R3mo
         D1lw==
X-Gm-Message-State: AOJu0YwmvCkU147uVdPqUVMoNxPBpTaBYCrXH/TsxT2YTFoHUWZ2dISU
	LV404dHZYRZqmsr4qeJ/++QU4VecLoXf2ctySiQ=
X-Google-Smtp-Source: AGHT+IGxZagZlXfv7DfDNqngVb74gBVCtcPeKt3Zcsk3Werd1Hhsme/J5SDYeifnaiSBRLWIoH52Bg==
X-Received: by 2002:a17:902:da91:b0:1c6:de7:add9 with SMTP id j17-20020a170902da9100b001c60de7add9mr3082076plx.19.1697817134775;
        Fri, 20 Oct 2023 08:52:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/24] oeqa/concurrencytest: Remove invalid buffering option
Date: Fri, 20 Oct 2023 05:51:24 -1000
Message-Id: <bd487f92103acd7e97d7815c8c6e233932f6f1f1.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189567

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix warnings from oe-selftest -j:

/usr/lib/python3.10/os.py:1030: RuntimeWarning: line buffering (buffering=1) isn't supported in binary mode, the default buffer size will be used
  return io.open(fd, mode, buffering, encoding, *args, **kwargs)

Remove the option since it clearly doesn't do much.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b872ee72942951fd464c4c6cb9eadcb9b4749c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 4f77589b00..3ac5a6dd7c 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -263,7 +263,7 @@ def fork_for_tests(concurrency_num, suite):
             ourpid = os.getpid()
             try:
                 newbuilddir = None
-                stream = os.fdopen(c2pwrite, 'wb', 1)
+                stream = os.fdopen(c2pwrite, 'wb')
                 os.close(c2pread)
 
                 (builddir, newbuilddir) = suite.setupfunc("-st-" + str(ourpid), selftestdir, process_suite)
@@ -308,7 +308,7 @@ def fork_for_tests(concurrency_num, suite):
             os._exit(0)
         else:
             os.close(c2pwrite)
-            stream = os.fdopen(c2pread, 'rb', 1)
+            stream = os.fdopen(c2pread, 'rb')
             # Collect stdout/stderr into an io buffer
             output = io.BytesIO()
             testserver = ProtocolTestCase(stream, passthrough=output)
-- 
2.34.1


