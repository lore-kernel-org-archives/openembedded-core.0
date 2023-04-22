Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F860C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.10376.1682179098180738074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=R5MO/kG7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63d4595d60fso19807462b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179101; x=1684771101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeWuTEfoFMKwzf+T85+9MRGaHNVOwyHhDjfMl0AQm0Q=;
        b=R5MO/kG7SNXg9zvnTEQiBJWXGmr7lktiqXCm6f6XNtkz061Jcr7W5TUv+gEncNNsKY
         NVoP7jbBUtQ2/MLrdanJfI8mxLHqJg7iYM5oMwVzOhlCWAF8KP01VCXpsjlP4ZxrRw4f
         +bKD7lglnZH6Cdgiq91jt7PBHFChgNm5nzUXLlHqzdxUZQr/fTQmLkCutVWA1pHOH3eO
         eF4rg0NO38gyMPbbpP/Rvk/xfy7sVML67KtofeXKqPTGI2O2+6PLsHoeOeeSrq/syFx+
         GinafsvUIsXkeDsy8YAQN4EojnHtW33SaTscaxkf38XZiLzg0vw1Deyeau6qKYHTBQpv
         oXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179101; x=1684771101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeWuTEfoFMKwzf+T85+9MRGaHNVOwyHhDjfMl0AQm0Q=;
        b=GvoJaEQPLiUms8p+5RqomzAKWDolTyPXjcQN8yIYHi3zV3vHmcZ/lq+0zvmSydkCtJ
         CCNsD6dfCba6vSiVAfHdnxYzcKiqPkRI7HSCcHDtCthXi7UpU0USUlL4aiMbddiXmL0Y
         6OVwso8vX+w+U5859KJF5pNTo8+Itut78fLYSrkQUEPoqh5yUCNzTJU68YpEG6Ab444v
         OdyQq6qyIyu7xjVn5hgulPoHoao9FOxKuFm3k74dc4yOTkddCw1oHWciyxSmkfX61RmZ
         4fxGfaAksHoOHQwrg/3Mdxn+JT8FejnjIm99j4o7wnPa3SO9RdCpIGEZ6jq0mAK4JayC
         5Bng==
X-Gm-Message-State: AAQBX9fzuzObyCz8OxXYabTYBo+7zwSQiJDWe/qdryFNkEQciq7fejlU
	k1CJutySV3RQuWXKAgO6Osw7Cee6tSIA8xcuQSc=
X-Google-Smtp-Source: AKy350ZA5DdBaBLwyJShV+ae9zsRzTy9QxHhqbE4A1KBbfSKlUBwkq8bWlC9trAvIZdhnc/s1nGofA==
X-Received: by 2002:a17:902:d50f:b0:1a9:4cd5:e7e0 with SMTP id b15-20020a170902d50f00b001a94cd5e7e0mr6196273plg.17.1682179100981;
        Sat, 22 Apr 2023 08:58:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] go: Security fix for CVE-2020-29510
Date: Sat, 22 Apr 2023 05:58:03 -1000
Message-Id: <76d855f3d2c250ac85ca6f24bf0e178fb32607f9.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180317

From: Shubham Kulkarni <skulkarni@mvista.com>

encoding/xml: replace comments inside directives with a space

Backport from https://github.com/golang/go/commit/a9cfd55e2b09735a25976d1b008a0a3c767494f8

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2020-29510.patch           | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2020-29510.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 8df9d62612..7178739b7e 100644
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
index 0000000000..e1c9e0bdb9
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
2.34.1


