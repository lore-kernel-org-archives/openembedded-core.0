Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E65F61FE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:02:22 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so216749wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kDWZfBmMEkEWJki2bE4rZiGt68Tws9S36JcThaEUSlE=;
	b=IJzyQfXWvilQFQ1xlJvJuP8OZpxbe0wcaVjjsD/y7e/MdfIotIJMkf9MPZqOUlfDS+
	KpGv5iKseAnxAzkEbdluZHSNnv4vOazo22qWl2w3BMai7SvI+RhpgCERlTd2ETeAzes2
	zgqP1ldqwr7++GMP9LI33lxHwk+X4J0aYQAWiOQJIDU1I2nGluRBvjewV/25M0X+AfkN
	Rl9YFaeDH+1B4Gvynsck8+dVrgc19RChkCgo7Q1GsP9h6LZkcqmk/7Z7IslQNkaDMMdi
	3mkl4uIW2HaPr2o91HZR7qUBEVD9n3Z1orN0fUkJdd9gNbpgS3GB++/BwMywsZe869Kf
	J+Fw==
X-Gm-Message-State: ALoCoQnLET4ZSkAANTU/fWJIQ5dPT7A3gcAA1//tbz4QmqSqpRWRMqzVfGyH2hgUier+6HqPJXRf
X-Received: by 10.180.36.51 with SMTP id n19mr2265912wij.48.1389697343135;
	Tue, 14 Jan 2014 03:02:23 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id x4sm913900wif.0.2014.01.14.03.02.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 03:02:22 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 12:00:46 +0100
Message-Id: <1389697249-4062-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
References: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/5] base bbclass: add support for lz4 compressed archives
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
X-List-Received-Date: Tue, 14 Jan 2014 11:02:23 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2e5217b..81fc305 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -573,6 +573,11 @@ python () {
     elif "osc://" in srcuri:
         d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
+    # *.lz4 should depends on lz4-native for unpacking
+    # Not endswith because of "*.patch.lz4;patch=1". Need bb.fetch.decodeurl in future
+    if '.lz4' in srcuri:
+        d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')
+
     # *.xz should depends on xz-native for unpacking
     # Not endswith because of "*.patch.xz;patch=1". Need bb.fetch.decodeurl in future
     if '.xz' in srcuri:
-- 
1.8.4.2


