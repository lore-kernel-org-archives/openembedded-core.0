Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D52156011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 13:00:40 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id h3so13138624wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=En45VeJOoQAyMfSlViVip1HMq4euJdUvMml28OTaE3E=;
	b=zWszKTqJqOnJF6YPgjdNlYGcOBZsHyUdE2uJNka6THKElfM4xNNgfDxmyus+jftdNz
	lBzgrLIifEA8U1c8GVYATBGGqsmToiGwAJGcxgnHLcrLOsLXW8VwQGEf2BPH1d0eX7Ko
	A5deP3CM38VTkDa6QwRU2HiTiwc6QYCe+TbvqoJ3JlQqCzeuG6iHx/MGa/Kax16jW8Wn
	RY3QPgC32UDOScVZfK5eOk9q+kc1VhIHaL1YvGrAQUKHHUbr5p2f1r/Ip2eeun9lOCwu
	phX+bjBiXDeRfH0VT05a4DN2GzMjDNjYvSOeSp0OV1jF6LmspcAJSo1lo4BhynAAp0aU
	L20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=En45VeJOoQAyMfSlViVip1HMq4euJdUvMml28OTaE3E=;
	b=Mo9IP7FU+VZ+y+PqTcy3/HhyDIzVl6xZNsCspJHfF4haX8q3JB5cdSm+tpq/bd1ZEd
	8jMDXYTqGvIWIOH9veRH+1bsqPCoi4jyhBWjYU8MXfFIraObxw+d/msIs/hOkrMFw02v
	c1qjFMWehQlAj7xKP8C7/3yLYmf9ZFG9ib8EYZLmyZATNjfP58Chg4VIHh2Ww+65KH0a
	b/iPXkuY0rVJylHd0822MiYpCGm8rE4HYsGGKQ6nRTPAubdz3uV7J/iFop1gZL4J23uZ
	AbneSQEN7r8NPYfgB0ElxsoanrBW4c7BBV6yYGEY56ioeuVOKA7XxT5M2MXXFp/l7XiD
	lu/Q==
X-Gm-Message-State: ALQs6tChBYbuV4eZEFOsmG9z/PjyTTfW+Ryt2mGJIncpSUyBzyEs8yWR
	gVQD34nqiUn816AygWQ1f3ykCDLB
X-Google-Smtp-Source: AIpwx48tIoTWGdNa/U0EjJZRlqBvADhrxV73+60wjnsvcl1lBy9lSgc7Ki6w5uZPozUtpYMi+hcEJQ==
X-Received: by 10.80.167.4 with SMTP id h4mr32287985edc.239.1523883640736;
	Mon, 16 Apr 2018 06:00:40 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id o6sm3422518edj.31.2018.04.16.06.00.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 06:00:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 15:00:18 +0200
Message-Id: <20180416130021.4428-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2 1/4] native bbclass: handle base_libdir as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2018 13:00:41 -0000

Native.bbclass needs to fixup both base_libdir and libdir to handle things like multiarch. This fixes wic and ext4.* image failures during do_rootfs where mkfs.ext4 can't find its libraries.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/native.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a911f2a..7f2df17 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -78,6 +78,7 @@ exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
 bindir = "${STAGING_BINDIR_NATIVE}"
 sbindir = "${STAGING_SBINDIR_NATIVE}"
+base_libdir = "${STAGING_LIBDIR_NATIVE}"
 libdir = "${STAGING_LIBDIR_NATIVE}"
 includedir = "${STAGING_INCDIR_NATIVE}"
 sysconfdir = "${STAGING_ETCDIR_NATIVE}"
@@ -89,6 +90,7 @@ export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64
 
 NATIVE_PACKAGE_PATH_SUFFIX ?= ""
 bindir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
+base_libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 
-- 
2.9.5


