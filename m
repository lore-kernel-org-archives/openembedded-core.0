Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FE7C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:13:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.532.1784153593038975753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 15:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NXBHgzc+;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51bf2479349so50021941cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153592; x=1784758392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyYa6f7hFHI8mU762ysNeDHWi/pTuaG5NGgybIb9+38=;
        b=NXBHgzc++9mXj6uLMSRjDpg/DfcI5AccCGN/e5QHfYCH/H3yZ0QwCLSnwYOepXsgkE
         W1hp61GQP8r1awStJVcdwRC1CSIW2VP0P2PHrtmHCdbHS+dfxqlSVk9VT39BSRsqMNXm
         sEejl5FJ4FwegB7/Y+01SAVleaJMPZgygml7g7okdMdgPKQj8PDjpDBo0tra5/ke1bJJ
         MwLvlMFME6pNssHkTOoBxZPODmdx9hsklIDcuqk7o7h0smCAKHHAk1qVpJeDRaX2m0wt
         QIA1Rzsb6hnB0XAAT+UQ61wjsK3bw7NciGJBogyfIs2SGY2XWH8HHPfOEWXMsQc5QRY2
         E1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153592; x=1784758392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NyYa6f7hFHI8mU762ysNeDHWi/pTuaG5NGgybIb9+38=;
        b=lzD93bR8vBBvbw4IBHyUydKxjbLfyK+vKLiKrvvqyyWR+DfPPZ73+D0STlZZBgbH2e
         deASfQ6JaMMPC338wrEWY/s9Iko79/FMe7h0dNxJQXMwuJeZiKUv72MG/YfxVV7cQq2+
         LVU4O4tBAwqNBDXh1+uIhg2TjVY6wBOohVzyPJrvxq4DH11rM6k2TagQhI68zSadIifJ
         FaQd1z1nekW8m2+nCs5nTOTWS59kx/GJ9WsyKsWLJNG78Y3GmbShVRFcILacx79FfyHg
         9JKTxIthbTb0TQM6Z/xYEcKfW8ZuDgBEJQ6lFYnCywEkpL4JNjQGyCeRpY51BJJRpeF2
         b68Q==
X-Gm-Message-State: AOJu0YwexERMavYRfgNCcLIQDPqYJyKMnh2CUGN594WdA8CRHcmNUu3l
	2I3t3Jlb5zpC2uW31tE0OmqKW4M0WePfbbdH1WgIcMyDwB4T8TmKoIhqpaftew==
X-Gm-Gg: AfdE7cmQuS7W7Ls2di9d8+UcdPDsOrLpZ4DA3NuVGZAqVWoGit/hUYG63FX3GPSCdBG
	/yTbYly7LD71GOdEF7eWqftjWmUmma7mQSnYrCpWMdjW+AwpboWIpvx57HjitH9Nvvsjx2DEQLE
	P8M1EU0baY2FwZnTZOnxA2V3k+6a3jYuqrra43jKfyo7zZLKPdiFmyK/fFT4w+Vr8yNVdZ0EkLa
	91v1xNeyGqBjlq9wuZzWDKukdEKaecJwuuIx+F+d8nEqQL8a95x4rKYBw1hZzQqP4Hd7RvIhpbJ
	NE2ebEYgoKIOTcCIIQkErM2tnmdW348dIP1nh1THp2XUYdA9TmU7G1mf6IooHD1GULfYpTghPMC
	fYxX9ZioI2YWBsRJRrlxEqGL3TmWvBKrpG3HTanpo7jDaGYrl2qNI8qvsnOu6hzumpqqIQk7vXq
	3hb6psa8W5XjTXPYKIYQONt/eIWJIW4w7RtiJPDQEDdgcq
X-Received: by 2002:a05:622a:190c:b0:516:d955:ea2 with SMTP id d75a77b69052e-51e4217e650mr83179851cf.0.1784153591591;
        Wed, 15 Jul 2026 15:13:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm204822086d6.9.2026.07.15.15.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:13:10 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oe/path: canonicalize('') should return '' rather than the cwd
Date: Wed, 15 Jul 2026 18:12:51 -0400
Message-ID: <20260715221252.3369108-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715221252.3369108-1-twoerner@gmail.com>
References: <20260715221252.3369108-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 22:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241046

canonicalize() splits its input on the separator and runs each token
through os.path.realpath(). os.path.realpath('') returns the current
working directory, so canonicalize('') and canonicalize(None) wrongly
produced the cwd instead of an empty string, and a stray separator (for
example "a,,b") injected a spurious cwd entry into the result.

Skip empty tokens alongside the existing unexpanded-variable skip so only
real paths are canonicalized.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oe/path.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 44a9ff9d0757..7255d99bc2f7 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -356,7 +356,11 @@ def canonicalize(paths, sep=','):
     # prefixes in sting compares later on, where the slashes then are important.
     canonical_paths = []
     for path in (paths or '').split(sep):
-        if '$' not in path:
+        # Skip empty tokens as well as unexpanded bitbake variables: an
+        # empty path would otherwise reach os.path.realpath(''), which
+        # returns the current working directory, so canonicalize('') or
+        # canonicalize(None) would wrongly produce the cwd instead of ''.
+        if path and '$' not in path:
             trailing_slash = path.endswith('/') and '/' or ''
             canonical_paths.append(os.path.realpath(path) + trailing_slash)
 
-- 
2.50.0.173.g8b6f19ccfc3a


