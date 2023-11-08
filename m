Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF1FC4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:20 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.107053.1699483996556668246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R1BdgWlM;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b4145e887bso119410b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699483995; x=1700088795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjFKiZfBlr95DFMLTP6eU+224JUS7PJwmDsZ1FYbtlE=;
        b=R1BdgWlMUQ8NAiA2kGN1dNXUNr9qGXWSLzyTrrHuypy4aX+ON5UIAW/LcyCjLPZSgs
         E6cdzXcKn614I9lHtDyQBSOcaLrqzZf7Nk4dJ6gQ7BCe7r3K7HdyIrQ0r5JKUGiqKwna
         S80n9fyXfo1B+NHlY5sjOeBwMd63NrfDK3FBae7rU+v72G4VJtpeI+KYLsOePlE466Vm
         ArvWRCmlSA6OgRk48mznDbr1aPowhK1q923hkwseUNCtCh20o5CeXHpAEWgtSYTikjID
         9o/UEAapH+CMQHo1B9OvVlJ5Nc0oi9GPkHy2IDczJEsKABej0KsWpLTT3eEPBRZxLAHd
         Aq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699483995; x=1700088795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjFKiZfBlr95DFMLTP6eU+224JUS7PJwmDsZ1FYbtlE=;
        b=DNhQ5NxkNrS0p00yFW1W3j/JcATEGrg9Yun3K6bb/BSfHRXjHpfOhk9p1ey5tiZm2h
         f9V3jwB+w8jcwxyr4faxphiUwn39+l9+WgT5v5Rg8Zczxl1I46AdLtEDeIA7oCyWdwJx
         WcTANoOp4gD1BQ0CikPn4IDfOAIhRazpHFNWDcPcveefVuXfloCIyMTKIyxTzrrIbM+W
         +zWjJsIP/xkETN3VTcpxZVPcU76izuG2PX0HfSrm4BJkvUggV3Ej+dqYIF2j+aQAuxkI
         WVCQXGiMAPEbuCFXQ4f80BaM3bL5Da8JFgHdQt8CZ93qKbZrVqf29yMQy1gA96L0sgxv
         vpuw==
X-Gm-Message-State: AOJu0Yx+PPE1rv7O068AUmjuxCjUrNMZygo2kOEj6t9JEI6znMbMSrhJ
	Tzfwa3XxL5lRI7YomEK2d6i4lj4UTF6arwN5blZv9Q==
X-Google-Smtp-Source: AGHT+IFjKKDwbp0n/T/HQtQrbaiJnvDHodO/5HlHDaDLhSqOFSS6XNFjG1WUHuWE41vVyglEs8KJvA==
X-Received: by 2002:a05:6808:2110:b0:3ae:511e:179e with SMTP id r16-20020a056808211000b003ae511e179emr4417523oiw.54.1699483994981;
        Wed, 08 Nov 2023 14:53:14 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] binutils: Fix CVE-2022-47010
Date: Wed,  8 Nov 2023 12:53:00 -1000
Message-Id: <3fd5701a861aa263ad1d912bfd44d4d5826d11a1.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699483825.git.steve@sakoman.com>
References: <cover.1699483825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190359

From: Sanjana <Sanjana.Venkatesh@windriver.com>

Signed-off-by: Sanjana <Sanjana.Venkatesh@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0032-CVE-2022-47010.patch        | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 60a0c04412..43cc97f1ef 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -66,5 +66,6 @@ SRC_URI = "\
      file://0031-CVE-2022-45703-2.patch \
      file://0031-CVE-2022-47695.patch \
      file://CVE-2022-48063.patch \
+     file://0032-CVE-2022-47010.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch
new file mode 100644
index 0000000000..9648033e67
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0032-CVE-2022-47010.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 01:09:31 +0000 (+0930)
+Subject: PR29262, memory leak in pr_function_type
+X-Git-Tag: binutils-2_39~224
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0d02e70b197c786f26175b9a73f94e01d14abdab
+
+PR29262, memory leak in pr_function_type
+
+	PR 29262
+	* prdbg.c (pr_function_type): Free "s" on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0d02e70b197c786f26175b9a73f94e01d14abdab]
+
+CVE: CVE-2022-47010   
+
+Signed-off-by: Sanjana Venkatesh <Sanjana.Venkatesh@windriver.com>
+
+---
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c1e41628d26..bb42a5b6c2d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -742,12 +742,9 @@ pr_function_type (void *p, int argcount, bool varargs)
+ 
+   strcat (s, ")");
+ 
+-  if (! substitute_type (info, s))
+-    return false;
+-
++  bool ret = substitute_type (info, s);
+   free (s);
+-
+-  return true;
++  return ret;
+ }
+ 
+ /* Turn the top type on the stack into a reference to that type.  */
-- 
2.34.1


