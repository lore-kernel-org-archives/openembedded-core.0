Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10210.1619186433605095641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d66AYFWZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d124so34094575pfa.13
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uW0f+AQ/yaTbdvIKFzCAamUt2V2j+OC/SZ8tdtdnawg=;
        b=d66AYFWZnAClI2emJVzP8aNe76CP7JkRXZh2lluKmgucti/AnhZZcuK0ZjiUWYFiTN
         AWiFWxSfp6ZD3FKwismxHs+qCD+YYNbpXvfFvgZ10sI/GRcEvw0giyz7FXw9A9G7RmUB
         iKVd8K9r3RQ/VDNCVH4P8PPT9VdoJWciMpeuYoJK5Q53eulonGD0RvtI14b71v+lmoAg
         YPjLl/g89MTMigVeFUmAFoNhx8VnHwK8xdaXtighy1PUOvYr6/6bN9ugXBRJbZfqtlNY
         OqRpfMMse+FdBv9jlMy/NVBat5KuW8s600667BoahBGj4A/lgu/JpMlLmhHh3pu6y9Mt
         qDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uW0f+AQ/yaTbdvIKFzCAamUt2V2j+OC/SZ8tdtdnawg=;
        b=F3kk/hgp1S1Co/Iac3yRHOkZPv6GWqdKBOorh3StjcTOH1dTp4z1/wtDak3T2356dt
         K62AtHtGnnnzLTZwIb1Z6GG2Lv/96BoBS9l2J1PolVU+GPjAG2S5sg1i4buH8zCypOPR
         ztFzbeThH7XH72qpUYmdu0gYgd+fvXdQq8Z77uKlPNaPIVGwhyWezUPiRdLsny3hxuYZ
         nTeAFv64sFcl/vOTqTULzfJYSB9kRNhcUkldxGbdcOc8QjLTrk5kamDtHx+IhF1NkRwf
         AdfvLortEa+3KCxVNKr5LG9F7dh6DdlTZvSo3cyoc8BeNmZO+6JWzllRtN0mYC4r+VEE
         B2dA==
X-Gm-Message-State: AOAM531unF35WlcCoiLKHEdfxnHrLPfAySQ6RjtQBACVPjRzZE98a/JR
	NbIt8z9XOY9lsrruQQKfhoh2MkTWM1mhKwQjHtw=
X-Google-Smtp-Source: ABdhPJz5QI0PD/lFg+o3LCusDbQfLRTbRWijxOWEufud7l3TG5kstjLwEXfHr2aCniNaCmtRDkQ2eA==
X-Received: by 2002:a63:5814:: with SMTP id m20mr3994272pgb.82.1619186432784;
        Fri, 23 Apr 2021 07:00:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/19] groff: not ship /usr/bin/grap2graph
Date: Fri, 23 Apr 2021 03:58:55 -1000
Message-Id: <5619bc0e98c02cf80601eb399bb205f33f8e4098.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

grap2graph which converts a GRAP diagram into a cropped image fails
to run as below:
 $ grap2graph
 /usr/bin/grap2graph: line 89: convert: command not found
 /usr/bin/grap2graph: warning: falling back to old '-crop 0x0' trim method
 /usr/bin/grap2graph: line 104: convert: command not found
 /usr/bin/grap2graph: line 103: grap: command not found

Considering we don't often need to convert a GRAP diagram into
a cropped image and the recipe ImageMagick which provides convert
command is in meta-oe layer, so don't ship the related files to
avoid the confusion about the above run time error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 251be7279a475ee18c0c53fe9795bb37bffc2b45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 983cb9aea6..f0e9eb6a8a 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -62,6 +62,10 @@ do_install_append() {
 	rm -rf ${D}${bindir}/glilypond
 	rm -rf ${D}${libdir}/groff/glilypond
 	rm -rf ${D}${mandir}/man1/glilypond*
+
+	# not ship /usr/bin/grap2graph and its releated man files
+	rm -rf ${D}${bindir}/grap2graph
+	rm -rf ${D}${mandir}/man1/grap2graph*
 }
 
 do_install_append_class-native() {
-- 
2.25.1

