Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C245C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:53:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.13402.1714744405330003059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=opK647i5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f449ea8e37so875648b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714744405; x=1715349205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2PeMhrwbbrPyXzbUV1xnKjRNhEhkPwesMDGTUhXXPQ=;
        b=opK647i5xqL2Co9fex49P8rhEPx+m7Q+HIUdD/rA3/+71fjlhIBsa+amM25Y5aHE4Z
         +KSkyTwOa2IRkOUazOsUU9mS8kQda83+fHPV5jBM5sD/0nr3Q5zFMwunFgYqI34cay+P
         wKZdzz6dEX2gcpnKOxk1uTeSoe6WkzfNONA0dI3AujXkHZWLklQARqUUEnt4Owptu1gM
         cl08/Z7EBWNgBwD+BqG4j+W0XNmMGVvBnI6rMNxRs6MEgv/Y2+pLx8ENSfi6ToBH/cqi
         bvey0cRoZ5qWdz421stfBg6QWPE/GgwicN9/U5A6dof1FaZjbQZBtNJVD5Ii4pqdxUOb
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744405; x=1715349205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2PeMhrwbbrPyXzbUV1xnKjRNhEhkPwesMDGTUhXXPQ=;
        b=rQ+sD8tNXhBsCjXJJQOarlPmyTYaLCewhwICXAdYU0wVPBKhvhqZH6t6F8k0Hwees8
         Yl43spnAw7qmjRfSUc1V+PFUKoqX/RsNYA98f/eIkBVbhJSEDNqXQSSDKxJLLvujQiLu
         xxronaBx3hPEr7WXCjLnSjnokU/HCo+M6b1exqxf1dmAyTpd9g5Wu/kA2jupxycTo2lB
         THfe/I0TrFQewMaJijJcRuyK+mwVNCuY9H4rkUr8OK1FY6aA6NdGAD8yIANLwF4sBHI/
         jU3AwXuOrxZesNgqEXvyyRsutq83LSjutliQhZKkMuJwxLMURKPUOjW44TIWF1HGqLgh
         c1Ow==
X-Gm-Message-State: AOJu0YwhzDCUEFZzSdMH27BSPx1cCc5P97pjbp5cx8enbC05zihPXgeg
	PhAGuT9M+Q2FgUnV7OpiTXkUKAYNWlGuTMIq/W5g9ryIP2iSewAqBGEw3x8GuIjMmsp+0LjOZDU
	2
X-Google-Smtp-Source: AGHT+IE3sSZfIBqDTcDr+Cabo4ueieRKw9UtbBuzRu1UTgB74AGRRnFrKgnF3ZUwsPWRzrUhBIlMfw==
X-Received: by 2002:a05:6a00:4610:b0:6ea:f4ad:7298 with SMTP id ko16-20020a056a00461000b006eaf4ad7298mr3093060pfb.34.1714744404419;
        Fri, 03 May 2024 06:53:24 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id e2-20020a056a0000c200b006ecee611c05sm3044941pfj.182.2024.05.03.06.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:53:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/3] scripts/oe-setup-build: write a build environment initialization one-liner into the build directory
Date: Fri,  3 May 2024 06:53:13 -0700
Message-Id: <4bf3f11e39312cfce59d4652804faf0eec6b5ace.1714744247.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714744247.git.steve@sakoman.com>
References: <cover.1714744247.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198994

From: Alexander Kanavin <alex.kanavin@gmail.com>

With this, users no longer have to know where oe-init-build-env is relative to the
build directory; that information is contained in the one liner and then
it's possible to simply use that:

. /path/to/build/init-build-env

This will particularly help with initializing builds in unpacked
build bundles, as users won't have to know where oe-init-build-env
is in the bundle directory tree - similar to esdk initialization.

(From OE-Core rev: 1cabdf287c2739accdab3a766df060f1bc802b63)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-setup-build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index 5364f2b481..c0476992a2 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -91,7 +91,16 @@ def setup_build_env(args):
     builddir = args.b if args.b else template["buildpath"]
     no_shell = args.no_shell
     coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
-    cmd = "TEMPLATECONF={} . {} {}".format(template["templatepath"], os.path.join(coredir, 'oe-init-build-env'), builddir)
+    cmd_base = ". {} {}".format(os.path.join(coredir, 'oe-init-build-env'), os.path.abspath(builddir))
+
+    initbuild = os.path.join(builddir, 'init-build-env')
+    if not os.path.exists(initbuild):
+        os.makedirs(builddir, exist_ok=True)
+        with open(initbuild, 'w') as f:
+            f.write(cmd_base)
+    print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
+
+    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ['SHELL'])
     print("Running:", cmd)
-- 
2.34.1


