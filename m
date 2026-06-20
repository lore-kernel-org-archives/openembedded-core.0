Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AD2CDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6026.1781960435898155001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GK9R/Fdj;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1683620f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960434; x=1782565234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1EyLSqmaplHDDm7guGN0vFh6UYyDQk+L+hC7JaxzFo=;
        b=GK9R/FdjJZxyugBDlF6jbRLPjOh33bFcl0+9DXvqBHnmm1BNd/7xPLmwqT9VDS37ey
         BH2I8psKSnIMGZnbJ5M3oBa8dZENQo9aXXa9LINlgKiIflLeHrS/5aKeiPcjxZYYwdXz
         aY/u6oL4qJuMqLKFVPhhi1u+qGBAIisGhst/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960434; x=1782565234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y1EyLSqmaplHDDm7guGN0vFh6UYyDQk+L+hC7JaxzFo=;
        b=Iio1XF0weRQ2/cEXsAIG77yM9o2urnwnCqhS5KcZkrRdow+9sg+4S3lPwm222cXohK
         qEC53+uJ7bCG3VHqDVSOvpZYDsAtY1RLfIABLLaI2yLCfr/fkkAFQLH6fFv0PaDVPsDy
         tUeR6mUmGlB5fWjh7OHMBeF0husLzg6aAr5tNK2elppKHPzXjmeNCoNhOhJuQN3NUyYj
         vgmX2lj85ChuDu+9hpdfW+VIjwzpMRWeo3PGpMkcuusraBrzpKwpjLEJZBmu33hpj34L
         tO17sDoGHqCW4xGL18A2vN/4QRR4iBZchg957QsyhyOOxudyu7FQW+RBUWgJenneq2DB
         AynA==
X-Gm-Message-State: AOJu0YydGZlCXksV1JD5ESDhlYapMjJCzIdP7HcdvXgD7XtkF+I20ygS
	zovn/ODflsQKZCbLrIkBpEIiWt0f8W97MRYSMWjUcwETyNfsXLxu4EAYZ+pHfBP0VrGSBPKeH5h
	h6F64
X-Gm-Gg: AfdE7cnQ2tFlLbyFMXIasp87eNiq4Un4qu59/Od/2JP8OQit0FHcbZKFXsxthk/wVz3
	1QIfrpfODtHJX7kSwpwAAfxLr7/BB3Kk+wMKpx8jyNtEGFHxQXhFJ9oKPzb9Zsd6fuqplJQ8bu3
	h+XPKMGoR6VkbFwfXoTGlmpdSwZwKLpnkMg+6Z0fWamgmFVBi42GikzOMjyOTG7Ey0kuLJmxvBq
	Vv/H+6Z59jHkwd4r5DDzo4gVCkwu1GaaUFXEdb5yYGt6Zt9hyMt8WfbblyLb0gJvuyySj6PMjHE
	Qex9ffw0rGOjhbpMTqHrw8KyKzIDaFiNvRDpD9WmVohp10v+oUIUUO86V7telySl4hDsU4QQMqY
	A+h+htvtuTFB+/zpcXlgW4x9dKDqF8mgfnqBJHZOUMcfiSjJpJtkcbJDXP/0H+pBFBisYiGAQD8
	pF4SPI4Koq2HQBaUU6eyIsLIhh0Wiy+X6yaDP/yheNPb90bQhS2HwIlingl07Q/yw+2PC6CeKH7
	sgxqvph4K3ZrOtO
X-Received: by 2002:a05:6000:2486:b0:45e:f188:393d with SMTP id ffacd0b85a97d-46503175f8dmr12830781f8f.29.1781960434049;
        Sat, 20 Jun 2026 06:00:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/36] sstate: Detect broken sstate paths containing tmpdir
Date: Sat, 20 Jun 2026 14:59:51 +0200
Message-ID: <cfd31f0bce7cb8478dae4a84af81fd7679739d4c.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239246

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sstate objects should not contain TMPDIR paths. Detect this and error
if found as the side effects are quite problematic.

[YOCTO #16281]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 907af8fb448e2f9ecf8e0439f2d8c7c397fb873f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sstate.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 434557db77f..904a4148ddb 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -655,10 +655,15 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
                 exit = True
+            for dir in dirs:
+                dir = os.path.join(walkroot, dir).removeprefix(state[1])
+                if tmpdir in dir:
+                    bb.error("sstate found a tmpdir path reference in installation directiory %s which must be removed." % dir)
+                    exit = True
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         bb.utils.rename(state[1], sstatebuild + state[0])
     if exit:
-        bb.fatal("Failing task due to absolute path symlinks")
+        bb.fatal("Failing task due to absolute path symlinks or tmpdir path reference")
 
     workdir = d.getVar('WORKDIR')
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")

