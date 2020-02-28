Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF420618D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 00:04:25 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y5so694941pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 16:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D0rcUUW16atzygTDOSBk/Dl+VLpiPpex2kyFxkibhsY=;
	b=u/M6MMOcuh/iN1bSdxZff2y/wMScZDygTr0NeA/DOEUINTqcm+afVC/Ne+WDppz/nI
	P30Z0K4eoSzwuEfqHJH2A1YfxNzuX47p4rgM2KwECXdssdEVPhL3V99SfNGcdojvmJRz
	SjFlGJbPsNObBrl3Glyi5rQmllUA8ruEEDQGil6fuoDb1p8sAHuP/BOOfBmqns18lTEj
	yx4/FRyrd2Cse01D/Wq1Nju0Dpn/TglxlXx+qk8WVR6DaFdyyBpwwv5q7e/B1NUgA6b4
	gnKce3ltfRevldRNoSv4/3LPT/g1coxo0TMzIWzFlIbqFjf0Dzugfvj2EPtNRIshta0G
	CpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D0rcUUW16atzygTDOSBk/Dl+VLpiPpex2kyFxkibhsY=;
	b=i58UAX3XXY6RC0FCfN8p+hvtXzZ4ZeBNIDzWeAvJxf8QDkowZwuowheKR4KeNcjk1Y
	iVa0mENi2+yrBBDXCSPKqojA5aeUUdd4jNHH3g7Cp6vsIRWwOwXyd8jSeGgDhc91F0/E
	MAAz3MnXvB9v4WB9l54KLxsDqblUE9ATo/HkzmaUnvjUWka/z01VYdmAn0S9GC8sph77
	m/8Vb0jDZLnJ0/lof/Qyuk7Ulmd4PmWkyTKbA3popPa9sP7EuxsJALb6AUIkW/7QRDan
	GV56q9gOjb/YOhsjLpdixk3PkKLOQkeB4NFbB7sjJP6bF0XLB+c4/LKGjZhXedutc2Gm
	qn7w==
X-Gm-Message-State: APjAAAXH/lLJ8s5Mkk+7e9fnaX7vpttUw6W8pMX+tTdSnYRB/4UjhhEe
	z2xbOnb8DtwDHBW9UTmKBWdVXWIBjLg=
X-Google-Smtp-Source: APXvYqzzO8qtkpmZToSls6dCUCAjt6GuOJ6pRJy1z3gSK971TT7i4ZxPyJSqIbqYcDqmLkF+i+C3kg==
X-Received: by 2002:a63:d441:: with SMTP id i1mr1891016pgj.426.1582848266540; 
	Thu, 27 Feb 2020 16:04:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	200sm8549393pfz.121.2020.02.27.16.04.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 16:04:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 16:04:37 -0800
Message-Id: <20200228000437.1848815-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v2 2/4] systemd: Do not force removing resolved from PACKAGECONFIG
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
X-List-Received-Date: Fri, 28 Feb 2020 00:04:26 -0000
Content-Transfer-Encoding: 8bit

This needs __UAPI_DEF_ETHHDR to be set to 0 which now
taken care by CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix typo in append

 meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 5d863410b8..a56a28a189 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss \
     nss-mymachines \
     nss-resolve \
-    resolved \
     smack \
     sysusers \
     utmp \
 "
 
+CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0"
+
 # Use the upstream systemd serial-getty@.service and rely on
 # systemd-getty-generator instead of using the OE-core specific
 # systemd-serialgetty.bb - not enabled by default.
-- 
2.25.1


