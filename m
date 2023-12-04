Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CCCC10F09
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.72246.1701703576275089697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JT5DH+tr;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c08af319cso17432035e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703574; x=1702308374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc6Qr+QyoV76QwdroYpOrzxahT28GhtB7MPw3CWaRSA=;
        b=JT5DH+trfyO89cr/XWhkcC8RLQlp3Lh9+cCTWlJYqoFwHAzrz9Qb7ajdbLGpkjsDhh
         LE5ntEjogNY5QBJZjP7GS+8vy6TyZIFeHs6qxzzF4kh7vW79tM44S0jFRLNkCiHVSX/9
         JrOU1FIYRUI1zGXYl1rU3t6vVm9qNEXonIZH/FC1fRjfkUSiR1/NhmtP3Inq3hxpt7uo
         jC2fsOYkzUuMmM6hz7FsivK+HnSXNHk+VEKzatF2ix+a21jtJeNTei7P1pWbK4kinwBJ
         TM4ijLSp5dptPdnrp/xAnzsljfA/y/Bv/SYcZs0HEfKheNpElHFAANOWEb8l1Yt8FOkA
         LEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703574; x=1702308374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dc6Qr+QyoV76QwdroYpOrzxahT28GhtB7MPw3CWaRSA=;
        b=kzuEWlDeNeU/mLnalq4SnKciaT3XC68kdGW1tWBLzoU6qwEqzKtJOvuP3Ki3BPmrqr
         VRQ5AJUaLRt1eOaboKXm3Qjrk8WnwKQ/iijE6/4ZWdwP4xwK20s4Sc3PXvyDSVwbsL2m
         TdBTRdVDcJj4sw46lYInXvfBzlYqWJXXbJcsuM7dch8Aer+5dk29sJP9mEua4gaAkRcd
         JAv+Mn8UW9hpl25hzmcHedFAIGwKfTvGjdvrN7S7kzhTdMazpoAsruE8k7HkdpKs3bKn
         oFqYP3xmmE6SH0eT7fgGUOFqNdURaYaGv9BhD6tQHNLyEdFg+Ts1ikR/dfmWrn85+k9l
         dpDw==
X-Gm-Message-State: AOJu0YwwR52a3jLZx/YFrjCxNxKau1wLHdU0S13DeE2Fr4+pN6HZzpFZ
	r9AlVVO+g/vn4LH5mApaLW553qts/0F75t4tQRY/3g==
X-Google-Smtp-Source: AGHT+IHNO+TJouP3Pl7atwrYFiCwQhY0RrACm7PXXvSrpkd5zF9xJAgL+AneFUr/BW8BoWy8K1iNPQ==
X-Received: by 2002:a05:6000:71e:b0:333:4cfa:1dc4 with SMTP id bs30-20020a056000071e00b003334cfa1dc4mr930065wrb.75.1701703574030;
        Mon, 04 Dec 2023 07:26:14 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 4/9] recipeutils: bbappend_recipe: remove old srcuri entry if parameters are different
Date: Mon,  4 Dec 2023 16:25:58 +0100
Message-ID: <20231204152603.831495-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191747

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
index 9784ae3b031..8aa82396c86 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -774,14 +774,22 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
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
             copyfiles[newfile] = srcfile
             if install:
-- 
2.42.0


