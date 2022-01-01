Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE6C4332F
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.24197.1641036607049759456
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZMy/5rMS;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso15836015wmk.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RPoIPxrMWTDXqFESIE0culmYtK3q0lCAbfDxBJl2AGA=;
        b=ZMy/5rMSCaPJfs6Vl06yeiqz5TlNdpI1zlPZjfT52Lo/D3GDYV+TDYS48+A+N7mvFv
         1N+ZQ2WUD8bzCPgT1o0SSwnMJQqy4awKmgUL9vLsXySUnAUnWmK8WhExCQOxDLBEtwV/
         yTYj5/sPguqjNYhB99IhJX9Bdv0wN/8NhUjHc0nohYkbbMQoI71WDeYemfpRzVphvM6U
         X9zJknHIec+KmfC69/jNgXpFza6s1f/BDtsysUUFz/nAF92kNj2tSCxsOivCGJcK38e1
         UqIhiuW4IAkPlh3T+VgXZVuXnx5uktpqc46aid6l/pEuMiRgo7BxsstIJnCMo9IMHQcv
         N+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RPoIPxrMWTDXqFESIE0culmYtK3q0lCAbfDxBJl2AGA=;
        b=v2SCLRupOr+DCkyL62L4RmmyqYD5CALt17pvGRQuIXgM++Cw0/dGcNjQtZiVKHVY/A
         ip3y1OpjtmMUfONHdQ0YB9KqIL8Kdmk/rYU8BkS8/ZukHkSx4HA4fccqB9RB4guQMAfj
         6djQKRurT2QErk/69Wz5WkkiVzzKm3eOaN80c8XgkCzNSmQ4dnCZtXpUuhTkDx6rynvP
         FHS5gYzVbacCXZbT0zQOJ+9VJwiVaf5smo2bQolZJT4ZUIz6Tse+fAB/j8iHmiN7ePvF
         Z5PT8+voIGdBEWuojc8fCFAM5AC0ErbxSsArWNSnIjP/laFZvAF7+zgDm1/r79wM/rZX
         rA4w==
X-Gm-Message-State: AOAM533N4MgJn8RqcRHyrHmCGPSblUo3sFKsPybVJZNlYTkYlBOZxw8R
	phBnl5bC8NZz8Nqst+IVOCsKeh2rdS8=
X-Google-Smtp-Source: 
 ABdhPJzIPme9h+PXBwelBclhUlrbUtDGcwV72nHeN81nG08lNu5UjmqiW+U1FYL2koIkrs9b90UWOQ==
X-Received: by 2002:a1c:a5c5:: with SMTP id
 o188mr33139197wme.22.1641036605155;
        Sat, 01 Jan 2022 03:30:05 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] lib/oe/reproducible: correctly set .git location when
 recursively looking for git repos
Date: Sat,  1 Jan 2022 12:29:55 +0100
Message-Id: <20220101112959.1866747-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220101112959.1866747-1-alex@linutronix.de>
References: <20220101112959.1866747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160095

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 4fb99d963c..35b8be6d08 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -92,7 +92,7 @@ def find_git_folder(d, sourcedir):
     for root, dirs, files in os.walk(workdir, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
-            return root
+            return os.path.join(root, ".git")
 
     bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
     return None
-- 
2.20.1


