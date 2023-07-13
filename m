Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E8FC0015E
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:03:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5625.1689246189984863179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EkBcsmsk;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3144098df56so730045f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689246188; x=1691838188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVy511rxJ77Dn3jKUSiUyOst7A3xhbYIDI+sk8knpQo=;
        b=EkBcsmskbp2NLJeqzDkWv3+bIYtgrZu38Xm2LqNIGofeOSlSeEZk4q+8343fm3xnAJ
         29BR/QaRCzNhWJoCIAPPG/tg6qJDU4B+ssobwgtf6ZFvUaevyfDaJdQifHt4d7SfaO2s
         mZOSQpyA5/LHIbYkS/1Ef2uZHTAxWYKrFBr02fkp/biy2BYKaD7xHo1Y829mEm5gvn78
         PSRSjjvJ+DtUmIkOrP8IxSV1+yRSidWCbFJaMZ49RZJoO1HlAQ2UW6ElobjE3GMopcca
         UAIu1zWdzpxKL/Ipq8QXQ27jIL84M0Nevdv7rUWy68+07QdYxbO2Rz7iUz8dlbTngB7O
         +teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246188; x=1691838188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVy511rxJ77Dn3jKUSiUyOst7A3xhbYIDI+sk8knpQo=;
        b=cQLK9aSCnwm0hhbMpA+uILxjrDQb2xkMD+XU9pTGio7LtYO6fpqVhqh5xPUIYisY/s
         Fe5SIap3Gx18RnEIdDYYy3MYTqP4AjHlzIUILPyx5q0gk+vvHouXlyytXpxwrgC5Dyxz
         JvyIHbLlMYLBnxdD2BIy+6PHaOMIiq4Ns4ZT85wxPYr0gi5Hd9xccNWHilCkdCM973Ua
         9FpMQ0mFe4Pze4B9D40Gr7yczcmn6snndZIJRw8wg1DRLEJArPLaCcSlGlW3qwDTZa4/
         Psnc1yDKk1G43KdnlI9EaB8sla8EqJBAWJuysCiuwJxiSeauTa/QikA/TPx0e621V2TK
         eisA==
X-Gm-Message-State: ABy/qLZz0KqmJd3XMPAA+PeDLzKSQ8Db1Z/XbMhNTlgip+lD//Jr7ozY
	bIGBV34+eN9HETtWUMl+b60R1T4b8l8=
X-Google-Smtp-Source: APBJJlFSeZhRsKLnHNSdpRl5Xq+0jdYkCvRay8yUohrZhClt/FyuTgVbTkz8Fl9PVqEXnFVxsHaE1A==
X-Received: by 2002:adf:e7c1:0:b0:315:8f65:91a6 with SMTP id e1-20020adfe7c1000000b003158f6591a6mr1416278wrn.18.1689246187888;
        Thu, 13 Jul 2023 04:03:07 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id i17-20020adff311000000b003143853590csm7623038wro.104.2023.07.13.04.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:03:07 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/2] sstatesig: be more precise and show the full path in exceptions
Date: Thu, 13 Jul 2023 11:02:43 +0000
Message-Id: <20230713110244.3169513-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184240

Also remove the warning than doesn't make sense as the code will generate
an exception and bitbake will abort.

Before:
| WARNING: core-image-minimal-initramfs-1.0-r0 do_image_complete: KeyError in .
| Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
| Path . is owned by uid xxxxx, gid yyy, which doesn't match any user/group on target. This may be due to host contamination.

After:
| Exception: Exception: KeyError: 'getpwuid(): uid not found: xxxxx'
| Path /build/tmp/work/intel_corei7_64-lmp-linux/core-image-minimal-initramfs/1.0-r0/sstate-build-image_complete is owned by uid xxxxx, gid yyy, which doesn't match any user/group on target. This may be due to host contamination.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oe/sstatesig.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 30f27b0f4f..4a886215b2 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -595,9 +595,9 @@ def OEOuthashBasic(path, sigfile, task, d):
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
                     except KeyError as e:
-                        bb.warn("KeyError in %s" % path)
                         msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
-                            "any user/group on target. This may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
+                            "any user/group on target. This may be due to host contamination." %
+                            (e, os.path.abspath(path), s.st_uid, s.st_gid))
                         raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
-- 
2.34.1


