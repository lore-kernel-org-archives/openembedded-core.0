Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.4285.1612602262360859329
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bz9/NjTu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id o24so163497wmh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGzHm/lNnS8LzE3OsmPQkEnN/5aQwyEzG8shmKdl5l4=;
        b=bz9/NjTucexLHxz3Q/efp7CgIpi2YC1boH8OauHETSeUVdl9J8m+tXlFabhKAapILJ
         ixIs83dWHviX6oSe2qEjzWMfHnBQeDav5x/Fh0IY2sxcKJCgMCJQdpnMDZJtmvHd8yXm
         pikSlv0sm5Wf6bzP3ds18weuLt1W3DvLMvPpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGzHm/lNnS8LzE3OsmPQkEnN/5aQwyEzG8shmKdl5l4=;
        b=kLxJE3MgWGnmSMFrOZVfPRufXz4uVi2wFUvc7EEVcZtQ3mYOUIlKFDQNUhmPZTzQh5
         rg74WOuEoDFPMH71nG1Pltf/Fd85T0dvUIIr2gvk7BSdheJNO16l0rPbRRBMNBl9zqiJ
         pzyzN2JJRVfgWZBl10bhvqs8c8lqAYidxmtax2LAwKNIjTLCco83WX+82miRAm871dDb
         rEqGPstmnsMR7+BuVoBTn8gxa20IKyi0l5DoeXrpA/0w0xvhgY0jpuncIhYFgNcGNfhP
         KV4tnSSVsWd07OEnu4Mmy+peij5oO0rjQABnsKK46B8Kv4s9EzztEcWzoBbBhv8j8VAt
         9YMg==
X-Gm-Message-State: AOAM533mP5wYnqb0Mz+Zxf04qvBhFHwlIPoiNIYYwgtST2uj8r7i0rXt
	mVICp78g9ba2LUi0jQCb/y53K35+1HBfRQ==
X-Google-Smtp-Source: ABdhPJwj58k+x1Z+rQP0LJBH3aHSWRs0TvLczJAxaIWIZERnkOV6yr/VFxL6NtSaSDWXx98ZYZNRxw==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr6709952wmc.161.1612602260906;
        Sat, 06 Feb 2021 01:04:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 09/10] autotools: remove intltoolize logic
Date: Sat,  6 Feb 2021 09:04:14 +0000
Message-Id: <20210206090415.1707868-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

autoconf 2.70 now invokes intltoolize, so there's no need to do it again
in this class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/autotools.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 9a328c22800..b334a8186ad 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -215,14 +215,6 @@ autotools_do_configure() {
 			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
 		fi
 		mkdir -p m4
-		if grep -q "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC; then
-			if ! echo "${DEPENDS}" | grep -q intltool-native; then
-				bbwarn "Missing DEPENDS on intltool-native"
-			fi
-			PRUNE_M4="$PRUNE_M4 intltool.m4"
-			bbnote Executing intltoolize --copy --force --automake
-			intltoolize --copy --force --automake
-		fi
 
 		for i in $PRUNE_M4; do
 			find ${S} -ignore_readdir_race -name $i -delete
-- 
2.27.0

