Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.12853.1614955735487356482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y+0SpiMc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id g20so1536629plo.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lyH8EBg5QxO1lqAWz6kcCnpcFaxIqfaw5KoUc9evU8I=;
        b=y+0SpiMcKS1+lk9QafQG6Kc3Ad5ED1CaKDCTNnBg/HWUl+djZ0ekCqqQxlOq27b2y3
         9SCxCEAdQVKcx1Uhofxuivlb6ZzDsML2HgXmAcAeddp0sW47VerwktXJwsEzYqlZtzx7
         b0/Ri+/jjO1ns9P8UBjgPhbd2o+6VJDZ1ylt1RQyE805a6vhL22JvWDgBV+IqL8sFKub
         Z8zFXD7JX74Jd+lRWfQMSfES11jE9RUYK1IDnCaVkZ9YUcLYPgF9kifng/u7kyKXO/jH
         L9p1Oyz94yRddEOuAuAWXxJyr6zaayh13rXsqloexPT/T1nYyouVLUqR0F1lw2e/mPs7
         QBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyH8EBg5QxO1lqAWz6kcCnpcFaxIqfaw5KoUc9evU8I=;
        b=c+hLoskXoI5JXep+jEhDLB3nT7S9ejhOuldAU/1Ska5OAvhfj7yMcSg1rS+PW2QRnr
         3Al4bL5UywgfCIKXrrwOR1Th0JqMPfhc8ibuZFDsqPj5SOGDty/34fuOlrLXjVfr3Ob7
         l8W5wyf88YmrGhjinLd6SAA8wnerc78gKQoi5qPH1qL5oaMGz3dDzhoiP2InwT8ihYIA
         42GpSdjLFJVfGiRwdvkqhm+Q9XSJA/k/Ry/5NDQaSlW6MPmpqI+DBFI7iYd/GhokQwd5
         AWxaSFgjfuwmRLMIFQ/OF2/xTsgpBb39UfXCTAjt6P4a7WwhWj3hR7+YBsk9S6CnhxB3
         9D3g==
X-Gm-Message-State: AOAM531QHTUEPy+Qzic75zDws5VdLA6cXFlUZ7mou/phOILP5TmT4oL+
	uHL6u0lkiB6AC74OUDLFupGvj/5vEce0aEUX
X-Google-Smtp-Source: ABdhPJzmloqX9UTQC9i7rmycZLTlQ0pZRjCSZOx1/b1Php3bYWjFujiD6M36TQBoHqiiRb6QDEEpBA==
X-Received: by 2002:a17:90a:ce82:: with SMTP id g2mr10752666pju.193.1614955734510;
        Fri, 05 Mar 2021 06:48:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/27] package/package_rpm: Disable font_provides configuration for reproducibilty
Date: Fri,  5 Mar 2021 04:46:30 -1000
Message-Id: <ed1fbc5a33ea6e6cdcfd4749153b51338b132619.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The host may or may not have fc-cache which is used for find provides
information by rpmdeps. This lead to non-deterministic build output.
Disable the font provides code so we have deterministic builds,
we have nothing using/relying on it at this point.

Need to disable this in both the rpmdeps code and in package_rpm
itself although the latter shouldn't be being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c0cd8012a96fd4d9caf33c6de5fd39cea6db55d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass     | 2 +-
 meta/classes/package_rpm.bbclass | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 15bff9c778..3ff74c9f31 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1620,7 +1620,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps --define '__font_provides %{nil}'"
 
 # Collect perfile run-time dependency metadata
 # Output:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 95731c7d8d..7de409197e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -683,6 +683,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
+    cmd = cmd + " --define '__font_provides %{nil}'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
         cmd = cmd + " --define '__find_provides " + outprovides + "'"
-- 
2.25.1

