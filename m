Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.8940.1632492988749309423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3zw5N4Ye;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so9706036pjc.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/49ttrub4orYBKZfh0BeEjMS82l6uSi3Us2qfB3I4M8=;
        b=3zw5N4Ye82JD554aFS0Dh8GTZwQRGU12csRkNUnGnvIRSEYwUConGSU3q9+RMwFdhh
         e1vR+WWF1wevMmLumm/C8tT6HrniJ24DNq/roeEZVWNRfkaNp767Lmbo1+ZzHisJvfA+
         KFWorytVSr28Qw7hzqEYFD+sfIBSdEgLWMq9p5oEO19ARVsEsTx5U4I7cWVJCVw/lgcc
         0X4iCa/iaeTc8ENGtyZ8a/D5SOa9KQY4lrpNJNaxh8yNQkuKzrs1cMigxTQrpAx3h04j
         vNZCQTvp4BcksWfcWThV3ADUm0Qt7xm9JdJ4lOxVMr5F8BfchO7ywcWS51IIzi/lmpVl
         HpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/49ttrub4orYBKZfh0BeEjMS82l6uSi3Us2qfB3I4M8=;
        b=OEauJdGtIEx85Zh8JQ1SyWB3roai7pAObgnmn2hdVOHvkld74Sbeeujxkzt+4M+n5G
         UEr/TvYPGjXIIV1zC48EBo1B4XcyjGRBRAND32HfesvsfAMCyNnFTJqRI9HOtoRjhE6N
         bhn0Sig/aMi36uKLSZpYUqtco41zMIFI7J1/8LxK75BA8XDp9ivw5cMAcakPSHa7FcGG
         35HbBsNSIh0w/aGaubnlZG/9TqWlqhdMPi3EykxHPFIFTWyMAx4KJyl9uDNDQXdfON2X
         AttuSPyKwW4NYUgY7lu38mL3gPY0ZGzb57K6lnGRZCpu2veUXMvvJw/NPYxv5fW5fImR
         vc7A==
X-Gm-Message-State: AOAM533rqU8c+tCrNHKrMynYzMPx3x5MlvE/WjobqQapEK6qXXF2MxgI
	EWt7iMH/d0IuCpRMlKLCKuk/IubxfE4DXZfgr7Q=
X-Google-Smtp-Source: ABdhPJwqcOwvRCXZfSY/XuU4K/pS+TWUxQjooyzWZpc1qqIuJhz5bpn3ksUzLIZE69noEBQtm5p2lw==
X-Received: by 2002:a17:90b:33c8:: with SMTP id lk8mr2525133pjb.241.1632492987745;
        Fri, 24 Sep 2021 07:16:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/25] iputils: Fix regression of arp table update
Date: Fri, 24 Sep 2021 04:15:18 -1000
Message-Id: <c55f4e5caf813737cb18a686dc7a07ff5b8f52b7.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Visa Hankala <visa@hankala.org>

Backport a fix from iputils 20210202 to make arp table updating
work again.

Fixes: 77c5792aa5e7 ("iputils: fix various arping regressions")
Signed-off-by: Visa Hankala <visa@hankala.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ng-make-update-neighbours-work-again.patch | 79 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch b/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
new file mode 100644
index 0000000000..bf86115843
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
@@ -0,0 +1,79 @@
+From 86ed08936d49e2c81ef49dfbd02aca1c74d0c098 Mon Sep 17 00:00:00 2001
+From: lac-0073 <61903197+lac-0073@users.noreply.github.com>
+Date: Mon, 26 Oct 2020 09:45:42 +0800
+Subject: [PATCH] arpping: make update neighbours work again
+
+The arping is using inconsistent sender_ip_addr and target_ip_addr in
+messages.  This causes the client receiving the arp message not to update
+the arp table entries.
+
+The specific performance is as follows:
+
+There is a machine 2 with IP 10.20.30.3 configured on eth0:0 that is in the
+same IP subnet as eth0.  This IP was originally used on another machine 1,
+and th IP needs to be changed back to the machine 1.  When using the arping
+command to announce what ethernet address has IP 10.20.30.3, the arp table
+on machine 3 is not updated.
+
+Machine 3 original arp table:
+
+    10.20.30.3  machine 2 eth0:0    00:00:00:00:00:02
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Create interface eth0:0 on machine 1, and use the arping command to send arp
+packets.  Expected outcome on machine 3:
+
+    10.20.30.3  machine 1 eth0:0    00:00:00:00:00:01
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Actual results on machine 3:
+
+    10.20.30.3  machine 2 eth0:0    00:00:00:00:00:02
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Fixes: https://github.com/iputils/iputils/issues/298
+Fixes: 68f12fc4a0dbef4ae4c404da24040d22c5a14339
+Signed-off-by: Aichun Li <liaichun@huawei.com>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/86ed08936d49e2c81ef49dfbd02aca1c74d0c098]
+Signed-off-by: Visa Hankala <visa@hankala.org>
+---
+ arping.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index a002786..53fdbb4 100644
+--- a/arping.c
++++ b/arping.c
+@@ -968,7 +968,7 @@ int main(int argc, char **argv)
+ 		}
+ 		memset(&saddr, 0, sizeof(saddr));
+ 		saddr.sin_family = AF_INET;
+-		if (!ctl.unsolicited && (ctl.source || ctl.gsrc.s_addr)) {
++		if (ctl.source || ctl.gsrc.s_addr) {
+ 			saddr.sin_addr = ctl.gsrc;
+ 			if (bind(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
+ 				error(2, errno, "bind");
+@@ -979,12 +979,14 @@ int main(int argc, char **argv)
+ 			saddr.sin_port = htons(1025);
+ 			saddr.sin_addr = ctl.gdst;
+ 
+-			if (setsockopt(probe_fd, SOL_SOCKET, SO_DONTROUTE, (char *)&on, sizeof(on)) == -1)
+-				error(0, errno, _("WARNING: setsockopt(SO_DONTROUTE)"));
+-			if (connect(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
+-				error(2, errno, "connect");
+-			if (getsockname(probe_fd, (struct sockaddr *)&saddr, &alen) == -1)
+-				error(2, errno, "getsockname");
++			if (!ctl.unsolicited) {
++				if (setsockopt(probe_fd, SOL_SOCKET, SO_DONTROUTE, (char *)&on, sizeof(on)) == -1)
++					error(0, errno, _("WARNING: setsockopt(SO_DONTROUTE)"));
++				if (connect(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
++					error(2, errno, "connect");
++				if (getsockname(probe_fd, (struct sockaddr *)&saddr, &alen) == -1)
++					error(2, errno, "getsockname");
++			}
+ 			ctl.gsrc = saddr.sin_addr;
+ 		}
+ 		close(probe_fd);
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index d652bfcaad..b33b913817 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/iputils/iputils \
            file://0003-arping-Fix-comparison-of-different-signedness-warnin.patch \
            file://0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch \
            file://0005-arping-use-additional-timerfd-to-control-when-timeou.patch \
+           file://0001-arping-make-update-neighbours-work-again.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
-- 
2.25.1

