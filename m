Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A0DC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:37:35 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.55243.1656423449482897124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G1dH3TGC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o10so17655308edi.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vbiw6u6ta9whrRqJg3jJHXEGj5OWAD1r7LONljPa3ek=;
        b=G1dH3TGCRHrPfLpjP/iGYTupwRGnKUJ90iI4YzvRmZ0CMSqlc4rk9q2AvjUUKurW4I
         x6z/yCbJQ84HZQbvokChi1zG+kWj23Xekz3dhqq+Bm7GbrGj1o4kozF/aHstBSnlUlQg
         c+XKf+7TKsCLDE/OVqxPJsUnReQYBBPovyiICQlv21mw8Th8Jn8VQnq5IYeeeZiQdYVZ
         fHnUDW30RhkvJ+wlqkbk+9NIYq5uu1xnI/oIYyZtvO/LQ1G6ohI5/TJDfQ+kHc4X/hzO
         +3bukIX1hsmngdvCvvLKnFtYQ7RAp7pY1aYJVymXACHwhSBpQSq1j+Sk8/5NOoArTm5h
         W7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vbiw6u6ta9whrRqJg3jJHXEGj5OWAD1r7LONljPa3ek=;
        b=4AFwnBNKvz85Qr5yG6KnNkrODkQArDSltXzs8Kh/rYlorkmib3fnF19JqlOhGV9hTK
         0UUnwEvkcVENVh42zgEKjUwpUR9CF0CJTjL0YE8fXxljxNS+LMGo0emqP5BIhz2ajuKl
         sf2yOq4NZM0+J8aCbfUf04LZDxqpe9BEkGpvTswBloUVD7AiSK1JGz5n6XgW0pD2PMtz
         T0gtC3wHQhzM1nGfiFHRhUzATsVwIW5JOb7vRFqApUgkJcoEnNlZBdvRdwObvZzdVHtE
         YTLUk4BJd1VT+s+C6QEIbLvB0hrQEV/LQOcGzBwgsET8K/1r2vNDIjLe5JOa/Cm4/Dr7
         ioEg==
X-Gm-Message-State: AJIora9VK59S1Vd1m5grA1hRoylX6IKFNrU16MWETUTrLAeWtjJICEQq
	b9doiF5gcYMEL7vvdDcddEmSVgxylYE=
X-Google-Smtp-Source: 
 AGRyM1vAsogbk9MBUIrYSOGAFckTGjaihdVYAUgSPxU78KX2Z7dKliHiOOUdIwuycl6cqxMhXI4beg==
X-Received: by 2002:a05:6402:94e:b0:437:8d58:4ece with SMTP id
 h14-20020a056402094e00b004378d584ecemr14578731edz.396.1656423447636;
        Tue, 28 Jun 2022 06:37:27 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm6451853ejp.64.2022.06.28.06.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:37:27 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH 1/5] lib/oe/cve_check: refactor
 update_symlinks with safer version
Date: Tue, 28 Jun 2022 15:37:09 +0200
Message-Id: <20220628133713.3390786-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:37:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167339

Now update_symlinks has more checks to prevent unwanted exception.
It returns False if the link is not created/updated, True otherwise.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/lib/oe/cve_check.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index aa06497727..688693520e 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -169,7 +169,17 @@ def update_symlinks(target_path, link_path):
     Update a symbolic link link_path to point to target_path.
     Remove the link and recreate it if exist and is different.
     """
-    if link_path != target_path and os.path.exists(target_path):
-        if os.path.exists(os.path.realpath(link_path)):
-            os.remove(link_path)
-        os.symlink(os.path.basename(target_path), link_path)
+    import os
+
+    if target_path == link_path or \
+        target_path is None or \
+        link_path is None or \
+        not os.path.exists(target_path):
+
+        return False
+
+    if os.path.lexists(link_path):
+        os.remove(link_path)
+
+    os.symlink(target_path, link_path)
+    return True
-- 
2.34.1


