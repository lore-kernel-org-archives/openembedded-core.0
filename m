Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77137C79FBB
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:06:09 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24039.1789070759992795819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jsjPTOIu;
 spf=pass (domain: mvista.com, ip: 74.125.227.140, mailfrom: sdoshi@mvista.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so643205ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070759; x=1789675559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=199OBdBhpDSKUFmwDSCWs+nUqnKGcdvRv98s2rnItXc=;
        b=jsjPTOIuhgzlWEuln0w5+xeTtgXZR3Plm7kJVrrJy1OOvQKVnntlh4UHYi4Mq4lKFU
         90vQJEErOfdn06SW4qZRaZtR0YZYEdAs9popWrtOz9ZjhhHnbXTREQL7PX5k0EDUmARp
         ncmo4S4khsqxKZAsz9MMuy8xmj53MklQpXeD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070759; x=1789675559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=199OBdBhpDSKUFmwDSCWs+nUqnKGcdvRv98s2rnItXc=;
        b=TODaXVNlsf3YeWAewpfEY7Mj/Hp8rnB3DvaEfWz48z61AYk4vIOiosLz4v5LMhJ/P+
         QYLiwYrbL0pKRdjl6yxKl+Vyn4ExDU++uQQvMs3kFr7sBBDMhy5ogeZ1BJkz/IxOuxiC
         Y6baBL5CiifDPvVx0/d3uoqLBOw8ewaO8XnCOH4DZ+ExmeZAffdaguXGzBQaK+7nsTFI
         38dk1zv/PHAKFDDalHVtlFJpOUetNDmzjzlmVZMhegnYVeKUeX/qkK+yLmghApfXKEcY
         n15+GcWAycIRGB/ynO4i2BV6RR400RrbAz2NL6AIN9WI9Pbqu+YwauWeRKJl+OijXWVo
         sa5Q==
X-Gm-Message-State: AFuF++mKRyy8SOmM6oszDUh9pSe2ealuot41bNwGAyflhAYzrS22RXZ+
	621ux68mrE9VT4XbFUh+QeYltUgT1ZfCF3uaW/uxXadCYKpCZUoqi9KClopTPOSx/pMb7nymuqz
	VDbBs
X-Gm-Gg: AYBFou13hfa/cT9BvCdtf4DEMc8WYQGHfPJD0aG/YhXQrhKMiwpzF/sbWnurs0V8JGa
	4oqgU+GzduNqUj5YdL+mPLiqh+krvErlXSuzkizhxQEL+5vya2uIzrAZYGD9PcAn1atVYsV1aYD
	phcN9xMp6eodIbU5nFU7mBX7wSE39Kv+JKLI/HLwFpaWSdgUIbhu1mJK0veNOnpl5E8uX1FATTB
	BJRVFAfwOFdMkrMFhdgiupuqb8au6HnlOJz5JIQtG4ydFnabmfsEUftatbW0vmmA30R6uIXrrKp
	vouc/GsxPJDiBhx1QjjmpwX/t0+PKmoA3H15cOh19qaHlDZgD+2m5fVS+abYsw3SCoGvfE2Ks2p
	2ie/REw/uW82GgyocD/6UzRqne8aMeBaX9rxxU0QtNzSvu3NQdQlNgij3DCQEFqaC3Tx3wKok7w
	HF2fRotADFVaulkLkgwsRytC/K08lVJyDNjNmpW5up2Y7YwcBKOyQOB2V4c4AMw8AkxL2+Dm2++
	1xp5eGkQ2o=
X-Received: by 2002:a17:90b:134f:b0:399:1b08:28de with SMTP id 98e67ed59e1d1-39d9beb0be4mr630705a91.7.1789070759452;
        Thu, 10 Sep 2026 13:05:59 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:05:59 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 5/6] libxml2: Security Fix for CVE-2026-86141
Date: Fri, 11 Sep 2026 01:33:28 +0530
Message-Id: <20260910200329.842463-5-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
References: <20260910200329.842463-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245597

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-86141
[2] https://security-tracker.debian.org/tracker/CVE-2026-86141

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-86141.patch       | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
new file mode 100644
index 0000000000..cea31d8d14
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
@@ -0,0 +1,36 @@
+From e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 07:56:18 +0200
+Subject: [PATCH] xmlregexp: Calc string length after null checking
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1107
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/e89a8aae4c9b40cdafcf66b3f9e57c62db37bb55]
+CVE: CVE-2026-86141
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ xmlregexp.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index 5e15311..1c1b25e 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -702,8 +702,12 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+     if (string != NULL)
+-	ret->string = xmlStrdup(string);
+-	ret->len = strlen((const char *) ret->string);
++         ret->string = xmlStrdup(string);
++         if (ret->string == NULL) {
++             xmlFree(ret);
++             return(NULL);
++         }
++        ret->len = strlen((const char *) ret->string);
+     ret->cur = ret->string;
+     ret->neg = 0;
+     ret->negs = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index b3f6a482d2..2869aa46ac 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
+           file://CVE-2026-86141.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


