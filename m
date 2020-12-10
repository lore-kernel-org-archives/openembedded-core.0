Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.20319.1607632124530986146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=djM/EQOh;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: kergoth@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id f9so5201543pfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 12:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKb6bTHigDveHHnKYi1fwXDVJ/fE/YMtOZ7IChMjTLc=;
        b=djM/EQOhvEw08WrK7umhJwJJkomoaOp0kSlPLPFHC6ssIsp+W1UybQdzn6rIYnFhpY
         3imuE98Ys+KsprtfErm18V9qR1gj/7o4DhsBJAzksOgq0L5ArJB8MOg9Wbod5mF254QB
         dodKAbCxd9ugdXjhcIdPR64J7rPQZjYp9zDDXQ7aCl/EoTR2TB2oIP9AZ77LW5MnbUn8
         fdFevdLcnh1+/dITIIJsFSLAqplXDTDsREGJHTTRGwAnEvxP1rIslE6oBUa+XXCqhq04
         8KAGeqCZWval/Zr4mkNMvJgBYC1B+mWT49ZU5AxM1TtW6kMooUp32FlRScALIjqhcnSM
         4q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKb6bTHigDveHHnKYi1fwXDVJ/fE/YMtOZ7IChMjTLc=;
        b=YscSbBYR9B89Kn1gR+NL6BQlKFklQ5oJ1e+2AZHixkVcndsr3bPPiGm8NdwwlmWS03
         5Zd4+TNt6Kle15uVz/E1abIPF4e7KqgkiIq661KPfnn9ChkB7YNFSVsopXaPOOeOEPtG
         zGN7XaudVlQw54LMEwKk8RQ97m34t+9o3iP4/NSrOFctHyODihOJhCV7QCvX2E4im090
         ALoTn02wlDLF5us5h2VULDfLPeBmi2VwCO4ov7xTqkcFrtEvJubutlf9nVpo8NDb7gW6
         auckucb6T3v7cCxh/omHnXKqdZFdhsvQcSW9KpTv4vHtGmJ1ztLq3rfX9CItiU3zk13V
         2gkw==
X-Gm-Message-State: AOAM533DqhG8ZD2WbX43ZgO3bOaqjJXccCXVrDNUW+98FnFYLZkCkyb8
	Oko70X07BkXHxTg51VIXsvtq3Ev3aotruw==
X-Google-Smtp-Source: ABdhPJzIn0Y4vzC7PugRkzFqltDDHMLvcIFIDRZxmZ+TbNYtKSCovp3MZT8iI0HBGYD1HzQTbFY/tw==
X-Received: by 2002:a17:90a:cc06:: with SMTP id b6mr9382766pju.94.1607632123738;
        Thu, 10 Dec 2020 12:28:43 -0800 (PST)
Return-Path: <kergoth@gmail.com>
Received: from localhost.localdomain (ip72-201-170-237.ph.ph.cox.net. [72.201.170.237])
        by smtp.googlemail.com with ESMTPSA id v24sm7287929pgi.61.2020.12.10.12.28.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 12:28:43 -0800 (PST)
From: "Christopher Larson" <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] grub-efi-cfg: exclude OVERRIDES from build_efi_cfg vardeps
Date: Thu, 10 Dec 2020 13:28:26 -0700
Message-Id: <a821110489e9bea6e3028d15275a5f6a17711e1c.1607630988.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607630988.git.kergoth@gmail.com>
References: <cover.1607630988.git.kergoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

This function is primarily *appending* configuration entries to the
overrides, it only gets it to ensure it's set at all, so doesn't belong
in the vardeps. Having a dependency on OVERRIDES means you cannot use a
bbclass like distrooverrides without changing the signatures of recipes
using this class.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/grub-efi-cfg.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index 3a2cdd698b..ea21b3de3d 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -120,3 +120,4 @@ python build_efi_cfg() {
 
     cfgfile.close()
 }
+build_efi_cfg[vardepsexclude] += "OVERRIDES"
-- 
2.29.2

