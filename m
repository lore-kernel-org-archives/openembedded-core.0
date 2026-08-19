Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0545C5DF8E
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10322.1787155067153390843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jexpJWBz;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so815804f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155065; x=1787759865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t+FItTlfqszOI5fvunzn9X6+BVvjmbJwc7e6X21RzAo=;
        b=jexpJWBzyzq0rG/FZ5Bqp/MTPyvUu9gBv2ko8wQO92XkHyxXwfcGRq1ji9bIX3zDud
         GsWMdYDexzD4Jhwc4Bc3sfCjVHBlGLVgODtxImoGKW4vaRtGWtfSiwX7Cy1FdWZVoWvr
         zj9d+Km/KuZ2vEE5HHHm0VregRXNlcMjA6iRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155065; x=1787759865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t+FItTlfqszOI5fvunzn9X6+BVvjmbJwc7e6X21RzAo=;
        b=cbzV8E78rbzQ0/v5KgURgc0n9/B/Zrp7uNPPW93R3MKQ7lm6wTiXgonQm3yyGqhcbc
         tTqOqXbXxDVMe4M9Ph/hS2LSwNBIaWbkjnisDe4ApE9325XtE6j0beL4EgxWvmElIX3U
         bYdBRAYv5Ye4+cYL8L9HFji8Z9qQHhBXvXEhn+fG/6BEAqOMgOiOIByDuGlmUTgT4i7I
         oTQzlJN5qabtrPPjHrcyxb6icoy4cvXSkgVckmkH/qs1eQ3/jxQgT0ZpF2VpZ7RbumRp
         VUQSnwwmE9hUfkSCABfyhwSj5R7e5tO6wMsUMk9IYlwXftd/8V0cEI8ImYlx6gQgkq8g
         91rw==
X-Gm-Message-State: AFuF++ldp547gui2aoiYoUAoIOJiqiWI2QxnZyEa9mDP13SRvfn/dWvc
	yxEJ4sKKcnQSvKVEjLJ/p/zt3w0UcN1jDGDh0W4jqp2E20Qoo8ixcQimQn3Vn4Eu3qxLkZhFa0B
	ejcaX7Pg=
X-Gm-Gg: AR+sD10KdKt5WqyrpQPytHxw3CdiCvqHn9AaryqZf/ZHgojQDuITOhGp8Wp6ibZz27Z
	tbNCoTe0tWd71UIyjlR3J4vj+QCJSWcIxbgVqj6FA3aZcSWt/eltNqhTk1fppq3jPxgJWVV+JxT
	LQG5vMHGCnqiRpyvKIwD5qT0nXH95bXJwgPUDIqbXmUzbTC6ZKOIRSp2VezxO4XB+BztsTwqKWB
	AwhMMP9mObQ4ZzXckaO8KnYiT3GnyRnVvhQ+uc6v0kKC4+q2FdB34mwJlF+NY99HV7jcJUCZemp
	JE1+gC/pfikobmFfE5Yz8oTO6PDqziBlSqQ7lUGEuzJGdSTaTfa1vKlMbBOuCWiErhUBVLYJ1CJ
	xRub+Euc//TcW85xukjSA4PkKamigWReGtxA4CJLdFBuVPqXa8V+TRsGH9KXiuMKEJc0FixnrA3
	WhppZ5JEkVAIkayQhqAmEqJtxx4HQsSD7aT4dk8077CbTUL8IuwtuSDdHzpr5ZcDPM4eKCH0/PG
	BT6hCWhwTZZTtHXyvBKgrLKBk31uuZiVWShH+QxwNOo48gClnfOEzP5ItM4vupqINhVJxmnTi/L
	RY7xxWm2KjYZXuf1cR/gaJREZqd1tdwOyXDMPDFS
X-Received: by 2002:a05:6000:4301:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-482b1e86885mr8496019f8f.3.1787155065377;
        Wed, 19 Aug 2026 08:57:45 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:45 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/37] expat: fix CVE-2026-56411
Date: Wed, 19 Aug 2026 17:56:45 +0200
Message-ID: <98e969a60c4979e9d4d9d202360c27bd65718631.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243750

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

(From OE-Core rev: 61f895ea50fc7d6e3c1f3bac9e77f3a7ac96de6a)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56411.patch          | 50 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 00000000000..c6dd601f202
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,50 @@
+From 5e696e78f8c4a709c4f774973b142e57090c4364 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH 11/17] xmlwf: protect notation list allocation from integer
+ overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+Backport Changes:
+- Use Scarthgap 2.6.4 freeNotations cleanup and return directly
+  because the newer shared cleanUp label is absent.
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index bd5f68a4..6a3d31b7 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -387,9 +387,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data = (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount = 0;
++  size_t notationCount = 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+ 
+   /* How many notations do we have? */
+   for (p = data->notationListHead; p != NULL; p = p->next)
+@@ -401,6 +401,14 @@ endDoctypeDecl(void *userData) {
+     return;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    freeNotations(data);
++    return;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 0f996f882ba..fb36108eafa 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -71,6 +71,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

