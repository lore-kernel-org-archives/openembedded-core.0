Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8B4C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.31732.1742141575058818383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CWkJoWLz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso7980205e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141573; x=1742746373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7laR6JF9BQXyGluuKcFaGQ4AbQbZt4GZBwteN0HofXA=;
        b=CWkJoWLzPR5K4v/FsIGpmEax0Mgwvm20/F7hIBhYJTUNRBNTHE7oeLAfwyuYq7Ff4G
         BMYbM8QkSmvUfDOXxTyG/uiJmWsEOEi8Aj0dd6EiRmwQ0rN/kQEyOJBy/RsTwN8CjtFY
         eWMYZmpWymG57kS8UZFbuJ7VpHixWTrV+cflo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141573; x=1742746373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7laR6JF9BQXyGluuKcFaGQ4AbQbZt4GZBwteN0HofXA=;
        b=uC5DbxFqKowDwwICX/HXwEuwQs88mgC8G4YOMqQ5s2cdd9mwi83+TwDPf7FYlBear9
         derTmv/pmtA5KPeLSHQilbECIOYFSBSUlQasJWnNJys+qzP/qrAR5taxOwzn63InTive
         0U6XH4CRT7HBk5SV/Gfw6CSCv7GPgRwrnakG5nB478sbZENUDKWk+jWvsZCJbdstaDaN
         yprn4Yt8d2WEGYr8nuEuMhUW0RrG61417iVXUcyJqZI21IhdTgfga05Wwnm3AYdu7kK0
         DBpbxmtZkGXnhEbwG2qBN/lwuW1g2STZTPBdKmGPpoP09i8zSG9qQMtPNC/1F7ED4N+y
         5W0w==
X-Gm-Message-State: AOJu0Yy8HGaUCTBceZnyDW4MykGAwXT3hD8bwzIQdoyORgjke4Rsdhix
	ALnSk8VltDwDiXdd+N9cJR/Ce1gWm09jNuOSjCj1yZoGper+nCZ1RMajOmQgAo43gS5BczIZYVI
	T
X-Gm-Gg: ASbGncua1z/eJ0DsvNuV/o15+vbWV1lHGHlvrio2OwFNl/OOzPU1vJc6xSZ6FOxNkmR
	eWd+ALip6Psfw4v8jap6E+qQnjCJxmbAujKHkQ8beys/cdw2nLhlMTCFw3pMeGhsx8M7FtugUH7
	VcD0c4JRWNBCBsqAwP1qVcmSld6V4X+tHxT6P8VXGM2MXVatWWurwlp/hKM76LvuGqETU4sQ70g
	7ZW51Pid8oB+a0EdkJV8+2gHHoHdla8OhqFw5Y/na4/rdyCY2prff2n6V1y/n90SrNklaMgzLfr
	0uev9brBv5RqZFZ7bRTglovcubos1EEG8TkKd+NtjycXJ52roFRF7wl+3XECK1DJc3hBRaHu/rU
	x9sPt7kvQ
X-Google-Smtp-Source: AGHT+IH+eOhE2FqwLXGK7ctoLIPskzwMdl1u3Fp4Nk+XFW8gNGEmzgqW6+robRCw2DKFJxL+QSrLEA==
X-Received: by 2002:a05:600c:1386:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43d2d4282damr13757725e9.5.1742141573116;
        Sun, 16 Mar 2025 09:12:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/43] python3-websockets: upgrade 15.0 -> 15.0.1
Date: Sun, 16 Mar 2025 16:11:55 +0000
Message-ID: <20250316161209.3629986-29-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213032

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-websockets_15.0.bb => python3-websockets_15.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_15.0.bb => python3-websockets_15.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_15.0.bb b/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_15.0.bb
rename to meta/recipes-devtools/python/python3-websockets_15.0.1.bb
index 9a7456dee49..2e1b0f09195 100644
--- a/meta/recipes-devtools/python/python3-websockets_15.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_15.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ca36151289a15b39d8d683fd8b7abbe26fc50be311066c5f8dcf3cb8cee107ab"
+SRC_URI[sha256sum] = "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
 
 BBCLASSEXTEND = "native nativesdk"
 

