Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.107121.1597919096747685013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l52nQaFi;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id d6so1870681ejr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GMnhcGKoE1cIkp35tVRXxw9PEFa5rlraSOpeWXyD0cQ=;
        b=l52nQaFiQ0QBPPLEcy9Gs6On0aOglYKw7MpbuWdU0iRF8Bt0/I/lLv3mTn5EzYClTc
         XPhSlXSg9eOfpRPZzI9HhIwGEeMznWD0sfPBkOt91E+VdRhOFB8qhLHKASwWc2CUwHpE
         kh5qbl6TReu035KFASCYrpSGBJnKhRuv2MW46bqH5YY70RRmdhiKXLxvRbGnRPvIAa1w
         M2sYuoEK3T+KzxemqWhwTPDq1Ze44rYzm9GfExA8znbO5J09MIaNMH1XdJ/HyXBYpqBo
         E1YRD535gxq7KOVXqhms3djM958iOGyWSfzX+M4deNg0uLmknYG7b48qn0K6LAV2kYa1
         StTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GMnhcGKoE1cIkp35tVRXxw9PEFa5rlraSOpeWXyD0cQ=;
        b=FoxZoFdWuonTjtSdsRGr8mLnS6Cby1BdqoHq2GM6zBxuYgOldzjLmudefcpkQUeIAO
         YwGgNpowljUFJyTI30jxkaAF1qni51qZvnUbzLuTsRUHH2jLoyUCWjB1siiiFensT4Ef
         z2P7JC+GkR9RO2B7QyHeswkppV/0/MPBOoJDb7BMIsKg56TljteUlVYg1TLqj5SIm016
         30ZPD9we6YLV0BiKd7rhrncGVB3FPq7KnC4qlsdRt4QA3vrbcyvx3GQHpkwu1QuMzxO7
         LWBvlzlbI0ifTbl7LJDOBkR1Z23dzDLNC+KtMhxRnhSmjLXCxyU1gIkroCY9rK3qaWyE
         Smrw==
X-Gm-Message-State: AOAM531nQrx2LOUEOgB7U6dBEVVQ9WXUXEcmzoBUCCuj8XHmwnhecIRo
	MVYahSXKeQWcEXO/jVLXRATnG4PWNfJXDNmT
X-Google-Smtp-Source: ABdhPJx8vobANl68ie3ApU6HAWSCAMuDrDtwSa46DxljKoa7lc2HvT/wOB+FAFGUb8eDxiOozYRR9Q==
X-Received: by 2002:a17:906:b108:: with SMTP id u8mr2664746ejy.249.1597919094808;
        Thu, 20 Aug 2020 03:24:54 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:54 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/7] nfs-utils: Drop StandardError=syslog from systemd unit
Date: Thu, 20 Aug 2020 10:20:37 +0000
Message-Id: <20200820102041.28077-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

With systemd v246 the syslog target now generates a warning (and has
been deprecated for some time). Drop the target and allow the default to
take effect.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
index 6481377d8099..5c845b7e82f0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -17,7 +17,6 @@ ExecStop=@SBINDIR@/rpc.nfsd 0
 ExecStopPost=@SBINDIR@/exportfs -au
 ExecStopPost=@SBINDIR@/exportfs -f
 ExecReload=@SBINDIR@/exportfs -r
-StandardError=syslog
 RemainAfterExit=yes
 
 [Install]
-- 
2.17.1

