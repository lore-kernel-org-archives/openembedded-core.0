Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.14481.1605813476492219971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f+gHAgNM;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id ec16so3468317qvb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f00is09PoC3IY4fIhiJdGb9ys8DWMU5bjfm7syMLe7c=;
        b=f+gHAgNMkA9eTRXoJHms0pwvp7vCGboNeaDXWI6awllgAr104mV297CgqtUCnLk27r
         5xLiQ77XxfDe4tscyTmKySMInTdT6u20moqI+vqqP0OOiAqfrw/Yt2O1wRWFwPk/0nKS
         lhW8dRM4BmWCS5uR7GpryEp3pe2TSQWEOh9qCDznuEFNoXLq83P86X+R1ecyd9VKO/QC
         XRoZ7SW4q8J6KkezmuogH57PzGqqhfgO9BH6XnfKu6Pga2Ya+udFrMZNTTSv+AQ25pp8
         wpIg85YiVG/sN8KkUXEU0j9bkZ5h3BY7dmTI8Wz8Da34kTH7G42CiUIoKz1XXnQdMmec
         oYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f00is09PoC3IY4fIhiJdGb9ys8DWMU5bjfm7syMLe7c=;
        b=k/JJSnOIq/f8V9lJig4hyg4z7wieKYZjP9J2x63iM4rY5Vc+OJlSBfarLcg1R559dW
         OywyB0mBILrHRKGUhSCkyu2wlnO0Okp9IjhDjR0W+8nYn42v8qXSinKK/G0B+YmBnLA6
         aejiZsiQSWqspnLqyKPlY4wDow9acoq//NlqZQae8mjPGput5EfcK5iLKHbpiMpXkgJX
         rbwJt3pFjMunX3PGXtOdWXexazVlklXEakx6i0q1pUP3pOcYpPuFo81+rojfNfVOvj7g
         /A3/FHQ7h6K96z0c30vBhYf8Z1MQ44IauYBRhhWNL7NwDbEd1HymEq6PV0hBgtPRiok+
         Y9oA==
X-Gm-Message-State: AOAM533Ygi9Qk+crAzp3LCwFT+ppWBhwMduYSnM6MnuF1Nd3I4VU9FbX
	etnrQjKSN58BS3toNpCqtPbP6pDTksnGYM3+
X-Google-Smtp-Source: ABdhPJwUxxxJBomgbDDEp1MEHvZCEKYAYZoxaFOJLChrmkfgW1GC5YpVqVjkwmZvK/pqpJAXtfn+Kg==
X-Received: by 2002:a05:6214:1507:: with SMTP id e7mr12590582qvy.50.1605813475657;
        Thu, 19 Nov 2020 11:17:55 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:55 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] kernel-devsrc: improve reproducibility for arm64
Date: Thu, 19 Nov 2020 14:17:48 -0500
Message-Id: <6f0748b2146827f94be9c9d385f38302e8e650dc.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "INC@Cisco)" <INC@Cisco)>

.vdso-offsets.h.cmd contains command that was used to produce vdso-offsets.h.
It breaks reproducibility because it has an absolute path in it. There is no
any value to package such files so it can be dropped.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8373c97a31..8a900ed182 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -119,6 +119,10 @@ do_install() {
 	# but without this file, we get a forced syncconfig run in v5.8+, which prompts and
 	# breaks workflows.
 	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
+
+	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; then
+	    rm $kerneldir/include/generated/.vdso-offsets.h.cmd
+	fi
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.19.1

