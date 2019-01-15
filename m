Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 55B6C6BF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:02:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t6so2811197wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pgDKf7Ey2EvxzR1mTOPBwyUbYuiM1S9j+qujY8R9xcg=;
	b=bMC4KKWWCyuicXRes/1DUXozda2zhSBVMoPYr9lAtrb6O5ejaAZ2xLaSxjjSOXdHKw
	KiKnRMqc3I6ROJaxFRxj03sgFBgpUKtX3YJ5pSg7SMlRmo4GDKqvEUKqbpBEhKyOJk0w
	4lADNChTHrUnob5VxMyD+tBLlIiJb8h/Pnsfyz42eNWVhEjUBDXNav0QtGOx0JulW6eb
	GIqreWu7/Tm5wwQJFvhbdjv/s+nlJdNI0yHh7XLrCOwBHN1d68bqXiYxRQXjxaY0azfn
	ZMbqqwHP8IPynvkN/97+yrfjSPCsR3FcO2Ol9Aoiuuv0S6e89JcLYRGNzIDyDalu7loE
	EWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pgDKf7Ey2EvxzR1mTOPBwyUbYuiM1S9j+qujY8R9xcg=;
	b=a1s4o6FjKQKwK1yiWtCREQhAjH2bOlFb2ZL9+xVPxy5mDbwarqK6M2TQct+DCGzs4F
	jvhzIY0y6qo9pZLBpOMfyRUbXgo3OeJYmpS+g0ehCJGvK0NiywhNAnu85ymDTpp7Q/Jp
	4fDRu7SPkV4RqI2Gvsr87g1JYnBxENDAKfS390pbJ5oOVXyRG0IP5zFt9HtqAZbDMgDk
	5gOw6VG0ApypdD5RxWBE13LGb4V4qeaNBtfDdcL2GRh3YzQPxdFFDli6be5z4F6novaN
	Vp6wr0Xw/TK4dzL1yc5F1NMdPXcUyWWNNC8/G4iaC5IieeJOrwnPMu5B4+LHMijRF6bq
	jbbw==
X-Gm-Message-State: AJcUukez20EoYH7vaYaxgv8EkT/3LSNSkzcsjJ1JQKQuK32R7JuZuur/
	VH2te/YhTO4u+mhczdwVDeWK4AIss2o=
X-Google-Smtp-Source: ALg8bN67R95pbC1QU+yMIMBx4h01PZsVEE9dhXLEwtsapwQOsTJehJCfSFhpBr6calVV811Ug9zNJQ==
X-Received: by 2002:a5d:6988:: with SMTP id g8mr2939811wru.33.1547557331636;
	Tue, 15 Jan 2019 05:02:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s1sm112793721wro.9.2019.01.15.05.02.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 05:02:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 13:02:03 +0000
Message-Id: <20190115130203.1829-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH][thud] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 15 Jan 2019 13:02:11 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

As was warned by commit 312ee68752fa [kconfig: announce removal of
oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.

So we switch our default mode to olddefconfig.

commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
and keep the old name as an alias] introduced olddefconfig in the 3.10
kernel, we shuffle oldnoconfig to the fallback target.

The fallback mode allows kernels between 3.10 and the currently listed
oldest kernel of 3.2 to continue to configure.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e04d2fe0043..880c5ef1728 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -492,7 +492,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
2.11.0


