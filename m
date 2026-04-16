Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA646F8E489
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:37 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28281.1776378808415272403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I34F6t3a;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso297095e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378806; x=1776983606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=I34F6t3asgpuCb1YbjpyvLmioqFasAbaPWCTJBmqMvNDS9plsmsyrUlPt8SQUusr4j
         TTG0GA9/p6128KPNGdsyUNjUiEdoSicTbJ/wnLLKiDdqcgiSUDGFz7Nodl64wgZ01saN
         JqUGVEy17YauquaeYdf1kBW62zdio6t120zUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378806; x=1776983606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0uHzev+D2TX5lx68FpEJum0Jy8kOUbQhyO7z07ltsbM=;
        b=kBlDVHzuvGZXU2fw1jODJfG0HQguFn/eJmfjp5qhj3tv7rVrIGRmK80VmrFjlNTCDn
         WadsrPT/WYyoeZ8C5O/sFfiiOH585MGEAYwjOF1SRAPcPI6P+ZUeQvauTICmSu8BSwzn
         dOcYGAgVkVPtLkiBs+gqyl6S0aFkO7Qel0Sv+MbIhUj5Eh1I4E8AQiu50b/3A32ZzV4F
         JcRjqDNndNGaNnRX8M52WRq3/pcxY5zWwH/nodw1rqx4ft1tmJKVYCg//QOz6V+cGqvN
         vHDv8bTI45y6NX165hvHbScczlN2Gk2G+SvfZjLCzFJVFHZY0COk1LXsKKqhqIhAmzPq
         XUGg==
X-Gm-Message-State: AOJu0YxAAq9FelrVi7X1aC5rHCilur+KThWF69cWrIrPR0zQvhLanCQO
	FHAXgQCTrtFJfwPVq6/tY+kikwOxs2UJ6XWhrUFbgg11fhuw6bEz4wJObIw9gXF7V/myJ+U+AB+
	3DFUoBydQ7hr4
X-Gm-Gg: AeBDietSAIMUOMl9j2Yz2T//Bkm/2kqCByHOwmHocg2C/vAQ0kYlwzWq+rq5/ubD/Ow
	veafC9xatku2kqCyfK0LntLff46z0gmbv9vSI4ORuU+oGtQFkMCdf1qdFFC+d8Fy1jMTYMxehM1
	R706Uesxy/KuN5TIW8f5UqSigCFJqkmb3jExGqivB5vVF9rvgCBrOKTPs4iB2p9pzgKXOMWiv0v
	iFhVj2vHojQX2OhPCrkRQbq47oxBgT4pDSHu/FMtC/CJSgpNxqMcb8qq4Ug1T+tVKdCFnqKc/6r
	y3uM7hiTg1VqNptTHN4xkNidweZvLq/kU4GXhkGwh+cnz/TjqiokYYYdR+OrONws6X0pDUqfERc
	2zfFj7lUUNPUpcn/JQS5naoBQ7iOrPh7MINgalnVUnbD4QtBKrTO4bF3gv90fFEDphg1F3QFup9
	H6oAR7QxUR8qM5jKwTRsAItgoCnp+WQh1yvpvf2merzNednEjklt7DkE3LkZSAJWPBGH/jMtcdH
	JxApcnnX39dHJi6XCZSdFkm1y85ncL4dRRMlQ==
X-Received: by 2002:a05:600c:c118:b0:488:b187:d8ed with SMTP id 5b1f17b1804b1-488fb73d758mr3967705e9.2.1776378806615;
        Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 42/51] oeqa/sdk: Default to https git protocol for YP/OE repos
Date: Fri, 17 Apr 2026 00:30:25 +0200
Message-ID: <5d669fd8ed500b753859e8e76ac875d83252311b.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235471

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/buildtools-docs/cases/build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildtools-docs/cases/build.py b/meta/lib/oeqa/buildtools-docs/cases/build.py
index 6e3ee94292b..9f963f18f8d 100644
--- a/meta/lib/oeqa/buildtools-docs/cases/build.py
+++ b/meta/lib/oeqa/buildtools-docs/cases/build.py
@@ -15,5 +15,5 @@ class BuildTests(OESDKTestCase):
     """
     def test_docs_build(self):
         with tempfile.TemporaryDirectory(prefix='docs-tarball-build-', dir=self.tc.sdk_dir) as testdir:
-            self._run('git clone git://git.yoctoproject.org/yocto-docs %s' % testdir)
+            self._run('git clone https://git.yoctoproject.org/yocto-docs %s' % testdir)
             self._run('cd %s/documentation && make html' % testdir)

