Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.9316.1625231385898246664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 06:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtZ6v0zq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: tolvupostur@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id i5so13220057eds.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dR7CDOZ6d6AKHW8h7gcYRaWpgNzWiw4S6xDmCdksNlo=;
        b=rtZ6v0zqWhrMCdLADyoaKZraLF1PUXJPBrJKY3GucK8U+wDkkUgagVUS8hshgHUWXv
         Bj9mXN/FR2jyg5ehQI8hUVL0dRW/IbO7FeY4/H36nXV9UYbb7hAoD4Ivsly3/uazAq1W
         DRslrrmtZQS2l5eIVDKq1Gg9O6P8zsRmOB5cibO54eaxAlmBlmgRcvvrSPvYnqkgAJka
         TDqJBvlTAJW1M8us5dzHVkMC2DG0azJuZNfLo557OYwD9Amn+U5YAZMSyyjRnyXhc8cA
         rkGaCAaufMizPnOatu+Divvn3m5HxlkBry8V9L5wbrMUnjj0Te3Oo5KhqjTVPVpxzNhP
         LSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dR7CDOZ6d6AKHW8h7gcYRaWpgNzWiw4S6xDmCdksNlo=;
        b=ilbLW57LgpIqcivVUZ632DvwDxktgWyxdUx0szEU0t/LNDPPZPZ040FktJDyo+RKdx
         2PFfDnLLgFTR6bGX2kJW/kUOnMe+jGYfhSrcKPJKKVQBB1Mq6EwNtIuQ15AzzuqbJ+al
         140yIVJ+nTRE+zlYEPsnQNc7UkVk2j2ztwxVQ/Wv6MSS+uckyTU7sRTF+Gi+52iAMWp0
         6EgveuErdxe7fvTVuIqSaJ0lV757YXO+9JwJP0p2Q14snkhLD334i7KKNzQkyk3jMzdy
         Q/oQcTxPBVsJs7Ioc0lRD5ymfJ395Qmmi1H1K8hRI64HjNIKvZrL86OQ6oPH19KaKt0q
         kkUA==
X-Gm-Message-State: AOAM531GFa5vy9+icgIzck8GIipqWxS0o8N7lxTnwxgtrEeybZXro1p4
	eNtQ6oH8GzMEnHkZpMQXCkwbd6ib0Aeew22tCXcblA==
X-Google-Smtp-Source: ABdhPJxJUC96NyX8CnMsNEHGcovkBqkPsqpXB+FzcgWjyVivFNu4FfdRQG6wK0OTLQ8cARSfkS/o/g==
X-Received: by 2002:a05:6402:26c1:: with SMTP id x1mr6621325edd.261.1625231384376;
        Fri, 02 Jul 2021 06:09:44 -0700 (PDT)
Return-Path: <tolvupostur@gmail.com>
Received: from vision312-sde.vie.at.tttech.ttt ([213.143.114.199])
        by smtp.gmail.com with ESMTPSA id c6sm1268848ede.17.2021.07.02.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 06:09:44 -0700 (PDT)
From: tolvupostur@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Einar Gunnarsson <tolvupostur@gmail.com>
Subject: [update-rc.d][PATCH] update-rc.d: Fix enable/disable command
Date: Fri,  2 Jul 2021 15:09:40 +0200
Message-Id: <20210702130940.7405-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.17.1

$[] is a bashism and does not work on POSIX shells

enable/disable on links numbered 08 and 09 gives the error:
'bash: 100-08: value too great for base (error token is "08")'

Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
---
 update-rc.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/update-rc.d b/update-rc.d
index c9355d7..24ac752 100644
--- a/update-rc.d
+++ b/update-rc.d
@@ -114,7 +114,7 @@ renamelink()
         # or stop link to start link with a sequence number equal to the difference of 100 minus the original sequence number.
 	if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; then
 		oldnn=`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut -c2-3`
-		newnn=$[100-$oldnn]
+		newnn=$((100-${oldnn#0}))
 		[ $verbose -eq 1 ] && echo "rename ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} -> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
 		if [ $notreally -eq 0 ];then
 			mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
-- 
2.17.1

