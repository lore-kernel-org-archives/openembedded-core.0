Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A893CA9ED0
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23573.1791708084677141629
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mCEnE59J;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c45111bebso504949f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708083; x=1792312883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xaVOYYJnet0FXo0a8dHgLWS6KaTeqx+rT/yOXsv3fgE=;
        b=mCEnE59JWMn3GBS9orlunH0XxG/+VfCJbjRFSRtvThCYVujzsPNRK8ZnId/wFl0y8M
         /0k/qNJvskM/3pT1FnydXQJlyWfLCLOW7KllmBGYHCnmxeZ8J3+a1vt74+4OxgtDkgGM
         n+PL4C0NhZ/UE+Foo9SQKUfS4TES2ouNv1LNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708083; x=1792312883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xaVOYYJnet0FXo0a8dHgLWS6KaTeqx+rT/yOXsv3fgE=;
        b=WHQFCJiew13lKNrGwOsf7v93v8vsHNehZqwJdY9UP88ylZJGi0DOzpka1TKzgxGmCN
         mCu5jB+oxZ/XwEZbuYlwFP6ZnvH8q4RnY/M3/0dVyTpgaox+ykCWBlFLK3s/X2Uw+dVN
         10/dHCB31Wac1WLYJOyINRZ0eNe7P5flUQtdTvx8DEZjKssoTgY5GnGR60Vg0gAU0X69
         aReF8dHbd4zyfTSnSTl3EGpaHXSX3QXR1tjTIqAxOuAfLF48pFSR8KQZHiq5nK4CVhyU
         Z4pyNKAH6qPazVlFv8z8YIqDtiSBOvBSh9i22xturz1fg0KrhJzHWYXsLe2+MrEYkX7u
         2ulw==
X-Gm-Message-State: AFq9FYK+2/d0QOmYLsgbguhDNX3v6Cc/RZLL8KYTgNNGvI4IohGXFlIh
	wxF1/pqXyXvGPr+ohEPkIxvyWcrmerIh+ZFWO3vE0aFmjm+T73m6hie39cVVDt4LBEjM3mtU2xp
	pFs3SURY=
X-Gm-Gg: AYBFou3sDqMRIFu+6+YatMhRFx9rfpf0PE0gvRp+yMOgLoF8059ZDw9P6VuiOkgf4bM
	NyhGVViB98uAvp7YH4AqULixbB2SR9ItnK7S4P5GrXCLHi2qxB8pryj1WTjRFyBU177tzr5p68T
	vHjasQNdXC30ERTbxOdVdWhAbKOljSG6bEBmLo4xC8xBKDP3GOLbzztnKIp53NeWAUoxgXEy441
	1y5oe/MH1I4HZ6QikPjRSaB8lVlFSVeAlgK+qeQMWhyZTg1Mar+kdDGy7j3UctvYjSqTZNqBYLr
	uTRwffB9hzUrTbIJoPxe1kDtZXunTuYCWd1Hj+jpOYVIT5eFpngYI5IPZM/vOxakxhAQ90wEArN
	S2Wjga+m7hz4vFl39SHq8OgFAq6SwaLHHcaPMjxzvNjMiNVHpHutnoFGUwTHLh+I8v8XIERSeue
	sYrQf5qpzFkAnDtuTb8to6oaxV+8FygCK80HSrTQD5zwuZfioY290uP4xjdVzP++MwG3+yJLJXK
	rqloCLDWusQNBbc9pg+Z2KklD2pxHJTEnXDpjFNVDE5fzubsiXePzAhR1xRncnfM0sKBE7E8g==
X-Received: by 2002:a05:600c:698d:b0:4a1:98ed:7a79 with SMTP id 5b1f17b1804b1-4a198ed7aecmr29123635e9.8.1791708082943;
        Sun, 11 Oct 2026 01:41:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/60] python3-click: depend on python3-shell for shlex
Date: Sun, 11 Oct 2026 10:40:07 +0200
Message-ID: <39904a443d351da342109c6be23e77286e1949f0.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247543

From: Darsh Kelaiya <dkelaiya@cisco.com>

Click 8.3.3 imports shlex when loading _termui_impl. OE packages
shlex.py in python3-shell, so add it to the main package's runtime
dependencies. Confirmed module ownership in python3-manifest.json.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8dded0894fdb2c17ab8f8cb2f13f9f95638d493e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: updated Click version to match wrynose's ]
---
 meta/recipes-devtools/python/python3-click_8.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.3.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
index 9e80f8aff0f..44612cb8f3e 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -30,6 +30,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
+    python3-shell \
     "
 RDEPENDS:${PN}-ptest += "coreutils less"
 

