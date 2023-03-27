Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE02C761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.29698.1679904761586222892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtYJBPAh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4595390wmo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679904760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=VtYJBPAh7ggpXDRNT8DsRG65CiO2WoVvBwIphCkpaxonfJ32h92W3RV6s9pyKSBvKd
         CcrNxIBdF9ellTmV9Rb3XHcQJiidQCBP1DcKiG33ZGbWfcGN9I6jnnKtFdL4gW8w3Tud
         Jbe2QKhzEFIa1q4KfSt1AJQugceJ6CdaBM+p/YG5NK9hJDEHR5WQw95cGee8I9PPaAsn
         Tzx0WntNvLA3T+GN7MXjHCsoEKP4/OAntRzpMcnTW81v9F+FgPvLHP8tqy7DKNWzh04q
         QdYOz6j3IUbhVeUwPecHKZ28n1FMrYHp/ddKfb3LyWtBeOG4AbnIYKqYJsRIhSvD1jep
         ENXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=8NwUqR7kYlsqf5iI0SmAbqcfYKwrlf9wLxANeBe9GU6cbg/b4uS6ovnpqwc/N4D8fL
         UoZWXTYERBUaqfEvHmA/2pSRs5zb4s1T89kzJHWY/3o1C6VK3bbZ4Ducv1u0t3qCzXPF
         Vz0Up1ZPL/jKlWhP7nE159Wv4Y0NhwK21kebyitXnwgMINIdZtVcKGiYPmnQC4h3iKrT
         tguSlaA6qtL+OEubaWnG93Y9cgkT5oW30WfkExA6w7GYqjikcDo6Trd22HD1j1a0L2vQ
         hblViqOF7zsOWBALBLMo1o3eu2REnUimO/aZXC7qSqryV8Two5OPXQVG2GnymRlAk9BN
         xYbQ==
X-Gm-Message-State: AO0yUKUxu2ucjtH/WOt9jJlle2O/aStRyCzeOHGhdbwTnm0BwKcbUCF4
	bv2pI8tOf4QWLBOnNOrYkYZ8TmNixKY=
X-Google-Smtp-Source: AK7set9raGDSYwz+5NPw4IebRfaWB7dItfv+T7hxgVyPybn84n+fZHzrV3YI8IVl27I8+hXhlpdjhA==
X-Received: by 2002:a1c:7716:0:b0:3ee:526f:b15e with SMTP id t22-20020a1c7716000000b003ee526fb15emr8403010wmi.23.1679904759699;
        Mon, 27 Mar 2023 01:12:39 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e313:787e:85a7:511b])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm6186380wmq.43.2023.03.27.01.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:12:39 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV3 2/4] cargo_common.bbclass: add support of user in url for patch
Date: Mon, 27 Mar 2023 10:12:33 +0200
Message-Id: <4ced6feed495f18a54a072713544de6c84964d9d.1679904677.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679904677.git.frederic.martinsons@gmail.com>
References: <cover.1679904677.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179142

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


