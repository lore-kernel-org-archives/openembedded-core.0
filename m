Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.1906.1626837703737686030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 20:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kdm1dgAb;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id m3so861338qkm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p+IloW9JEY3AZKtOK0sQ8qrROlIIGcKMSTjM/Adm/4k=;
        b=Kdm1dgAbZzboVRk8pZy3qdkOl/Pwi293veZkRU46R5bFLaGNFe7TZwJ/99sYywHaM1
         7Uu8/XJo40BuEaMC5QBetcrkTXU5t7dJfYqq4QOOGLHDsuRcMk7kcCGwspxST76VwE41
         HWVLDHxmmmZPc54DmUwFcELD3ferS8q9eqrsLnnPlFYrnTm74My0gaZPBVYoNJ+OLuBU
         k4G33OfZnIt2DhUQYF0cfAZwZywDlpj9gX5sIvZU0IA/B7t8NVWpLZOTGTN4FkqcE0V/
         1xZ1lWQ7ZtLNk0nRMh1Q3OWGG27WxTnFxEkR88eYd9k4Ok415l1tEa4y0UbehTtpLSxP
         Y7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p+IloW9JEY3AZKtOK0sQ8qrROlIIGcKMSTjM/Adm/4k=;
        b=rrkY3cIzU6HCxYcAB0oLRYgIYH4I/nhxSTwKmqOJzyTHAQksfuQv/AOKgi/Ejcb0jH
         Plg4tPVF0S90RRixTndeC0wkYeKXfxzntK/wHPkhlQHP2mE06Vo13bOKl+/sDiYh900M
         sz/AuigCr4wHgL9mgNuchIKPUA8GglIt3vVGXBhZtwvwmyZOsSNG2pHGTUSNniG1RbLg
         l8FzJUK50+WT9FHZGTQdupncw5qNP5TQGnVB6DTUbqZKTCAaiF1YHuGaun8R9WNtFKsu
         WVPQkwQhiePR/7P0X7i1cJW8p2tODI6DUfj+ydqfKawGagLx9ormncT3rCjl+mrycJrk
         ZHVA==
X-Gm-Message-State: AOAM533UXg9X/i0q6hLyrqTa3XBEj1L1mKRAKUGPrjKR+KBnge8y8wr0
	vJsVa/C/2V2ctoN6FxGTvvs=
X-Google-Smtp-Source: ABdhPJzHSkuuh7D2gMB1oXoYrRrEABFDADKsR3cmqfRp17eAQeI5Pcd1MtR88uYo4sjuy1tDLPjX0Q==
X-Received: by 2002:a37:e314:: with SMTP id y20mr32292833qki.289.1626837702933;
        Tue, 20 Jul 2021 20:21:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h13sm10767892qkg.13.2021.07.20.20.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 20:21:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: Fix devupstream SRCREV assignment
Date: Tue, 20 Jul 2021 23:21:37 -0400
Message-Id: <edd90e86fd06ba15d0914a1a70cdd910cdcad6f7.1626837575.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626837575.git.bruce.ashfield@gmail.com>
References: <cover.1626837575.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul@pbarker.dev>

Fixes the following error when building linux-yocto-upstream:

    Fetcher failure: Unable to find revision 570e7aedcd00e7e8a218e37c3dfb3b1fda83d111
    in branch v5.13/base even from upstream

The error occurred as the SRCREV_machine assignment earlier in the
recipe was being used instead of the mainline commit hash we want to use
for linux-yocto-upstream.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index df385f912c..f43e738c69 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -31,7 +31,7 @@ SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
+SRCREV_machine_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
-- 
2.19.1

