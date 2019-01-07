Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81D727BEE1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t200so1562322wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xOqOokdSA3G6gE6deJVc5BJTH8VrrgNcgc4ng4UA9q8=;
	b=nNdvGDa7Gh2qAhjMFhOoxsWG9T5OPoEoGyPSpKOR6+u2mBaKbGO3AyiCuXv8qnjNqE
	eEG/dQJ/h3PLTbatIc2Z+FxUwdEffrKpRf6296kPHARmdbOjNcNWdU8zHsEwCOHkMC78
	Y7v7j/DHHpdYO/1MCd1gHqMlr9za9ibgvEehnm2PKzmP5wVI65hxB8shefwA4AFweYLx
	uV7Ems6QTd5bdRCsCY48mCMHYeA3eH6T+JmSXSA0YGbozcajmTCxUXwTmCgOpBfnflhr
	PxYbpw0Wj4Lw9PSMDt+rao38jmsGg9Z52YczMHmjtqpjdIaL3CX/ljoblaM+zkJpVU2d
	aisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xOqOokdSA3G6gE6deJVc5BJTH8VrrgNcgc4ng4UA9q8=;
	b=ru8I3Yw0w7dRYcwHgAobXHeP7z7SPJqU9TiQf+srvZ8ifXCelfGNep4gPjqCs9YXrv
	FtBXOpPwQPGyfks6+qf/P6hDi9mClhbopnCwHGJogEl+zZvm8zmkIXnybmm7FPLHUfiq
	u9mpSdIqooxE6g8RTAK1kUUB6CoGVp92XK11D9v5vZsLrPgtnckDo6okcKF2uCJ7t3of
	peDhmwnVjcT2h26j9bRm4oB3HQseFFETmQnOrSJZQU1BSblqXTwuIR/UXxcso++hq5BI
	q/usmlilamxt+00p82UsR5UP9G5ywuI2ce2g4oUdxggZ9LyjBLmO4s5NaBec02yvWIWg
	xcwg==
X-Gm-Message-State: AJcUukfNSeBnhUH1POoEaqp4RD0GESb+rJ+3aGbXv32ygU2jbWFwrTc3
	1Fm/CiecLhNkNUjufiH8ftC8SIRIEaA=
X-Google-Smtp-Source: ALg8bN4I9cq2e8OwfbkkvhgY7fKo3YxhaN1kM5L1POViEotrtuahnFM9yX2eyqAFco/8m4LjLALIXg==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr8689601wmi.57.1546879113671;
	Mon, 07 Jan 2019 08:38:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:17 +0000
Message-Id: <20190107163823.31816-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/7] toolchain-scripts: run post-relocate scripts for every environment
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:33 -0000

SDKs for multilib configurations have multiple environment scripts, so
re-arrange the post-relocate hook invocation so that it runs the post-relocate
hooks after sourcing each environment script.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 46 +++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6d1ba69473a..1a2ec4f3b29 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -128,30 +128,30 @@ toolchain_create_post_relocate_script() {
 	touch $relocate_script
 
 	cat >> $relocate_script <<EOF
-# Source top-level SDK env scripts in case they are needed for the relocate
-# scripts.
-for env_setup_script in ${env_dir}/environment-setup-*; do
-    . \$env_setup_script
-    status=\$?
-    if [ \$status != 0 ]; then
-        echo "\$0: Failed to source \$env_setup_script with status \$status"
-        exit \$status
-    fi
-done
-
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
-    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
-        if [ ! -x \$s ]; then
-            continue
-        fi
-        \$s "\$1"
-        status=\$?
-        if [ \$status != 0 ]; then
-            echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
-            exit \$status
-        fi
-    done
-    rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
+	# Source top-level SDK env scripts in case they are needed for the relocate
+	# scripts.
+	for env_setup_script in ${env_dir}/environment-setup-*; do
+		. \$env_setup_script
+		status=\$?
+		if [ \$status != 0 ]; then
+			echo "\$0: Failed to source \$env_setup_script with status \$status"
+			exit \$status
+		fi
+
+		for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
+			if [ ! -x \$s ]; then
+				continue
+			fi
+			\$s "\$1"
+			status=\$?
+			if [ \$status != 0 ]; then
+				echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
+				exit \$status
+			fi
+		done
+	done
+	rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
 fi
 EOF
 }
-- 
2.11.0


