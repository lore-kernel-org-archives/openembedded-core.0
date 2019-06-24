Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 76DDE7E03D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:13:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so13954241wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YKqlA9LOVrPaRttfN2XNFJImu7X3hYJJIOA0BIoVuvQ=;
	b=PssTFCUDA10GrxLveHWd3hKAKMUP6ywBSWZxJKL36MY93TunOW0oYRjjPfqrK7QUwj
	wifOGr9obx4zCR1EsEsnFfxHQFZwoSq/shB5tLT93XzK/fLFP2CsSbN1o3VZFBIj6fMz
	ELhdEXKWiVHkjjkm0KjjeSGXTyzwGv4kSgiOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YKqlA9LOVrPaRttfN2XNFJImu7X3hYJJIOA0BIoVuvQ=;
	b=E+GX4g6VOZMPH97dWaJKZ56zNq1JojECSu9Wa5k3Cnyaa4gPFMAclepFGhlwJmXceg
	moXYy2NrKxbAyE6x/N4tLBSM2/WbsaSF3T0ma3Y/You8LIC9rxnACDJfDFTzgZrolrPD
	RbqRgScHiJrQELch6EQziddoQFZnOMvkTfPoLpKJuAPMZmc3kYJf4vg0BpZZHdTw2T+w
	uJPU9RWJWTHE6DepKEt4SZXG9rXw0ql50G5fa+tJbnEG9TgD/oj9f+mjTTdle7Od5tRu
	fM8MWpKacLRgb8rkouBoAOYaX9/RjKLSAUfxf/N62CP0PUHNtX+zDR0yu6TKnKUiNJ+3
	2b0g==
X-Gm-Message-State: APjAAAVwHMHHbOFyfCGbk5KvcuWo0APwWKFlZyqUasPgEfcEwsv2zpYC
	ASalET5UUg7vhOHXxmaqGm48PQTvvHg=
X-Google-Smtp-Source: APXvYqxd4btF6I8dM2dXGYM9xzBQKMpsyeMyBiUy7Dw1OiSphGArGCo9RMbIINdtE/GFF5Lc9PbIVw==
X-Received: by 2002:a05:600c:118a:: with SMTP id
	i10mr12009389wmf.162.1561392790946; 
	Mon, 24 Jun 2019 09:13:10 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q12sm12565858wrp.50.2019.06.24.09.13.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 09:13:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 17:13:07 +0100
Message-Id: <20190624161307.21260-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sysklogd: Fix init script races
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
X-List-Received-Date: Mon, 24 Jun 2019 16:13:10 -0000
Content-Transfer-Encoding: 8bit

In testing we're seeing sysklogd fail to restart klogd since the original
process hasn't stopped before the new one is started. This means a restart
can result in no process running which is clearly not desireable.

Add extra code to ensure this works correctly. Busybox start-stop-daemon
seems particularly open to this kind of issue, the dpkg version maybe
less so if timeout options are used (which we don't use).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/sysklogd/files/sysklogd | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index 258f8828039..73424840ba3 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -90,6 +90,22 @@ running()
     return 0
 }
 
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
     log_begin_msg "Starting system log daemon..."
@@ -113,17 +129,23 @@ case "$1" in
     start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile_syslogd --name syslogd
     log_end_msg $?
     log_begin_msg "Reloading kernel log daemon..."
+    pid=`cat $pidfile_klogd 2> /dev/null`
     start-stop-daemon --stop --quiet --retry 3 --exec $binpath_klogd --pidfile $pidfile_klogd
+    waitpid $pid
     start-stop-daemon --start --quiet --pidfile $pidfile_klogd --name klogd --startas $binpath_klogd -- $KLOGD
     log_end_msg $?
     ;;
   restart)
     log_begin_msg "Restarting system log daemon..."
+    pid=`cat $pidfile_syslogd 2> /dev/null`
     start-stop-daemon --stop --retry 5 --quiet --pidfile $pidfile_syslogd --name syslogd
+    waitpid $pid
     start-stop-daemon --start --quiet --pidfile $pidfile_syslogd --name syslogd --startas $binpath_syslogd -- $SYSLOGD
     log_end_msg $?
     log_begin_msg "Reloading kernel log daemon..."
+    pid=`cat $pidfile_klogd 2> /dev/null`
     start-stop-daemon --stop --quiet --retry 3 --exec $binpath_klogd --pidfile $pidfile_klogd
+    waitpid $pid
     start-stop-daemon --start --quiet --pidfile $pidfile_klogd --name klogd --startas $binpath_klogd -- $KLOGD
     log_end_msg $?
     ;;
-- 
2.20.1


