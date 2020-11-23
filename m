Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.43686.1606170335177864149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 14:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b/89ov0O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id i2so1327686wrs.4
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QODuVh3ItXA2CwAIUtncHBsCCKJoPcfOq5rcGTi5j90=;
        b=b/89ov0OHZe91VixIY5bECBLCizrz8ocz5HZmwIVMGPKllCwBQGfbrVMo866SEw9Pv
         zUgjq0Gp62J6ba9xtUSpOSlJF9v3yQt/yimlykKM/DyhhIwJ2wje8sDa/dp/lypfNpAi
         eDbPkCpTlqiIAFK1P/siLBZbO7/WH2q75R4MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QODuVh3ItXA2CwAIUtncHBsCCKJoPcfOq5rcGTi5j90=;
        b=PkbfXgraaTYl47bJdZHedNnAcXi+bMcbVxoEaOtstByVcY/DFRiLkYFrFgnq+bYT/3
         UbldT/t9quMI8y/iosY+F6Kxll+ocm55Ouwtnm7EYLUhEM8IT7FQMOoebkcExC+a8B3l
         w9bTo/mnl45reSM9BEljUqp1lDmanFmVZ+8kBQQiLkLlvdb0qdnEEjMHVwMpQqvxAAGG
         jKsvlkXvOgEIYymhg9E7NHxA42KBWJMjzs5LeaQi/pWkaTY5bbJrR31OrJey2XnoSEdH
         Jlw1jnJvrVcQ6ZuNT8u6tSyRjgqpMgdedGa+TvTHsWlq772FnaBRWv7oUDj1+FRnCRC2
         k8Wg==
X-Gm-Message-State: AOAM533udorI+uey6nT0pzgF3b1NgOOAE7eStTM6149dAiecv8nNjt1E
	q9SeMnzx+I8SigtL69WExCBIX6ToO3wwEA==
X-Google-Smtp-Source: ABdhPJwUm/BLdG0l4L+KffmWQE4kt/oYSBc3dsej3hwHWyi/GpC4ZUgHx9VdJza5RcRw+vhMPl6Wyw==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr1919040wru.266.1606170333674;
        Mon, 23 Nov 2020 14:25:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id a15sm524633wmj.2.2020.11.23.14.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:25:33 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] e2fsprogs: Fix a ptest permissions determinism issue
Date: Mon, 23 Nov 2020 22:25:30 +0000
Message-Id: <20201123222531.3030482-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123222531.3030482-1-richard.purdie@linuxfoundation.org>
References: <20201123222531.3030482-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When comparing builds built with different host umasks, this file jumped out.
The umask from do_compile was influencing ${D} and as cp was used to add the
file it wasn't deterministic. Fix the file mode to ensure determinism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
index 15054768dda..e6a4bd1f8c4 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
@@ -125,6 +125,8 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
+	# This file's permissions depends on the host umask so be deterministic
+	chmod 0644 ${B}/tests/test_data.tmp
 	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
-- 
2.25.1

