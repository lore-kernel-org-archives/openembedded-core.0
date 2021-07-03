Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.23742.1625326047316425901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 08:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lJm4UBKM;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: tolvupostur@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id hr1so18077966ejc.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jul 2021 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yuDl7i6/5vdaELH4iw4Op0nu1ERLnNZ+6j4kGuZgj0I=;
        b=lJm4UBKM6YSkLg81kPUKHdvQErJ1P1+/t0neyKlA+iAWYOjEub5qRzdtlmFOZyaARI
         eSqq+KsURBec5h/RRJPOwA3UvzESL92ofp2OhUE23fX9yMk1diVt+xmd91/GmFZhImDi
         VUvYcPx1CiIUWSUd3X6QXhzB8Qote5kPh/s8puM0o1oP0dj/MDKfCkh6hPdqzCXsm4R6
         kBbcxviILHmMy5E4UP35rqmXEA7B2XB4t4Axc/MqAvw3kRmXtln79N3Cgql9sxgy/p5V
         hO6SNZVA8l8An7f2enUf89FzaQ0d0LXGJMY8RTy54ZBGmLZl/Rvyni3O7qT0NUO6mQHQ
         nwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yuDl7i6/5vdaELH4iw4Op0nu1ERLnNZ+6j4kGuZgj0I=;
        b=kKsSqzJUGWvQ5zUFWbSsgTq8oqy6Rcb4avSWKvVyMzbKpU/Yd1Hr79pgy3lmvWJuZL
         KWONMM6wIGKfJ0dFgqt2YJccz1d28p4bQPHw2O4mn6iU2uFRTHu1vWTfOb5qDeelJOfT
         W91I8okLKglblhAJonp4QbOtJCx5XbhceH7cT1FzuhPNCR4kI+P8rvUpOjdZOpgcvmR/
         RkD/tjdoGf0ljvm0qymi45Q0z9uPS/3/zGopTVXeNmIzu5tVqxkPG6CkfKQjOlVFZa9B
         mhDhAltGv9Qyckft4Yb/9F/cunm7UvoAWki1EWnrXP5njhkSDnNMQeD5tNSsE/xeuuXH
         Qa5g==
X-Gm-Message-State: AOAM532u+o/O6eSqKsa1Ufa1QbhhED2Xif1hjImry4pl7otoFTQ1WAWf
	uKimuR4I2o4pG02XeywVjIXN0Ufkq2lHjBW7lao=
X-Google-Smtp-Source: ABdhPJwH/xvOLLQTzatH+SUWs3LBiwlYx7RhvYk2Ws2zgND48dys0Ut2ZpAQoInHiRym6KdS3AW2Ug==
X-Received: by 2002:a17:906:551:: with SMTP id k17mr5105652eja.435.1625326045713;
        Sat, 03 Jul 2021 08:27:25 -0700 (PDT)
Return-Path: <tolvupostur@gmail.com>
Received: from vision312-sde.vie.at.tttech.ttt ([213.143.114.199])
        by smtp.gmail.com with ESMTPSA id s12sm2656635edd.68.2021.07.03.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 08:27:25 -0700 (PDT)
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Einar Gunnarsson <tolvupostur@gmail.com>
Subject: [PATCH v2] update-rc.d: Fix enable/disable command
Date: Sat,  3 Jul 2021 17:27:18 +0200
Message-Id: <20210703152718.8806-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.17.1

Now works for any number 01-99 in both bash and busybox sh.

$[] is a bashism and does not work on POSIX shells.
Links numbered 91-99 created a single digit link.
Links numbered 08 and 09 gave the error:
'bash: 100-08: value too great for base (error token is "08")'

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

