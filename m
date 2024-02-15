Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6D2C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 20:52:14 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.1691.1708030328891038586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 12:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pnrGp6OW;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78717221b97so104351285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 12:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708030328; x=1708635128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cITcZABcwiF+rAwhbyIWFfIVDsiK0AAf2U5O7eBktMs=;
        b=pnrGp6OW4LGOFGvk26hOBDKNFlJzx37D0ob+8fwBgMIGfYf7dbbT7cQxmA/jGsCaHD
         J5M+/+mYqNnZTAw5GjxiX1GH3FYE1IkEuRlgEm/YoTg+iXTzqwG4Ktz3iGVby47Er1MX
         /JBCPmm2EyeMsTKQRN9JKzWYKLWhkyDz4MooMIhUp1jaeJH7dsX17uUyAi3K54Lwvrlk
         QenYOW5HxX3EKij/1RhWHZte33d4tpUIj8A/9pgv8k3GN+6VLgIc6IpXFhjrUHDzLAkA
         ULKM4VsOg5ug/RInaxTMSDcyiYbYdUCWNIlOvvL6zy0+AAMPGS6c1DTREJIRoEi1MI/X
         BWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708030328; x=1708635128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cITcZABcwiF+rAwhbyIWFfIVDsiK0AAf2U5O7eBktMs=;
        b=mCRh6ZTG+MEWb4BFZ+zVKlYEyWwIcM1F+GpfGfhBYKJL1kH+drGz/ey+fjgeVEvgLy
         AIFbYOX4xpUNpB6bKbOP4s8SzLuMcr873baTPpQhCbVwogN8PmCsYvLc53RZ1WGmawXe
         w/r2DAjBkOckqG/LIC9g89hS9Ez9VmxwPar20VSWxQbiXfzl/dwMwibiQI3tOLEJnIIx
         o6Vb9dctcqBvJLOte2Ik97RP5GyNq7u/f2icM0vWXAsZinIVA2HznDnttU8xUyz4dUXc
         sLOtsJe3aJfoXL9CNHhYlYj2DxtzpNf03o3TNJfQKPeKfS0StYLeXvo3+cpHiUa7iwKc
         RvdQ==
X-Gm-Message-State: AOJu0Ywig0FTV+irz7IrFfwIeSCTDXyBa6rSTtcEpuj8NRgq4Hw9TBZm
	a771wpxgiU3Ic8gOC+QfIesk3WExe8k4zBzGXmQMZG+3jVFcBbRsMv0zbxBbXFYkfdCznhX+gB8
	c
X-Google-Smtp-Source: AGHT+IEVucjMbmQgsTZGVcuxwpIvOjRy+GIQqv0dL6S+vrz7X0nG7g0J8ZKeIUeQGi+qHBuApthhXQ==
X-Received: by 2002:a05:620a:1366:b0:787:3e6c:f33f with SMTP id d6-20020a05620a136600b007873e6cf33fmr1088173qkl.4.1708030327792;
        Thu, 15 Feb 2024 12:52:07 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id k9-20020a05620a0b8900b0078728bbc801sm927388qkh.61.2024.02.15.12.52.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 12:52:07 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] patchtest-send-results: add --debug option
Date: Thu, 15 Feb 2024 15:52:05 -0500
Message-ID: <20240215205205.3314474-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215205205.3314474-1-tgamblin@baylibre.com>
References: <20240215205205.3314474-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 20:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195698

Add a -d/--debug option to patchtest-send-results so that the contents
of the constructed raw email can be checked without actually sending
anything to the list or patch author.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 9fd24c9b959..8190fe86c32 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -38,6 +38,7 @@ def has_a_failed_test(raw_results):
 
 parser = argparse.ArgumentParser(description="Send patchtest results to a submitter for a given patch")
 parser.add_argument("-p", "--patch", dest="patch", required=True, help="The patch file to summarize")
+parser.add_argument("-d", "--debug", dest="debug", required=False, action='store_true', help="Print raw email headers and content, but don't actually send it")
 args = parser.parse_args()
 
 if not os.path.exists(args.patch):
@@ -92,12 +93,16 @@ if has_a_failed_test(testresult):
         '\nMIME-Version: 1.0" + \
         "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
         reply_contents + '\n\n--NextPart'
-    response = ses_client.send_raw_email(
-        Source="patchtest@automation.yoctoproject.org",
-        RawMessage={
-            "Data": raw_data,
-        },
-    )
+
+    if args.debug:
+        print(f"RawMessage: \n\n{raw_data}")
+    else:
+        response = ses_client.send_raw_email(
+            Source="patchtest@automation.yoctoproject.org",
+            RawMessage={
+                "Data": raw_data,
+            },
+        )
 
 else:
     print(f"No failures identified for {args.patch}.")
-- 
2.43.0


