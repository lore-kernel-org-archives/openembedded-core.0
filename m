Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEC1C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.5733.1678402734361671343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WIXwy7Tx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso3414975pjs.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxAjdsogfD9E5yKennxRQDCw6HN7uFKMfSRL7n7fLSo=;
        b=WIXwy7TxjuHarCsnqjoogts2iYAffKyMeE9LYHX6mX88J4M3B2A5P2+6eo1MJV3YRP
         gorujuQVEyYxTwFhP4l4rA+3cljapIFcnWfyNsZKT7nYYvhwsgccv5xPnNy1iyQsGeNz
         ZS4z4mJ9WYCbfnmf/2PdBuQYXqr1eMUH8NMsteQvJnQ53IILub1de0/0EFF80M0XTe1/
         qSJIzT6+M6FfwMvfOF9o84VP1v1ih74Cr0SQKyuXsKC59Wm44pK8eISo09eM16VUmx2R
         V2JK1YOEAWmRIkicwPbIUVE7XUV15xzc8eMyYplU+Jq8b/Dt7+OQKVNAnFkPakfSQcq5
         srSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxAjdsogfD9E5yKennxRQDCw6HN7uFKMfSRL7n7fLSo=;
        b=A3z68vtcgdr4UpxTAfkJ0biz55XfHXpSy22wx2sTM0NYqQfMjor03p+OKfRG9PUsaX
         Qo1+wm5PkZcQZebtAQPe0VQyENNAWHYnoDWEx10BIDrtF+f1HTaper4fHVo9MODrd9JP
         tPW/0HwyC7FcNLMlvJH35u9EDFqra5u3LXqCE4m4E15p0Twy9GKUkB3Xcq/OewB0GeoT
         cFz7HSfPU/T7VHdOiSQcvyuYDhMm81UBe6+gl74wbdU9cYdEtYoaqY1yGE7IDA0T7vTG
         DvNMplrECzOvRn5rjuCvq6UM0dcSwfHSy9rZWCXt6i0we4HXWQb0QfE6qSEOWZbDS4np
         52Dg==
X-Gm-Message-State: AO0yUKWqLaTpBhtLxTBU38h2RKSLb9GIpUE5yhPO93T1846dQ3mFIVPk
	JHgYdtz1qM+4zc8U/5+dMY5TJPy9mXbzUqpnKG8=
X-Google-Smtp-Source: AK7set8e8yVtJ8jvkaYwhUiaxYbgk0vQBf6NiJLDZYzKGwMkqyGEFCe99aL5kU5KYqCLug4SWvOUcw==
X-Received: by 2002:a05:6a20:7d95:b0:ce:ca9:ab30 with SMTP id v21-20020a056a207d9500b000ce0ca9ab30mr24098105pzj.36.1678402733457;
        Thu, 09 Mar 2023 14:58:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/27] oeqa/sdk: Improve Meson test
Date: Thu,  9 Mar 2023 12:57:58 -1000
Message-Id: <e7838652d8c33ce11ece4fc088925394df3bc8de.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178296

From: Tom Hochstein <tom.hochstein@nxp.com>

The meson wrapper setup command detection is broken in the case of an
implicit setup command with an option with a space-separated argument,
but the test was not detecting it since the case was not covered.

Add the option `--warnlevel 1` to the meson command line to cover this
case.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 54e9ee8a0c6c9fc89cbb743f0e4fc18607d503cf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index ee515be188..147ee3e0ee 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -35,7 +35,7 @@ class EpoxyTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            log = self._run("meson -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
+            log = self._run("meson --warnlevel 1 -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
             # Check that Meson thinks we're doing a cross build and not a native
             self.assertIn("Build type: cross build", log)
             self._run("ninja -C {build} -v".format(**dirs))
-- 
2.34.1


