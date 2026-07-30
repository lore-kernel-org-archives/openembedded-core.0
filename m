Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F63C54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 09:10:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7457.1785402635450588831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 02:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=LUWtvQVu;
 spf=pass (domain: snapchat.com, ip: 209.85.221.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1718066f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1785402633; x=1786007433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3pg7WqS4xBsmGS5mSeKvKfITewrlO8VcfioX++KVfs=;
        b=LUWtvQVuoBYQ0k9rrcuzTrCX8z8ELGRlQ+dWDaYHNitaghCJ5rYAaYVSzoWZRdfheU
         9ibi09QUCQcLc/Pg6ZDS+nWGWWwNi79JOO0EISVSsSGZjPuTip45EAhIDL+Dyt3tNN6J
         rmZ2ipuD83AX53RYYOj1nzY+E57yyUzNAizUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402633; x=1786007433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3pg7WqS4xBsmGS5mSeKvKfITewrlO8VcfioX++KVfs=;
        b=fNQvU3TmZkgB6cl4p0jkhnEQpG/2cIdcgofy4B6FT5Ks3KHOLJriTVesmq2FbYToh3
         uWPQs7LcQjG84wK0cUL5SjLm2i+YErNCfW80KGkYLUXYrt3IRfSfkzc3RQvYRTq+sCv9
         EgGmKJxDYNTxPaUj+wfBonVenlUCggIpjtNrd4ddQtWih0GcjRCKE9MoAMfJbTw2zwmJ
         3CudPSCl4CpGzEhHm5a+vpt8ow128UmDod7kUw5H5bEB+4COxSrj05mWRgkzo6uSnKPm
         vs45+23nQj/KKFLEvy/SuQ02RB6um0wMgjf6JJFT++lotfVnrSvogngHqTXuTimX6zuf
         5IPA==
X-Gm-Message-State: AOJu0Yzbd5vp/2J88XWUry5bkrjpIB2tGmoO6nq7a/vawtkkNz5oeFCE
	RLpLU7W4ynN21ZLMiFw0Zz40KIdAElHcjk48PWdmikzZHd9FPWn4QIBLVYCbVKjnxB5bI9S1y3u
	WMLChFUI=
X-Gm-Gg: AR+sD10pzB9Cr1f88zba1a1kyelAhoxfidIec2iu9YKPh3qGtNg/Ox8d8BB/ZwaTh2g
	rAemPCN2ERN5QBKCcBH28ODYZBLp+cSvNGpWkMchgLHnfuQI69QVzqPmcpTWzVzgM89x/eSugWQ
	2ZKJjnS5Rr4uiw1hMWrD4exVu+0uI7UT7b/TwgXxVznzM4PUka9IHpk3FfwN2nHDU769+HaOdn8
	Gmk4UyaiuCPnQqKFg6ZYUHk++1Z376TZAD+Er3TITitkYzGy2nwdLpIKsO0W110oCrJkMuo6v0K
	mGVqD2abpRJbhsFqVpoYxYTDtZTnVW/ylpTXYMvsrpKmkjkdWvB+XKiVKKEKGo41bX8IONfwDr6
	oEoj1I7U+CCgHk74TzC5wJ+JKvZxcmelUpgQZFbnwxPKDvWVfWqWUPMRnprBm+NPGa/VP/le4e1
	OOijS0M17MpupKBh5ELwgkyOWQRF20DqMM7fPCETsfJS35PdklSfDw3vZvERxlmZVI9FbZOC05L
	bgVHTUA0UDmsKbvJ7FEZWO6pKAZ6oH0kw==
X-Received: by 2002:a05:6000:2889:b0:47f:7346:89df with SMTP id ffacd0b85a97d-47fc81d0e6fmr2265808f8f.24.1785402633477;
        Thu, 30 Jul 2026 02:10:33 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc894c994sm4603935f8f.37.2026.07.30.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:10:33 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2 2/2] opkg: enable sha256 checksum verification by default
Date: Thu, 30 Jul 2026 11:10:17 +0200
Message-ID: <20260730091017.171702-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730091017.171702-1-ecordonnier@snap.com>
References: <20260730091017.171702-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 09:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242330

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


