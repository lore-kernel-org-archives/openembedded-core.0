Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5B81B731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 15:59:06 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l6so71597364wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=F/h3GfMYngs49RsE74XksU6Elj8tHW8th4s/fubl3bI=;
	b=HcRbhK69lpgq4pRfyTcXwnHqfs9YWDmHeS/Lq97eH+HLzvM59FvVEQh+CEM1QZaCcI
	YTh6vHxrrZR2k7YG7i8m6BMmHHvui7xgJl4B5e1HHTrmW3/X7AVSuG+56FkBNLDf8v7r
	MZ0bgyMpyc+TTfqgsSQF5OJWtEsXDMt4P5b9n4pXUNPWa6JD+LZ2EcaQJojgPtjje4lU
	9CoNSA5wKz/EPy21FASBmOcljt4y1l1Ie60gk1UkEjRg2Vw2mIBoJLq3VceNQ9o+viMS
	e8bMYI+M2ZeMapvufwL2RSXaMPQScBKe1c8BpksUx20gQriOC7wcp2QnLSzjiHwJIWQT
	O2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F/h3GfMYngs49RsE74XksU6Elj8tHW8th4s/fubl3bI=;
	b=hWTwSIlkQ3Ynn8ug9xzp34ZUg33ntCAUCTUswfl90I/BwrSTz5Dit+D/iI97F0S3bp
	qN9aJcVNrxwDWcPyiqrg/BEmrZDFvHLtVseZ3gQwFiQRhAwoWPfFkXktLipsPhFKdz2D
	klSLlYjSqG1kTx/AelzQ+ZduUE5GOyYBkfYZpA6JkVWqbyA9RFFx8Nd5Ju/B8XDW5WJC
	r1+egHUn3/YDDgbQb8Ums3HZyk3nIn9m3xX/tSuAXubMTwM/A7dNt5a2cRweRp9wwItY
	kRDFfgMnqgg3oQ+S1L3mJ29rY7X1VBnZFxNsGukVmg7JoJqXZIXXzLHcqrHW8KAnZ8x8
	yJ1w==
X-Gm-Message-State: AD7BkJKrRoZwPkqB6gnQZm+BxB761hlqWeMqNWXd55ZyBbLIw/2kqcmE1CnLfjoX/Q3jBmRP
X-Received: by 10.28.158.149 with SMTP id h143mr24712241wme.61.1459958346742; 
	Wed, 06 Apr 2016 08:59:06 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	xx3sm3915766wjc.32.2016.04.06.08.59.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 08:59:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 16:59:03 +0100
Message-Id: <1459958343-2915-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] build-perf-test: add eSDK installed size to metrics
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
X-List-Received-Date: Wed, 06 Apr 2016 15:59:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/build-perf-test.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index f1f44d3..7d99228 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -369,6 +369,10 @@ test4 () {
 
         do_sync
         time_cmd "$esdk_installer" -y -d "tmp/esdk-deploy"
+
+        s=$((`du -sb "tmp/esdk-deploy" | cut -f1` / 1024))
+        SIZES[(( size_count++ ))]="$s"
+        log "Install SIZE of eSDK is: $s kB"
     else
         log "ERROR: other than one sdk found (${esdk_installer[*]}), reporting size and time as 0."
         SIZES[(( size_count++ ))]="0"
-- 
2.7.0


