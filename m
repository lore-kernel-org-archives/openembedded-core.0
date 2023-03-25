Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B22C6FD20
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:01:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.17973.1679734854156038401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gC/g/Qva;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r11so3897450wrr.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 02:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679734855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=gC/g/QvapTHlGRzN1sIMj6DqPw+fzSNltxsuxok1DRc6Rc5CHT5sY4vEggzGdEAZH2
         8zcg6DQdbzFvgQuV1IY4UroMT3mTJ6ND0hb4ANP/KKLPZg6N3mzWDD7qXJO7qGt/en9l
         wOv2a2tZO3EGwWbPv3o/ccYp9axB8pq7IY+LvUc8UFmgFDE6uwz3H7o7Wr+hNwbW4xhi
         HKDhDq5GvhQ6StlQoiP+hrYa0MOK40f9tNTIKfTm4KPV75z2oivigdB8Rrk7KVeuX6kq
         j9GiS3zD3yk7osskPeAqefBeWoCZggjHNG33HPhypU4clRdC6ftaboM6j+ZFF0pUQ9KG
         wLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679734855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=nRwf43fyYnBMuDNq6DUbrmYoIy+/xUxI9zrEWbOOxCTCLB0h9NqRseQaJa9PYCsl8/
         KxnrAkj3WrOh6G75pilSfTNG/P30bk9lCu1YS06daQeYqL8lT07yZabJl9VMww66Vcb2
         tJX9ZaYaRYDe1cxL9CsI949Mb9U0iw8CbZoUW4H1uaBYu8h2CSl9pp7M9UqTxfSo/IWA
         KBsslplIicUK3R4qx8HG1dWzOd1uBxBNjfxRkD04PoZ1cL72C6/YaM5GOQqiogSWKUj0
         tSIyko2x66DqCNqc2El5uKxD6czCUYaec+NqPzsBK9wqbgfWgG3KtRdlXn5T+u7mo3c/
         wgPA==
X-Gm-Message-State: AAQBX9dizZBKZKGKheER/LNe+IF51xe8HqkujoUL6zfA0Axd42HFkHqq
	smuvKRrAn9z0XrhR8e5meJmksxZ5GRw=
X-Google-Smtp-Source: AKy350ZhRcXXByObXxfc+vQ+VWNlXN8qSYyaglP+eCCYrf0hcQA+0RfrxPtNPlIZYDyE2wt3PXESVQ==
X-Received: by 2002:a5d:40cd:0:b0:2ce:da65:1e1d with SMTP id b13-20020a5d40cd000000b002ceda651e1dmr7376017wrq.24.1679734854648;
        Sat, 25 Mar 2023 02:00:54 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:a02e:c702:681f:71a5])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002c56179d39esm20226621wrs.44.2023.03.25.02.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 02:00:54 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH 2/5] cargo_common.bbclass: add support of user in url for patch
Date: Sat, 25 Mar 2023 10:00:32 +0100
Message-Id: <f13057b84bea1e0a3569861703a9041b3656dc32.1679734210.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679734210.git.frederic.martinsons@gmail.com>
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 09:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179091

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


