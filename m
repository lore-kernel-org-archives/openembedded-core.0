Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02B5A6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 04:59:02 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so2138902pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 20:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YBUZ3OIAMBZ25lkb63YQAXq6tw86BBGy6kC2h107F5c=;
	b=j9xIHT1Er2Tn9vWHxtxFMuFejAEX9Q00EfUpZuu6vrUwftIcaSBxqE9B8CmbSfdoVy
	YMZmb9POlviIsZddyggHS4fnrdI1i1/aeRac/o341LHkd5iAKBQltcVXdIN2AwHHUYhl
	yj2Jico70kPvt9i3yok4BpKkIn20EgtvdiH/Q4CbIQF3ab2qB4lAk8+RvgoCXvTtQy0b
	2OVSnqlBPhbgEFu1Y2KkS1+rYJ0ELA5xVt1zpnPc90fb+9Up2JRXWeD/jMwq1tJWuvmZ
	7NdpVYPc2WWII1EXZvCX65XLCLv8Hni5hJGIKc/kyMWM/jmHXX2orXU++BWLdhC/SMhj
	8EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YBUZ3OIAMBZ25lkb63YQAXq6tw86BBGy6kC2h107F5c=;
	b=UpCENLpUv6pa0XhxYe1aGMWv6fKLZ8EK21MAu+GnPql5lLbZ9dZmH6xSP3YS8bP7x+
	niSmIK+vTKYwN76o6f/lH48HoyKJ2penF1n7fXQ27zzVVfp4vccECT0Y3LqKpMYvbpAl
	BoLhpaDbjCThe/aMn8n/p0Uzr0lFpDaLXt8QoN2gThyzb9ErhqSu0HMeqDLUPHH4PNVg
	NO/hwNtqV8vB+SGiagiq+9AOzMye6pKcGfKomAlIasfP/WrhmTTeVJD8JcZDXUjRUDiZ
	OhlkAZhGZQSi/sSp4TQ9Hc/AeSIo+89yJU/hg6G5HTyWMK+4z0wkFhG2vQEpTX9XTzsJ
	b8vA==
X-Gm-Message-State: AMke39l+PBcMkMG2aRS+xB3xah4D+6EjB4oGnZ3RxT4c0RLFAcG5eS9zrpMaqMVkNwxXgw==
X-Received: by 10.99.112.6 with SMTP id l6mr8240163pgc.33.1486702743183;
	Thu, 09 Feb 2017 20:59:03 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id n73sm1101312pfa.9.2017.02.09.20.59.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 20:59:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 20:58:53 -0800
Message-Id: <20170210045853.9043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] qemu: Inherit pythonnative
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
X-List-Received-Date: Fri, 10 Feb 2017 04:59:03 -0000

On buildhosts where default python has switched to using python3
qemu-native fails configure like this

| ERROR: Cannot use 'python', Python 2.6 or later is required.
|        Note that Python 3 or later is not yet supported.
|        Use --python=/path/to/python to specify a supported Python.
|

inheriting pythonnative makes sure that a usable python2 is always
available.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef5d75c450..50f53f0de1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,7 +6,7 @@ RDEPENDS_${PN}_class-target += "bash"
 RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest pythonnative
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
-- 
2.11.1


