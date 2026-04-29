Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1582FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:05:28 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11459.1777469911133566117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 06:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=KqoDOWr9;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.167.46, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so1437494e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777469909; x=1778074709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjtG7uGof/B7apGWWCaoVokjxtDZoPRCdUh0fiXShhg=;
        b=KqoDOWr9K+C+25bLrAXivgkMuQeG9cg9BYzop6Pt3/n63RcN+gAnqH6KsHB1aVx1Nq
         nMB7azTA5HSPxD+dmsf65yg7w3enGcj74BKvbS3+JCzbX0I6YUSSsXCu6OHxqE/6LnyU
         JBnZ1RY4W3tS2hk9IGewOIrp8oXdeJL3EClIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469909; x=1778074709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjtG7uGof/B7apGWWCaoVokjxtDZoPRCdUh0fiXShhg=;
        b=QpKDn8KZJlwFzCdDhGSvJeXCta7E64aBAY+ClpKYFBegLXtc15S0Og5kNEFSAj2b8U
         HP4e8zAeipHOZPJZox1AqPI0ApsNNKucfmd+3Yo6x650N1vYX+Wr6C8UowjW7z8s88S7
         29lFDEFn7oBzKShjCH31vroD2QzUzxOkOTHtO7AnoHtByRrN8itlY1eq+ANBrir62gAE
         jC8DSLSQFbUlumT6B0BuS4luwWNjgu158VwFzVE2hOz6assaSqgyYHf4hRMHzOa9I47V
         1SEFa1OVdcTkhDy93yfnTDfhq6Z6rFwc0C7OruUHcxmMQaZH8Q+cD+qECKzeL4Z13bHJ
         encQ==
X-Gm-Message-State: AOJu0YwnbEocOSr7SPq/yDZoUxlq5VckWM2RuP7fD7jquHPemIOuTyiE
	NhtJx7HfrG/mgOFioSsXjDMRmSVqbKusbwMvfjKGLxg4pEAmuGrpRctwlGLbR/032VZIIHXGJKw
	SbUqK
X-Gm-Gg: AeBDieva/HYS9rZMf/kG08xjCJ/MWukMoZSL2njMjzSypte373AMxxbEidNxnLGcPXV
	Mi6ubTkCkgX8Ok05/CLFxmjqu2xVcyLUhk0ZFnrw3qDkCbTewoBf3GSTwEuVU0RbG37vvJNSBgL
	Kr++ImORyx+J/nZkHRPEzXZO0qpLYyIcNEeHnhnGUOndbtcllQJ7D2ZgrIQDfkoeR/Sm7JiX5/q
	URAlGrILRNx4p2NKpbgMZTroQMOl3v8uaeYz1cPBdGIiAb8Kq4w/v5t0nJch/mZTq0kh2cIMX1F
	OSkgjKbfWHtPG/fVK2EHd7edCA6hkfnF9dY24aqXEBULzkM7jUg0WxslrkUdktR0H7D24vL3LCA
	yMWXl9cgBC0ltjW7XzswVU3iKNdWDXiY3VqpbnvHi99bkKxgpQ76Kee6Nd9cBwizFMCXXfjNGTE
	IpL+SxCe0xig9xeRSmXowdphPk6+O63oeT9DT/KR9xgXdc4OMz7MgbvPxmNRhLfkm/n+3YJVssH
	8ZpEUuoZmUnaCKVDD2df2MfNvztfeJS2ubu5E1lEl9Y9PZ1QqqyryD/Cj6x8+XG93lejmrzjRio
	Y/XWWehGZSr7PfyH5W6fjnalKt08/sPkVDo=
X-Received: by 2002:a05:6000:604:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-4478e4c620emr6445197f8f.9.1777469567426;
        Wed, 29 Apr 2026 06:32:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c00sm5942795f8f.25.2026.04.29.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:32:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH] libfwumdata: add new recipe
Date: Wed, 29 Apr 2026 15:32:08 +0200
Message-ID: <20260429133208.613280-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 15:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236109

libfwumdata is a lightweight C library for parsing, validating (CRC32),
and manipulating Firmware Update (FWU) metadata, allowing tools such as
RAUC or SWUpdate, and in general any application, to modify the boot
bank selection.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb

diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
new file mode 100644
index 000000000000..838b4983c21d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Library to access Firmware Update (FWU) metadata"
+
+DESCRIPTION = "This package contains a library to read and modify FWU \
+metadata. It provides a minimal API to allow userspace applications, such as \
+SWUpdate, RAUC or any other OTA update manager, to modify the boot bank \
+selection."
+
+HOMEPAGE = "https://github.com/passgat/libfwumdata"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+
+SRC_URI = "git://github.com/passgat/libfwumdata;protocol=https;branch=master"
+SRCREV = "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
+
+S = "${WORKDIR}/git"
+
+inherit cmake lib_package
+
+DEPENDS = "zlib"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


