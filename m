Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.178.1617899552654601118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tiMt0FHJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id i81so2776357oif.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P97RIji1/8Bo4WmNlTWBCm74+1m9fzVmPrwJO6bF57U=;
        b=tiMt0FHJAelAU5/VplPaWaJiOvCPVQmRpWpg2soX0F1BuGCnNV3ErAsWpILzq8Hkx9
         4SU44TqOq7eTqxx0RpLu3Gox/+Kc9ARsQXPcoP56wHP0CuaQlENTT4CUvcEzovkWFcqS
         r9CNgw/IFucnFFdOFQhDuAyojbI7dcG1vL3bVcpWkWhb96IuS7S0IVJWJa8vnOA8yv90
         Qcq3iIX2+ff6kO7sHB04UCVuRY7KDrLlajXsSKyzIur2FGtgcCvz1QTt+RqpR9Ul4Vxj
         PtrZgmXhOArdIq9eoN5w50x0VSQ5dckcv29nnYD2Vf+m+EvK/14+Hsfyzqkd6oQy9KAf
         P9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P97RIji1/8Bo4WmNlTWBCm74+1m9fzVmPrwJO6bF57U=;
        b=cnSrw3r94JPqe1Sq2bK9qCini91aukFtfHiILug+RChxzzPgSXHRdTeY5HOcCtFw5I
         eNgkwTtwAVgylXle6d1s5m6bh+kPqGizCBrMAKeqPQjUwZJgGauV6IJLz+OuCWHZsNFO
         OmHN0TBN6zzPmNNE8ec4qX83YxqaFGQClhP9QzMIO0IaBW9nb5HVkquKzmZrxaWrNuDX
         Y1ld0AePfJvl9tuTKKMOF2/vcFF04hwQuqAIsrwUIHIS6xBvJ7u+I9DvHTFikCaUYdNY
         5Hp1UxTnzULFaCYEJmXEjDkszAocAP3+BqnKuo1sGv2gUCyOZZY4Txed0+WRBuA7WTZV
         QRRw==
X-Gm-Message-State: AOAM530DzdKX3bSovfzn6lTfJ7e15ltn/AzRGzxzbvBemSYDZr4/pVi8
	Fbb3KKjRkGra7IU2/+vTzr9K9xbfyedcdoCdrVo=
X-Google-Smtp-Source: ABdhPJwjQ891T14jiajnyTGHgCL3AgeYecPwsbWQqLYxn0d9P6rP+z4IrTibZT2dEof44Kbn0Hxf8Q==
X-Received: by 2002:aca:4004:: with SMTP id n4mr6713075oia.89.1617899548573;
        Thu, 08 Apr 2021 09:32:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/11] goarch: map target os to windows for mingw* TARGET_OS
Date: Thu,  8 Apr 2021 06:31:10 -1000
Message-Id: <cbc074c2bbf5956ff225e794bb0b214c94a93d75.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Morrow <pemorrow@linux.microsoft.com>

mingw32/mingw64 is not a supported value for GOOS, so map from 'mingw*' to
'windows' to enable building for windows targets.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1099b95769..ecd3044edd 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -114,6 +114,8 @@ def go_map_mips(a, f, d):
 def go_map_os(o, d):
     if o.startswith('linux'):
         return 'linux'
+    elif o.startswith('mingw'):
+        return 'windows'
     return o
 
 
-- 
2.25.1

