Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.439.1592848932586126899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Mrf4504p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id 72so264835otc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rp8bJHBb84geleakNK/Jb1h+qOi8oh7w1pdluvNZrEM=;
        b=Mrf4504p0XhmQFBz7NNNY2br8GOGI5XjJUxU+ZBWmIfufVFiE/6yGHlQKGOog3YVwE
         OtEqtZ5RQTrCy0BzPkQf9bX9uCmnv+lH/b9LCkHogkrNOJ+ySSEN3CYmSLGk9wE+3jcy
         YadBUnoi7cXTd54j35kl7wXd4QtV1Zcw9URNLdHRd3xWATlEYhL/QxeZKWjS9xKTHxN9
         uL6O9nJUdVHlRxefG9+nyo2FOBo/7q9GJ5TEN7gJDROp9b4aQUOAJkUCp74eELx/2cqW
         aM7YQ/N2osy6gXa6rLTP3j7jTwqyh6wshuIgVHCTOgQN7Z7oTEIjgPlpqRSDmYfDD7In
         TYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rp8bJHBb84geleakNK/Jb1h+qOi8oh7w1pdluvNZrEM=;
        b=mMF6tyYmrxjymgk5RxurUFQUQGE5SCccjDte8W7BiFmYdQjC7YJpJxZLiS1+gwF08W
         4zAzkSdwgyZQU0v7EGD37kPNF9pZQ11GrZBFkvofqrk1/IVrry8e8cIEHllFxT3a/ZkT
         eYSphfkoOTX6F6JuxF5+Z3TZGIoY0N7kcj3t4fnvYSmYbXqcsoTYT/8814Qab0bFVFdz
         y3jkkKDvcpRxb2AOhST2J4a4Iki4y9ImpYwoQw1xqqqgO/66MgHn8FpzBgzv0Yq9+1Gi
         9srJUt4k4qMNyoF0TR3TN7CbGty3GlbUJLo+vpboJYZMjDZPAwRqVZaCtOsG/cWZFnF4
         SBGg==
X-Gm-Message-State: AOAM5325L1a2r41iAT3Qb9Hj3PWEuWs/g+9eTXhxZ6VUOJEXqu53aqfC
	Tm0mE5eFaCfGDVUGBAXZ4AusX3vW/AVj2Q==
X-Google-Smtp-Source: ABdhPJySv1817yJqin2LMSW3Gc6sYD7T7CwkRtSCBfBbsdCXizBJLWgN4uqfvLhAG3lmoe56KSiNVA==
X-Received: by 2002:a05:6830:1059:: with SMTP id b25mr15897568otp.128.1592848931518;
        Mon, 22 Jun 2020 11:02:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.02.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:02:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/33] meson.bbclass: avoid unexpected operating-system names
Date: Mon, 22 Jun 2020 07:58:26 -1000
Message-Id: <da4c8d7524747b2af6425f3e1547cccdb4d33604.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas M?ller <schnitzeltony@gmail.com>

For example 'linux-gnueabi' is not what meson consumers expect: See canonical
table of OS names for Meson (thanks Ross). Surprisingly this did not pop up
earlier but wrong system-name can break building as described in [1]

[1] https://lists.openembedded.org/g/openembedded-core/topic/meson_host_machine_system/73023862

Signed-off-by: Andreas MÃ¼ller <schnitzeltony@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 010202076760329829fbde8dab4f535d6f755873)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/meson.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index e9628033c6..ff52d20e56 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -68,6 +68,9 @@ def meson_operating_system(var, d):
     os = d.getVar(var)
     if "mingw" in os:
         return "windows"
+    # avoid e.g 'linux-gnueabi'
+    elif "linux" in os:
+        return "linux"
     else:
         return os
 
-- 
2.17.1

