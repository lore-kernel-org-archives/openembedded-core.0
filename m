Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7961CA0FEB
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:46 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.64674.1756215882523984260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0RfDXjMd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2460757107bso51562825ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215882; x=1756820682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMXfFewiUZjpZI3k3KO6PhnhfLOmN9mvjc0YE1dPsRo=;
        b=0RfDXjMdkZ2RS/rK2B/qcS3pTFIRDxVO8CoHFkfLz1wfoHLtAsGHSBSypUCqup1buH
         YRNGZvzcTj4lU3q4zYAEqPLvEm3zBuQG5OZ+CxSiAHG+LqIN/oGQ1CKlomC4Q1chEzsf
         iv1b3EAhLY4rH02dpHKx88uTe09BTPXFApJo2E5WBmA1MIUkeNLGYxchkLX0nM/HYtbl
         x2CpLCM+M0FZlh9hR4+ydcRPCpfhJqd2fiMQswjOZuWrwD8kh3yrtRz5g+tE6rRQLfCT
         79kbnvntTrx3sy++xaEHAPLi6FCSzs521zsntVqRHN1Y3bG0JOBrBv5yvB4k0zIwjNuy
         smRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215882; x=1756820682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMXfFewiUZjpZI3k3KO6PhnhfLOmN9mvjc0YE1dPsRo=;
        b=DbmUi6JjKOIvbonhqzcO+QU4VnD5eDll9tXE0tkKpRALHyEGwV5HGXD+349H4niTXG
         2NC+DBwXGgvOfCau8rq5GeodtNHYddxYuwrXBNhtCw1uSvTIRdbKmexDK+RxCgK2gdSt
         Z2XTVYNtXmLTVNRPJUtY8T3qwnVjm6rQyRcfaqiz583pozJIqYCANOruA0KGvtHt/yHe
         TX/XcJqzokAc00AlRaUXN83Ob/Mat2DzpyA1nIUYwGvdll8N4z54J6suHlZMMOov7BeV
         94F/rPlfPJDDUhc2LMxj73Pok8zCOuFmbsUTOPFMw0a8iEXLHv4d+0nyi77tulYbkDmx
         NVLQ==
X-Gm-Message-State: AOJu0Yx2+kEzl2K7J/jhICK/Xoem0me5RIN8uYp0m+LNjY11az1NZ2A0
	oCTf3VzVnfhKned+2AYNUEV6CfMV4d6N51J/IN5vS6qE75+0aB9snWfqa6a5GeG5Ks9axdJcR0I
	gYSah
X-Gm-Gg: ASbGncsCqSOSGbnWm1lyIr+vdjE9HqMcCG9PFOhHXzUVi6dbgWmU5tdXQtJBchfMtXD
	73OB9ywVhSIyK3cPg1oRL7NgqsbsPaBhJbqwO9G/2MLJc4f1QnVaYs448zKa0aJu3TLzqfWbRu8
	RsHrsOEcmyHoQ5FotuqD2IOXm64Tj8XbaDYnXt2PBrUMOiUuQzRKlpfwP5bQHknj9fjtkEw03bc
	LNOcSTm6BTBZa1oxKGHbJlI1NnIIMOF61/xWGnKmQXk2XArYSOnBg0Rzg6g949y7eYz6Uicek59
	YwtrEdW92JMTQmGF75ZsxUFx7kHPL7eqoT5HQI5EGVvEGc7x2H7bF5mHjBGgxEBAU5tqrWYUIBh
	R5VFVgBK7kkJ/1w==
X-Google-Smtp-Source: AGHT+IGUHXZZjA/iyk68gkcGz6LLNUbzuwQIclz2xqCsGV906LzwzckxIkjrIVpIqqxfmYLA69KCQg==
X-Received: by 2002:a17:903:98b:b0:246:de32:10d2 with SMTP id d9443c01a7336-246de32149dmr94801585ad.15.1756215881642;
        Tue, 26 Aug 2025 06:44:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] xserver-xorg: Fix for CVE-2025-49178
Date: Tue, 26 Aug 2025 06:44:24 -0700
Message-ID: <8d29231af51de235b99be0eeb71dfab41d67589d.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222463

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2025-49178.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch
new file mode 100644
index 0000000000..ce3e2f415f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49178.patch
@@ -0,0 +1,49 @@
+From d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:46:03 +0200
+Subject: [PATCH] os: Account for bytes to ignore when sharing input buffer
+
+When reading requests from the clients, the input buffer might be shared
+and used between different clients.
+
+If a given client sends a full request with non-zero bytes to ignore,
+the bytes to ignore may still be non-zero even though the request is
+full, in which case the buffer could be shared with another client who's
+request will not be processed because of those bytes to ignore, leading
+to a possible hang of the other client request.
+
+To avoid the issue, make sure we have zero bytes to ignore left in the
+input request when sharing the input buffer with another client.
+
+CVE-2025-49178
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2]
+CVE: CVE-2025-49178
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ os/io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os/io.c b/os/io.c
+index 3e39c10e6f..e7b76b9cea 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -441,7 +441,7 @@ ReadRequestFromClient(ClientPtr client)
+      */
+ 
+     gotnow -= needed;
+-    if (!gotnow)
++    if (!gotnow && !oci->ignoreBytes)
+         AvailableInput = oc;
+     if (move_header) {
+         if (client->req_len < bytes_to_int32(sizeof(xBigReq) - sizeof(xReq))) {
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 1fceec89f7..67e146bf97 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49176-1.patch \
            file://CVE-2025-49176-2.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


