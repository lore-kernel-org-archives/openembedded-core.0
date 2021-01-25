Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.344.1611586366832828156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uEQTqHP4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id l18so2743282pji.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TtumOSJ9i/2uUjXHdWAGoz81J974N3hbXNq7TOtNPKw=;
        b=uEQTqHP4eDHcRMva/zxqJ3owUYlmtOCYcTcLwhFd8IvRUGhhx7K6ISelDntoK4rse+
         KkcIK/4sQl7hGAKchlkMTvoFWiK+HbrOjWtDljw6vzO4oSmO9Pcq+f0eInsZvIllh4RW
         wTMWPmFxOyTKkfx63HRHikvuMVWevkoHJvlDgvZOLtlzfaZVocPsGr0rj6dvAfl5Hd8L
         w8BU8yxMS57Ha92kuvknayEaalNV1Feieod14FlYwze2i7dIm+ce/oUDs/X6bXYNlXuo
         +0dcahH+TyOSL78sInChB2Wqw3yKfUb421x25AsQ/VWr3Qe+WIKf++8bbANaZEsp39h8
         wWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtumOSJ9i/2uUjXHdWAGoz81J974N3hbXNq7TOtNPKw=;
        b=iAXGKkfA1jrh3Pt9f6gdnWQiwuK23tvYvhd2k3J3Ha1JhZfEeizwyzX/COFLq+QDxK
         NGcP4jfvm40x57DrHJFZELiaGa5l0afX3vd+kW0S40yfoJaIPPNOYM4btXXi4YmJ2AUs
         egmkqNrLQA1vakbta8oA/GFBseXnhMBtYqyKTRPqKGuT4HtlHmfHv0nu9zraNXiS698J
         JRzO8dOoz6NQk1qMIVw7lmAcALXkOKXeRumwNNZ9c3iiu/rRPovA4GoAeo8mAZNmprml
         clTOUcTkispWCdnyELP6EdpWlz6QCqGj6m4yO5owAafrIuwvC4mO2kEhfoEVwMs87veP
         HLsQ==
X-Gm-Message-State: AOAM531UbvmOIwnMH6mANp4cI5R3HKsYCi4w+xyWf77F6yUCHE4bWYfI
	FeZDKZMDaKZ8j7Q9AZ3k9QhOMA/nVwNdTOgVJBM=
X-Google-Smtp-Source: ABdhPJzay2t8wO5oQ1Fqk4GE8cqhszXS6DoMDC+VTkEqv/8pwCDiUrcll+s1RzKX3CtLyePa8WXPcQ==
X-Received: by 2002:a17:90b:1996:: with SMTP id mv22mr562248pjb.121.1611586366010;
        Mon, 25 Jan 2021 06:52:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/47] base.bbclass: use os.path.normpath instead of just comparing WORKDIR and S as strings
Date: Mon, 25 Jan 2021 04:50:55 -1000
Message-Id: <0076c1690014fb40f8a53944d80e3e59dc726a1e.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* cannot use os.path.samefile, because S/B might not exist at this time yet

* there is issue with PSEUDO_IGNORE_PATHS when some recipe sets e.g.
  S = "${WORKDIR}/"
  whole WORKDIR gets added to PSEUDO_IGNORE_PATHS and then the build
  can fail with various strange errors, in my case do_package was
  failing when do_package calls:
  fix_perms(.../1.0-r0/package/etc, 755, 0, 0, /etc)
  and fails with "[Errno 1] Operation not permitted:"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50b11a61ab29acb8ec990668353e0b7305114628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a710abdbd7..65b9d954c7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,9 +388,9 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
-    if d.getVar("WORKDIR") != d.getVar("S"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
-    if d.getVar("WORKDIR") != d.getVar("B"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
 
     # Handle PACKAGECONFIG
-- 
2.25.1

