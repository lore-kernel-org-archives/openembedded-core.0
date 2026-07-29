Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0194EC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:35:12 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22269.1785360905489560874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PQkpuDZJ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1607232b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785360905; x=1785965705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUQB9R6QWjXWGNcPD3mcykG2nOgE9KHNPBJJsLvGs5Q=;
        b=PQkpuDZJe5uCQv+i8kFZq1NnIlMJKRV6ogCIOUtTG6rjqoYBJU24G+8yUCNit9b8R1
         t8yfiRRRg8KpNnyORDWkHaPGHNnpVnqnqiCW5nrpaPp+GI6xbCdsI7s0TAaNmy8AxGaf
         b217ykpGS0yRJSbSyWIhBa8l1I4BZcu5GdbyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785360905; x=1785965705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUQB9R6QWjXWGNcPD3mcykG2nOgE9KHNPBJJsLvGs5Q=;
        b=K38138m/Hm+93L1bMlbw5FsLuhzgIP3mimQBD68UJpylZQzLzbpdgledbw9JCG8wBC
         Jon9wjOZClL4xlBirckOwPWQgkydl6Qa0wB7c+xKiJohPNFnWtQNLuF0WzMCaYLNq/Bq
         QdW5NmPVxhkmPkAqwG+NA4j+UjiJOyj85/6jMz6C3ZJUujGwEZajRTFnyiyT51THs8wi
         FK9gqJc+xEzqxRp8bkobq6msHohySMYtBzbs7qVYg4k7+kpAyhwe9b3I4GU/0GD1P/vz
         6bRsH8cp2+ok8Suxhqs2/MDelsQzL6as4CLSJA4TnHyWoSwnnxAKLGMSncALXuZy7sId
         0zOg==
X-Gm-Message-State: AOJu0YzNB2cIWy7RYDtjeoAFmn+0ja4BocTwu58jEB+HWVmqCWvRHhUU
	b09lVmnIRmR9Z1CHvHrkjzr08eg3gNX++RPG5btTWYovXmwEq9E7kJ+YcKbS/RX/dVEeYTMjbCf
	h51K0
X-Gm-Gg: AR+sD13jNgT962XCxP+jaP7gxZjePxXovm8R6MzODtlcHAgVbjvqRLgskgimBSUAxL4
	Y0St+WS+JRamEszJiscHyN4EgTn6VxpgpJ4Xo7ksKFdNMDbCxReRB4t8iFnuxRKEdLl5EhqcGlV
	6TSl/2PhKUSKVmF8js4VQe7/7y31Yu41+pstGNPXSIfznfM7qQX6xof6fbBSKyB4MWb3vZYz2ys
	NnAhvNeAYQkBMxSV8PjzP6OvXUxe7qZK8nKpA0agpU0ynLVaVLUJqImtoXsjkleMif+F7CO0ssW
	UcrN6hkhHnwzexvLqqmcJIfejGrWIJuEgF4xJ1OY9jpHMZ7mqOcrSOQt/7tHvwEl/EHV35bQXoO
	GmGfgYuvbDicCBYv4UAWJYQJ+6GoFpzInavBtnzTfbxO6SSnLCa2pNbvlq8+8VnNODNpuP7PlHl
	tKCNyqCON6LMpU4NPoGWIiRGX0sPCB5OI7RHhDq65Fv40BRzo4f+aKbGBPFCs0XQaF2Azc9l8UB
	PyxUkQ3QAtiauknhMlZBkKLk7IIxmOUj+4BKcw=
X-Received: by 2002:a05:6a20:da17:b0:3c3:a969:2cf with SMTP id adf61e73a8af0-3c8ba5f5466mr8881812637.53.1785360904735;
        Wed, 29 Jul 2026 14:35:04 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba3519a5sm1362179a12.18.2026.07.29.14.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:35:04 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/5] vcontainer-bbmask.inc: add python3-pexpect,-ptyprocess
Date: Wed, 29 Jul 2026 14:34:31 -0700
Message-ID: <20260729213430.218008-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242295

From: Tim Orling <tim.orling@konsulko.com>

For container-yocto-builder, the container is the "host" and so
we need the "Build Host Packages" equivalent in [1]. When
we are building with mc:container-aarch64,-x86-64 multiconfig
and the vcontainer distro, we need python3-pexpect and its
dependency python3-ptyprocess to fulfill
packagegroup-yocto-builder-extras. Otherwise we see a build-time
error like:

ERROR: Nothing RPROVIDES 'python3-pexpect' (but mc:container-aarch64:
.../meta-virtualization/recipes-core/packagegroups/packagegroup-yocto-builder.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-pexpect' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pexpect']
ERROR: Required build target 'packagegroup-yocto-builder' has no buildable providers.
Missing or unbuildable dependency chain was: ['packagegroup-yocto-builder', 'python3-pexpect']

Remove the layer-wide meta-python BBMASK and allow these
specific recipes.

Once meta-python is allowed, there was an error for
meta-oe/dynamic-layers/meta-python which we do not need for the
above recipes. It can be enabled in the future when needed.

[1] https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-host-packages
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index 0c9b8b02..572ebc4a 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -94,6 +94,9 @@ BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
 BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
+# To satisfy RDEPENDS for packagegroup-yocto-builder-extras in mc:container-*
+BBMASK += "meta-python/recipes-devtools/python/python3-(?!pexpect|ptyprocess)"
+BBMASK += "meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/"
 
 # ---------------------------------------------------------------------------
 # Entire layers with 0 recipes in the container image dependency graph.
@@ -101,7 +104,7 @@ BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
 # does not warn about zero files matching BBFILE_PATTERN.
 # ---------------------------------------------------------------------------
 BBMASK += "meta-filesystems/"
-BBMASK += "meta-python/"
+
 # Warning suppression for these fully-masked layers is in meta-virt-host.conf
 # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastore,
 # not per-multiconfig datastores.
-- 
2.43.0


