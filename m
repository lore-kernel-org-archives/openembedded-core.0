Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3559360290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:21:59 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n13so30558398qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 03:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=N5BxVY4PlBlv3sbax5hDRY2FtIxVptdYg13BURK5AvQ=;
	b=RNF1c+cHAbsKWMSqIt5HNMKWmCqrcAt5jQxjtqLiSSjkQU+3JbUpz9XN2GZHjCDlXQ
	8G2dPdNVdaw4HtTF+6wI6FD8N82+h3DhgaBjxWQ+oaSavIyMo49/mmzsXyVMrYeeeLIJ
	noS0RUOi64jUOI8L34rhOf3t1F4JwlR46xPibqF4xITVjqrh4JDytspJMuEGrWsDH5xI
	QzWwkQN19A8VIjJc4qGo07UcVlV/wSFVB/Q2guBM2/OAgz1PvqXHS3qHMbirZwovYPOz
	ucu54MOm24QmrXtK9ipKXNJ2ghvKTGxuWOMEe4KHFiM5RGm+19DjYkqQ1M38DDI+nCJq
	aEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=N5BxVY4PlBlv3sbax5hDRY2FtIxVptdYg13BURK5AvQ=;
	b=PSRf7OiAk0/AuWIqIN78enx68V/UQ8oB/VvUqFo9DIn8iZE58wEC4227uELiODUasw
	PAtGvQZl+cJeZ8Vok7msoaotlGSKW326G12v4Vp4MgE+4l4cMgDT7rRLGS7Y1iriSytc
	lnzHa9lQCkLVQr17cHa4UxNMFr4qP3+KpaKvrAkkRYknvUqmWxCj8swhezyQP9G+JJMj
	LgEkfnPSTymRuGcgnhZcPohAjcb0TOKeNXf5XEWn9UbQH6Xj4t1MyWfuOYsU9j47y4G3
	RIbNQPPB6HbSXOc+UDQ1UYipqlOM8jKInksqobsXyW2yl+sIwr8nPuwblDSNamY8I9wm
	E/Gw==
X-Gm-Message-State: AIkVDXKjtGoqXdCI142shTOgdCCr7LH/NvRhT5MWDStVVrDnaJEQ4pJNssL9WrEh3aTzWA==
X-Received: by 10.200.56.164 with SMTP id f33mr34921084qtc.158.1485343320064; 
	Wed, 25 Jan 2017 03:22:00 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	o14sm7118243qtc.46.2017.01.25.03.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 03:21:58 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 09:22:05 -0200
Message-Id: <20170125112205.8223-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] watchdog: Add RCONFLICTS to watchdog-keepalive and split RDEPENDS
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
X-List-Received-Date: Wed, 25 Jan 2017 11:22:01 -0000

watchdog-keepalive is a simplified version of the watchdog daemon
and can't be installed along with watchdog daemon, we need to
choose which daemon install.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index cedfc042ce..9659f27df5 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -52,8 +52,9 @@ FILES_${PN}-keepalive = " \
     ${sbindir}/wd_keepalive \
 "
 
-RDEPENDS_${PN} += "${PN}-config ${PN}-keepalive"
-RDEPENDS_${PN}-keepalive += "${PN}-config"
-
-RRECOMMENDS_${PN} = "kernel-module-softdog"
+RDEPENDS_${PN} += "${PN}-config"
+RRECOMMENDS_${PN} += "kernel-module-softdog"
 
+RDEPENDS_${PN}-keepalive += "${PN}-config"
+RCONFLICTS_${PN}-keepalive += "${PN}"
+RRECOMMENDS_${PN}-keepalive += "kernel-module-softdog"
-- 
2.11.0


