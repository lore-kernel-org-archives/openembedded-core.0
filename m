Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.107123.1597919099856084793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u7rP2YXB;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id m22so1835545eje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=91gicoTKH7Mey0qcBpVtw7VuJ0IpGWq0E7mabnXN5Dc=;
        b=u7rP2YXB6FM4xuTQ24uS2sxgdOnGmkryt5H1cPK08xT9aznT+dvuTY9srBn9cPNkl7
         QRJtEusz2yLYxc/nae4e49H0bpL2tfNdGCq1gsHiwdtzNLOw412yNHoiBfjhLzUhEuw2
         O8hziiHEg1AgL7rP5sDFN0vLZIDrSoen6ceRp1JgH+q8O4jMlTXBbT/UsDlF+jAy4E9A
         fNEQW5JPF6HCNofcehEb/w25eqXvjLbnj/Sj9sGgbvfGpEzZcUPy9k+dfv9pFUOj8m8S
         igQynPOsi9QWlBzba2GIlFalm3MPjVmziFLfV0gN9zGO+1NTLBENmJxPuCnAypJy0szP
         Qn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=91gicoTKH7Mey0qcBpVtw7VuJ0IpGWq0E7mabnXN5Dc=;
        b=SiIz7nkVPjUcqhPpDwNwQBurqrLXdm2ImnohswzSp4Lg5n4GYS1qsq87+fuJ03c9hV
         wLEQfW+C5MgPcGkXvistE9k32wrgKVsjcNqKhnfpdN0wX2o+prVvbVpsSLC7oxdRuL1A
         cF1HXsMEunB+ued8/XkVzWeXgt407SPuMk1u4xEOq7d6s44+QTgqLu0yVJw9Rn2Lrtib
         R5+Exy8gGvD/ysRT2gvDEBjHH04WtJbR4MpzP/vlU9snAZpJE//d0SrpZaW7m97Tlqti
         S/8e96ldM+YjCjKGcVZ/YqOS+8euIfbYL6Jy8QXH9bQ5dvskHlcTds1ETTA4+r4u+BvG
         93Qg==
X-Gm-Message-State: AOAM532ARb01gO8IONXmAQ5cuZkZR9laeXtSzfF5yD/jmNkXRsMpVQzQ
	VkJilJl6GYUQjuzo4QttLuyXeylXaZZd1sOk
X-Google-Smtp-Source: ABdhPJwc8IAOZtciVc72N+KYqQvyPAn6gieA6Z9jrhFleuVeDjblmT76eXQ3ivjdfiFiV3PSIxr13w==
X-Received: by 2002:a17:906:388b:: with SMTP id q11mr2719484ejd.100.1597919098054;
        Thu, 20 Aug 2020 03:24:58 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-76-105-136.eu-west-1.compute.amazonaws.com. [54.76.105.136])
        by smtp.gmail.com with ESMTPSA id du2sm1230795ejc.2.2020.08.20.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 03:24:57 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 5/7] volatile-binds: Drop StandardOutput=syslog from systemd unit
Date: Thu, 20 Aug 2020 10:20:39 +0000
Message-Id: <20200820102041.28077-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820102041.28077-1-alex.kiernan@gmail.com>
References: <20200820102041.28077-1-alex.kiernan@gmail.com>

With systemd v246 the syslog target now generates a warning (and has
been deprecated for some time). Drop the target and allow the default to
take effect.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/volatile-binds/files/volatile-binds.service.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index b23355a7140b..e2ad39f258c5 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -10,7 +10,6 @@ ConditionPathIsReadWrite=!@where@
 [Service]
 Type=oneshot
 RemainAfterExit=Yes
-StandardOutput=syslog
 TimeoutSec=0
 ExecStart=/sbin/mount-copybind @what@ @where@
 ExecStop=/bin/umount @where@
-- 
2.17.1

