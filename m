Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.17426.1613314201485297029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 06:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iDSqHhA2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id n10so5455324wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IxyyLcTJTr7Lw2A0JW/iGQj/O3SJuML1FdAOAwytoFk=;
        b=iDSqHhA2b2Rcm4SuMiDCzecP9So8KaL/GWwTdy0M6RpqvlpzCJ0nXEb+pEwqrvlU64
         5eYpcaNW1CmDHkx8WoEJi+AZTzSrKGkC/5FtBvr70cpm/pdmeeZhwQiub1YbPlTyy5vQ
         s4sHHKk4LsXGtO28XeOoCJhHI6AJyQxdpLpC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxyyLcTJTr7Lw2A0JW/iGQj/O3SJuML1FdAOAwytoFk=;
        b=dPiShSh9JiM87yzd6NEVMQUq8qxsR6X2kZiAiWt1qVPp4i/tQJFHojLPL2tyRDiYin
         zSlEOD2CGs9coySAZhFS5Ek8Evg8P7qk26b1JCp7qIv+mjfH83ec2w8IaWvfzHnpJJKI
         U2vwumS4i5KSzN9+JJBWOaxCPL9+50mYH6FxcdH/3Vax6XNeYJHbRYs7BNjrcz/onrIG
         mrneFVU8KVp0+t0r9jPydTjTcVsuWMqEsk+q8PR42w1cwLB+MXzg+NiMjyY5aL16RsrA
         1K+Z728EeGCns5dpCVHmXjQTFU0JsbOBYGT17Zoipenw9GYFfzvc436sf9wCYyy/CT4m
         rEAA==
X-Gm-Message-State: AOAM530Ip3GSXxzldrHohkRhjn1JsC/UUSjdHV783qR4lW8hgLWZzAwz
	nDpqjPG0o9GhFR2LEtD+8P96rcyOTlgTGA==
X-Google-Smtp-Source: ABdhPJxWIwUsjc+XB1O3fmGnU91fir+1aRZ548+A5zCVzCLCzmPsn3YQc/vxVPS8Z6HTNGU0lPVehw==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr10311712wmg.93.1613314199859;
        Sun, 14 Feb 2021 06:49:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id a186sm10710684wme.17.2021.02.14.06.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 06:49:59 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] package_manager/deb: Fix image generation with package removal
Date: Sun, 14 Feb 2021 14:49:56 +0000
Message-Id: <20210214144958.1966826-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
References: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building SDKs with the deb backend you could see errors like:

Setting up nativesdk-python3-ndg-httpsclient (0.5.1-r0) ...
mkdir: cannot create directory ‘/usr/lib/opkg’: Permission denied
dpkg: error processing package nativesdk-python3-ndg-httpsclient (--configure):

which is due to environment misconfiguration when removing packages.

Fix this by setting the same environment variables as used for installation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager/deb/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 7fdfdaa4fa4..2ee68fefb10 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -313,6 +313,10 @@ class DpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
 
         if with_dependencies:
-- 
2.27.0

