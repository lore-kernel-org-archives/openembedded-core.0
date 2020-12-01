Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.478.1606848781614527855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eT6rwVDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id l11so1677472plt.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pgPCoc5vGVq9fBdyOYXydQEIAdYcZ0JxPgC4RC3JzUA=;
        b=eT6rwVDbpNaf+lmMF9EpyppWumt+e1A87YsBlAyZQNCTGAJSWreCpZkZDuuUMnc58S
         Qui0itf02IWZth9aybkad58n3DK7hrQ1d9MWeCzimQwbVya+6zrmQZWOMpUWx9WqmVYI
         KkAlBKOGXrigPfda6lm+kbz0r9Duz8SiEE9qBLTg8Bh7JxA/PpVDFyJszrrrSGQFsh0y
         GsPNDsUS3StGmcSu7w/et451Hz4cOGHjOhU9i/pNkrDIuR65HIcFA6y/mjakMZtFx0sr
         i/fqG/WNOnjRFRkxPHKcecbMLfKry2Mp+FlrKWYPhdijNuKcBvjETtzLzfhIAQmDNDss
         FdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pgPCoc5vGVq9fBdyOYXydQEIAdYcZ0JxPgC4RC3JzUA=;
        b=LIDiMceaTDWhzkVwIVEa/EVFA2VmlqPXxarFLPHAbe2KPu/fMXmJ3u54yPMcRhFL3O
         1y12HYGRw2s7gNR3gKI7xRgdYUvCNsvTIIq2/KG44v1botLgi5igOf21bwqTSJDOVbSA
         mCSXhuXlLP/U+Q+dp+outw14BZ6nGo0CcMxoI1TFP1UowJKfRNcrgEDGDtIJbY4Dsui+
         ifY2BGMasj9DcFeZy6ZNTTEo+SYo4hEZgsmvy8xPOUG539cJvK8fRRHxpA/iEB6xNWvE
         MzVfKMGcDEbDx9eztrthZwzppDlvyRtGcnezVOYR8BtnFcD5tXehdfpd9OFgXmWfF2tg
         Y5fg==
X-Gm-Message-State: AOAM5313T4YIkr4oC2BYY7fAC6JjUyUblTGJV9QyNg/DpQGnrmihc/eg
	jQRlE5KMP5KHlgAg+rXTgKL3uSUPwyQYX7wz
X-Google-Smtp-Source: ABdhPJyRtnP8flhDMsqBaPr5Nl/rqFal1LpPdbYsgZQFtQ1G5qB2Jfug527rqaEPAZreY9Z/SHXdbQ==
X-Received: by 2002:a17:902:9681:b029:da:5be1:ec53 with SMTP id n1-20020a1709029681b02900da5be1ec53mr4119180plp.62.1606848780742;
        Tue, 01 Dec 2020 10:53:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/16] e2fsprogs: Fix a ptest permissions determinism issue
Date: Tue,  1 Dec 2020 08:51:59 -1000
Message-Id: <071806feb195961e59069f778c9ae8f27a739d9a.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When comparing builds built with different host umasks, this file jumped out.
The umask from do_compile was influencing ${D} and as cp was used to add the
file it wasn't deterministic. Fix the file mode to ensure determinism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37f37f4a52de3711973b372160f23672b61ff6ad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index 4f7cafeac9..439928e433 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -128,6 +128,8 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
+	# This file's permissions depends on the host umask so be deterministic
+	chmod 0644 ${B}/tests/test_data.tmp
 	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
-- 
2.17.1

