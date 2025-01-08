Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C59BE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:59:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.16256.1736333944109512057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 02:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q7rWtTlm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso172457555e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736333942; x=1736938742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ2jteIw1AdJ6ocokGrgyEQOjHURSXCXrLpMKbobQAU=;
        b=Q7rWtTlmdWqMnSkw3AFnGsYJ2t9gbj75gxtOrDvWkuhusZ9D5aN1E3tcz8FlZEJWdu
         ZZkyOdonK6ZYSqhbWxsfNp48p3fPIGF58aRzZeRGPO1EYItlgGiE50Zm1fDL4wNZRElt
         udfQMBhidLFDOm39sDdrJYMeGH8wCFIJ5ltn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333942; x=1736938742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ2jteIw1AdJ6ocokGrgyEQOjHURSXCXrLpMKbobQAU=;
        b=bN0ylTiC22rqSMucjEbipeFOJj+Tkg/uyXK28QVazOaPeipIIzTf9zAP9i3YU0yLVs
         iURRQhpqz9qU3HvX3blR6JGVQmbSU6P6PzM6+S6XUB5dKZKXUpdUM5dP8SDZ7uBR3QVL
         IKg28crrkKt5+jpyfkmQK6KBt9a+Axe6vy6iwZoNhpiXHSQH6/JodSrq44TJ0KjF8u4X
         Y14htuEzUdIavIZbbNXzk94guL1BaUB5cNtTo1LHQVtojLwa2GMxRdJ7VBVMSwN1H+A+
         6xUWzhfi7eTAqtkfAbkFXYyCy0QDAnssgJWVwpcFZZK+VaVKaHgoyYv7TcoORbxwH7hW
         5gMw==
X-Gm-Message-State: AOJu0YzN507WW/QWw2H3xSnqFbaMnXY9ILkMgX0jniMkqhpKGcwZI7Fc
	M7Ph7uwSpGNQnVKvsO/jVBT/wvRI17cwr5QEJvutpOnIRE0u6tgyCDhgS6w8zOvpnqDkpZGLJ93
	FuXs=
X-Gm-Gg: ASbGnctqaO/BPtMUAww1bXyK31m442LEQVB3D+grciJfVTyTfh8bc8J9IYzx1skWG7i
	xDnyci0Q16WNXJVFsBMVoREKzH/GfG6pZfGk/eC7fxAwNNuhuVjnRD/m2D/xCdsGtQapeR1GZuM
	OV9IlJ8BF8bG5P2qoAm1LUFinUT/8j0eZDlM93MdDmKNxYov74aRWVNB1ob2a1Yo8DZx1dLTRun
	zVvaubzGYTB1+KmUzbfprhcQ/57RhR/SWMiRDMhYdhwjFPJmdCi2lzAunLPi+q31bY3B7z1oMy2
	SCrBILeurg==
X-Google-Smtp-Source: AGHT+IGgj3Pcj/wLTPitP/h8I3mJefkcyfEGrl1kuYfdGYMYdz8H9rTVwpvBx8a8Ndj/sBEZL1ZPTg==
X-Received: by 2002:a5d:6d01:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-38a8731508amr1653239f8f.35.1736333942080;
        Wed, 08 Jan 2025 02:59:02 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm52186033f8f.11.2025.01.08.02.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 02:59:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] sstate: Ensure errors cause task failure
Date: Wed,  8 Jan 2025 10:58:58 +0000
Message-ID: <20250108105859.3561400-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108105859.3561400-1-richard.purdie@linuxfoundation.org>
References: <20250108105859.3561400-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209549

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index decfb5adefd..2c259a66579 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -646,6 +646,7 @@ def sstate_package(ss, d):
     d.setVar("SSTATE_CURRTASK", ss['task'])
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
+    exit = False
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
@@ -664,8 +665,11 @@ def sstate_package(ss, d):
                 if not link.startswith(tmpdir):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
+                exit = True
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
         bb.utils.rename(state[1], sstatebuild + state[0])
+    if exit:
+        bb.fatal("Failing task due to absolute path symlinks")
 
     workdir = d.getVar('WORKDIR')
     sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")

