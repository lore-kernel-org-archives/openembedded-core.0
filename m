Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A04C77B62
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:56:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11706.1679842576774997436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wp5FN70o;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id l37so3620214wms.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=Wp5FN70owY5N0vfOy8DBcjst5iE8rJX7OjqLWWPnkodmi+Qi/I+7FrzCP959SCUW5g
         YsPxtPbWAB0ixbwtmhQG2pGbXcRm+i7bbnSaRS9YCswbWuWpXVwpscXHbKz/3wrIVqQc
         CcTyokUFKnrk1Pjr7XdJHAstSnNUmlonQveolcWr02pCw7glJO9WLfDThSVhsM4wK1pA
         UDFeR9dVzKo9tdViNzCoAJr+n5WVj+Bpl42xB84676Hoed0/OewilmtvA/E5oSb+X92/
         2RXK0YgWCdallLvLe7yqhT9455vSRdDhXD6lPZcQ6Zd6E+c9v1hWE2YGzimKevTfKew3
         4qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=DCIOV9gS4HhVb8BEw4oQgNtejBPwbyrUfB0zIhQtL1zhh8IANNtGRnXqrxa6rie1Wq
         iQ6+836+UUrxW3M/eXF2QULpqHcCkOJ9PY8LmnR779mMoEO/VM0cIDLGTjsAbMLGAv4d
         cLX0VQd74mXcqDqZ0i9zWl7brIY0rXgo6wIceZoi+sbczxGTkYL4iFfRxBdpEOCNK71p
         2M0HYYnNEJgNhqGMSK/YoP7v5IkHJrJe/vKTymRpFeiacTjDcUHlSCjH4w5+TTtC1LRu
         2sh/jIypLjN/US48Zd7YgH4vOn8602/Z39efxnHvaY51zWVAOsPPXAq70/4CDU/Fk0C2
         mWPg==
X-Gm-Message-State: AO0yUKWJawnEXiYYSHqMECvalX08Qhn2NtUkaZ1/D0Uh37EfFKRNUQ0t
	ML3XE4ecG9/aYjPeJ+s+xgLEr1frFCU=
X-Google-Smtp-Source: AK7set+UreBAiSNmbRnvyQGspAdo19lYuY4iJzMqv6RqzT/MuTK3+L6NAVRPnA3f8r6QxOMFhTmvYA==
X-Received: by 2002:a05:600c:22cd:b0:3eb:29fe:7343 with SMTP id 13-20020a05600c22cd00b003eb29fe7343mr7102257wmg.33.1679842574693;
        Sun, 26 Mar 2023 07:56:14 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:af58:462f:1cbf:cab5])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm10797549wmm.36.2023.03.26.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:56:14 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV2 2/5] cargo_common.bbclass: add support of user in url for patch
Date: Sun, 26 Mar 2023 16:56:00 +0200
Message-Id: <4ced6feed495f18a54a072713544de6c84964d9d.1679842454.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679842454.git.frederic.martinsons@gmail.com>
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179123

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


