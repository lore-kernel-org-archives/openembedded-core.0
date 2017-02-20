Return-Path: <huyht1205@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D089C71B27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:38:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a123so9444304pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bYWVFDHDBp89fmQAOeTQO4ZusZXpm9EVVJsEfiII064=;
	b=OhbXK0vmWt4NHdKhtdc3YY3EVevliDe8aAT4NQHpTKLpYGsv2i3eB8c2PSW0a+t33a
	5yBB0vPi/Gc9mnnBNb3ssOXS/CJ8o/wC8Q7TUCWbH1om4+nw4FLsLA1yEB+7u5lOKPls
	dg9Km4GQtuNGCOnPRX/74dRuZDsMg4lGWibjSwQidvVpQoZZY4+YJUCqwGY03JTOU4JA
	6A0vWodU3aD84ZAzrt0io4hAPsfJyzrG7qiIn0NKblmvafwQCCFMQv2unrdqgSRZmEFF
	YvLICc2iHiTFZydpyOVqU+ZQ3D4mTjnYe2rFoBMlQlUM96q1Mns8sRzWzUj6H0ke+DU6
	uhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bYWVFDHDBp89fmQAOeTQO4ZusZXpm9EVVJsEfiII064=;
	b=QS8LbxEwUIEjwtNYymdtOHH2CPtlqKdpBuRMsqhv4dJNYIM6WS0C/dcG1kXMjuQwkb
	z9/ad6O75+c+Bjx3sAu2X6OSOF6q08c8QPfsDvu0Igrh7CG3hkyKwr5REhVKbsG+ufd9
	aQNH5R7iCLOWXm/77syqObrOr7OWTT5t/1RvnGsHBgg8EXr19mBqPDRBaRTwLSoyDLvr
	iSaSG1mqYbR06YK40D1Z+AQCGvc5U1rvmRwvLp9Q+vmxIRM3mHdPoPS6PnD1mDjdZhbx
	YZ11JIS9QZTLNLP1EI5ZTmAxtuFzjxLh0El1FrgUVQ1TRgEnLH45UYm5fe8Q4qCFFPm0
	NaFQ==
X-Gm-Message-State: AMke39kG8vJKqDW5mADyITvqlyu3jOKY+mMdrJei7THXnT5s+bhQFh1Mwhx6Cg9YUOmaDg==
X-Received: by 10.99.211.21 with SMTP id b21mr26606388pgg.166.1487583485697;
	Mon, 20 Feb 2017 01:38:05 -0800 (PST)
Received: from lh-asuspc.local ([210.245.32.62])
	by smtp.gmail.com with ESMTPSA id
	z7sm11968603pfz.128.2017.02.20.01.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 01:38:05 -0800 (PST)
From: Luck Hoang <huyht1205@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 16:37:58 +0700
Message-Id: <1487583478-22151-1-git-send-email-huyht1205@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [scripts][PATCH] devtool: upgrade: fix error of import recipeutils
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
X-List-Received-Date: Mon, 20 Feb 2017 09:38:06 -0000

upgrade.py imports oe.recipeutils in meta/lib/ but path to oe.recipeutils
is not provided. This fails populate_sdk_ext.

Signed-off-by: Luck Hoang <huyht1205@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a085f78..45b23be 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -27,6 +27,10 @@ import argparse
 import scriptutils
 import errno
 import bb
+
+devtool_path = os.path.dirname(os.path.realpath(__file__)) + '/../../../meta/lib'
+sys.path = sys.path + [devtool_path]
+
 import oe.recipeutils
 from devtool import standard
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build
-- 
2.7.4


