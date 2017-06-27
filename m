Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 272F177FFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:38:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p204so157663wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CfugW67dmeg7RQpirbK0cqB368PDe6GE8ldAJNSU+s0=;
	b=b4dd7H22YzrIn2PmtxbOYQ156jysdd0pc2hKJr7qjTCdzVoUr2QopQ3E+lLutEfOaR
	Dq9nZ+rAawZC4puKP19wQLrHMDh8u+G3KZAvqHFGsXn+kszxYQIz3kYN95nOdcOHHyo1
	c99FfzS+Zpu1PdhfNhyigkZEeIEfZmJCzf8xOj5jUD7+gZS+N+q87Db+5APBnDByo/db
	mqq/EZYTeIWEY1ZPbnQyJQSQir5RjaMSuTnZaH+smsYr+pyWGo+890jh3hSEmlA6GuXi
	8mUIIAcQ4zL4GYtAKNKC3ZPJxfZYLTLMxQldAZgvVCWX8CQHAPhVfra9v3fPzngowdzW
	F2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CfugW67dmeg7RQpirbK0cqB368PDe6GE8ldAJNSU+s0=;
	b=kFv3lY54VSzA+5ykYME/XR3lP8x0CkALBeadiqyJf5Yk0IEagypCBNmki5tfzqUQNf
	E5I76OAzfuieN9B0nohjOIHCSt7WXsnNpYSCqlUo5Yb1LqTnMX3PhpA5w90ULTi++IJg
	AxpAIg5w5ZModyNXJvcfYjA+SY/CseL3ND9pz/MB6HMECl/9w8Hj4wfjLkLlbQduEiT1
	hNSJeBEoxoT1hbKpDOtciQJ5uOhE62Mxrf6xrwYMEAZEIFuxIgSekkregzbMgUzvo4Fe
	Z02fw2cta3mm5CPEf1CYd080Iq3bhgCJUibMiv3nGXxre8UqRDdl+wjibTmhMi8Mdr/R
	Pdkg==
X-Gm-Message-State: AKS2vOy5CgWmLUcprHVUIZ2FroAG11ykiy9Yy+BP0dzIyCOzVqwrjjQK
	3eEAiPl1JdLar7lR
X-Received: by 10.80.161.69 with SMTP id 63mr3449091edj.142.1498559936604;
	Tue, 27 Jun 2017 03:38:56 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.84])
	by smtp.gmail.com with ESMTPSA id 4sm1389818eds.48.2017.06.27.03.38.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 03:38:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 12:38:49 +0200
Message-Id: <1498559929-17538-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] scripts/oe-find-native-sysroot: fix a incomplete regexp
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
X-List-Received-Date: Tue, 27 Jun 2017 10:38:56 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A "=" is missing in the regexp, which leads it match multiple results
if STAGING_DIR_NATIVE has overrides, for instance:
...
STAGING_DIR_NATIVE="xxxx"
STAGING_DIR_NATIVE_qemux86="yyyy"
...

it will match both of them without "=".

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/oe-find-native-sysroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 235a67c..350ea21 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -50,7 +50,7 @@ BITBAKE_E=""
 set_oe_native_sysroot(){
     echo "Running bitbake -e $1"
     BITBAKE_E="`bitbake -e $1`"
-    OECORE_NATIVE_SYSROOT=`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+    OECORE_NATIVE_SYSROOT=`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIVE= | cut -d '"' -f2`
 
     if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
         # This indicates that there was an error running bitbake -e that
-- 
2.7.4


