Return-Path: <roylee17@currantlabs.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 29C0B60125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 19:20:20 +0000 (UTC)
Received: by padec8 with SMTP id ec8so47697499pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 11:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IrSBCwdH3mzReoW29kW6hRrztqQJgMv8RekSQsEkmM0=;
	b=frOoEjXlSMkZbYYubKYzc/Sx6o7F7mi6V5MPgQhefkewSBOZpruGf/4MXyjj2vi8e2
	SIZc+q2v2dmgwkyRnFMD27+mdI0Kd3OydqTCnsgi0CN5e5TxRISsipnQZCAEXlvBAJ8S
	k27Mi7529itxhBn1WNO858OHxuIGhl1cRQ39gkcL65p6KJJli62hxfUxu2uTdc6Mbk5l
	2nnScfbXhFPGVcoofnyl9aIUOYfmxrV1yvlr8x9jUxjuBmyrQKdxwajI5RnUgLVLKEVu
	gG3NHiE2LPcaOVw1Y2yQ4YVCKk9si7lVDb3jezqGRhHdJEMmaUtYWwaUPB3Z4/ORbBRR
	CyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IrSBCwdH3mzReoW29kW6hRrztqQJgMv8RekSQsEkmM0=;
	b=Ef12MPDkHN1QaQGiKRafNSyYzQ7xhzx8jW3rkErFROMxBfWnge8v/Ra9IgrU4t6F/F
	9Zd0LDHRNZSj7yPvFOUto5yf2eDM5G8JGG4u+Gy0kRgp/IlzrrbL2IXK6b6nzE9C8ohx
	62neKdlEVl0OMLUTusPd6ipjefvuRmY1jXX/nGfoohfzLxyaffSLksqZ5PP3rlwD0qzQ
	arrRfqMrK8jrre6N+ecRGK47Uo5YRjaRvVhbEV+g3lb9DT4GhV6i2e13clu+KJN/8IoO
	Xcgp+RWf9HZPva6v9l6tVeOjqrTwU4ZueJP6uCDRFfulIcmeI5wYoyEn+M4nNSb0eBX9
	IAig==
X-Gm-Message-State: ALoCoQnWO1IAZqp48/ZmDNpoufoJviGxf37FNu1E2GG7bUYfmiNURXFrmE/gOojrq+FfEve1Rlx4
X-Received: by 10.68.213.1 with SMTP id no1mr28871670pbc.77.1446492020509;
	Mon, 02 Nov 2015 11:20:20 -0800 (PST)
Received: from localhost.localdomain (c-73-222-19-194.hsd1.ca.comcast.net.
	[73.222.19.194]) by smtp.gmail.com with ESMTPSA id
	hl2sm25387848pbb.58.2015.11.02.11.20.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 02 Nov 2015 11:20:19 -0800 (PST)
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Nov 2015 19:21:25 +0000
Message-Id: <1446492085-29311-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.2
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] devtool: include do_patch in SRCTREECOVEREDTASKS
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
X-List-Received-Date: Mon, 02 Nov 2015 19:20:24 -0000

The external source of kernel has been patched during the
construction of git repository. Include the do_patch task in the
SRCTREECOVEREDTASKS.

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7b87558..a7747c7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -623,7 +623,7 @@ def modify(args, config, basepath, workspace):
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
 
         if bb.data.inherits_class('kernel', rd):
-            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack"\n')
+            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack do_patch"\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.6.2


