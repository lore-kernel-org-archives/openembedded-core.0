Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B0C02786CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 23:36:01 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k20so2014500wre.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HentNhCT3B2/d5LQ9MypXjm2nQudFtIgWvM3n0PoAVU=;
	b=JMbgsMh+aFjfsU0Fw/yGt3+Cohtf/nIOp3pCAKbfd56Hp9B+5l1uNRJ5zhvBCf85Hm
	lKNZS7mYB3OCfJ3HN5cZnN2fu/MPl/4uuTPt0cGT6qKfgGrHyX1vfSNbHqO7TWbOIEg4
	lhH4La0MGQcRg3m0aHBjfu2Ep3xrGcyXuIAY2UmK3VuzdWqbo3eCSYJOSZk6r6t5Dhtj
	TAcVv/M5qO4daDny2JWxc1zaQR/z9711kbAtmSBbgt8ytjWfYkD3oks5o8xFGkqh5u2o
	xh6A33G7UWUe3dHgkmAJYv7yyWn/0sflWqTnXKTKKiK0YZvn+wrV9dL5Uzz7/3bKlbSx
	eZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HentNhCT3B2/d5LQ9MypXjm2nQudFtIgWvM3n0PoAVU=;
	b=d0MQBAX4lw0B2UDxW50LQswWAOqDgUuh9E+b6Mhol0HXERf99prN1/zXwd0g+6wlEO
	K84rkpyCdVXrcaB94n3+UBVSHnYfP4ISJw3o2iY30IFmIiPwG1s6wzXZQryMg4yDDtYH
	uuYY7ddmKh0OdNosrm1TF0hIPZe69EgB73AOe9X+sIn75w8aoSbl/NcStJ59vBTa8KUC
	dt0Aa1CQd+6qf6m5IRHdUsOkOR+Nw3pXuYT0M5mf1EOd01HUPM4saCz9TsTuE8j0W3+V
	6EIhvpeMC45IqILMD3+WdO1xYCR6MwBaOWai61ABc+04F+cVVZIjsEd4wzRK+HmbcqsW
	Zz5g==
X-Gm-Message-State: AHPjjUgHmwhZFJku4WB3LXNUBBbSnmNNYOUj9H9NfC/1SmLigBWW0/7R
	kfnwCXQkgtX1tQzk
X-Google-Smtp-Source: ADKCNb7Q1vDG2IH47D9jnFSAXu340rTVeQU9B1k44D/+PIdIvCjdH1a532iBysAy0nqG2uPwPqoe3A==
X-Received: by 10.223.166.196 with SMTP id t62mr21903350wrc.251.1505518562200; 
	Fri, 15 Sep 2017 16:36:02 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	y84sm1340368wmg.43.2017.09.15.16.35.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 16:35:59 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Sep 2017 01:35:49 +0200
Message-Id: <1505518550-13471-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
References: <1505518550-13471-1-git-send-email-andrea.adami@gmail.com>
Subject: [PATCH 1/2] sysvinit-inittab: start_getty: consider whitespaces in tty driver name
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
X-List-Received-Date: Fri, 15 Sep 2017 23:36:01 -0000

Unbreak serial console when driver name contains spaces (PXA serial).

Fix commit ac0e954
"start_getty: Over added SERIAL_CONSOLE cause error in userspace log"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 31b4413..f0d9f8c 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -8,21 +8,26 @@
 ####################################################################################
 
 # Get active serial filename.
-active_serial=$(grep "serial" /proc/tty/drivers | grep -oh "^\s*\S*")
+active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
 
 # Re-phrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
 runtime_tty=$(echo $2 | grep -oh '[0-9]')
 
+# Backup $IFS.
+DEFAULT_IFS=$IFS
+# Customize Internal Field Separator.
+IFS="$(printf '\n\t')"
+
 for line in $active_serial; do
 	# File is availability, file content current active serial target index.
-	if [ -e /proc/tty/driver/$line ]
+	if [ -e "/proc/tty/driver/$line" ]
         then
 		# File content a lot of unknown serial. We use -v to remove all unmatch and get left off.
 		# Tail use to avoid 1st line included into the filter because 1st line is file description.
-		activetty=$(grep -v "unknown" /proc/tty/driver/$line | tail -n +2 | grep -oh "^\s*\S*[0-9]")
+		activetty=$(grep -v "unknown" "/proc/tty/driver/$line" | tail -n +2 | grep -oh "^\s*\S*[0-9]")
 		for active in $activetty; do
 			# Check if both index is match then proceed to enable the serial console.
-			if [ $active -eq $runtime_tty ] 
+			if [ $active -eq $runtime_tty ]
 			then
 				if [ -c /dev/$2 ]
 				then
@@ -33,3 +38,6 @@ for line in $active_serial; do
 		done
 	fi
 done
+
+# Restore $IFS.
+IFS=$DEFAULT_IFS
-- 
2.7.4


