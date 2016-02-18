Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD5D60621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:10:34 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id b67so41643449qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ve/sShti/aXtdqM2jm1OYCOSvv0BPpM676kTD6NfmnQ=;
	b=vOLPrIs0HBU5smxqHEaVygsKkom+Vk+6GqoGK+KjzgjP8TNvkUEtEvYrc0fEEqf+Aa
	rrwGpCx2Qp3a+U9VRXVXP9c3+xLfNawFMYBfbQ/XiAqgrwx2HcmgYf/aVRSqLsoYhTeM
	Id+uPmV8GFY35Zj7sb/kgEldhVw6SO/xZrGdBoFT0n/i/OjAEMyj/J5fIl+jvSgmjASj
	0brgDtThQ06NCa+D5A4LTA5W1X1x3FGcZ19FRAKDtlxLfK3UUJRXxje8xit0n/zDlr77
	/kc90A+kGIzUD4wbHImHdJZE4WwBigTYcNQT8yfA00H9T2iVHtht5adWAb3JkURSC2L2
	EZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ve/sShti/aXtdqM2jm1OYCOSvv0BPpM676kTD6NfmnQ=;
	b=MJ7lseqCckhDaubE335lBo/nPL7lsE6/MJO0N3QGlDHfbg77fTccArgsglcS90rZ+n
	9kI8wcUG0nehNgnu7wcacD8VBKsuGrBsVda7dh2ARE7uX8xX5sAmrc1S9C9Ej76KgKD/
	vPDW48cHGs6t1Kva3uxJpAiLvDLvIch73GVp4gV+P6aZklmsZ9CobsJnUTeRED3zEaB5
	oanh7prkob81PpH68J5D6PCzt7mvb+VZg9hzc8mKg1MfsuEjaQ+5+lXBaNo9Zj23utEa
	wPPiXncDUQWlzdZY18L1GvD8JKDyZT1w1p8NPj/uOOFA5Aw8ktIl/DksjY8KEX8r3GkH
	rjrw==
X-Gm-Message-State: AG10YOTJL+vMHzhoHIqpzp/FrctBCCvlfnQhxaLHgXQGG/oEPumv8NCdGCl1/nsvV0bHPw==
X-Received: by 10.140.159.203 with SMTP id f194mr10920675qhf.18.1455815435396; 
	Thu, 18 Feb 2016 09:10:35 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.127.4.90])
	by smtp.gmail.com with ESMTPSA id r6sm2905374qhr.28.2016.02.18.09.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 09:10:34 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 14:59:09 -0200
Message-Id: <1455814749-8562-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [PATCH] waf.bbclass: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Thu, 18 Feb 2016 17:10:35 -0000

As of commit OE-Core:773c9e18071d71454473dd81aff911104a2e9bc6
EXTRA_OECONF is appended with the option --disable-static on
DISABLE_STATIC variable and this cause the error:

    waf: error: no such option: --disable-static

So, we need to disable this option.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/classes/waf.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index b3b5e94..5e55833 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -1,3 +1,6 @@
+# avoids build breaks when using no-static-libs.inc
+DISABLE_STATIC = ""
+
 def get_waf_parallel_make(d):
     pm = d.getVar('PARALLEL_MAKE', True)
     if pm:
-- 
2.1.4


