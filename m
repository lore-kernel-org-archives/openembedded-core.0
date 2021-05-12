Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.1861.1620844080534573775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 11:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XMAc9/yd;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id c11so17838927qth.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EXRSFC82LZlT4k4NM/Ntl5Unf5ER90vODKNqnXyuuY=;
        b=XMAc9/ydl0OPU3Cvm3YFh1vosek/PYblFRDEiSDpyXLrH+PO9TEp3VhTzRwLQwRw7g
         46IDBpSeHyPDWmehQjSlwQJgUdvaXopU2K/NPCkswu3iGVsz78OWoaXdUaqG4LHYrRyv
         Gw3QjFujC4+Nbl62b2H49b8R+uvLTCgT4ENSctnKwMjxno+dZkBTnHf+FzGDFHrV+uIf
         lAt4twI547ByiqG9Hnm+X+8bJgQI3PSEoghmpXH0I58GYKMEHZ+S6R+1cVBq9ikXupLk
         U1v7hJ4pyOyfRmpJfSzESQrOryfQAbKW3fA/KPJYDU1vppA6wFyu5Bjk6/4iNCG5+RK3
         aZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EXRSFC82LZlT4k4NM/Ntl5Unf5ER90vODKNqnXyuuY=;
        b=FLdHg3/XA8J4guHqSRuROYFW9SjUzSmnpSa1iToyvCkN4Vcr9t2lewHkO5qiAA5xfm
         TCPPTLdwoiMhIyDSsA3sGm5nv5kiZr3OhDzuTK+NUWQ+bZfQnZxDNjsK90gapROVrwM8
         2QNVOYD3hOFaxTjJD9aDQ/aKcMUCNjKWUCKG6eTZfGSbLF3foxIO/krJgx2GwPlz7uUJ
         cTsRXjWFR4Eb+dlyuineWzwP+zsLWaVA9HHmZ4YDp4NKhVrZcNdTMEsl6AW8QRfB1sFh
         h0/F37BnYteu/mLYI6cHmMob4rUnna6jaCQK3QHi6fFMlpU1l8kAAprXruDqhDNysEED
         nkLw==
X-Gm-Message-State: AOAM5311+suG6mYwROy5knnJCuSsOnbxU9Jxr9FAbUPeiH8ztCg5oSYY
	UWROAFpLLuwYARx0lVtz28A=
X-Google-Smtp-Source: ABdhPJzRKEjZXpl7cIilyFryMRZoyBHuhZ5N7l4Gy7yZDu164+CdGhwmHVrRW6balhUf7jr0mlIhmg==
X-Received: by 2002:ac8:5946:: with SMTP id 6mr34613999qtz.366.1620844079589;
        Wed, 12 May 2021 11:27:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u3sm573451qtg.16.2021.05.12.11.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 11:27:59 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kern-tools: Kconfiglib: add support for bare 'modules' keyword
Date: Wed, 12 May 2021 14:27:57 -0400
Message-Id: <20210512182757.5602-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREV to pickup the following for the kern-tools:

    commit 6dd85ff178cd76851e2184b13e545f5a88d1be30 [kconfig: change
    "modules" from sub-option to first-level attribute] broke parsing
    in 5.13+ trees.

    We add the new location to the parser so we can support both
    types of module specifications.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Without this, the kernel configuration audit for 5.13+ errors
immediately.

The older "option modules" parsing has been left in the code, so that
older kernels continue to work as well.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 70b8518304..e967f485c1 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "00dfcab64b85bcb61208724a1588662184ebdd59"
+SRCREV = "d220b063852245fdd16b9731a395ace525f932d6"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1

