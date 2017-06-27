Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC4477FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:39:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y5so4968604wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2pNSfIjNDoMNhe0vy76mb64iy30aA7RZc1nV6KOObdI=;
	b=Hv+SxDqsTy5PEURxeixsszXaCyvyH5yjamW2Cm8EcC5q5dfIaXRlTHUbFwNYXH9vGd
	dPqzXdu3YwGhZpPV9I8+M6wqo9w6Oo4xPBTDZc4CVOZcMZ32BJBgh3JNbwmojENgnRVH
	XjCPRBJhjMRlXdJqTPdyrg6haFrv37ih2KMCyJ3EtnovUlWi6baU+0VrS3bV3cnibzF+
	PFLwliugKXaPe4GPdzgTHkkTdQDAPMB7fTGKohG5JWPL0Dk0RW8m3lwACmaXYM3wLn/P
	OrjBRtI9jkCfbfnl4cMzPZ8pYAQC22RLrTcGbDli7ayYC7FmcsGd//TSfxm5uMrlaT7V
	5UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2pNSfIjNDoMNhe0vy76mb64iy30aA7RZc1nV6KOObdI=;
	b=Yhol0bXTbuMH09AtBxAe18cGG7UiwYIiUZJnYDhzmLjxiTbeAJKJZYWPN53U1c4kUw
	qqyWm6GVLP2ditEDVyhhPEySqWYRgN9wQ1kHix/Z8SCu42MD+rxjlnunNNqRSUU/PS2p
	qYGhQgTUWEFKGWNEaYQEcTTjfF1wWQICExMULjFZHxbMlyDoiTR9M5mV8VTzUgZ1Bj/E
	LrPlbvdkuIUmAh7W7KMRHj8GneADrkND+9WCleay5cSee1408NcenlS8YG8gnP2Qq1IP
	y5sFrXoTKgOeErFBbnQdeb7aV9j90oez/4n7eNfZdxiGGUGwnpRvKPZ8n8CG/YgOTRLE
	n/gg==
X-Gm-Message-State: AKS2vOysF9UMDn6cphXYJfed72wZgVWG9WfWPv6gg81rQwimxgfeVJoL
	9VUcNq8hV9p+GE6X
X-Received: by 10.80.179.209 with SMTP id t17mr3457129edd.62.1498559961325;
	Tue, 27 Jun 2017 03:39:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.84]) by smtp.gmail.com with ESMTPSA id
	e22sm1540196edd.26.2017.06.27.03.39.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 03:39:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:39:14 +0200
Message-Id: <1498559954-17714-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] scripts/test-reexec: fix several incomplete regexp
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
X-List-Received-Date: Tue, 27 Jun 2017 10:39:20 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some "=" are missing in the regexp, which leads it match multiple results
if the variables have overrides, for instance:
...
SSTATE_DIR="xxxx"
SSTATE_DIR_qemux86="yyyy"
...

it will match both of them without "=".

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/test-reexec | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/test-reexec b/scripts/test-reexec
index 9eaa96e..30e792c 100755
--- a/scripts/test-reexec
+++ b/scripts/test-reexec
@@ -38,9 +38,9 @@ mkdir -p $LOGS
 function clearsstate {
 	target=$1
 
-	sstate_dir=`bitbake $target -e | grep "^SSTATE_DIR" | cut -d "\"" -f 2`
-	sstate_pkgspec=`bitbake $target -e | grep "^SSTATE_PKGSPEC" | cut -d "\"" -f 2`
-	sstasks=`bitbake $target -e | grep "^SSTATETASKS" | cut -d "\"" -f 2`
+	sstate_dir=`bitbake $target -e | grep "^SSTATE_DIR=" | cut -d "\"" -f 2`
+	sstate_pkgspec=`bitbake $target -e | grep "^SSTATE_PKGSPEC=" | cut -d "\"" -f 2`
+	sstasks=`bitbake $target -e | grep "^SSTATETASKS=" | cut -d "\"" -f 2`
 
 	for sstask in $sstasks
 	do
-- 
2.7.4


