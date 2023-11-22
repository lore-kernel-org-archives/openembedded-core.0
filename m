Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B64C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.10883.1700620295106920102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yCx94z3o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso3912599a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620294; x=1701225094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE/CbOwsP4Q8S9TMIoF+d5CxSfdHb2wc0guxvu/6tbw=;
        b=yCx94z3oEsh21TyMV8HXXMz500DfB3KAR+hboXSNIx+/RcdNuXYVLTIggHqr/L5y8J
         haeA1KfVbx3YhhJtulf5ZbrDMxDvva/iFlKrNkvPaiaxrkQXm/FYZE9BidYDsGhy6VDG
         hOZnTLAolPODU8tM/+w3kf5Ri+V4XmpFez4v5euY99RgxyfkjMrJYFURHXK1w9leL3dN
         GGg0OxLLw0i0IKnIOeQT4KEFAHA5AzaPYUxyM8RJjuTs4TYaZ/uzSBrDueqNrZ39gg1/
         cN2bGu/jUTDBMFsrGrtUdm6beLaky/XGtlgGv1Vt/7QOi8L+spKKjcCZQzAGdUcUupXT
         EfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620294; x=1701225094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iE/CbOwsP4Q8S9TMIoF+d5CxSfdHb2wc0guxvu/6tbw=;
        b=nmh7sRTzKWv+PG41QGp8D69u7MMr0Y3vDMM3NWIHtHg/GDj0LyOrQuGsO9ZLmEvRVh
         9yXqG1chapawjBPgxQAUKRboFjzZGPpJYJKVGJV/JGNvc9mMo3se4R5ipCZURzipkH65
         TTnFzt8QqLdg/GB/t76IgcjXA7kWWLJ7b3sXZRqVOFl0OZgPs1IJnYtcz8e7kJ2l5Y79
         TZal5bK7Dk9LpM+YJ+XJai5ZWr5dp/Id6n1R6xE6GigRDNGcrJJzLZuHaWXdIWiWYYcu
         fxcs6LcOO/pE1sgzDiE4Iqdc/Ui8fi6EwmYd8TTJriFtYQYUoYNSjO+vJsHu9zqP9aYj
         tNlg==
X-Gm-Message-State: AOJu0Yzm99El/4Zs2fBkrF4KgafrqNqjo98FgtB/j0Umv+5B3/5pfq9W
	ekNMPTrvG7GlfVS55QzhrUJEUZSHHcVDMKzRC+Asxw==
X-Google-Smtp-Source: AGHT+IGwRapJntUmOn0rUoZr02b4a3lgwy+ytpt8C/Td/thZt6WIjtn2MLpfRp4TESv+aRMpWGjiHA==
X-Received: by 2002:a05:6871:878d:b0:1f0:5543:6048 with SMTP id td13-20020a056871878d00b001f055436048mr1402535oab.49.1700620294071;
        Tue, 21 Nov 2023 18:31:34 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] binutils: Fix CVE-2022-47007
Date: Tue, 21 Nov 2023 16:31:06 -1000
Message-Id: <03e6ea59d82e613ba3b5d388fa87317cef982f2b.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191008

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0033-CVE-2022-47007.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 43cc97f1ef..dc29141812 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -67,5 +67,6 @@ SRC_URI = "\
      file://0031-CVE-2022-47695.patch \
      file://CVE-2022-48063.patch \
      file://0032-CVE-2022-47010.patch \
+     file://0033-CVE-2022-47007.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
new file mode 100644
index 0000000000..cc6dfe684b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
@@ -0,0 +1,34 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
+Subject: PR29254, memory leak in stab_demangle_v3_arg
+X-Git-Tag: binutils-2_39~237
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb
+
+PR29254, memory leak in stab_demangle_v3_arg
+
+	PR 29254
+	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb]
+
+CVE: CVE-2022-47007
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 2b5241637c1..796ff85b86a 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -5467,7 +5467,10 @@ stab_demangle_v3_arg (void *dhandle, struct stab_handle *info,
+ 					  dc->u.s_binary.right,
+ 					  &varargs);
+ 	if (pargs == NULL)
+-	  return NULL;
++	  {
++	    free (dt);
++	    return NULL;
++	  }
+
+ 	return debug_make_function_type (dhandle, dt, pargs, varargs);
+       }
-- 
2.34.1


