Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AD2C48BF1
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.18140.1708013921660086882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RKT2vgyL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d72f71f222so8518245ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013921; x=1708618721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rCiX4Fbwb0SPavm0nSLqDzhoRrAhTKopN7jN0llRZc=;
        b=RKT2vgyLtJzJaQwvn+o/O/TqSZ99xV7eCARNH/naZzyQ2jXW//TFymK08/2cqd4qbR
         s2r6piPZR/OaERLb7qkZBoiyesocjwzm6QnpqyKIF0FJuU5BDyLlX8kR7y03wULlwKQD
         lA9P9AYukhr1qVE8d3Z1K74dGLShy/1xV0d7HlVc1DXhUfiZFOH3wsQcqkoUZfYOZFx/
         YZtgXQ/xdyl78IzO6CURYAXllairSLzt4sM4504b0iJSledqDnX7HAaFsdtzjEWBMll2
         gQgyANGJX3HOO08UcynrjuZTmw9jtBCIGSSPG3ALLocKCyehq8gxUEYsr7p9WLkGh5XI
         JMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013921; x=1708618721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rCiX4Fbwb0SPavm0nSLqDzhoRrAhTKopN7jN0llRZc=;
        b=rLLwZnR3Toeer5PsVblOMnjQ8JRaFJ9XePcZ9T59/4nDuq4kcql7Or4mJeWlvwgtbq
         zvWGxx/zoPBezmfjkhv17J6Z1nkaDfAygEIlTGcFQjwxk93gCyibTcYcsfoMgIcMVmhO
         S/1BrzCYmmeP67zI1SjzOg7ZV4FpLNwBJiIlkZTVne8J/ID79ovMuQtXC4m2k8nVpbeo
         hN96T4cdSUjaoENSZIaOwHKawXz30x0DSNSSWl4dWiUuWe50X9r3GoIpps7GMZyO55Wa
         qdkR4q13F52hy7G68Lqb6d/3UTADlz7oJVXG3KA/dfz5Z1tRlGajGDLc4WFVBCRTPibz
         nTIQ==
X-Gm-Message-State: AOJu0Ywj9k6hRl8HlQ3QO4NvOLMviq9cm8KALvXU5FGCr4kArc/f8BV+
	ldl9tHevaguxZGOelpZmo1LNc62/aVXb7rYdSoQAqK4invXk17KIASENy2GuZAns1nC/bMipBMj
	yrBM=
X-Google-Smtp-Source: AGHT+IFlTQfG3vMPlbur4BPPAFzAeD9NJTXbKvUkTSIM4Gz0wSK5A6JLcvzalEsc2y2Tcsisc7rY5g==
X-Received: by 2002:a17:902:b20a:b0:1d9:a647:5579 with SMTP id t10-20020a170902b20a00b001d9a6475579mr1984136plr.1.1708013921025;
        Thu, 15 Feb 2024 08:18:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 16/21] reproducible: Fix race with externalsrc/devtool over lockfile
Date: Thu, 15 Feb 2024 06:17:59 -1000
Message-Id: <6bb824019fd7335a10fdcebf7d301c101d60ad61.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195536

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We occasionally see races over the lockfile used by externalsrc/devtool
when walking files for the source_date_epock calculation. Skip this file
if present to avoid the issues and fix a real issue where SDE could be
contaminated too.

[YOCTO #14921]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4bc0eb4bd90e6e6e46581a8ed367212bdd910a26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 9ac75c02e3..448befce33 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -131,6 +131,9 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         files = [f for f in files if not f[0] == '.']
 
         for fname in files:
+            if fname == "singletask.lock":
+                 # Ignore externalsrc/devtool lockfile [YOCTO #14921]
+                 continue
             filename = os.path.join(root, fname)
             try:
                 mtime = int(os.lstat(filename).st_mtime)
-- 
2.34.1


