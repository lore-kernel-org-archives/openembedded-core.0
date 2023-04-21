Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A604C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 13:56:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.12510.1682085372907089371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 06:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=JCThDgk/;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b620188aeso2786178b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682085372; x=1684677372;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b1Lb3GSPyaosmjbAnxWn/Ah+IqEHtP1RRYGJ2jsxbk=;
        b=JCThDgk/1QjgkU0xbLYDYfqLHu4OCg9tzR77iwwJDVT1z7keK83xlrBMliJ7wiTa79
         I6sIf9s/E32wVR0ORsLULpv71YQdrUPMczmtIacKd1ao57MOw271wGHtexe8R77aSIYd
         +k3OWMn8k5SWnEzq4cMIzHCRa5iXosQS0QEko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682085372; x=1684677372;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b1Lb3GSPyaosmjbAnxWn/Ah+IqEHtP1RRYGJ2jsxbk=;
        b=hRAsWS5mIFOReblznNhdNtHMFh2bznzYRl1quIEoqHkXM+5aG9DT47zJ1F2BG5xuyI
         1DbnMi3S/jTR2v5Yl7rx27snj4wCKJmgmF5Tvu6GOrXXcRTVd64CHAGIJNPtw8opsP5j
         KD9hpHuTc303TamtDhYBsSf8Y/JyuSi7+m93kb005FH6Kh//qnafioyc52w+p7VAawBW
         yjpMNcI6IAzVM5m0RaSENfhSvlR4auiMcPvw6iZtQCwJ1S1ic1coPZ5enmAZqgQS/2Ne
         atVdxGgMQj0YnEgurNZRmdTJzEvAGPvNGz15yKVtIi/lCY6jmCV9IimbdGkkmWaaeBO8
         FerA==
X-Gm-Message-State: AAQBX9dOM7vEuYVi5nEywNA70IRfPIEyrg5gIIRHb+ls7ZBvVNBr0sO9
	hdmvoE3+pGINwisDRv9ihBxcnW6WacxxGOImtIg=
X-Google-Smtp-Source: AKy350bBIclYak0DlEbxLLxRRgRScHkdtzUDm7bj9RR8i7pSm61eYSWGBxZo+Mc+HXyZFKBO/+iOXA==
X-Received: by 2002:a05:6a20:5492:b0:f0:5d4:c4a with SMTP id i18-20020a056a20549200b000f005d40c4amr6798528pzk.8.1682085371832;
        Fri, 21 Apr 2023 06:56:11 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id g17-20020a63e611000000b0051b4a163ccdsm2584887pgh.11.2023.04.21.06.56.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Apr 2023 06:56:11 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Security fix for CVE-2020-29510
Date: Fri, 21 Apr 2023 19:25:58 +0530
Message-Id: <1682085358-29263-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 13:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180286

From: Shubham Kulkarni <skulkarni@mvista.com>

encoding/xml: replace comments inside directives with a space

Backport from https://github.com/golang/go/commit/a9cfd55e2b09735a25976d1b008a0a3c767494f8

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |  1 +
 .../go/go-1.14/CVE-2020-29510.patch                | 65 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 961e233..c37f0cf 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2022-41723.patch \
     file://CVE-2022-41722-1.patch \
     file://CVE-2022-41722-2.patch \
+    file://CVE-2020-29510.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch b/meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch
new file mode 100644
index 0000000..e1c9e0b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch
@@ -0,0 +1,65 @@
+From a0bf4d38dc2057d28396594264bbdd43d412de22 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Tue, 27 Oct 2020 00:21:30 +0100
+Subject: [PATCH] encoding/xml: replace comments inside directives with a space
+
+A Directive (like <!ENTITY xxx []>) can't have other nodes nested inside
+it (in our data structure representation), so there is no way to
+preserve comments. The previous behavior was to just elide them, which
+however might change the semantic meaning of the surrounding markup.
+Instead, replace them with a space which hopefully has the same semantic
+effect of the comment.
+
+Directives are not actually a node type in the XML spec, which instead
+specifies each of them separately (<!ENTITY, <!DOCTYPE, etc.), each with
+its own grammar. The rules for where and when the comments are allowed
+are not straightforward, and can't be implemented without implementing
+custom logic for each of the directives.
+
+Simply preserving the comments in the body of the directive would be
+problematic, as there can be unmatched quotes inside the comment.
+Whether those quotes are considered meaningful semantically or not,
+other parsers might disagree and interpret the output differently.
+
+This issue was reported by Juho Nurminen of Mattermost as it leads to
+round-trip mismatches. See #43168. It's not being fixed in a security
+release because round-trip stability is not a currently supported
+security property of encoding/xml, and we don't believe these fixes
+would be sufficient to reliably guarantee it in the future.
+
+Fixes CVE-2020-29510
+Updates #43168
+
+Change-Id: Icd86c75beff3e1e0689543efebdad10ed5178ce3
+Reviewed-on: https://go-review.googlesource.com/c/go/+/277893
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Trust: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/a9cfd55e2b09735a25976d1b008a0a3c767494f8
+CVE: CVE-2020-29510
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/encoding/xml/xml.go | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/encoding/xml/xml.go b/src/encoding/xml/xml.go
+index 01a1460..98647b2 100644
+--- a/src/encoding/xml/xml.go
++++ b/src/encoding/xml/xml.go
+@@ -768,6 +768,12 @@ func (d *Decoder) rawToken() (Token, error) {
+					}
+					b0, b1 = b1, b
+				}
++
++				// Replace the comment with a space in the returned Directive
++				// body, so that markup parts that were separated by the comment
++				// (like a "<" and a "!") don't get joined when re-encoding the
++				// Directive, taking new semantic meaning.
++				d.buf.WriteByte(' ')
+			}
+		}
+		return Directive(d.buf.Bytes()), nil
+--
+2.7.4
-- 
2.7.4


