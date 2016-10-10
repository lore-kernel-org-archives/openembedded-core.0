Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DDCC96AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 17:35:35 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id ry6so58264956pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IDRwKAQECh7aULZxMex5ckMkA365/8/gQpWVivgCpWA=;
	b=CLBFuYzHrcL5CJ1CYXmZhZlHesNXuddqgAB20yZjmQbgjhuw/ZcLJ1IZQtPSO5lAwH
	chowt4Us2AMqkofW4N9A76J1KA5X8DUm6HmDvDoVgmMBIdDBvrwxPeOEli2MGdsa+5ik
	ey5bLJLbV6QqrkN77mLfnZtkEd8XOSyuDxsbWNLm5OgDqOh4E2Lk74kE9QBSa8g4kJXk
	nAIzlxPcLx/nAchrh7ekwPr7WuYYhvmJSK0ZVuKPTBMAWiePfXB3srFAJ0an9KkEejKe
	/BM6HjMwTl8gcoageCJU3eE/QJrbgxMzZFQbK4s84jPbMWl8BPFnqHqQiEccnLaIHqta
	X1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IDRwKAQECh7aULZxMex5ckMkA365/8/gQpWVivgCpWA=;
	b=MCVyjrvdJKhGXp+ad1zD74hWCKWWFlTGc/Q9WoOcGv3J/pdmUsLes2+DSF6rac07R/
	RqT8I1HqWHc0C+2aTapEDWBgVw+JR65RNhiIAF+T3TS4R7EMOOJYnx3GL7WmctInOyW9
	341eOFnGvd164HOV14ActHoV9f4nUItXr0ziCVrsCv51TJ1eWazpo6Qb+6HOquYc1P7T
	r8PfXOjEUmkb7C5dt44wUW0Nl19SEtcyZvPpoaareiG5mWSrEJsbc56xsgacLmRkmqqb
	YhpW9P2Qfai4LXCE0m09Yw8PT+MzGCRZuFCqtl7R8RzVIBOoR9aiyHWEwj1lqquvFOJz
	9r+Q==
X-Gm-Message-State: AA6/9RmY+K2qdKLiInkQD9aOEgKbPbAdSyx9mK5dlliY4s6i1rfcc9OG+RbFOIAnCPeVBUac
X-Received: by 10.66.249.39 with SMTP id yr7mr5865839pac.46.1476120937099;
	Mon, 10 Oct 2016 10:35:37 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	yk6sm5774410pab.43.2016.10.10.10.35.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Oct 2016 10:35:35 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 23:05:25 +0530
Message-Id: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Mon, 10 Oct 2016 17:35:37 -0000

Following are the drawbacks with the current logic:
1. If ip=dhcp in the boot command line, then the
current code makes connman to ignore "eth0" network interface
from managing internet connections. This can cause NFS boot
failure, if the network interface used for NFS booting 
is other than "eth0".

2. If ip=bootp in the boot command line, then none of the
network interfaces are ignored. This makes connman to manage
internet connections on every active network interfaces
(including the network interface used for NFS booting), resulting
hang during NFS boot.

This patch finds the network interface used for NFS booting via dmesg.
It searches for "device=" string from dmesg output and finds
name of network interface used for NFS. The "device=" string
is printed from dmesg, if IPCONFIG_SILENT macro is disabled
in the kernel, and this macro is disabled by default.

If "device=" string is not found, then falls back to earlier logic.
The earlier logic of detecting NFS network interface is retained, as
we cannot determine the exact network interface name used during
NFS bootup.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-connectivity/connman/connman/connman | 35 +++++++++++++----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index c64fa0d..aae2ca6 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -29,23 +29,28 @@ done
 do_start() {
 	EXTRA_PARAM=""
 	if test $nfsroot -eq 1 ; then
-	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
-	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
+	    ethn_from_dmesg=`dmesg | grep "device="| sed "s|\(.*\)device=\(.*\), hwaddr=\(.*\)|\2|g"`
+	    if [ ! -z "$ethn_from_dmesg" ]; then
+		EXTRA_PARAM="-I $ethn_from_dmesg"
+	    else
+		NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
+		NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
 
-	    if [ ! -z "$NET_ADDR" ]; then
-		if [ "$NET_ADDR" = dhcp ]; then
-		    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
-		    if [ ! -z "$ethn" ]; then
-			EXTRA_PARAM="-I $ethn"
-		    fi
-		else
-		    for i in $NET_DEVS; do
-			ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
-			if [ "$NET_ADDR" = "$ADDR" ]; then
-			    EXTRA_PARAM="-I $i"
-			    break
+		if [ ! -z "$NET_ADDR" ]; then
+		    if [ "$NET_ADDR" = dhcp ]; then
+			ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
+			if [ ! -z "$ethn" ]; then
+			    EXTRA_PARAM="-I $ethn"
 			fi
-		    done
+		    else
+			for i in $NET_DEVS; do
+			    ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
+			    if [ "$NET_ADDR" = "$ADDR" ]; then
+				EXTRA_PARAM="-I $i"
+				break
+			    fi
+			done
+		    fi
 		fi
 	    fi
 	fi
-- 
2.7.4


