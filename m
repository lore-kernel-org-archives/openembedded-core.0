Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0E26374051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 10:48:38 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so10544089pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 03:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cOkoJ3M9WopaoDcQZizdQGIOZGxSuFgwRsg213mEqGg=;
	b=ltNmzS44FOt90dxoG8ubUqjefFk+U2GwR2C/MkD4PjVPxgybgA3kfg7lL2+5NbnA9n
	bYPEHPcmDVgmmE3dXYvoyVvgBBKpySPehJCxARLgZfLxtGKURjrMg/ELk8EKfH7BmA12
	XrX2FVUvUO5KvFysBKm5iFcYK6mwU0770vkzpFpmxs3ihfnBxJaGoLffQxHvpcOxGf/w
	ot2NmeLyQUW30YRbRssNUZT7VmRkqiLwaFHQqpnDT0g29jBFurpjLAKiYKLnzBNoROn5
	tq+yFqGulSJSdVkE5lT0HZ0ZN1ExfA30lq56GujD9BE++ZClnnjRN475liK1z5KmUmLg
	bzww==
X-Gm-Message-State: ALoCoQl0iUTE9Xq3rLhczLp9w1TZPROuVSKKDXHLZ2pm9lZpTVN3u6M7+jpHUon4FMHerLjGCr8b
X-Received: by 10.70.22.131 with SMTP id d3mr57331284pdf.67.1434451720001;
	Tue, 16 Jun 2015 03:48:40 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id cf1sm955541pdb.41.2015.06.16.03.48.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 03:48:39 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 16:18:27 +0530
Message-Id: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2][fido 1/4] runqemu: fix MACHINE being detected as qemuarm for qemuarm64 kernel image
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
X-List-Received-Date: Tue, 16 Jun 2015 10:48:39 -0000

Basically, runqemu script autodetects MACHINE type based on the
kernel image name; if MACHINE name is not specified. Since 'qemuarm'
string is common in both qemuarm amnd qemuarm64 kernel image names, the
MACHINE type is considered as 'qemuarm' even when qemuarm64 kernel
image name is given in command line.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 84ece4d..09c507d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -232,13 +232,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
-- 
1.9.1


