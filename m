Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 261087F37A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:53:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w26so7211787pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xKEM2WVtJOtw7XbvcrTJBIbAJxvUV22JCJp1VEF8dsM=;
	b=qKGuo6yj+X6e3Qhh1q1RbeUu0q/QaesV/Fc9zQBNArOR3AFMU9rU/BS1SeShBvIjn4
	NKsz+zRQ+oYhisHjctT+piEcS4iAE3+UMsWQf4G449hoqKkvKx0bMFOHjj54CnH90ScS
	2cY9hg8/QEWeruylmFQdLrz7DVAPuc0H5kHZ3bYO7E96+z0zSlIlTTdlkp7pDxoJOJDt
	JtioZUfZmzSud4UucPcxDHQvp33zeF3DMELvQfefY+SHY7i0fv8Er9vbxQlbrLiisKJ6
	mxiYtrkU7m+MVnyxG+FKhoUSNbClgqAGKMLGhx6T+N2yX14e4sELmjYDKyFyRl4antLz
	0Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xKEM2WVtJOtw7XbvcrTJBIbAJxvUV22JCJp1VEF8dsM=;
	b=n7LRndQgOnzX8zvc13clB8pH3tDFDpSkYYgZ8OYr+MOFoJp/Yb+phCHen9dRLVXoMJ
	kkTaxn4tGlNOugrpDA1WvxBErMqZS/6Cdht2n0DQM92ne1A40poplnxSzdhtUgnobAKG
	8w58CnakXFjfftaaNeA4DwITWmB39pgHzHQYgjDrs1IOZYXq3cmEaKxykMzhF7M85K8E
	oQlBbETL4lHFYteDOgjezxzNBhrlI5ZTR46GK8FtHQ4bwlS2tSfzWsLzKUr0QRcrzVh+
	39/2afq9y4rW1owY2tmqooTVeMCxr7GLcYKq+06RMvw7vnJR6u3VZTnFfZ0Y2nNP6rX/
	5jUg==
X-Gm-Message-State: APjAAAXp3jzmg88IBBDUhe8Cdbi2i2KFPd0obhAriXbwv6cS4swRyhjk
	va4DBvt8VzbhIZGKuNb7jpIrMZMv
X-Google-Smtp-Source: APXvYqw1rqdKPZ5czkcH+O8+N5s3iNkVRYqORKoweMTVSi9dBlmaGFxaXG9+vrj4GJ/HVxX/lrLXwg==
X-Received: by 2002:a17:90a:b115:: with SMTP id
	z21mr7160926pjq.79.1566593582146; 
	Fri, 23 Aug 2019 13:53:02 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.53.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:53:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:42 -0700
Message-Id: <1566593504-21918-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 11/13] dropbear: don't create invalid symlinks if ssh, scp, etc are disabled
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
X-List-Received-Date: Fri, 23 Aug 2019 20:53:01 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index dcbda74..7269888 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -70,8 +70,13 @@ do_install() {
 	install -m 0644 ${WORKDIR}/dropbear.default ${D}${sysconfdir}/default/dropbear
 
 	install -m 0755 dropbearmulti ${D}${sbindir}/
-	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
 
+	for i in ${BINCOMMANDS}
+	do
+		# ssh and scp symlinks are created by update-alternatives
+		if [ $i = ssh ] || [ $i = scp ]; then continue; fi
+		ln -s ${sbindir}/dropbearmulti ${D}${bindir}/$i
+	done
 	for i in ${SBINCOMMANDS}
 	do
 		ln -s ./dropbearmulti ${D}${sbindir}/$i
@@ -101,7 +106,7 @@ do_install() {
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "20"
-ALTERNATIVE_${PN} = "scp ssh"
+ALTERNATIVE_${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"
 
 ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
 
@@ -113,3 +118,5 @@ pkg_postrm_append_${PN} () {
         rm ${sysconfdir}/dropbear/dropbear_dss_host_key
   fi
 }
+
+FILES_${PN} += "${bindir}"
-- 
1.9.1


