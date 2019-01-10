Return-Path: <dpfrey@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C72079D63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 19:18:31 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id w73so5735624pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 11:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=352VlvEOlHh3LrqvhhakgnEfaj9ntyE7UQLCcCRfKpc=;
	b=X6DefwnUJtzUSSrCf7vSB/XZQNqhCTVfNUHqDtEHHYnuQgvYag8bM6uw4OlGdW40Tr
	6XoLicW3UhBhvmsj93mLEMqhGtVxKfTrZN9+11618MGtE1auPdNJ/vIDuu2o8q5EqzIL
	DcvhAs9DTaVYy3nTlmjvSzsusOYZ91yBxC580mrE8S+vKbrQM4pnxGuT696vjv9sZ74k
	KLKkzyPxV5pmhkyjX+HG/NHGQEE7ZM1GkVBxJZ4ET87xJgsvVoPV5w+EDMMdzb6hlm/N
	3R7wIJTVOAju8YqFdhcg9ma+BB06FYDi3gDMvRMHD+TxiH4IAwgRy9sSmq7i4Q56JWGz
	yGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=352VlvEOlHh3LrqvhhakgnEfaj9ntyE7UQLCcCRfKpc=;
	b=IeS5QVU6iXugSfYcY3JDaU9jkXvPpmYNDyS6Q5GW3W8KFHsRIJ6PHdRBqVrCOkjOXF
	RlkdanKqtnd9gJqXWzhAsQvcX1WtAyCw6zxwH3gwhF84LQdObYziWuEoWASoWv3VhXZi
	2gjTlI3E//bNJBFUpRUzB7EUZKoPd4ECNCtEwtpShz1GezZEZeIV7qXGTuj3n9dwwz8E
	ri7+CoHJaY+Q7Etet81YmYSX1g0Q/hMTL1sYFg6/KZSdjNKQNnOC0/G3hrk2SCWgwarx
	Mv/GcKCHeWqX3Us9XK/5/ZXqO/yleiru+tfMWahDI8LDebzCf7xY3PwmkwD4S4UcRNvS
	5LKQ==
X-Gm-Message-State: AJcUukfpLA5Z2st3i7c7EDegyvjNnS+N59Ufsi5EHjnwTwlH4TtHH6yZ
	RXqUJqfI/uIBnvG38uoFkIBNThMR
X-Google-Smtp-Source: ALg8bN5bu+3FZcEiIF/KJv9KPGWHIbbx8h/AEzeQmY9uRyMPikciA3QUlAS2FNwgbuAK5ZDOJyfDfA==
X-Received: by 2002:a63:db48:: with SMTP id x8mr10138766pgi.365.1547147912209; 
	Thu, 10 Jan 2019 11:18:32 -0800 (PST)
Received: from dfrey-debian-linux.sierrawireless.local
	(carmd-fwm01.sierrawireless.com. [208.81.120.1])
	by smtp.gmail.com with ESMTPSA id
	f6sm115593021pfg.188.2019.01.10.11.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 11:18:31 -0800 (PST)
From: David Frey <dpfrey@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 11:23:52 -0800
Message-Id: <20190110192352.14188-1-dpfrey@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bluez5: Fix status subcommand of init script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2019 19:18:31 -0000

Update the bluez5 init script to resolve an issue where the status
subcommand would exit without printing any message if bluez was not
running. The early exit was caused by the fact that the init script has
"set -e". When "pidof ${DAEMON} >/dev/null" is executed, the script
terminates immediately if bluez isn't running because pidof returns a
non-zero result. The fixed version does not suffer from this issue and
makes use of the "status" function from the functions library.

Signed-off-by: David Frey <dpfrey@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5/init | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/init b/meta/recipes-connectivity/bluez5/bluez5/init
index d7972f2d95..ca9fa18549 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/init
+++ b/meta/recipes-connectivity/bluez5/bluez5/init
@@ -1,5 +1,8 @@
 #!/bin/sh
 
+# Source function library
+. /etc/init.d/functions
+
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DESC=bluetooth
 
@@ -44,14 +47,7 @@ case $1 in
 	$0 start
   ;;
   status)
-	 pidof ${DAEMON} >/dev/null
-	 status=$?
-        if [ $status -eq 0 ]; then
-                 echo "bluetooth is running."
-        else
-                echo "bluetooth is not running"
-        fi
-        exit $status
+	status ${DAEMON} || exit $?
    ;;
    *)
 	N=/etc/init.d/bluetooth
-- 
2.11.0


