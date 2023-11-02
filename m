Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D608C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:48:17 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.27781.1698922095260126195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 03:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjCNKyUj;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c6b48cb2b6so11029501fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698922093; x=1699526893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YL9ojmPx5K1oOsIMAYp6r1/ySeTPNCfpRDi5fetZVdQ=;
        b=VjCNKyUjgf1l9i9GysuqzZvACEEjPQLO1S3qWu6REMJbqBV5ipN0tVY90iS9pmJu9F
         7zQAS2rRdhiVnAPYbFZWJqbd2Nla9RCf1DpUe0kxXSr7VIr+AOPriVPo8T+uuOAN8NCV
         0g/GfjPbMTrO/AzbspG2UlNBzOfZ2Xa7FEziPVioY9R0qkBxnBSPbmvJnLLmn/XOEnoJ
         qus7oDfYf3wQk4Jpbca7xg5l7MYzKoJ9ly5dp2abMhS36vz6cOa+dY6ymTcf2+XCPAjl
         dYyjvhdf1/gZ2P6d5vZAsRCGJ6NLGacgdVVaPrMiIt0POCaMp9vNcNGwIYPNFUC6lMYy
         bhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922093; x=1699526893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL9ojmPx5K1oOsIMAYp6r1/ySeTPNCfpRDi5fetZVdQ=;
        b=QxLE6z9a2xHidiERYcVrgGnJBXUrnJ35htkUHCc2shi5cPxddOYRyvgbxiSKhoDwB8
         sjtRNOY/MMzkMozjOv9ismR7IRrdwKLLywPIl0WYaDkARmYbXrL2nkgxPyajjVK+SPWJ
         5iCT3oWMUPG2EqF7k+MwUPHHALE8KLfoswRIUWP+Doz4K7xkcOQdLKvbbD2uqwYuBeK4
         KbvVakvlDHe4xVPYwo/1glsWPWSXxyY5kSLK9otUO6XmNwNrUTouoWGRgxbByX1mU2lO
         zT/fFM0ReuuPYWxBX4jRfZ6ojYkKHmmPJJhvRThShQKYeQXPd2p8IZoPxM/4w0pfVOrj
         n1Cw==
X-Gm-Message-State: AOJu0YzKHp4SMv+fFPLNmRZ7p8TmQtL/jDixfkR2PQaTQQLAAtl78dCV
	LKmXl8aT8Rpf2vvXIVhHWv8NDKR9wQ2zhg==
X-Google-Smtp-Source: AGHT+IG1hTN13+pceBj0L1pZI5xc0q7aFpxlFcn/XikUMTFZ9XRjpKD1p4Uf6WbluFRJCjcE3ZEfqg==
X-Received: by 2002:a2e:b90f:0:b0:2c5:3a9:7467 with SMTP id b15-20020a2eb90f000000b002c503a97467mr12420231ljb.8.1698922092888;
        Thu, 02 Nov 2023 03:48:12 -0700 (PDT)
Received: from uvv-virtual-machine.localdomain (dslb-002-205-007-068.002.205.pools.vodafone-ip.de. [2.205.7.68])
        by smtp.gmail.com with ESMTPSA id fa27-20020a05600c519b00b00406443c8b4fsm2546449wmb.19.2023.11.02.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 03:48:12 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@wika.com>
Subject: [PATCH] lib/oe/path: Deploy files can start only with a dot
Date: Thu,  2 Nov 2023 11:47:34 +0100
Message-ID: <20231102104734.7018-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 10:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190076

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@wika.com>

There might be only hidden files deployed. In that case we don't need a
generic wildcard present in copy command, otherwise it fails with:

Exception: subprocess.CalledProcessError: Command 'cp -afl --preserve=xattr ./.??* ./* <BUILDDIR>/tmp/deploy/images/qemux86-64' returned non-zero exit status 1.

Subprocess output:
cp: cannot stat './*': No such file or directory

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@wika.com>
---
 meta/lib/oe/path.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..e2f1913a35 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -125,7 +125,8 @@ def copyhardlinktree(src, dst):
         if os.path.isdir(src):
             if len(glob.glob('%s/.??*' % src)) > 0:
                 source = './.??* '
-            source += './*'
+            if len(glob.glob('%s/**' % src)) > 0:
+                source += './*'
             s_dir = src
         else:
             source = src
-- 
2.42.0


