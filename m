Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E54DE7B60F
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:58:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17464.1696424282405583209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=v0Np60yM;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3247cefa13aso1914181f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696424280; x=1697029080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c6VtHlw5Mij4l7bSz5CW/psRuWL8yZUcKZN0yjmpRY=;
        b=v0Np60yMAb/Cbknuz+yG0lzigTt+z5hYYdHKxlXie6qXBDh19VGRt6edbf+eoe+g2l
         o0T3mv7MVp17s4dUdfu4X2IMBtiRePZ3+MzLv/1OGU7ia0a3dhnE/ctt6fZxCSaxOAT+
         EcHs0uIUW83cE+HbyS7yU6mbAeS/tJZPTOMFne14snyJAxwKOFrWyKJKGG6XbQR270YO
         9/eJnOr8cq/6J/Jh+6bIyuwSuzkIBLnwOs33GQsLs0R7Y0BQL+IrDUJ0gQIj5KcTembg
         Rb87WhLo8Kikh7djyY2HDIyfjtdtOgEU8A+adI14z07nGEVLLcOWvx/dqnuXM52uaFQd
         XJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424280; x=1697029080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+c6VtHlw5Mij4l7bSz5CW/psRuWL8yZUcKZN0yjmpRY=;
        b=CGZYVLhyI+1JSeqdxv8n1VLw0eH6I69kGJGP0mrcGDNzTg+rtlB32kczilwAUrTZac
         Zio7/FZIqCbVRbjI4cnYTN5NgKGRvNmti8oDABTUuj2Ng4Q/IrO3KMfGAuYJQXIYh9TQ
         Aen6Fpxb8z9ASBYW+cF/J0EpWAy26tkIFpJx8WZ1TuVc+5HAjCYlxlW96ca/Swf3Tgdi
         /obeMG4yS3gIf79Vil5Z9SCm7ryiUdQNSUKdFQy2lAoLZxY9PLoEnYtb07LuD/HBnzde
         v4OAJdYoIPvmghB5HmGHSDO2FIUyV2ZqJslyozfiFXgJ2/+W926CYRX+s8vzrATx4KLK
         9D+A==
X-Gm-Message-State: AOJu0YxDxjH+fzYBt+exRYThbXPRsb16bVojHfT+qaFegWDSQj+vn8jY
	2dR3+l325HTiZOtda6Rf6OgHXJWyu93u8aLMffQ=
X-Google-Smtp-Source: AGHT+IGQwC1ztvL1AI+mV6U+WJpLJmgFRAGRceWYXu11zIcs+Ald5lHgscF/ClK6fcq2WGpHI1SOUw==
X-Received: by 2002:adf:ea4c:0:b0:320:bae:2dfd with SMTP id j12-20020adfea4c000000b003200bae2dfdmr2133476wrn.5.1696424280598;
        Wed, 04 Oct 2023 05:58:00 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b00326f5d0ce0asm3958763wrx.21.2023.10.04.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:58:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/4] insane: Detect python and perl based tests
Date: Wed,  4 Oct 2023 14:57:29 +0200
Message-Id: <20231004125731.1785803-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188682

From: Jérémy Rosen <jeremy.rosen@smile.fr>

match_line_in_files will look for a regex in all files matching a glob.

we use iglob to avoid a complete, recursive scan of all source. iglob is
based on python iterators and will scan as we walk through the directories

pytest are detected by looking for "import pytest" or "from pytest" in any
python file.

perl Test:: is detetected by looking for any t/*.t in the toplevel source
directory.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 857f0a3736..932391e914 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1351,6 +1351,20 @@ python do_qa_patch() {
     ###########################################################################
     # Check for missing ptests
     ###########################################################################
+    def match_line_in_files(toplevel, filename_glob, line_regex):
+        import pathlib
+        toppath = pathlib.Path(toplevel)
+        for entry in toppath.glob(filename_glob):
+            try:
+                with open(entry, 'r', encoding='utf-8', errors='ignore') as f:
+                    for line in f.readlines():
+                        if re.match(line_regex, line):
+                            return True
+            except FileNotFoundError:
+                # Broken symlink in source
+                pass
+        return False
+
     srcdir = d.getVar('S')
     if not bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d):
         pass
@@ -1360,6 +1374,14 @@ python do_qa_patch() {
     elif bb.data.inherits_class('ptest', d):
         bb.note("Package %s QA: skipping unimplemented-ptest: ptest implementation detected" % d.getVar('PN'))
 
+    # Detect perl Test:: based tests
+    elif os.path.exists(os.path.join(srcdir, "t")) and any(filename.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
+        oe.qa.handle_error("unimplemented-ptest", "%s: perl Test:: based tests detected" % d.getVar('PN'), d)
+
+    # Detect pytest-based tests
+    elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
+        oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


