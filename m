Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E58C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.31779.1742141540443596073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ASeEj818;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so6816545e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141538; x=1742746338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRHxN9DZGRY9/huLu1bug3gGvD4vNmfVxhZjEOeJ8kw=;
        b=ASeEj818FR9jeVizKkFmhQR1N33sOD8rORhoduiAigu3FInbXsIAEcd+CF0uSkGNO+
         TScnbM6DWEdFaexa3gS8UJh0x+zTOX0v7SP9Vck8PJVwRn21mv3F4AojCvXUkCMFErOA
         RnVjQGJXwTIdyZQpX2hYB4AebqEk6LC2pnmXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141538; x=1742746338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRHxN9DZGRY9/huLu1bug3gGvD4vNmfVxhZjEOeJ8kw=;
        b=jAUZ4Htt6AgkhfwuHhLoOgJNp/raxjnEv6z3K2+5EmsPMaKZ8PCX7FkBhrek3IRBKk
         gwfS+5v55LN8GiGfgLOdaz+dJ8wicJAV539CEVijzht6se1kvDhPEP0C9O+Zkk0BZERT
         KsObvaidf6gsi584i5ySuFGMy+yOCDZ9izOPK5VH5MLeyB5HsSvoFqxJxo+ytEGOklZg
         ANBo01EfRzYaMEvMm5GaFH49gCqoDEiaXQbvM0UHv9ZTXR0U67sN1HLuM9CwhEbUPsL5
         M5cPN2w5evuCVh3+jRo7c9Cffp+b+EqmiesqKg2ZOqp3raD10QNey2hbfkptozidd7id
         27XQ==
X-Gm-Message-State: AOJu0YyRIxEALk0Wl8vX1KahIbfQ2F0CtUdhZVNME10QKzyg4gOpX+hA
	gB3BPoP+oLN+k+o8LJr4MIgngTxECY1FoL1CJPNkpNd8dgU5J0YDvops6btuQAjG4LlkxKqXLBa
	x
X-Gm-Gg: ASbGnct90oL17ozENTsMe1uP2HNirqz4r3xPY1L4EqiUfBOUZ4zbCvSlGx/2VtgocpC
	2PODx7MGUTSeVUGlPge7FmUXem1w9pCdgAgJ4DHdx7+vsWJ/Uqyyx0DcQ/OjFk+ap1QJOVJaXaW
	PnPx1o31gudyVfRdXzcHCBykd0OUhBBToa/zE8qt2196DF2br8r7LVM9huOZkVoPmzi2tnxtgfi
	zDO3K4FHsPvK1nAbtocsIMJZtldSnypyLv+mN5duuJjLZMSI/Bvo3BXstRBZkLf2vbwIgTuZ+7t
	WF0mQXabf0Lrg4tFkFX1XWedUw80SaIl2RsaimXX9znQ0wQtxLUI7pYABgzZ6q1BJxuJ4pWnJQ=
	=
X-Google-Smtp-Source: AGHT+IFmE/UMLmxkKxz1KWHykTWP4td1xOkMrO1GijPixoocQPYxyycezuWi2w+M51vnWFGpKgtLjA==
X-Received: by 2002:a05:6000:1869:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-395b4231bacmr14915856f8f.0.1742141538124;
        Sun, 16 Mar 2025 09:12:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/43] gcr: upgrade 4.3.0 -> 4.3.1
Date: Sun, 16 Mar 2025 16:11:33 +0000
Message-ID: <20250316161209.3629986-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213010

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.1.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.1.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.3.0.bb
rename to meta/recipes-gnome/gcr/gcr_4.3.1.bb
index 3fc8ec0a643..f556376258c 100644
--- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.3.1.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
+SRC_URI[archive.sha256sum] = "b2f070fff1840eef70546a28be80235427c116aadc593b5b68ccc869be3aa09d"
 
 PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \

