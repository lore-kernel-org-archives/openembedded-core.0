Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.539.1593143132732340832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seNqYee/;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id p3so4377930pgh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=irVVMUDMBpwdeTAZ9JKCN4N88Upifq/kWMsR10Wt0DY=;
        b=seNqYee/q6LI9tVTfcyDRvNjpXgS+QuUggqnjVTZyHoUE09zP6RlcZ5UtIHCNXyPzM
         QSgPHAexdrb7hQhNXS9g4mGnArRlqniUl8YTfClRrrxvnoKzS7UekHYnDHx+0IhYRGKf
         Hg8JdwPR6B0Q82MuACyerQyHHmStRKHbVooTaeZ/JI3CnzprSRIK9VIWqHPmjvvzwa8u
         VhBRzWgLKOcFRkRfEx/lCSJwGlXmhVF3ItR2NCt18TBLanoPLYHBKRW4cnSxOUCCFXXb
         sn6rQvwLEXGg9NIQoKcJkPq0JOEJY18+Al2GzR939F6H3HqZgiQxzDqGsZ3kRTCn7yc0
         hMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=irVVMUDMBpwdeTAZ9JKCN4N88Upifq/kWMsR10Wt0DY=;
        b=SARnJjYEV7nVtI5ynu9fnuUjtbseukPN2kN3huOYp52W2RMyf9Ij3pZHQSB9JqYdSQ
         H+fhbX13X1OQf07X6YYMDqo22AwqG8oQJaz+HtBwRnHZW5KclJNj+DZAwN8znjWNQLub
         pvTVdnlj8KrxIi5O9eSaPSzp7JE7sq/YOBTNMTz8WG70OAU+ZzNrKn5L0Y0Rfl87watd
         uvZ+GOlCtFoHMW0uUhbnD0rhfGjEol4foA8wEJJ1Gq1kMcDzdv1M3JHfVuThKMrveN76
         uoYtzLPeVD/xe9VS260Ud6Ne3VS3Ok3dBMFXFRyxxUoUN8wQmIO5juo14TTTq3Xg80iu
         /nQg==
X-Gm-Message-State: AOAM530aylNcZo9LzyQcQU+7zn11t8G0lj+JDgh1x4WBFSQJPvRHYpA7
	Xy2BnfFnGv8bZkThNg6iWior+6AaoJU=
X-Google-Smtp-Source: ABdhPJyNhWdrfmEKGaBkobnp5bpkyWRIgENbKupOZy1dUMUjTK3QYPEcpHzdZ0JxX5YicOLErMl+Pg==
X-Received: by 2002:a62:1e44:: with SMTP id e65mr848313pfe.233.1593143131914;
        Thu, 25 Jun 2020 20:45:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id y10sm25565863pfq.34.2020.06.25.20.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:45:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] rxvt-unicode: Disable wtmp on musl
Date: Thu, 25 Jun 2020 20:45:25 -0700
Message-Id: <20200626034525.3955716-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626034525.3955716-1-raj.khem@gmail.com>
References: <20200626034525.3955716-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not supported features on musl

Fixes
../../rxvt-unicode-9.22/src/../libptytty/src/logging.C:348:17: error: 'WTMPX_FILE' was not declared in this scope; did you mean 'WTMP_FILE'?
|   348 |       updwtmpx (WTMPX_FILE, &utx);
|       |                 ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index b568f04580..b064a63caa 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -30,6 +30,8 @@ EXTRA_OECONF = "--enable-xim \
 		--enable-combining --disable-perl \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
+EXTRA_OECONF_append_libc-musl = " --disable-wtmp"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
 
-- 
2.27.0

