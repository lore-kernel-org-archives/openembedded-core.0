Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C2DC88E69
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6002.1789330328161796072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O0pbLsHw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4858303de5dso2665062f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330326; x=1789935126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gfQzkwwRG9B5D8He0Pfck+fBlx25waFfhO6YRLFsGSE=;
        b=O0pbLsHwzBbEzgMkiyauYo5OSxyWfC37QtYx+tyTfRSHbq6GVo4NX6cHu6L32+a9fO
         i7s3WgKGPT34ZfebUrRgf9Imc6i1ceaP3+EFXMNs4+99j/DFSsBwweeePXFK19VgBOeZ
         oTpIMJ2de5eYqYVWif0RHdx8L/A43bYYPAvtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330326; x=1789935126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gfQzkwwRG9B5D8He0Pfck+fBlx25waFfhO6YRLFsGSE=;
        b=B/2t1VgqBiho/6Sftn3GsuKMCl/RuaFUEOlYpIaLFze+3FjFP40jozZZNPJ+T0ODEs
         WWGmHQ/PtiFZMAxKghzDtm8lbIHS1uHbhKr7mCWdbQeI4zLxO9+6akPyFdKv+GDm1Npq
         2hDH43fQ7DxG8ImQs0eqrOhdDVNdfhT0J7wLIPcR+OUVFiNOwhJOBxRbWykXc5skNVGO
         OasHW6WzaBkgG2KhwUqFcgWZsTLdTc/2sLedMAmo6zTfuayBPfe90gjpUA3/t08B/J3j
         9iwhQz/fa+7i7+oPmGwvomPlFg/fb/tvB8X6i1DiPIDjJvavmu2swz036R46vS/G45ko
         MPDQ==
X-Gm-Message-State: AFuF++mhFJeGDkKp+khOIUtvEdubMN2xgd2Hkw+qts7TIjZ8hdxY1cSh
	oCIgLwNIbZRGXRTBdfIC5pS+wb8xITYFRgnjfP5iYje1Xeshp/thfB6W/CciQk9LC6tRTpL9iS9
	v8wBFV3U=
X-Gm-Gg: AYBFou2R1X9BdGCUwmRrrfLpQD1+C88MN7rPzrxBfJ8sRzcZ9ftmYnXIazq8EFq8vfZ
	flxOFkhMJRbE/O4KyrUeIkEE4sZYE/n18sVRYu31FmBF/8ScooW2MTQ1g5qsdyuMwfSEmlRBmEG
	Q2USxlO0ET8MziGXHTMlIJ6zGT5Qzv/zBWkeG9/y8RiGz+6OHcQNQIYtEiwVTXozKxvtv5GwUxZ
	R8MBlJZUgAlefxkYDlKXf9JAIWR7i6FYT+JN5kdrltgI/MWhVGZoqDQe1p5XaR3vyZm4lNBkyZD
	OG3Von3RIouDyInhtOz7zxGhZgBjpadk5Xw5DTo2S47HZUdy5OrunJEwUl/o59iXDs9WBjW0KO8
	V2VdemP0NudFjHvVeKUJezdQZGAuOUIAOHouB3AfXPnwyxeChaMCuREWpSkfrv8QPY/96V9gVed
	Pqroc0KLl9k9i1rx4qbwyfEngJqRCySQ9y9qRTaKko00XoGyozszZu3aCKk38FCi6tsRmKxIFzF
	HxyodIwfVDUPNxFb1xDoarueVx1K18IxfVaT00=
X-Received: by 2002:a05:6000:26cd:b0:486:e949:532c with SMTP id ffacd0b85a97d-486eb33953dmr15995418f8f.43.1789330326386;
        Sun, 13 Sep 2026 13:12:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] python3-meson-python: upgrade 0.21.0 -> 0.21.1
Date: Sun, 13 Sep 2026 21:11:52 +0100
Message-ID: <20260913201158.687889-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245732

0.21.1
======

- Restore compatibility with Python interpreters not implementing PEP 3149.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...n3-meson-python_0.21.0.bb => python3-meson-python_0.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.21.0.bb => python3-meson-python_0.21.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
index 69fb461c1fe..2c86f7fed41 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "595c2f40b76692c78274c87b733379d86562583e9ffb975487b9eafada03055b"
+SRC_URI[sha256sum] = "78b3345dcbc0fed7b939e7e37a9faab35bddaae07bf62e7542c8ad479c395af5"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 

