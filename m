Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFFCCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 12:08:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4584.1761739725515950440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 05:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDr1lDmf;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so5511675e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761739724; x=1762344524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=albq9zzPtUeAIOl16ybvlWUWcyvrmeczOQDj3SR9Cfo=;
        b=jDr1lDmforGTGsNYgXvlDmO8b2d2EYf8c7PG62lRqhUI55eKkYzodKwLeABwXk5DEf
         drWX3lMcndXgpQkKb4UhqHB8L8J2W8DGnTQ+cAazNshsYCiBajhww3uEFVMV/HS3LyCn
         M70VIFfqxbfl5Le4DYgRLKR53IGYsmWDJ+YzACS/kKn98MOzoSNqqtclGcw4H18AxLt3
         aHyFHJVP0LNPf0OT/QqwODZmphSeCtk1IVRd2pGJ0c0x1qgmuL9BzKHmBtVg5mFHwOog
         zWvCAJxeeayqjsa3sq6JDT5WKI7UgoyDu1gNEqvt56VlRR0pUt4CrLIqHM/Ti+s86v69
         +1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739724; x=1762344524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=albq9zzPtUeAIOl16ybvlWUWcyvrmeczOQDj3SR9Cfo=;
        b=k+xAKZ4OrLDmAbxnMjmeg6Zl+mjUSbMMJsGIiOSwcYA3uTeiKcO05T6XfVB0jEvH2b
         rLDCqi4l39iXP8BetrUNbWRUiqPmd8gcjRfW9S0+qm1zRHyve36RN8v+ckaC8y7/shm3
         15VzE3y3lS7l+7APpFGQ0P7AwHNITGt0sLO7RM/werFNBlk2GUZsvtZLJqEwTcIjUzdO
         gt1Z1NzXHzWJ06F2d93Dvni3yL2gpJ58Vu24Y26xsBHFSabnr26DBNQYcEhJHQWU3mkb
         V01DmKB5mQ1AZsoRHd+NN+4OGVuK7g2xlWPFXKf+7PbrrqXji6GxwEq5FVmMda4AtW4i
         ydLA==
X-Gm-Message-State: AOJu0YyYtioH/WhodmsO16jWPhgnvCwKocH8M/wBYe1gFMbB6D5sA0Rj
	k3hGUaZaNSvS7IaBpR7bwuu2m9ONo9LJ7n14vjAgXZOjx6Ps43Q3tmz7WCSCRw==
X-Gm-Gg: ASbGncu8qQVaQL/Vp2xq0raa3zmJyH7jaGLpbLbIIng3CPOcM14fZeUk6gRKUIgWdDv
	z1RUQ0UkoYy4vTAG3nCH4E7U9oFX135cvL5grABYGlwzB7x2AjEeKT0WEhBb3WcaXL9JLfJayLH
	brvffi170THminxcwWslXip6r+oI8hv26Dx9huP0Tri1w2kctxI6iiyQA0BcTsSbdSo3dnOaeSK
	4tb1/cNFDnmi6D2X62RmgS2+RhADg/Q9FvPjtUXvknwNc6XxOz9AWYgEn6kQF6by5UlOs/gCyn6
	0sW6XMiiHW4Bx9OCXCHjkFzEVpK/tYMLUi/bB8Ldq+2x5gFMrdpe88PVC0xXBs7CIpEMfr5t+7F
	6mb4UhLQ7cmFDGfSPKZyAX+Hhh6NVtxugq+y+DzZ3v44HctfxpjsIaAwNyYLUxd0zhOVtflBk/d
	ep3H4jTlE1Or84fBXXWmRHm29q9F0N5utBVmGllMW8CBAjoYCjTOoPDqQSUns6lBAdi5/bA6Gj4
	5jLT9SpYQ7CS95CUCNn+I+e9nAxsKk7LQW4W+Q=
X-Google-Smtp-Source: AGHT+IHYMRsQLtfIWw6efs9t475ZfBLbrDSyYeAUN2zBsm+5dUQ1dCql47HxVav1XFgmu2VDEvNF9w==
X-Received: by 2002:a05:6000:2406:b0:426:fff3:5d04 with SMTP id ffacd0b85a97d-429aeb096c7mr2428605f8f.25.1761739723711;
        Wed, 29 Oct 2025 05:08:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b2dsm25685793f8f.2.2025.10.29.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:08:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] testimage.bbclass: check that root-login-without-password image features are present
Date: Wed, 29 Oct 2025 13:08:34 +0100
Message-Id: <20251029120835.4075555-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251029120835.4075555-1-alex.kanavin@gmail.com>
References: <20251029120835.4075555-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225453

From: Alexander Kanavin <alex@linutronix.de>

More or less all of testimage relies on logging in as root, without password,
both on console and over ssh. Previously this was enabled by default in poky
and core, but now that it isn't, testimage will error out on timeouts in
both console and ssh login attempts. This commit adds an earlier check and
provides a hint to the users about what they should do.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/testimage.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 847a6f18a81..83b750bd7d0 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -131,12 +131,22 @@ do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
 def testimage_sanity(d):
-    if (d.getVar('TEST_TARGET') == 'simpleremote'
+    test_target = d.getVar('TEST_TARGET')
+    if (test_target == 'simpleremote'
         and (not d.getVar('TEST_TARGET_IP')
              or not d.getVar('TEST_SERVER_IP'))):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+    image_features = d.getVar('IMAGE_FEATURES')
+    needed_features = "allow-empty-password empty-root-password allow-root-login"
+    present_features = set(image_features.split()) & set(needed_features.split())
+    if (test_target in ('simpleremote', 'qemu')
+        and (len(present_features) < len(needed_features.split()))):
+        bb.fatal("When TEST_TARGET is '{}', IMAGE_FEATURES need to include '{}', and they are currently set to '{}'. This can be done for all images in a local build by running\n\nbitbake-config-build enable-fragment core/yocto/root-login-without-password\n\nand rebuilding the image-under-test."
+            .format(test_target, needed_features, image_features))
+
+
 def get_testimage_configuration(d, test_type, machine):
     import platform
     from oeqa.utils.metadata import get_layers
-- 
2.39.5


