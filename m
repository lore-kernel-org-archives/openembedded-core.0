Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1876A60065
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:45:40 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id w10so5570930pde.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S3QxebvrrtJ+oQSLZ8eagHIr2O5mN8pdwqrTyBYh9gE=;
	b=MOtS8Knvdc0hAoOznOf1JK2Bq0VqWyh0VINxFSn79IdqGzU4T0Uu7PUuDMjbbQoLcH
	nbRwQB5FZjSPyo4rsGk+ygDIjSX/ph9GoFR53WOFOeVj0iuY30kE6IfyLnO//5lXWhBV
	KdZrvUuKvl6EFrFTmD/gHc1Jvqw9C5J25BhCkTev4liXvV6dkZ2J6Pofbq9IqpBXwJ1m
	aCpikRCDGp8ddK8FomZZG80iI7zS5CmZfNXWT8XecR8w0lVDGS4djhFXySl9qapnZ0FP
	fYQS8hk8oJyTFJk59U8trk9baJYxqtRgX1HlRK2r4cQcMl17N+gyxN+L3wfTrn6sLaiL
	fEAA==
X-Received: by 10.68.190.229 with SMTP id gt5mr6107035pbc.15.1406900741880;
	Fri, 01 Aug 2014 06:45:41 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	nh7sm13170257pdb.94.2014.08.01.06.45.39 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:45:41 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Aug 2014 19:16:34 +0530
Message-Id: <1406900794-19878-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [PATCH] dnsmasq: fix parallel make failure
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
X-List-Received-Date: Fri, 01 Aug 2014 13:45:45 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

The dnsmasq target depends on .configured and $(objs). .configured does an rm
-f *.o. Yet the only thing telling make to build the .configured target before
the $(objs) target was the order of the dependencies of the dnsmasq target. We
can't rely on that order when doing a paralllel make build, so add an explicit
rule to enforce that order.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 .../recipes-support/dnsmasq/dnsmasq.inc            |    1 +
 .../dnsmasq/files/parallel-make.patch              |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/parallel-make.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index e57ab72..1955d6f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq.service \
+           file://parallel-make.patch \
 "
 
 inherit update-rc.d systemd
diff --git a/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
new file mode 100644
index 0000000..3d1040c
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/parallel-make.patch
@@ -0,0 +1,18 @@
+The dnsmasq target depends on .configured and $(objs). .configured does an rm
+-f *.o. Yet the only thing telling make to build the .configured target before
+the $(objs) target was the order of the dependencies of the dnsmasq target. We
+can't rely on that order when doing a paralllel make build, so add an explicit
+rule to enforce that order.
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- dnsmasq-2.68.orig/Makefile
++++ dnsmasq-2.68/Makefile
+@@ -139,6 +139,8 @@ bloatcheck : $(BUILDDIR)/dnsmasq_baselin
+	@rm -f *.o
+	@touch $@
+
++$(objs): .configured
++
+ $(objs:.o=.c) $(hdrs):
+	ln -s $(top)/$(SRC)/$@ .
-- 
1.7.9.5


