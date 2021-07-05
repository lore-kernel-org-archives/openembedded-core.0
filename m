Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.7539.1625468899019217257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 00:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t39mYkqn;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: tolvupostur@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id m1so22431743edq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0dc5mjeReCTk9J5mwxUidH1uuZoxKMY5bzYHSBhfA90=;
        b=t39mYkqnYxGJBg+HVuv5si4yrKAZ0KO1PhnQpLOO/k2HxX2vUii2AEPUHr8K4G+iHJ
         Lcseo4GIfpi3Zm93lErJeMfZ33989yjlusRdQCtg815Bgc9ERLR5BQdG9pa7RjXbI+am
         t8K0o2xpVxjoivLZ4djCe4KMqQUclEVOfbLRiFtM9VDPJmSseuZjIzPvRnEh3Cw78gV3
         lJX3OyaPXriFgzuduow8CfJCNQuxW7kdcfAIlTT376JySF2zaLkZHjqb+VS0WqB+dqR2
         Hy6gzUvOrMgH5xkGXAA2wVQMClEZ5Ny1fxwmBnL9cGAfzzRTyXtnmT/DfC4V8u+8z22d
         v+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0dc5mjeReCTk9J5mwxUidH1uuZoxKMY5bzYHSBhfA90=;
        b=Bansgt3RPTo9JoM2+tTMxGt9dyaV+to46wD23ktfMU0xSKV6HJvOcRTN58yJ3XuviD
         PR1tf6f0iLVAbYWJUzJMr24cJPtEXIA/m3QWFRrz5ONiUZjDvzunjJfxo+rifoPUylED
         evH+LV+Xl6QiI0jfnQv3YJ9ZzboRjoyX73lMIqn2F1a4TO3EKvA9MEQOc4EERb0KtBBw
         vMRIfitWIvEmDmWaLWz4ChIVwGxxcG0EVMDC6niOeUlBxkJO8VGQOLkTUqzXIMKxTChy
         2I1XsB/bWC+IPnHYez9bugA9A2nzgnaCe3fU8VdM4k5eQIH9upaXsrbpwkTLZqY3VX91
         KryQ==
X-Gm-Message-State: AOAM530ieJ73rl9nianqZaGhuxmvIi1z1HECprtXzaDhebx5/R7V0Zla
	xEgMlN/zSByIxf/3P9gvYDFtQKC4Nr9A7gDOA4w=
X-Google-Smtp-Source: ABdhPJx/dVZu1ArtMwBleShpOlSZ9ZGNBcsWSRIe8rc95BRaI88QYsiuk4eyosE1eCWjvhj4/aNXcQ==
X-Received: by 2002:a05:6402:4cf:: with SMTP id n15mr14917147edw.162.1625468897319;
        Mon, 05 Jul 2021 00:08:17 -0700 (PDT)
Return-Path: <tolvupostur@gmail.com>
Received: from vision312-sde.vie.at.tttech.ttt ([213.143.114.199])
        by smtp.gmail.com with ESMTPSA id lg16sm3964004ejb.69.2021.07.05.00.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 00:08:16 -0700 (PDT)
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Einar Gunnarsson <tolvupostur@gmail.com>
Subject: [PATCH] update-rc.d: Fix enable/disable command
Date: Mon,  5 Jul 2021 09:07:40 +0200
Message-Id: <20210705070740.10780-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.17.1

$[] is a bashism and does not work on POSIX shells.

enable/disable on links numbered 08 and 09 gave the error:
'bash: 100-08: value too great for base (error token is "08")'
Links numbered 91-99 created a single digit link.

Links numbered 91 or higher now create a double digit link
with a leading zero.

Signed-off-by: Einar Gunnarsson <tolvupostur@gmail.com>
---
 update-rc.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/update-rc.d b/update-rc.d
index c9355d7..95d1c22 100644
--- a/update-rc.d
+++ b/update-rc.d
@@ -114,7 +114,7 @@ renamelink()
         # or stop link to start link with a sequence number equal to the difference of 100 minus the original sequence number.
 	if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; then
 		oldnn=`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut -c2-3`
-		newnn=$[100-$oldnn]
+		newnn=$(printf "%02d" $((100-${oldnn#0})))
 		[ $verbose -eq 1 ] && echo "rename ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} -> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
 		if [ $notreally -eq 0 ];then
 			mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
-- 
2.17.1

