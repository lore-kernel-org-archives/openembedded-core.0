Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.11140.1611768478231336933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFQhK/ka;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f50.google.com with SMTP id ke15so3749629ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4QhVNr//01FMDB8qUsGiyTbOZo/UP+ZxjwqQIHBFWVs=;
        b=KFQhK/kab+gE/UEgY2mc9Av0qo/SMeZ3eRlT7ojwUnLzTcnYb27KItjkb+edEA28ct
         5gJcKnYpNFKfJedNoAA4KO7zA7dqI2FzGfdpuvwtDY1h4U5HEXZougU8dGDQgwzJ8En8
         1HHs29QqxaStqmW9IkgILYjVOAASE0wAjnu2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QhVNr//01FMDB8qUsGiyTbOZo/UP+ZxjwqQIHBFWVs=;
        b=PoXvnIBnPofAsWfd+YG0RNWuq3k3aY3A2BP4ECBPaBNoqVV5rsax407Lw+5DDY8zAp
         QuDi+nqj+j3rD18iNtVv847F6/AUlu78gyUIYc85xlVM5sqCdjRlMra86ad/947O/VFG
         TKWqJfweT1dJdNVz4luJBZsbjdN50sD1t5aI0I5MO10MGlVO27YmrYOl9Zlq35gtem7R
         9/vbXo19zEtjK1aICpQbmHnt31WWqOaMYwAheXgfc+vfjuum8j76iF+RVbE+OwJ3XES5
         IQMj9up3koGvQ8o8TFqik48E0hVH/LYsLyPDjYzg9vdJIfnJuoldfjWoIJt23fLHz7JK
         6+ww==
X-Gm-Message-State: AOAM531qalEGcBiYpkP3+xNeYQQ5ofsEwv3mJRmVxeEl80YPEpxpzghN
	840kayxMBLX+NZeanU4xNvyLmM6VlLva5A==
X-Google-Smtp-Source: ABdhPJx25eMkplxvaDOKVAbzECJyDK/4cu/CquQU3XwBbFF6wdZbWENJS77MqaUOcHj4KU/Ed5gVsA==
X-Received: by 2002:a17:906:f841:: with SMTP id ks1mr7562040ejb.507.1611768476542;
        Wed, 27 Jan 2021 09:27:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:56 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] bitbake.conf/python: Drop setting RDEPENDS/RPROVIDES default
Date: Wed, 27 Jan 2021 17:27:51 +0000
Message-Id: <20210127172753.1286275-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We never recommend setting RDEPENDS or RPROVIDES without a package name
against them. The default in bitbake.conf is legacy only, drop it.

The python recipe was trying to add to the empty variable in the native case
fix that too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                        | 2 --
 meta/recipes-devtools/python/python3_3.9.1.bb | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af1b3b8c3e2..790859e8ae1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -272,10 +272,8 @@ DEPCHAIN_PRE = ""
 DEPCHAIN_POST = "-dev -dbg"
 
 DEPENDS = ""
-RDEPENDS = ""
 PROVIDES = ""
 PROVIDES_prepend = "${PN} "
-RPROVIDES = ""
 
 MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
 
diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
index a89122f9494..a2dc572672c 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -240,7 +240,7 @@ python(){
     # First set RPROVIDES for -native case
     # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
     pn = 'python3'
-    rprovides = d.getVar('RPROVIDES').split()
+    rprovides = (d.getVar('RPROVIDES') or "").split()
 
     # ${PN}-misc-native is not in the manifest
     rprovides.append(pn + '-misc-native')
-- 
2.27.0

