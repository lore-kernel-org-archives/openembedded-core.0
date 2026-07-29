Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EDAC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14295.1785339005948887235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 08:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=NSxHrrhm;
 spf=pass (domain: snapchat.com, ip: 209.85.216.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1081564a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785339005; x=1785943805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3pg7WqS4xBsmGS5mSeKvKfITewrlO8VcfioX++KVfs=;
        b=NSxHrrhmxdHJkTF3Mp4yhtrsHwYt7hlu4lqO5lNJJuDrKlwAOWO7Enfu7djz6lFvEP
         f5ucMgLTf9pV5TXouGO0djsx0xSGJ8nXPWfqcdEBkSk4Pofm1rm5vSGRTDKuULJORPDX
         FEsEpq/GD0gGgwxbN0VQ+V1jOU8QWcj+XQMdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339005; x=1785943805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3pg7WqS4xBsmGS5mSeKvKfITewrlO8VcfioX++KVfs=;
        b=ICAtW1Ir6VgbWLKK1iJg7zAiQfo8kw7Vqx4elWQu+vZ4sRwzwI+RpJ5+0TaB8aQ9Fx
         /VwM2YQHmgwIRYvd6aYzgiKZBbKQLvAjYPa9O3o5EkTL4VHVO11mnfVRj28NQoFNR34P
         GHGBO5fpqWURbOKqhQRkgihoCNrKOy7AD7a1qvsfuSLqE+2VGFo3mw7Flyls0LRV1F5H
         U8ixcI2/VeKmnRm443CLmscmLNNdZGNDyU3Io9gQd9CzCI0tyADAvuk/cETP4GYjUyjp
         n0bBBX/KE2fO+nvG/k1MF9S0po0WiTyns8GjAO4gaYBeeoDeRV84M6aGvQ9HjzOqclFs
         hhxQ==
X-Gm-Message-State: AOJu0Yyc53Ja7c7ZGg9ulTG4BTHngDKaXTatOTEpHHBzush/fuGe9Iyx
	S2JvlEFkAVrPuEG6YTqldoT0eAgoLyrCVrj6aYbNgpddd/vzWZvGewkB3k/Tua8FPB5xhZq4++3
	SYrrNcLI=
X-Gm-Gg: AR+sD12+DE/+h4m3iQm38Hk10WfbWmJqVpWlDEYAA1ddnyAW0bwAYm533G1gRM480LY
	LHR0MUVyuq68TGqgzK9cfXJiOPCIGxkfZgL3yUmnzAtV6we10QXfcEjgCkl2iNuQLQznK4lfaEr
	UYxBORbuPAeI7MEAd+tqq1NRfZjcTphVxuGOCQKMq0NHMOVyoNvAvKDamK9u+0gW7gGQ2HNm5e1
	KapYoXGgDl7Ddki/FSBHqHzU1fFZaAf0zjLhYCPK6wen2i+envaljvm6CJML/lV5rfniOWs0iGA
	UJXL3R1wvBYp6fjUbAWc71BZDtUpQACdSr2FBejwN/s5dxx6iA9ey+/04Szl08qt6DNTyVpeIY2
	/Z+1pjTpfvp+tCmbOY9ytVmP+tSCCt+r7pfiPow6399ZeskaI4bQ7tGuxVGEkUkFwVFtKOIMSY6
	314r8g/qDISAQIIBmkz9nuk0+JnCkXlZiO9kDsuzzmuc5gWp1wFogQZMLtkdGCI+CkUqLPtwod4
	865Fb5EFxu+jXnUA7FblKUbBC+GlwckEw==
X-Received: by 2002:a17:90a:d64c:b0:38e:7aa3:df25 with SMTP id 98e67ed59e1d1-38f6a484d04mr7623464a91.43.1785339005112;
        Wed, 29 Jul 2026 08:30:05 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72735084sm10409030c88.12.2026.07.29.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:30:04 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 2/2] opkg: enable sha256 checksum verification by default
Date: Wed, 29 Jul 2026 17:29:31 +0200
Message-ID: <20260729152931.1347887-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729152931.1347887-1-ecordonnier@snap.com>
References: <20260729152931.1347887-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 15:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242275

From: Etienne Cordonnier <ecordonnier@snap.com>

WITH_SHA256=ON adds no external dependency: sha256.c is a self-contained
528-line pure C implementation already present in the source tree.

oe-core already generates SHA256Sum fields in the Packages index
(via --checksum sha256 in OpkgIndexer.write_index), but opkg silently
ignores them unless compiled with WITH_SHA256=ON.  Enabling sha256 by
default makes those checksums actually verified at install time,
improving package integrity checking at zero dependency cost.

Once SHA256 is universally available, --checksum md5 can also be
dropped from OpkgIndexer.write_index() -- MD5 is collision-prone and
should not be relied upon for integrity checking -- completing the
deprecation noted in https://git.openembedded.org/openembedded-core/commit/?id=e462f47489f35902b6972f9837d9adfa542fc796
(2019).

AI-Generated: Claude Sonnet 4.6
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/opkg/opkg_0.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.10.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
index debcd94a300..e3c2dd790dd 100644
--- a/meta/recipes-devtools/opkg/opkg_0.10.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -30,7 +30,7 @@ inherit cmake pkgconfig ptest
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR ??= "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)}"
+PACKAGECONFIG ??= "libsolv sha256 ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)}"
 
 PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
     gnupg gpgme libgpg-error,\
-- 
2.43.0


