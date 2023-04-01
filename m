Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60462C77B6E
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17507.1680341458158683426
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ovv7L2yj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d17so24673623wrb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=ovv7L2yjBYvFAGzSW3Q8lmazL68u9CiJRiUzvibh8zdB03kfrsn93GBcvahQpwLIVj
         mz0BrinxaE/qL2csx87DLZaJyzJ8sPBz00urwXidt2nfvvD+i56HDd4EVYwQ5Xu3F1LP
         b3+kX+KR4TLGaDtQhXe7zohYg8t4Nn18Pe0RbxzziZkT/IbLJdX8NULl6JtvbybAoiGM
         LOQ05iBPm9lgrOkJkb89NHodAzd3eXF1pJD1x7ELzPaJ5N64zGjswlxfS/BhYDJB5NFf
         cLUkaA7EmYSBwMcaNYPfB7rjNklUnSVQujv6JBLAZaI/AKCeAf0zR0EsqHGWirbukaUN
         Ldkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=4Hg/jkKx2I9+ntF8PJqcC0ngASQn2AArhNd/ngc3SBU4D9zIPEoFfsdHYIZrtDA7At
         leFiEFOzDwqK+xK3IO4t3NzM57WYI6OOP1jvtsBwe1nXTZ9I0REOLWAftnQ0/sUzemPT
         b9epwLLi9epKPY6Y+xbSnLbfh4sLTPDU7PkmqqDmKvFsC8Qf57KkIO5BdezBK37ZBnq6
         sEz5nn3tY9C6lQzNSAL0UhVeImw1tG+C1yyh1UW5mgKtgvlE5obJss7WCyCfQcaA1dRA
         8B1dKmMN7+R9mLpZucFFW3WdO/oHlMIlxQiDhARhsO/HS2YtvbjGiAy1NU1wZxXjKcgJ
         dOKA==
X-Gm-Message-State: AAQBX9cHIRE+vNIifcoBx/YDRtldxBSpREB6yZYLUErkfRHNHeZz9fZg
	0TZjLrOJcs5i5yuiQZ1Vk7Xvtqpxn/Q=
X-Google-Smtp-Source: AKy350baw0xEUy2NkSE1uloNq7uxV4Z0YSFQH5py6o8KJbSLp5OY+qxXHS8UjqyzpFqzYJklfyLfRA==
X-Received: by 2002:a05:6000:1083:b0:2c7:fc61:12d4 with SMTP id y3-20020a056000108300b002c7fc6112d4mr22247488wrw.47.1680341456004;
        Sat, 01 Apr 2023 02:30:56 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:55 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 2/6] cargo_common.bbclass: add support of user in url for patch
Date: Sat,  1 Apr 2023 11:30:47 +0200
Message-Id: <7f4f5b6895ea211ba23ea609ad2e8c8e18e6809f.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680340685.git.frederic.martinsons@gmail.com>
References: <cover.1680340685.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179461

From: Frederic Martinsons <frederic.martinsons@gmail.com>

To handle url like git://git@repo/project

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 63b1382908..82ab25b59c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -134,7 +134,10 @@ python cargo_common_do_patch_paths() {
             name = ud.parm.get('name')
             destsuffix = ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-                repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                if ud.user:
+                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+                else:
+                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
                 path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)
 
-- 
2.34.1


