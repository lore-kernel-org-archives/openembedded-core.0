Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.957.1625954862939730129
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 15:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UGktkJd2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l7so17093424wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bbv00lwAN2ZFJJjg/ngW4tBr1S5rNrCoRJnbBQtiZzA=;
        b=UGktkJd25mLwb2xXtWsbB/8aHDm/W2xMvDy2I6BnQTU3Iz8tBqZumfTK0JZFhpAxKn
         IDaLijoQWTQQKmpigevLIvIvXhiud1JLbuEhgJqlrtn+sKWaIw9ZGqvDpFoUpS1NTir7
         qNqYtW1OB41Ih0pyFiRr/r3gdDz+yAuIzggO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bbv00lwAN2ZFJJjg/ngW4tBr1S5rNrCoRJnbBQtiZzA=;
        b=tMiUvOV3HuAmRTEusVEI7/87V0dbwqPllMkhE8Guk04esyG8w6ybX1L3TzjO0a8GOE
         wpip2j2QFU4h7RzhvOAXFRz110CBiC+m1F/NYby7J1GJcnHfljSKMRAGp4W9f7wuk2Mg
         RUFyZxI0Yb0gr6a6s2yIMz9rcO3oDZrs0OqEbnX+EBaajCNmMwOHCHwjRVpYtYFC2I26
         atfrAwDPwatqTt0cCCKhUQ/kTIjAzkvOQ+kwRYfLZOljl40ccVUHgSxksslNeIsgj0xq
         HxMs8AQcbNWneKkk/+UBDLENmjL/ezJ9jvoOtQdXwpUKe9ieqynLO3jkqli4pXosXvbM
         q3IA==
X-Gm-Message-State: AOAM533ufKTf28hajEOwdJi5Guo4ReQHXmpr1ruKwYQ39N236BhqksH9
	253z285CMsQIqWoRoNqXXDcKkL0KfPMTbA==
X-Google-Smtp-Source: ABdhPJww49qygTkzUpYrLFpfDjReRqZ+etFsfkBdP1lLbwlGFU/j5icesnxXZ6QJgvQe9YzBHgCIiA==
X-Received: by 2002:a5d:5102:: with SMTP id s2mr24853867wrt.214.1625954861533;
        Sat, 10 Jul 2021 15:07:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id t3sm5146334wmi.14.2021.07.10.15.07.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:07:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] pseudo: Update to latest version including statx fix
Date: Sat, 10 Jul 2021 23:07:39 +0100
Message-Id: <20210710220740.2793958-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710220740.2793958-1-richard.purdie@linuxfoundation.org>
References: <20210710220740.2793958-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates to the latest pseudo version which includes:

 ports/linux: Always build statx support
 makewrappers: Handle parameters marked as nonnull
 client: Fix some compiler warnings
 wrappers: Avoid -Wcast-function-type warning

In particular, this pseudo version always has statx enabled which means
we can then remove the need to make pseudo-native host distro specific
which fixes an eSDK issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4eab133128a..bcfc145d426 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
+SRCREV = "3058622fa8a7a1d1b15246b3ca6809ef643036f3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.30.2

