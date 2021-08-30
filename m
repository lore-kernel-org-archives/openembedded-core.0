Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.1314.1630349291853762443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 11:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uhsuhLrh;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id n5so23740143wro.12
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UW67Vz9o+V/Em6gYXMKsg7K3xebTTZ0YlNgf6RVD9Mc=;
        b=uhsuhLrh5LeZ8Ho72wiVU/ttwatFFFdnyvXB6DwWzZQQzHATnBKa+gdk6Af2J+FOq0
         xWnW1JodCPTV9YopGzBEjBbu2sataOH6Tpho85FiMQR6ajgTXolhCufgLfHNYE9KXkrT
         7ieahLxSc+cbWLnAHugw0N+jrdueoOlkEQ+Om590sMazsjVl+EADzfK1Qr9bDAg8OYq8
         RuhWzgSx7nuw2hENKhZFf1yt3+D5gsoePdiIZhaQ59nMhvDiL+52N+60PYUy+2Szit/m
         sXpgUiH24yK7Oduq1omgisU13zCXZ/g8UhgcLrKOOC3qXqg1MNDQeK+tRaSn86pGqXwI
         CrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UW67Vz9o+V/Em6gYXMKsg7K3xebTTZ0YlNgf6RVD9Mc=;
        b=h0Wxw0UaoMfxgjwcNISvDuF5rmdpcsGGOgtWvObrWxGc3OZWt1N7Elg2E7yfy7b+WZ
         52k+NNcp/h5kkb7P7HBC/s3jNuIu8CpY+Gy1DwGVDDWYe4uSe0X5l6Lcf9K9OwpoOoBZ
         3emc0hUltRXAmEg1IHeLkrC+8LGEHW/Y49uqwAw6ZuQlNAEjhTT0kY2P4GFNsgR5r3f4
         Uxo+yxXWZbUPI9Yw2A9aArmayTyIWavFSVR11iq3Curh2vmPUVaJ58LaxqncQVEgwsqH
         +lr7sq2OQxSd2NukG/P+gNHOJk01tYgNoJBX26MxQypxOXGpf1CtuHpsAbGGWkpQyr/O
         L6rA==
X-Gm-Message-State: AOAM533C8hUo1kpBPYql6VtWUV6LOTwvDMVIdNgC2q0s87xh8+mpm4BR
	URR7nndbtShhbMQJKuunpNX+eWYNrlK26w==
X-Google-Smtp-Source: ABdhPJwY5CvSRFYsKAbAfBHv5hLxi5I72Sypb6eMSSSkfwjJiiP7GUnjwOvuhVHBRfIm/vsqYV/99g==
X-Received: by 2002:adf:f101:: with SMTP id r1mr27255274wro.355.1630349290446;
        Mon, 30 Aug 2021 11:48:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id e2sm18141487wrq.56.2021.08.30.11.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:48:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 5/7] libsolv: disable rpm bdb format support
Date: Mon, 30 Aug 2021 20:47:58 +0200
Message-Id: <20210830184800.954770-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830184800.954770-1-alex.kanavin@gmail.com>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise this causes runtime errors when only sqlite is present.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
index bb925073ed..d30e61e9d9 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_RPMDB_BDB=ON,,db rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
 
-- 
2.31.1

