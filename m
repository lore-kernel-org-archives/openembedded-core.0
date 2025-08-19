Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88ACCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:15 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.4433.1755636608802747256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Pj+mY8xu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4743621044so1738838a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636608; x=1756241408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDeoCYOBZ2pO+Xd7XqPQJKOcF/OJYjTwtw5SLJgse10=;
        b=Pj+mY8xuiDN/F0uoUd/Wzuw4fZZ3E/Qv0c+IVJdmt0y1O7Bur37Te4NBp/ZXa8QbCt
         GY9pi/ly4Qcg+drkDYbzAxDwp+8NKZAdlaPdmniLDc8O/ZX7GUPzGtCD5knpdCnI+7QR
         xppPN6QKxNDl6GFftHp1kzeoia4/lCi3MNRAyrYraCz1gUA85mdBZYzDwyrn3k26HlGi
         Ec9APdKflxTmjQVZszm7NBonKa8xtAtB6Jx8qwWvMnqIcNr5IvawmU7SlKxaNq6zA8Gu
         esS9Qr/m7IwmQfmXB+x7kkWYshBHzGtWAkZOYIe7R0Q2e91CX3twc3S9GrJAlYEi+4Mv
         6zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636608; x=1756241408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDeoCYOBZ2pO+Xd7XqPQJKOcF/OJYjTwtw5SLJgse10=;
        b=c3OMp99FEgk6Kojrwx4wrty8fPBDkBbJsAOrFvH2kXygvXQ8Tlc7UoFYp9zuQ3nFBv
         Pt30Az02s5TH3kdTDxQWw8xvM9aJMfZQZFXQdGXNBL4qSgNiu1R/NwVWFrwzc16MQhFf
         Xoi7pPewfFSAKIkqfHSpQpTZaunVCyYtnYW2wDUwELRDcp4NoFJxuw7B94FfyGR4x6Eb
         WLZFqrSolzxmjmPhqcJVcr5T6A5xC25fMn3P1m57HmNf0/pC2jq8E5LJszJRG93jmWx2
         ikcxiKec8DEwf8kbuvHFYBxAWDWvqntUXrMYBfya9MgnaGN8wxdRvtlGwb54M/ouDz9i
         Bo1w==
X-Gm-Message-State: AOJu0YyHbf+iZwn+rVs4dkrk9AosJ/k/oxTrgCqMDPaAHjZKD1eJGjsk
	aFcZvxC9NNGu7zVN9lBnMeoUWmWd/M8uB8e2Ric2LSC099PIOL8RJUfjjI5SXTpf0+uROs7qIns
	PbcD6
X-Gm-Gg: ASbGncvP1LVj6Y/9TyYSzjSkEE8UUghdJdElEN6E4A2LDjQauhaW5GLbkUk3Rt436Kc
	C8Lx25mZ3zjyMq8eEgO4yXks4GMIWR48Q6JHasOFYPH2ATcpbKttmOtuom172o7GGwRZWD60dL4
	qg7E5acpPr72bSOsDmC4WMYsypx0WcUcZOiVxXgl2vOUcZz1vvuA4AvAQ6w6gdgAm3GXEUMuhvW
	6rPCNZtm7b33KCWUpVA4P5Dv8VTZgl7FYN51OzpMhzeZqOPw7nqdF407mHO6lGzozGJHP08OO2J
	MduAveUsHdGvR0do6sC0Dq8mQzdW/NEZPynovJ4LYdvnNMnyF8JrVrwu3NrNDPFSEHZSi1O37il
	SmrGUfjRN2K79pg==
X-Google-Smtp-Source: AGHT+IEt+QLFKD/9GaWhF1W4U2djxUKJTV6UZWighD4KEMm5Xt0VZKly25g8bwL1DtIdSjOpJVLcxg==
X-Received: by 2002:a17:902:ce83:b0:240:2774:8372 with SMTP id d9443c01a7336-245ef234300mr3520205ad.36.1755636607971;
        Tue, 19 Aug 2025 13:50:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] xserver-xorg: Fix for CVE-2025-49177
Date: Tue, 19 Aug 2025 13:49:45 -0700
Message-ID: <b876a8c8dc9ffe288a41b18a61b4758ec52a115e.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222145

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2025-49177.patch         | 54 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch
new file mode 100644
index 0000000000..d71d97d3c2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49177.patch
@@ -0,0 +1,54 @@
+From ab02fb96b1c701c3bb47617d965522c34befa6af Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:05:36 +0200
+Subject: [PATCH] xfixes: Check request length for SetClientDisconnectMode
+
+The handler of XFixesSetClientDisconnectMode does not check the client
+request length.
+
+A client could send a shorter request and read data from a former
+request.
+
+Fix the issue by checking the request size matches.
+
+CVE-2025-49177
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Fixes: e167299f6 - xfixes: Add ClientDisconnectMode
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af]
+CVE: CVE-2025-49177
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xfixes/disconnect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfixes/disconnect.c b/xfixes/disconnect.c
+index 7793272..209e3d8 100644
+--- a/xfixes/disconnect.c
++++ b/xfixes/disconnect.c
+@@ -67,6 +67,7 @@ ProcXFixesSetClientDisconnectMode(ClientPtr client)
+     ClientDisconnectPtr pDisconnect = GetClientDisconnect(client);
+ 
+     REQUEST(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+ 
+     pDisconnect->disconnect_mode = stuff->disconnect_mode;
+ 
+@@ -80,7 +81,7 @@ SProcXFixesSetClientDisconnectMode(ClientPtr client)
+ 
+     swaps(&stuff->length);
+ 
+-    REQUEST_AT_LEAST_SIZE(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+ 
+     swapl(&stuff->disconnect_mode);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 6013d0e53c..1fceec89f7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49175.patch \
            file://CVE-2025-49176-1.patch \
            file://CVE-2025-49176-2.patch \
+           file://CVE-2025-49177.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


