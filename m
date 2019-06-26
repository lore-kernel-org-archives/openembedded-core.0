Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id B9CF57E3AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:30:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id f9so3437944wre.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OU/wmth5zR1WEyTkFD7wV05tSDXPNaCP3E8neSkGwmU=;
	b=haA0/HQ/IV29AbthiNjHHIOnRZUv4m5LFOqEwC/LtRdqIm79J18kgNM08qTpWJ+0ob
	yMzp5uJsXQZQCTAgtKdVKkBSp0kdAE6ZkN7e5AzCo3Ukg95gDJTisiIDbAbP57ANKPRe
	0zU2d9ARhAj3NSRQ171xi9pJZu4rZQMIyTlX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OU/wmth5zR1WEyTkFD7wV05tSDXPNaCP3E8neSkGwmU=;
	b=PW5lIQKrKvzPx5fzF27+wzvAKCsv5r18PMrLPV1l1ZsUagiVLfH5NikjA67gsfsdTd
	qbrLDyBNKHK9LaUoPp/gclgRNQK1Oam0PCRt4eYLZ9vx1xN0lm1dDBXsXFLHj7nQBhLh
	qRYsouvbDEpMgamM3TfJeccbrW2UfsdTy8MSyFt/pvZGmcCmutdG8OdRhSoXuZCvGRDo
	wWa9Cefa0M46z2KInubj+4AMl2dNoa0bGgXXFDNr3hPoFe1l0rFdPYRE9pYD/PSyILZl
	9reLQf2itA0d9P5EUprDhdlhJ7VAZC6GGdfBNiZO1fb2I2NTKKPWHrr+x+OdZb8CPAZD
	T0yA==
X-Gm-Message-State: APjAAAWQxVHqvZzwsAjbmZbuG+aYldUonaJelRuuRPR6BDvRzMor+/yX
	L3/bHcsAUrOPNhbh6YKXOv7qO3S24Oo=
X-Google-Smtp-Source: APXvYqwmxJ6WGLIs4wJeJjZontGdxd6VdOi87kmnuWkFxePlxZIuiCuiwS3PtO5BlIcfuOxsG13j0Q==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr4189831wrq.350.1561566649289; 
	Wed, 26 Jun 2019 09:30:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s63sm1484460wme.17.2019.06.26.09.30.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 09:30:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 17:30:42 +0100
Message-Id: <20190626163044.4606-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
References: <20190626163044.4606-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] busybox: Improve syslog restart handling
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
X-List-Received-Date: Wed, 26 Jun 2019 16:30:49 -0000
Content-Transfer-Encoding: 8bit

We're seeing races on the autobuilder where syslogd fails to shut down
fast enough to be restarted leading to failures.

Add some checks to ensure when restarting that processes exit before
being restarted.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/files/syslog | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 89c4d12e9cd..49033c1755a 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -51,6 +51,22 @@ else
 	SYSLOG_ARGS="-C"
 fi
 
+waitpid ()
+{
+  pid=$1
+  # Give pid a chance to exit before we restart with a 5s timeout in 1s intervals
+  if [ -z "$pid" ]; then
+    return
+  fi
+  timeout=5;
+  while [ $timeout -gt 0 ]
+  do
+    timeout=$(( $timeout-1 ))
+    kill -0 $pid 2> /dev/null || break
+    sleep 1
+  done
+}
+
 case "$1" in
   start)
 	echo -n "Starting syslogd/klogd: "
@@ -65,7 +81,11 @@ case "$1" in
 	echo "done"
 	;;
   restart)
-  	$0 stop
+	pid1=`pidof syslogd`
+	pid2=`pidof syslogd`
+	$0 stop
+	waitpid $pid1
+	waitpid $pid2
 	$0 start
 	;;
   *)
-- 
2.20.1


