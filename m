Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 08B93601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 08:15:15 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l132so194083573wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7qMKQaYohEvNP15ZPS+9lBZlt8LoBALJlJoRXj/q1ug=;
	b=Lb77EsmUSFxW11mdUUHBcDCEkjEZkTgJJNlwnLz9LFAnJ9Ijh2Gpx/WsTFoj4mq85H
	3k3B43rYjI0eqEPZjULoJLyVwwsawEJLLQvv+UMBP4i2LfgYd7HHRgLxE9IRKxPTTAdQ
	9nD07Wg7eP8oXMSg05JePtsBR0VUW4UKwBIW2oh4/+aP/WJauuPUC1nNEMyongIpqWUQ
	kelWPDhXj9z9qXy1uMck4usM/nTDntsxH93Kp9MeEtXSXxB8Jk06Yhdl+K3Us/Tgum3i
	LVYZsK6IpvMkALC6wAzr3sae+ZLCZRgM66spI/oyDHvpO4OYBcfNI+lnwoepC5J7scna
	fsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7qMKQaYohEvNP15ZPS+9lBZlt8LoBALJlJoRXj/q1ug=;
	b=cO3n+QvuBwwh4uIbfe2tSmJbA9DLsMER96Zl701nRJAyRGn+CRbtV6IQSagtsZjhnE
	gMlsfgpqqcZh3iG11fvJtC4KsAEFS5KJgWb8t8Lk5SV2n7uPcpYilJBkrdOs6E3Vbp96
	3gG2J1Bh8EjmxscsdjooBWYcufZXVNxb/ZGw1asCuE+PpCYo07uiotlBa9mgOX+h8iRP
	TkplEusJSVBzq7xjahRE/DMFccfDT53w1ZkKBzazHTXquaeN2M4Or3dtZe9ut4ndffxZ
	Y+Rmf3QqjdM1C7KP0amL4fnYDud5nLpqFHKYD4RYd7Bi8G4xjmvZsCfeN2zGkJ26/hVY
	Dtsg==
X-Gm-Message-State: AE9vXwORVZmfjfPMBfiVwgmjdC/eN0NnX+m9mNlPQ5TTNRbRD+hCYNl90mI875+MzoM/txbT
X-Received: by 10.194.94.138 with SMTP id dc10mr28061879wjb.40.1474359316352; 
	Tue, 20 Sep 2016 01:15:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lj2sm26994128wjc.38.2016.09.20.01.15.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Sep 2016 01:15:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2016 09:15:13 +0100
Message-Id: <1474359313-2640-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest/lic-checksum: don't report the expected failure to errors.yp
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
X-List-Received-Date: Tue, 20 Sep 2016 08:15:17 -0000

This test has a bitbake invocation that is expected to fail, so inhibit
report-error running.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/lic-checksum.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index df44c97..2e81373 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -29,6 +29,7 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
         with open(lic_path, "w") as f:
             f.write("data")
 
+        self.write_config("INHERIT_remove = \"report-error\"")
         result = bitbake(bitbake_cmd, ignore_status=True)
         if error_msg not in result.output:
             raise AssertionError(result.output)
-- 
2.8.1


