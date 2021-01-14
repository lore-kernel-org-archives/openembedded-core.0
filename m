Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.3731.1610640719322792744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/1+mvae;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id w3so5603422otp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 08:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JajjVRXFFMEfgMR80559Vr1PBktYEnH7UwhJgL7poXM=;
        b=A/1+mvaeqXVLxssxLnOK+7AsmBR2jFBeI1o7TqRHaTR4zt5jvCbbwsO5A0Fq5Q0q8B
         bcIh1MJvyri/Iqqh93icuT1ojb4iubSAl6dm2e9iKsWskfuXYyPG4KyiJm/Xy6zRtrT7
         86hIkc8Pd0zsRTMGV8gI8zExUuB8fiB3dn/+Zv0WWGr2yApRVDt9Ue6o51q8cAUPHegG
         /IlOWhPxcolB2Hk3T9DmqURfns3Gj/C1yidz7+nYxtpMQ4T5doiezbT0LBSuojAimWDV
         W7ChgQVeORUdilwFz+Rbpz92CAehRk9XBhEgK/NvkCLi2QWqng5nn2a1L6/M2m7iz9eJ
         9wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JajjVRXFFMEfgMR80559Vr1PBktYEnH7UwhJgL7poXM=;
        b=koeVrC9E7IBsCt4iaAqjKYoe2dW4whE60HYqKkXnA1EyUUnboAzyXYJ2gDntvS6bx+
         wNYSJpdzFR2bPUl8Xyv9hgzihA2WHwQ9baiYO7Ur+Z+iQgcbL69zXAqZ1qeRbA7Pv9E6
         1a1KFP4CqswsDnEWWAWyl7lDSGEhIVmjgB3xwQ13H6GpYVQJc/G7GjtkUoDD2DECd27+
         yQY3yTA4QuQ2W6DebVCqkWmHGOrJ1YMdxLGEkhvPHLfQhpGyewgrF4gs5199iz2M5dlD
         5/PLemqrD6dT33dFmERwhQQXxLFnELEE/IfjqdVwFIyDXtiEJNi34rwUSkf8LrNr2mR8
         5Veg==
X-Gm-Message-State: AOAM5312xMKKCQfZX03EwExLj0k6mxSCsJsJqP5+nzIZMd0F1y6pgc8X
	XlMaXaXzUr3C54jGXVNJpRZ1xupHna19qA==
X-Google-Smtp-Source: ABdhPJzfQ4/4pUAN1aWaVclPlW4cb2rQuEASmaQ7B+Oqi3x/UJKoDCVZJYbjv3sZyGmBWmCdOzztlA==
X-Received: by 2002:a9d:64c1:: with SMTP id n1mr5133010otl.60.1610640718386;
        Thu, 14 Jan 2021 08:11:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id s204sm1110250oib.42.2021.01.14.08.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:11:57 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dominik Schmidt <ds@technokrat.ch>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] fetch2: git: Append the password to the username on git URI reassembling
Date: Thu, 14 Jan 2021 10:11:53 -0600
Message-Id: <20210114161153.17719-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dominik Schmidt <ds@technokrat.ch>

This allows the users to specify SRC_URIs of the form
git://user:password@host.tld/path/to/repo.git

which allows pulling in private repositories.

[YOCTO #14065]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index df9538a60d..a1356ed9f0 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -606,7 +606,10 @@ class Git(FetchMethod):
         # removing the password. ssh keys, ~/.netrc and ~/.ssh/config files can be used as
         # alternatives so we will not take patches adding password support here.
         if ud.user:
-            username = ud.user + '@'
+            username = ud.user
+            if ud.pswd:
+                username += ":" + ud.pswd
+            username += "@"
         else:
             username = ""
         return "%s://%s%s%s" % (ud.proto, username, ud.host, ud.path)
-- 
2.30.0

