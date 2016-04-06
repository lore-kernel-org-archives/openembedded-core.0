Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EA2A16FF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 19:46:00 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u206so59581033wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=i66HJmW6gC+9e2U0YhMI2xfHZ/ufYxZcNl/Jpk3XJK0=;
	b=lZu0QQAqqjemt9bugXbsj76ml93XBt2QV0/rpqRpcHiol/lH10zGfoUOjotbwMadQi
	MuwEjGoJZNBns0B7NmsrfawlmenvGXzcoSWQh7SQPmfQQ2nZDEkHYr7/MxwxcK47LzlR
	bITgAOUNSQaUx4vcUUwzixXWFDjATUCXCdg3W3sqhMySS5n9UGJ/HIGc/mqkWBL0M2YB
	M+GlEiT3k0Aenn++zhVD+OevHW1/Kin0ud02WztdLSM3rTBH+BPAdrsJ3Hg9vcl279vy
	RNtm+Sc7eU7po5WBaL4iECADDfX/lTLtKVwHqW9PyU5x34HR/m+gN2G50hmFpAmsN5S1
	nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i66HJmW6gC+9e2U0YhMI2xfHZ/ufYxZcNl/Jpk3XJK0=;
	b=lnB240mR94F0dGy3/RT/KfjXujm3l11PiW3C0u3jBfJ5ZlMB/gFlOT8//hq47Jj5W5
	IKElpk3/shwkpT8Hqpl/dZyTfv00yklLHtpYKzj2vVtwzSFZvQ4CPBbPB1sbo+bdKMdY
	ZOLuaeExarDxYm3SXYdQta9bvI4odeTIagMgm1s0VubHnjn8F1gnojtOiveyrZ186Q0t
	jOUHEKhiuw5iU8pSlb/TASR4ufJhOL/dXQr2wkciznzPnjvUzMYWO7TfQbzJtiK+zGtF
	IEuzAfsBidfdQV4fj0mWwKyuRb6ZTVxp3bK5nM+VVmCeHz++Tmo+cUFzHANFa/V4bBKD
	Jbjw==
X-Gm-Message-State: AD7BkJK4uWFmwNh20jJLl4s3DPxVjJNChOR39QrmnwtR6Op1Jslb40yHfotCpLwxAhSvFGwa
X-Received: by 10.28.103.3 with SMTP id b3mr24799114wmc.65.1459971960331;
	Wed, 06 Apr 2016 12:46:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	av3sm4771239wjc.44.2016.04.06.12.45.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 12:45:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 20:45:57 +0100
Message-Id: <1459971957-30162-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] systemd-systemctl-native: fix unit detection
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
X-List-Received-Date: Wed, 06 Apr 2016 19:46:01 -0000

The regexs were too strict and didn't allow for trailing whitespace.

[ YOCTO #9337 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 1164dd4..efad14c 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -108,7 +108,7 @@ for service in $services; do
 
 	# If any new unit types are added to systemd they should be added
 	# to this regular expression.
-	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)$'
+	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)\s*$'
 	if [ "$action" = "preset" ]; then
 		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
 		if [ -z "$action" ]; then
-- 
2.7.0


