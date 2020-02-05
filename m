Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E12960C92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 15:42:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so3320474wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 07:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iPXB4ZtyFq2zEAR8sXh/p1WoP5Th/MacdougpbuL+TI=;
	b=UCsoDDOzaWOUQJ6/pNxNXrb6bR001IuLBWuXjjJTTUUDF5fontrBTNjeN7yGagztCx
	XPDZ3WS0kOYSbjVmauiNhfVKIpdW5Tv8IvsI6q8iGUffvqqsBSIcrT33diTK9GMfRt4W
	RjCKU22+DaQNliNgnm0v1ErQcEjf6A5t1tG0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iPXB4ZtyFq2zEAR8sXh/p1WoP5Th/MacdougpbuL+TI=;
	b=qhrgDO2MFitYPoY80iFTDD7XMhVtVOKPygG9F1OZ7uaQmtEIUdM9cbsdE6KVUBqe2k
	H72tKrzyVhfZqa4Sa/PpDaPOAKtC5AwU3dQiIwwh20XnWDbV3fQKDewyG6SEeB8nTpP5
	Q7EwIwdJylzYTilB2SGBOUno1rq3GD4Az5GRbQvPnRA+JeAEXRVhIvIBID8bctz02CSL
	iV5S7/wgLapW8flSiRl32vEi8IkhPuVU3ETWijtvRnKPcxy5IHHDHXqOGlMOb+BxAXvO
	gQUSMa4kqDiQuU2XKkoFZD0UB0/fS1vUb1cK+imGzk/4eDWoeq6pFbcQiWDCdm7AoEqo
	Ifxw==
X-Gm-Message-State: APjAAAXEOy1F4GdrxHFujp59oA7NHHrlP4r9v9N3LCm3po84xh7fyUDK
	TGO9oFcffyZao5sRa1grZoUfYl22cV4=
X-Google-Smtp-Source: APXvYqw5Offx3OvKh4wmCm6X8jV4F0YO3jslVFgzb7U3iQj91Vj1nQwrqg8PkxZlEdclrTRz3R089g==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr30978612wrk.53.1580917365616; 
	Wed, 05 Feb 2020 07:42:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l17sm223465wro.77.2020.02.05.07.42.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 07:42:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 15:42:43 +0000
Message-Id: <20200205154243.839-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] tar: Fix build determinism, disable rsh
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
X-List-Received-Date: Wed, 05 Feb 2020 15:42:45 -0000
Content-Transfer-Encoding: 8bit

rsh is insecure and obsolete but tar will enable support if the binary is
on the host system. Some systems point it at ssh. Lets explictly disable it
for now unless someone actually needs/uses this at which point it could
become a packageconfig.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/tar/tar_1.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 18f09b5711c..ebe6cb0dbdd 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -22,6 +22,8 @@ PACKAGECONFIG[acl] = "--with-posix-acls,--without-posix-acls,acl"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CACHED_CONFIGUREVARS += "tar_cv_path_RSH=no"
+
 # Let aclocal use the relative path for the m4 file rather than the
 # absolute since tar has a lot of m4 files, otherwise there might
 # be an "Argument list too long" error when it is built in a long/deep
-- 
2.20.1


