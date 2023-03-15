Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86547C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.8805.1678888918724755584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JO2pPei3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so2094600pjp.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LP0vG6GqjhnlxKl4Tt1OWWzIHs+aRh3GJmbWuw8Uhqk=;
        b=JO2pPei3jFMWkosfn/XK0GPkXC/0zhARk6BfbAbZTTmHQcXAaQkApN2sQuAGr8aek1
         pZSRjEy6ad+/D886xiC3oxkJMUAoYUhVvkrjBfZfbIoDOtHDr1e3bKaU1dy+Q4OPMqh+
         DAM7A96fawU14OX2Dwspvio/JoFLkzFJs+EbC1Kpq0wlmEp+X8LkBRGR+AgtirwlExbA
         jyR7LHSHrjkob1PsU8Z9IXhimPv8oF1LiH9dvqlt3ZpTI3krn08U2XBm1pi0NP0yWfwv
         ICBAgPYa14cZEurI4rywWE++TbcPPh+XjrUXVT6JqQNkmQru3pdNrhePuwxTiTzU/egx
         Kx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP0vG6GqjhnlxKl4Tt1OWWzIHs+aRh3GJmbWuw8Uhqk=;
        b=PHIXxS9EAmybhzz3cX+l4elXMG2Qv4zrBRD7juQdYO2uqjScITq3YfL6QK/rT7sZkm
         ia7vOtS1dfn7xO4J0h5ol0eVmTAlh9XaezK8io8XNUFQLCtdLXfht7gh9TNAgUJldoyk
         3Wa0ASlVWBbY3W47cmQ16BgqyBF5jBYX1lY8C76Z96QXofwmsX/Zehsr3Zs55P4PbsAh
         uXII7I/fN0KRBJ8EBAa9s/gPeyK+rF4B0/WPSWvYs5qO6PZpOZn6Jw5ww4+ca+it0ARK
         2YwpFldU2ApwgGdpoegCQObOjIZ92a+VVtWNllgZnpIzBFEaQwEpQE2epQbF1p5SG0S+
         tkrA==
X-Gm-Message-State: AO0yUKVwblJ1HcYOzuINQqRLpZT4KyoSzk8OEGXviEVvG5ZN8PuR6+ba
	9Y5lp7WuLVLCmifK+U6EIZujb73ZfCPS1BGv2dI=
X-Google-Smtp-Source: AK7set+wb6pmTJGoQfl+HU7/uqef7PJtyQePbJYjztbtWKWUKafo+1slJrJDbVymxOnHFbOnU95QeA==
X-Received: by 2002:a17:902:ce92:b0:1a0:4410:e6 with SMTP id f18-20020a170902ce9200b001a0441000e6mr2894500plg.63.1678888917670;
        Wed, 15 Mar 2023 07:01:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/22] oeqa/sdk: Improve Meson test
Date: Wed, 15 Mar 2023 04:01:10 -1000
Message-Id: <3fbcaaa01304bbc645ddf01ef91805811e3c7f54.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178570

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
index f69f720cd6..1c41b04169 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -32,7 +32,7 @@ class EpoxyTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            log = self._run("meson -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
+            log = self._run("meson --warnlevel 1 -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
             # Check that Meson thinks we're doing a cross build and not a native
             self.assertIn("Build type: cross build", log)
             self._run("ninja -C {build} -v".format(**dirs))
-- 
2.34.1


