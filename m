Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B5C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:23:12 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.4645.1715059392407627663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c+1CfyVT;
 spf=pass (domain: mvista.com, ip: 209.85.128.178, mailfrom: vanusuri@mvista.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61b68644ab4so24932087b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1715059391; x=1715664191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvXlDWosLZ8In1sMPWyfQYNalA7cRBSr7/bOYsOpUX4=;
        b=c+1CfyVTKdkIeGRZS4lag3t4iPC+Cj/r5E36GHfzzq6ySYF3jj2+QpozwUcTrjCqrI
         916gqc+vRyGGqW+Un2lGSGqotdKiojS2VeBu6815kc48JjzDUwCbBpDKrRTqSzfW77M2
         JgNfXNj5NKBYLkT3I1E8VQ+4fGdBNdD2mppYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715059391; x=1715664191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvXlDWosLZ8In1sMPWyfQYNalA7cRBSr7/bOYsOpUX4=;
        b=oT9CKEEIpHtzltx8WZEE9EwOpa1VMA2DKTQfEUS2l6MhoCM7z2BJeUyR/xAZpJjz0x
         yvkCrr8n5M97jqs7jYMTXfC47TCnXi2gfW02yWiCwXvR+05V3k3sBqdc9tRUf3gO7U5f
         67/w+3PoPiJ+C1WlcNkNDsDHykwQ1FSw8D1zhKnyojUEchAIYEqE0FS/IRW4uGlwFdCa
         OB7PsxlQsnbKjmVChOrBlasFnLS1SI3tUNrkgegMIEyrfdKGn8e3OyRGD3ezksbjOV1R
         1esWEqaazmg6Tz9ilOEaZ6LpMXwNdiu5u+U/OliKUr4+N+qBAQ74fx/llH6piWHa/y8f
         PA1w==
X-Gm-Message-State: AOJu0YzG1Fqe/0uFSAO/pcYObohSGt5no7xgKlTwO45nj7obYiwdc01+
	imlUVi6EiPu/C5RtjOR5KNs4nks6KZ3pngYbhGZwbB3A5ikjENacO96BEOWdStIK9gmF4gLAYs2
	DldI=
X-Google-Smtp-Source: AGHT+IFJGrBAA9oVkttH+B71b0lB/84zED6yk3kOSLpozvdxIEcqu88knL8aAW+m918yvkRP/rNYVw==
X-Received: by 2002:a81:9108:0:b0:61b:3356:a800 with SMTP id i8-20020a819108000000b0061b3356a800mr12419776ywg.30.1715059388416;
        Mon, 06 May 2024 22:23:08 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:fea3:fe4:6e1d:a982:a297])
        by smtp.gmail.com with ESMTPSA id hi11-20020a05690c610b00b00617c218f6a4sm2458651ywb.107.2024.05.06.22.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:23:08 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] less: backport Debian patch for CVE-2024-32487
Date: Tue,  7 May 2024 10:52:57 +0530
Message-Id: <20240507052257.716841-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199067

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-32487

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/less/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../less/less/CVE-2024-32487.patch            | 69 +++++++++++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-extended/less/less/CVE-2024-32487.patch

diff --git a/meta/recipes-extended/less/less/CVE-2024-32487.patch b/meta/recipes-extended/less/less/CVE-2024-32487.patch
new file mode 100644
index 0000000000..d5c8b9ce31
--- /dev/null
+++ b/meta/recipes-extended/less/less/CVE-2024-32487.patch
@@ -0,0 +1,69 @@
+From 007521ac3c95bc76e3d59c6dbfe75d06c8075c33 Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Thu, 11 Apr 2024 17:49:48 -0700
+Subject: [PATCH] Fix bug when viewing a file whose name contains a newline.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/less/tree/debian/patches/CVE-2024-32487.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/gwsw/less/commit/007521ac3c95bc76e3d59c6dbfe75d06c8075c33]
+CVE: CVE-2024-32487
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ filename.c | 31 +++++++++++++++++++++++++------
+ 1 file changed, 25 insertions(+), 6 deletions(-)
+
+--- a/filename.c
++++ b/filename.c
+@@ -136,6 +136,15 @@ metachar(c)
+ }
+ 
+ /*
++ * Must use quotes rather than escape char for this metachar?
++ */
++static int must_quote(char c)
++{
++	/* {{ Maybe the set of must_quote chars should be configurable? }} */
++	return (c == '\n');
++}
++
++/*
+  * Insert a backslash before each metacharacter in a string.
+  */
+ 	public char *
+@@ -168,6 +177,9 @@ shell_quote(s)
+ 				 * doesn't support escape chars.  Use quotes.
+ 				 */
+ 				use_quotes = 1;
++			} else if (must_quote(*p))
++			{
++				len += 3; /* open quote + char + close quote */
+ 			} else
+ 			{
+ 				/*
+@@ -197,15 +209,22 @@ shell_quote(s)
+ 	{
+ 		while (*s != '\0')
+ 		{
+-			if (metachar(*s))
++			if (!metachar(*s))
+ 			{
+-				/*
+-				 * Add the escape char.
+-				 */
++				*p++ = *s++;
++			} else if (must_quote(*s))
++			{
++				/* Surround the char with quotes. */
++				*p++ = openquote;
++				*p++ = *s++;
++				*p++ = closequote;
++			} else
++			{
++				/* Insert an escape char before the char. */
+ 				strcpy(p, esc);
+ 				p += esclen;
++				*p++ = *s++;
+ 			}
+-			*p++ = *s++;
+ 		}
+ 		*p = '\0';
+ 	}
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index f88127a9e3..01fed7c065 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -28,6 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-46663.patch \
            file://CVE-2022-48624.patch \
+           file://CVE-2024-32487.patch \
 	  "
 
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
-- 
2.25.1


