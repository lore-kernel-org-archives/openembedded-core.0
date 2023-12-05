Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A8FC46CA0
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.101430.1701788209726171302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FYASao7/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.50, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so5016051f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788207; x=1702393007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+3figiPx80GXRWVP2kog25nPpVCg8Mmn1SmSOOGvZE=;
        b=FYASao7/tSJjC7ZVG8h1mkL8uoV39OFh8mec3cryijk4uoSyJ9Ef79m235Ng9B/Jvb
         qugkjmcy5ufiJOZxZV9Vjgr5aJCe1ufwCoZM3ucmLdaBqHiQNVHGduKT9TpyIiYBJwr4
         eKQNoTJxP2khYRwK+Uup2xBm/5Jf5pt+LURVCJ6U5ihOuMKsu/D0XggECFsKwrt4RPEU
         +okRYsBiTCsZRG7ltnUmMX7NCTGodl2+5ZGUIqa98yCm53AkqSSQjr/Ncu7TgSeXVMMc
         6XW9RU31NV4rL9a1HCjNvbV1ffaDTI5lwMoB7kNfGKJ661Wq1u1lPEjK3dH0S8DiqdTN
         xNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788207; x=1702393007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+3figiPx80GXRWVP2kog25nPpVCg8Mmn1SmSOOGvZE=;
        b=vlKkmTtXr8rG6Fi9Q7OmeWecJUwc9k4qLNbdtEbLAQi3A5EVRCQ36dOhfsElZvW8Ho
         37zWOKLwprtWXKnqCQj8Aaj4unwwNf1ngWFvWaE78rYXJTZKmz95DtjmJqgWW6tNmw6J
         ZxVUR0Q4plaCcD2p0xTc5A5vx3AbSBxUAAPbUtALfj//pE8Uf2zwFsafnYnXpoDw5H8D
         LPiK1k13QCVJFrfEW3ONboFFv+jRU8ccBpft4IxiB8zZvImtHif1WEzJ28HYxqFXmhIr
         Ri4vSuWFQsg/k/ZmM3EUNJh8nPB9EApofT+xhftjBXhq1t0gmbB7sXb/TOu3DkmwQrM/
         W06A==
X-Gm-Message-State: AOJu0YyOZQIhvZav8ST1hdH4HT+UZ5oepQVWdKcOQDFzQazfWJJa53QT
	DbhrBhRZAerBz+L2ro71fj3OTMLtzMXRDKHUKRymtw==
X-Google-Smtp-Source: AGHT+IEMOcshiAcSWj46gVwq7Hl8sddfyQhy0BH0+alc0uyQIu8wWU7X3uYsL/UQ3tMW2aN1webruA==
X-Received: by 2002:a5d:5f96:0:b0:333:4ac2:fe2d with SMTP id dr22-20020a5d5f96000000b003334ac2fe2dmr1767030wrb.54.1701788207501;
        Tue, 05 Dec 2023 06:56:47 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:46 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 05/10] recipeutils: bbappend_recipe: remove old srcuri entry if parameters are different
Date: Tue,  5 Dec 2023 15:56:31 +0100
Message-ID: <20231205145636.960819-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191834

Currently we do not add a new src_ury entry if the entry already exists
AND the parameters are the same.

I believe that when an entry already exist with different parameters,
we should remove it and add the new entry otherwise we end up with two
entries with different parameters

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1d793693bfd..d86873056fe 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -776,14 +776,22 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                 else:
                     srcfile = os.path.basename(newfile)
                 srcurientry = 'file://%s' % srcfile
+                oldentry = None
+                for uri in rd.getVar('SRC_URI').split():
+                    if srcurientry in uri:
+                        oldentry = uri
                 if params and params[i]:
                     srcurientry = '%s;%s' % (srcurientry, ';'.join('%s=%s' % (k,v) for k,v in params[i].items()))
                 # Double-check it's not there already
                 # FIXME do we care if the entry is added by another bbappend that might go away?
                 if not srcurientry in rd.getVar('SRC_URI').split():
                     if machine:
+                        if oldentry:
+                            appendline('SRC_URI:remove%s' % appendoverride, '=', ' ' + oldentry)
                         appendline('SRC_URI:append%s' % appendoverride, '=', ' ' + srcurientry)
                     else:
+                        if oldentry:
+                            appendline('SRC_URI:remove', '=', oldentry)
                         appendline('SRC_URI', '+=', srcurientry)
                 param['path'] = srcfile
             else:
-- 
2.42.0


