Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAF0C6D666
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:45:31 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b19so6864721wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F4jNNP4qj1NyJ+IGVz/uQSpVh1BJIkoNR3BJz2QMYj0=;
	b=InkRMgmX/jUvyLd/2WegllkBHF6bZ+XwfuEBcW/z0oTjKTYHxDLMxqgPnnni8gtDXW
	N74lkYYqChP12/spHizLzl9gQTaspxa8Mp1IMcTqcB31USWR/Jh8xTiGgTd4Sd+FqlcE
	0jbMJuEqIUfM6BqMhoonEkdGMGuHaZb8QNd+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F4jNNP4qj1NyJ+IGVz/uQSpVh1BJIkoNR3BJz2QMYj0=;
	b=aeVqHZJnEMDaSvJA0J2YN8RWrD5A6rmDGL0Dyvflq+9r/t4VM+p4FS1EpvPVI/6TZv
	wbupFjyA5zcenb6gCg4HzdUf69yu2MhkqEP9RBABhTQ1fxLk8lfQzH4YZF794AbXOnIY
	B4j/CMRVYZ4N79g8Ha+qI8Xpfnu6OHIBtSLZyVNdZxuW/jK3NoNdkMLv4B/6xP3rx22g
	tqmZt6LGCdja0hJHTbfOQyBolzfG9yxXJ8dSZnnxV8nMBODSA9vDA1stgFqnn6wVOzwG
	PCh/RTliqT8aLx0KGYXi2GooQwEzXahC7Tm+vgV2l+r2z3klx1TpEJhho7efquaIa4HT
	ElZQ==
X-Gm-Message-State: APjAAAUqnfIQDR8g8LRHvzHbmG4z4WV9DVTBTcsTpVyG3FQDJs9Vbm7F
	6+qsSNTJ1RTof8SaoB0q10qhaVM7juc=
X-Google-Smtp-Source: APXvYqxWwhaBi1KC/91IJtwqRO713LDtuLL4FFrAyFZQ0LtKj6dH/glVoIhgjd7eXRxTgIxQYMBaCg==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr15234920wmg.16.1578840332255;
	Sun, 12 Jan 2020 06:45:32 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q14sm10808553wmj.14.2020.01.12.06.45.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 06:45:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:45:29 +0000
Message-Id: <20200112144530.29417-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] sstate: Improve move into place op and touch file
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
X-List-Received-Date: Sun, 12 Jan 2020 14:45:32 -0000
Content-Transfer-Encoding: 8bit

Depending on the kernel and coreutils cersion, mv operations test for existence
of files and can potentially race. It also leads to the file always changing which
leads to potential problems if using and NFS share and there are other readers.

Using ln instead means we don't overwrite the file if it already exists meaning
other readers aren't disrupted and should work more reliably on NFS which is used
for sstate on the autobuilder.

Since we're not overwriting files, touch the file to show activity as would have
been done it it were reused from sstate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 356fe7ec180..b4ffffcd98b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -776,6 +776,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
+		touch ${SSTATE_PKG}
 		return
 	fi
 
@@ -803,10 +804,13 @@ sstate_create_package () {
 	chmod 0664 $TFILE
 	# Skip if it was already created by some other process
 	if [ ! -e ${SSTATE_PKG} ]; then
-		mv -f $TFILE ${SSTATE_PKG}
+		# Move into place using ln to attempt an atomic op.
+		# Abort if it already exists
+		ln $TFILE ${SSTATE_PKG} && rm $TFILE
 	else
 		rm $TFILE
 	fi
+	touch ${SSTATE_PKG}
 }
 
 python sstate_sign_package () {
-- 
2.20.1


