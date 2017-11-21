Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E592971B2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:14:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 128so3264606wmo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 05:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5kUy1OrFl050DgaEuxygyv/RnjqEZRuTiXS/k6rOIQo=;
	b=DyW/G2ZUb1+D7BBHCMtzvxmX3+rJ9mWEQqXqTRNGTvH8Z1nVR1+plpVr1wqb7jpnsK
	I5aSYpxkcVz7vHq367GmrEpSbw9RywIlLgf/Uqx9LzFuBwRL4EldxhuhfmNnx7l+Qbru
	QRyjVLHYNBvF6Zzb6XKVT4HGSg87ANIiDvPd/2Y5YT2ezH4G89HC/LLala1mrxdMnBdL
	SA5OSAQZbmjJn9ZZ47X2pOQ9VoeLmmOFTDZP/IS4aLQT2IK4O5cJjPoT39CxzxfPdpIA
	Y+9r1RnR3YT5NWAMx2xnrmvU01UhSJ02LF14Ph08k6nju70NzyVrNCETjRNODmpJimOn
	alZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5kUy1OrFl050DgaEuxygyv/RnjqEZRuTiXS/k6rOIQo=;
	b=hqoYJdRdWk0w00HxZlBo/tMuNHUcpDmUWrBpx2JHbslz7THJYPKSadUoF7qR3Ylr21
	fSpL2n7OeSaCnPJNzbo1tvkVNMks24iN1ugpekjBXPtJDD3tRe3nz6EkFQtRRGrYjgG6
	7GD8lKiAORV3SCjMEXqlbp615aaA/eEzlaURl7BWH0hjQjlM0jMT0of255+TkO98UpjR
	ToyoYSDPd2iVQk34rnfG8OP8qhXmWQL7svq6KYwsBpDX/z/Ptz2rCdiAwzP1AhtI5Cmv
	kgyW1lPPfXeWvnqCLYTnRRFloM3o2pMIr4HqX7BRcz8Soa13Vi5TSPIKXTcUQplst3BJ
	39hA==
X-Gm-Message-State: AJaThX5Kus1ggbJPm7UR5SQLf2Pin24r1f0Gz4enJCilJr/Fmy0ZK3mb
	4SY09kGfo5+E0M1KzSHf/8vpH2Va
X-Google-Smtp-Source: AGs4zMas/++kDC5nQC3wNpXcYgrtVm4YpjY42P+j453ALXqvmXjzlPtaeBlO8HdTQkvgy3l6iuluSg==
X-Received: by 10.28.94.75 with SMTP id s72mr1196585wmb.112.1511270089311;
	Tue, 21 Nov 2017 05:14:49 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d1sm2044066wra.44.2017.11.21.05.14.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 05:14:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:14:46 +0000
Message-Id: <20171121131446.14248-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] verify-bashisms: use argparse, add verbose option
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
X-List-Received-Date: Tue, 21 Nov 2017 13:14:49 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/verify-bashisms | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index dab64ef5019..a979bd29650 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -89,7 +89,13 @@ def get_tinfoil():
     return tinfoil
 
 if __name__=='__main__':
-    import shutil
+    import argparse, shutil
+
+    parser = argparse.ArgumentParser(description='Bashim detector for shell fragments in recipes.')
+    parser.add_argument("recipes", metavar="RECIPE", nargs="*", help="recipes to check (if not specified, all will be checked)")
+    parser.add_argument("--verbose", default=False, action="store_true")
+    args = parser.parse_args()
+
     if shutil.which("checkbashisms.pl") is None:
         print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
         sys.exit(1)
@@ -99,6 +105,8 @@ if __name__=='__main__':
     # bitbake server is crucial, don't change it.
     def func(item):
         (filename, key, lineno), script = item
+        if args.verbose:
+            print("Scanning %s:%s" % (filename, key))
         return process(filename, key, lineno, script)
 
     import multiprocessing
@@ -110,9 +118,8 @@ if __name__=='__main__':
     # recipecaches to handle multiconfig environments
     pkg_pn = tinfoil.cooker.recipecaches[""].pkg_pn
 
-    # TODO: use argparse and have --help
-    if len(sys.argv) > 1:
-        initial_pns = sys.argv[1:]
+    if args.recipes:
+        initial_pns = args.recipes
     else:
         initial_pns = sorted(pkg_pn)
 
-- 
2.11.0


