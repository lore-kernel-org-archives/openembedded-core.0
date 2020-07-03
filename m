Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.9873.1593782271350797956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fDVGeUjw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id z15so21359300wrl.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN1YL0Puuh8QxDCgzYLUyo1UiL3tQ54SP5v7S2JQfNQ=;
        b=fDVGeUjwqfYRqxBZh1iXAWXm+nHjyX3yDoLMdw0IDF44k5eLr+/K9vTbXiemkJVUTQ
         PSMJ+JI9ZMIlSik267MPLIJs6gDWdtoYQEPKzZUrShFOm5nUuSsg7Chbp8WJ4IQgSF4M
         yXByRMoAoRfIt8UJ2bc9WaEYFpHr0O0hV7ZXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN1YL0Puuh8QxDCgzYLUyo1UiL3tQ54SP5v7S2JQfNQ=;
        b=ZxFTj87WJIeeSiAzCk9lL1Hh0Ad8c40npVhe7mOe7FPCZxFT1Xp+ZE9UxkX/14caT1
         psw2c3AMhpCfV6Z89MDisEBqRSUSToVBX+OLMmJ+dnmIhBEgebB5X+mPODiKlEJdAsdN
         ClMx03uxqY1ItMfCDhEf7LX7eV3TvEiGtDgoq52QkPwyAUxXw/h2GMBpw1YJG5G1XIOD
         ltw8b65RZkOKtliPBWTWpkMKHfZXFSk1LY3jojUymk5wkTfzTCS7G0pQKfGgAA5G/UV1
         LfQW9Z8pJtCeeEjTQg97a6hBRDfYLAZweY7UC0PSDwcpC1cpy2bbloa+jgeeon4POFyM
         ssGw==
X-Gm-Message-State: AOAM531a9Q56nuXiyFyekTEY8X/SJbEUeBLRif2hKrB9LdR7jTNI0E2H
	bZ2i4vxW4nf11NtfaDwGASiXasnoli0L8A==
X-Google-Smtp-Source: ABdhPJz9DTG3XqVIxiYoNxqqgfZv+DDVdX3kt6krYw0TEO2K8Qc/8wrsiQsDhFMxTVwsdG5HR7TFEQ==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr37030627wrw.370.1593782269666;
        Fri, 03 Jul 2020 06:17:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g14sm10231027wrw.83.2020.07.03.06.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 06:17:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rootfs-postcommands: Improve/fix rootfs_check_host_user_contaminated
Date: Fri,  3 Jul 2020 14:17:48 +0100
Message-Id: <20200703131748.216892-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if the find command finds /home it stops checking the other
files. Tweak the find expression to fix this.

Also, from Alex Kiernan <alex.kiernan@gmail.com>, generate output for
each contaminated path so it's visible in the main log file.

When matches are found, dump the data from the group and passwd files
so useful debugging can be done based on the results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rootfs-postcommands.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 2f171836fa0..c43b9a98230 100644
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
2.25.1

