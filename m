Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 346D4746AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 17:11:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b5-v6so4758608pla.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=a9nIOan67bxs0/n+Wapyu6R9NuYTfol9LzwaK/U/do4=;
	b=RXIUan6QQ5Olu3Ph0s2UUcSgYnvRhy5KkZsxl2XagTxvEu7eXQ/H0H1pcHw9sqSLiF
	NlQ0vgxsbYlF0t3SsAU8aL+CqdjBTM0wPMngbhVR/LDs+hsdJT5EgJWxlM6bYjGyPAuO
	ZvYF6oLGHKDEZSDd0mrs3/nwY634VhJkHDrz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a9nIOan67bxs0/n+Wapyu6R9NuYTfol9LzwaK/U/do4=;
	b=kI+JfWxtvzN7Qb9Bl+tlKcAL9S9PEpoLTPk+K0nyqiIhCGZucdkYFgvst1ds3w7Ygj
	ihjUR4nwS1CIDpcWQ5azB0UtEwnp7RBNZlLdhyFciVLjjTY3W98hxtCZSP7HsQaKKxm4
	Qw06qdCUNHEt2Td07g1joG796bEWa4cloIHD74mDXkL2YdT12W80KDtVdZ6QDdv1+EkF
	2qPkk1QHL1GX+Xmb+51xC1WSMhYmtxm4g3F5PyC3RvK3p5oYG1HGq6mm3JpL1LZj+v4a
	MGo628iJWKMsIb5SQJCydu5R94pT+0fUBBnA4Kw3AgS6Q6CUm5MaoyaR3+wG7nFwNeHv
	ipFA==
X-Gm-Message-State: AGRZ1gI0Bpghx0FCa7kqGDaJIHR5VIIGkaBtmbA0BEnQ2YsDquaR/ASd
	suyysBvTsSGiyiWOZ31sn6SYbC7X23BQkA==
X-Google-Smtp-Source: AJdET5eR2HW8QdSHOHynaId8N4lbyzExBbrcDa29oUnUValeCfxKGmNt3Oc5rL2DZ2xH2Y1CFir97Q==
X-Received: by 2002:a17:902:3e3:: with SMTP id
	d90-v6mr22763638pld.118.1541437902883; 
	Mon, 05 Nov 2018 09:11:42 -0800 (PST)
Received: from yct-lpt.pdx.yoctoproject.org (5751f4a1.skybroadband.com.
	[87.81.244.161]) by smtp.gmail.com with ESMTPSA id
	m10-v6sm88717285pfg.180.2018.11.05.09.11.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Nov 2018 09:11:42 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 09:10:48 -0800
Message-Id: <20181105171048.23517-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH] scripts/autobuilder-worker-prereq-tests: adjust max_user_watches
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
X-List-Received-Date: Mon, 05 Nov 2018 17:11:42 -0000

Temporarily modify path to run as non-privileged user on more distros.
Change the recommended value to match what we use on the autobuilder.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index c0148fbce8..bb46c69135 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -34,10 +34,11 @@ if [ "$?" != "0" ]; then
     echo "Bitbake parsing failed"
     exit 1
 fi
-WATCHES=`sysctl fs.inotify.max_user_watches -n`
-if (( $WATCHES < 100000 )); then
-    echo 'Need to increase watches (echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf'
-    #exit 1
+
+WATCHES=$(PATH="/sbin:/usr/sbin:$PATH" sysctl fs.inotify.max_user_watches -n)
+if (( $WATCHES < 65000 )); then
+    echo 'Need to increase watches (echo fs.inotify.max_user_watches=65536 | sudo tee -a /etc/sysctl.conf'
+    exit 1
 fi
 mkdir -p tmp/deploy/images/qemux86-64
 pushd tmp/deploy/images/qemux86-64
-- 
2.17.2


