Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EB5E7719C
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.32455.1736371063632405073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I7SDW9/2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21634338cfdso3763305ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371063; x=1736975863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ+bEMA1XXUMb5HOOvMXRGKrAqpEK+FJo4O9aVZ6Tac=;
        b=I7SDW9/2y/x+X3yPKH32ZeOfGMhN3eLmY/rK8+Zx9kixNaUsvikl1nRl6jI8N6dvnK
         6BiDYkRBSvyW0nRJRsjd9rPGEHdMlysm6yJvwLKO4zILGiCalf8qOdD/piQvpgohLdG+
         DitOyDiJnqF/NtDEUo6bqNO8MnSyB42AQvCxUYnAHHXleYxbPSoEb/XotOaxO31J5Bdy
         vqxfyUJcl0td1you7HlAC3+3NeaNW8VOxLhTxRQscDOxm/G9+RRzJLmxZfELufVtu/fO
         DJhGKIuEjHqssEmWx63Alcx/peOXF76xn5sRwqqsMNXbEgemIEy57RzT3srI/adu7MVl
         L98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371063; x=1736975863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQ+bEMA1XXUMb5HOOvMXRGKrAqpEK+FJo4O9aVZ6Tac=;
        b=ZwkoFmrPSmqyGC1RVS7GbHGRawRksB1TexDFjEmqP7nPvBnIYl3lVrkukmW9Wbxcf5
         /paNxxHa3tHiphxMLPWPp+domoV6HbFn9eZE91U6dpvN+0BP50jCSR2Sk15pxCm7xqm/
         tnxpRdDEAHV41tANDjH5wZEd6/VIpXLCj2AOccBUEmh0voGZ4Ho7LPy2GpAOcQmOqwwY
         iTPI4KjXH78CGowo3UehC1880BBp/Hk/obqyygm+5yMbddjSKjauUdDWRZTFidje0uWh
         q/dckuu4qWhFtd5VaRwTtsZ9CSx6FQxtVLdenwxeM2eVWUJMcjfIgUA5HqSHhSwqg6u7
         v2BQ==
X-Gm-Message-State: AOJu0YzpQI8PxTOhs94d5XJS66+72YyxUvUXA5aXGbdFDz9K28f4/9Xk
	NdXjeAPAf82GPH/rQZ1lRqnI1m1YA7+nf50JVW5KPEK4PsPrJVNXAyrqm79nNIgk9uEvm6W60U9
	EM2M=
X-Gm-Gg: ASbGncvdhP5ghgvUXCBZZ1TpOZ5IncAcCfJ8I/5GQ9eP1m48cAe3DM2L7VmZEtyCJjX
	4BiObOyVK0pRwd1gMudUoxXHCWCWxxY9HQuKXy8GZBG6BhljqBByDScOUNZ+XjJAvXxPsazbTDj
	KkEGZj0sqfrFy5chD8GE7IqcB74AJcKxWKTdpGyO6dktf9MUwbL6l3NceXvGEjWFC4ioCCyJIFM
	0VXGUW4mpHmYqddKbdF/a/K5RtHBA+E/xk0R22KPnUTgg==
X-Google-Smtp-Source: AGHT+IH22A76ZDBZhb+FvgBF/6EzVBsDSEnd6muQK/sQZ4zD5whcO7Be4XAdyMpLXQjUmbKzCf4JhA==
X-Received: by 2002:a17:902:ecc7:b0:215:a18f:88a8 with SMTP id d9443c01a7336-21a83fdf379mr53959775ad.51.1736371062758;
        Wed, 08 Jan 2025 13:17:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 16/18] connman: Fix restart script
Date: Wed,  8 Jan 2025 13:17:06 -0800
Message-ID: <b022a8aa4c98d05265e6740c3c65c24913b05886.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209606

From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>

The script does not work if the connman service is already stopped.
The start-stop-daemon checks for the existence of a specified process.
If such a process exists, start-stop-daemon sends it the signal specified
by --signal, and exits with error status 0.  If such  a  process  does
not exist, start-stop-daemon exits with error status 1 (0 if --oknodo is specified).
The script uses set -e so we need to add --oknodo option to stop

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1c1b67166049181136d5eb68740f3bf98bf670d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman/connman | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index a021fd4655..adb5d44fed 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -18,7 +18,7 @@ do_start() {
 }
 
 do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
+	start-stop-daemon --stop --oknodo --name connmand --quiet
 }
 
 case "$1" in
-- 
2.43.0


