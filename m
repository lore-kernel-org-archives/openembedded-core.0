Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.61453.1594051919072709456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RflpIUVE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id u185so15119705pfu.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gMKRg4LfAq6d7MPmZY7Ouj3ZptmJ30rbzLnj9GhljOs=;
        b=RflpIUVEubmvlcVnZtSzO8A5iRQVSRg5I4hGup12xYFptGKbWQ2sLGWcrXxBX/C2n3
         NPsQYPIBntv07hxSjfH1NysUIfsIrbD9/RHeAf352Mc5H9HoH851SteNmDYc41im2q5X
         ngxtyy5OTWs3CENDPdPGc/d/IhRHe3bsPTWXQlHzHpgvrN4bBvCMga6y1Se9+6z3GXUW
         4WOolPsDQN3HN9U4J64RZvBxb6VuxV0THi5OK1g+6kk7AaATJg+DL7OtRHX40N1K0fe3
         Hy8FkbtUUkSp0tdwoRDPYKMwl21bMRNo6gFKPQkx0heiRpvICXRTcB5wNO2+ykXf2DqW
         eChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gMKRg4LfAq6d7MPmZY7Ouj3ZptmJ30rbzLnj9GhljOs=;
        b=Ja1FlGVKAA57XM2Ib9mg+CvgNUCFSdSpQwX2Q1HveoA3FD3z161ihODXC6YUxSwdSA
         YkC+cbiM+c+UAHUPliLnbu4U8MQc/gMcSS2OK1XskGdDUY3vaI+8TjjGZiR9xKAYJDUu
         5HyQTruip56XA9DQ9vLdcYA90b2ofDdax78+58qfS+LFH8cdZHiJ/qWa2XYtj6B5VUYH
         0CWPHqeF/pbx2Na7ke84aBZbeaXLERbuAPLtDvZoheFOpydMmMs4BM++DO4vCPh5bEZT
         rLgyv4Ugbgj/ZWeNrzrTW2LSuUA2A00m4rhdPMHYbZRsojp9wWM6cLvAFNAbq26F+6/b
         wqhQ==
X-Gm-Message-State: AOAM531ZvWP7p+EVTliQkE4l0WK6sf4TMWYAC89mk/OffKHlFXYeLyqz
	An8SWATxmHd4kjMHUaY2iuY0LJaEyEMelw==
X-Google-Smtp-Source: ABdhPJzjGMMCA6Hfw297GJ1rvEr8He7bKMda5pcmdGM9Llhc9+PwOh6lL5ryG6YMAy1brCkaO2HFsA==
X-Received: by 2002:a62:7e0d:: with SMTP id z13mr42044721pfc.161.1594051918110;
        Mon, 06 Jul 2020 09:11:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/25] rootfs-postcommands: Improve/fix rootfs_check_host_user_contaminated
Date: Mon,  6 Jul 2020 06:10:24 -1000
Message-Id: <eac1c35c7d441dfadb323884717d267ba1c789b7.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently if the find command finds /home it stops checking the other
files. Tweak the find expression to fix this.

Also, from Alex Kiernan <alex.kiernan@gmail.com>, generate output for
each contaminated path so it's visible in the main log file.

When matches are found, dump the data from the group and passwd files
so useful debugging can be done based on the results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 504f1d158bf7c6ad08fbce755021db2b14565231)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 2f171836fa..c43b9a9823 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -308,12 +308,16 @@ rootfs_check_host_user_contaminated () {
 	HOST_USER_UID="$(PSEUDO_UNLOAD=1 id -u)"
 	HOST_USER_GID="$(PSEUDO_UNLOAD=1 id -g)"
 
-	find "${IMAGE_ROOTFS}" -wholename "${IMAGE_ROOTFS}/home" -prune \
-	    -user "$HOST_USER_UID" -o -group "$HOST_USER_GID" >"$contaminated"
+	find "${IMAGE_ROOTFS}" -path "${IMAGE_ROOTFS}/home" -prune -o \
+	    -user "$HOST_USER_UID" -print -o -group "$HOST_USER_GID" -print >"$contaminated"
+
+	sed -e "s,${IMAGE_ROOTFS},," $contaminated | while read line; do
+		bbwarn "Path in the rootfs is owned by the same user or group as the user running bitbake:" $line `ls -lan ${IMAGE_ROOTFS}/$line`
+	done
 
 	if [ -s "$contaminated" ]; then
-		echo "WARNING: Paths in the rootfs are owned by the same user or group as the user running bitbake. See the logfile for the specific paths."
-		cat "$contaminated" | sed "s,^,  ,"
+		bbwarn "/etc/passwd:" `cat ${IMAGE_ROOTFS}/etc/passwd`
+		bbwarn "/etc/group:" `cat ${IMAGE_ROOTFS}/etc/group`
 	fi
 }
 
-- 
2.17.1

