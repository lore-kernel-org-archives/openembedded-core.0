Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3401AC28B24
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 17:44:51 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.14923.1741363973497639213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=YzEABPqb;
 spf=pass (domain: remarkable.no, ip: 209.85.208.171, mailfrom: victor.hansen@remarkable.no)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30beef77634so9425801fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1741363971; x=1741968771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/WB9HyWsqXPCQ6rG81t3zlRS1zqn79TtxM7lOmcqmg=;
        b=YzEABPqbFPwl2ZejHc+aQC5CcDbtNTtQofYW7UfqOEbaZxWXH1IegGpNt1MXueSm5E
         W81Pcng2Lxx1fVFJW0Hjbdh66JCmY551weAyW80jJk2jtHfXUDFfVfqld2RS9KcR3wkn
         I9Uh4jnqdCWQsRzXiOJoofaN/EvwepIkH5AwzTJ0jmORM0eimS2diQOJuIO6e/fvHIMW
         hUjP01b10jum5eqkqZdwp5NR4GJpPW7O/ayK3q4kYe+EPhVFAC6L2VZmhf5arg+GZnRD
         MrwEt0vsaPeb4C8MwV8f+nriarIwuGltgRTkClJsI3MYTuCJoKqmlohL5Amur0cM/nbU
         vZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363971; x=1741968771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/WB9HyWsqXPCQ6rG81t3zlRS1zqn79TtxM7lOmcqmg=;
        b=V2hjFbE5TORa3o65lmULukSxvM8TIhnAxwFn7dHlfXAgHhNJtSTYMGvTEmimoKVU6F
         oJFQ0zTVPj3q05pkIVegcQgeQzu1taQSQ9kv6PfZZ9hUhffoYyVDyaQ3pv16VC7RwY7e
         6MLtKEs5aLhcaeXGe+j5ONgt4dX8acmYtN7fjqFEAn5R8hsVglEI92t72l2VLVEyqfHC
         a3ZoAp5nHKpN73mR0Dm1xCOoxCIJ6+6UAlAlxXqFdJNqaprpbAe5A1VBknukPXYT3+q9
         6tnZ528kT+mnyXwac60HFbP9LFXJWpy2xXudGH4OSpPiUetFl3w4fgY0EMqnIzurJdUq
         1NpQ==
X-Gm-Message-State: AOJu0Yy32PsR4gJ2cKzv9HWECwnrJo5S2V9f9IMPnaK0wcOKGVA5nI7Y
	PxwNFUElVaQhzRS1YF0BWjf+7NCyJfI/LxDl8ZFVJhKXpyVahh/isCGrla2OcpswKgE6J/W8GXA
	PrNg=
X-Gm-Gg: ASbGncs4dmMR2+jl6Zo+lTapEfIiGbTj4gxgrloRmQCzI3UaPESAsD0w3BcfdkbI7Iw
	UJwyWw7AHBvUhrROqrfh4uGbptTSZn7nyOvxkYal5zNqjzQj0VwZ5gW6ah6s6N4ZT21a2ffwfz5
	NB7XMWqPoaQMJzhy67zjqR3DpsZ+WxCvZrNgDVSEG84oR23MlerWgu8q8DDY8ul4qf7BtsbUuLS
	NoZjsU3Q7i9xkB32DnzyiiH9NlH6TxjLJ9X6PO0D2wBkYm0kP508VcYBrTYYyXGsM4SYyRca3Wk
	2OgcskviJ4cP/mBpo68KkHlVBBi4xAJVfv2BCxy5qXSsnSoxkSJ6Ux8Z7VwWDczmBy4Z0oc=
X-Google-Smtp-Source: AGHT+IEGIMK9px2zRDsQlj8AVk4vjcuTnpc4C0By5Vx2VhJbGEdFZ5dlVdaTakcUtYJCrvlqvrPLBw==
X-Received: by 2002:a05:651c:2115:b0:30b:d562:c158 with SMTP id 38308e7fff4ca-30bf451a11bmr15812731fa.14.1741363971435;
        Fri, 07 Mar 2025 08:12:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:799:c96:7901:5b3f:c02c:b0ae:4afc])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c8324sm5807261fa.81.2025.03.07.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:12:51 -0800 (PST)
From: "Victor J. Hansen" <victor.hansen@remarkable.no>
To: openembedded-core@lists.openembedded.org
Cc: "Victor J. Hansen" <victor.hansen@remarkable.no>
Subject: [PATCH] cmake.bbclass: remove whitespace
Date: Fri,  7 Mar 2025 17:12:38 +0100
Message-ID: <20250307161238.821892-1-victor.hansen@remarkable.no>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 17:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212460

Signed-off-by: Victor J. Hansen <victor.hansen@remarkable.no>
---
 meta/classes-recipe/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e79f8a7435..b342deb671 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -170,7 +170,7 @@ OECMAKE_ARGS = "\
     -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LIBEXECDIR:PATH=${@os.path.relpath(d.getVar('libexecdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_SYSCONFDIR:PATH=${sysconfdir} \
-    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.  getVar('prefix') + '/')} \
+    -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=${@os.path.relpath(d.getVar('sharedstatedir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=${localstatedir} \
     -DCMAKE_INSTALL_LIBDIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} \
     -DCMAKE_INSTALL_INCLUDEDIR:PATH=${@os.path.relpath(d.getVar('includedir'), d.getVar('prefix') + '/')} \

