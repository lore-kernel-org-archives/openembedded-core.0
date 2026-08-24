Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9D6C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:58:15 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.937.1787587094590381557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gvQvj32Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-44aeefa1c00so69557fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787587094; x=1788191894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMOjlEiwMm0zykuAJEVYo2DgZv+UYPtUc/4AaVYY5AU=;
        b=gvQvj32ZxyQDO02kqt9GakhMjUwR60VjX4OiSKJs3APNVW5MsewQjinvinrjUI/mTv
         J1mHW/mH25Idp8Tr7+WtOLwupgLKKHdlHi1vgAOjT6Y0uK/PFt7JR2BMrbpsOA1d3dR+
         ICfZSJG1mFyCAMb5E198kwiOi9oZmTRJuUQBV+6fdhg33RgS54jYkH6Senk5b6B8mzTX
         vx3zolbJSi+qGZyVcTo2k+a7n9n1ch2MjjpilAH8c4hDTtSyDaCKQRRoBgaqkjCmkkHH
         kbXyqjG23PqVt040zCbIjrUMGZNkT5ybpS+K22yxe3GO4uDxaU12wHbDNXyCsw6bRETU
         nr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787587094; x=1788191894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMOjlEiwMm0zykuAJEVYo2DgZv+UYPtUc/4AaVYY5AU=;
        b=mlJqyomxpMOKov7MLU/mo4cLsDgnB+YU7e8KKuMHpjnXl+EaTABJeOT1tRbZeQX1vF
         qMzpx4WmKXrN+ptqbvAc9VXCvosn8J3XmosBYdPyHxkDYV9MKXzf5RmB8Qr2fQh6jFJi
         UsqA/PVu8TFo4hd+5wittjxrLicp6u57aWXrnVc/p1U5IYABJLY+elOBmYIrbQQ+o1hY
         VMSPZU59J/Ad7rZfAQ9U11K2CFSUk1VS6U7JMuDo+6lw52RVdI+Z9yyNByzEzdtIY9cU
         OHc0VYj0hnVArJIzCnAAiAgrCMzbl0tMiqB3hvItUOHo2ASc8dpBoJWtg1ify63/+n4k
         BxtA==
X-Gm-Message-State: AFuF++nhD/6mXjcDvuhY76lFJR7/kVec4UXzE6WRzo9vg7jfm+b7GRSf
	f2O5Eyn84cxG54Tgc2HbvX32XYJlotMh1/gbvQ3P1MUmQM+vK5Nm1u5S4W30+g==
X-Gm-Gg: AR+sD13UYcg4lx5UzytJCchr0aVXFugvIdUFWnEZuNAl6Z4omanyGqkVtY+5HAmlnEX
	LZeoyfdKKI+70t+nZlKrmt2v9N3/E8B2+W54Cr08dNA0vNdGOJ87U9p4AS4APyA9WiHlswjNub0
	wcQkfNgD/Fv6SMZziA5ycZj4PmMr83Oxogmso/mqFFTHuSdG6PsP8OuFbMmQFRegsIuIMQ1bFfp
	47dliIVpO5OT0skH5PIniyxljjW2/WJzZcGnEIDp+j70ZwVRZrw4k82ltqvh8YHNAA0CwYfqeDv
	k8wDUjbhaRReugbYpdJKdJjwANVDKrpq9IUbwxYdznpN7zkPM5l/MB5gLJ6KZO6f6AIe7Ipffz6
	73YS8xVmSrpFzSPjnjw/PvjhMJy7F1WY+Iy+0IihbC9wm5fY21DnJTsI2hNszKRptw8vnPT9O62
	y1Lr7a4vh6BhHjsr6iURfpiLshcnbBtbj8uAOdjOsjB8EFQo2A3ZTL6dSdhA==
X-Received: by 2002:a05:6870:cb97:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-464444d1457mr210198fac.0.1787587093687;
        Mon, 24 Aug 2026 08:58:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::b169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463831b6672sm5511702fac.6.2026.08.24.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:58:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: license_finder: Ignore non-files in license directories
Date: Mon, 24 Aug 2026 09:58:05 -0600
Message-ID: <20260824155805.2173246-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244137

We would like to move the SPDX license exception files to a
subdirectory, but that breaks the license finder code since it assumes
everything in the license directory is a file and fails when it is a
directory.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/license_finder.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.py
index 6f071f7c56..9c217cf891 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -48,6 +48,8 @@ def _crunch_known_licenses(d):
     for lic_dir in lic_dirs:
         for fn in os.listdir(lic_dir):
             path = os.path.join(lic_dir, fn)
+            if not os.path.isfile(path):
+                continue
             # Hash the exact contents
             md5value = bb.utils.md5_file(path)
             md5sums[md5value] = fn
-- 
2.55.0


