Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B0EC660557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 22:42:03 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bt5so33378986pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=v/eKlWDg19U6UogmZRGMHpBoEadzowBrUTch6njNsCc=;
	b=XkPE/l3mxiL3XEssaGQa2lIgllme9lIwJuqygZjVrKU5i139WPzRwSw0UYcyCIqTkQ
	Qu7nG1bY4kt8K3quc69mO+m2/zWJ3mANgYmfNFy7/VFeIHwyVa+y/2mBxkhg/QZ10HUG
	9j/PYybvWDm7Q2Og6kB4qMKwyHgxECcVizBsD8cqBFePIkLsns9rZ8ESyg9Ul0f9GMm8
	cBHAQ30/ndKbM+mcl494jijWCCFE2pxL4yojpH6qPBXO6x80dpEbDkLluJDasKgBpoIh
	1zKzaMV1YOcGM/ndyNXNl2bZNzHBcSfey5SChak+WOdzHlAc8G77xTXrb7ZWGi6zbl3O
	p+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v/eKlWDg19U6UogmZRGMHpBoEadzowBrUTch6njNsCc=;
	b=Uk48SpJTUQGEfvdA/vYr87P5st05bC2z4tYrkjHrrSa6dK38B7nNZGf92/M43/pEPB
	M5V7kIAxXoq492rD3f/U3mvQfFkvcBaB/Z4k7DInWyWsfNn7Vf4SC/vHCTgBPQ+pR6mG
	2kUS8wVWZlcEzaTz690VcQG8PpADfjLquk6jBpvlzXRq70Cxs+Pj8koo90z/5rtHAhpH
	bNLK+GhCf5R1Jim0RCqAIxpuWvdH8R5Wh/9UdhC/35E+rSnwzAYqM1FmyLXPbT1IN4OB
	ObXsbTLCt7i2KnA5MWRZhi6Py7MZUyHsnAV+tZ6aEG4wbelNQaYPQMUTYuRRd87FL85M
	aZwg==
X-Gm-Message-State: AOPr4FVPJqEan+4rJMVtR+b18ZUoyjy85iRpHOl+3Hb6mrO+XNI/S+YZBFufQk5jhxFCoV8Y
X-Received: by 10.66.67.11 with SMTP id j11mr17647287pat.45.1463092923624;
	Thu, 12 May 2016 15:42:03 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	o7sm22219660pfb.76.2016.05.12.15.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 May 2016 15:42:02 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 15:41:50 -0700
Message-Id: <1463092910-12064-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [python3][PATCH] Switch urlparse to urllib.parse
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
X-List-Received-Date: Thu, 12 May 2016 22:42:08 -0000

urlparse is replaced with urllib.parse functionality in python3

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 27e061d..e04a236 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -891,13 +891,13 @@ def check_sanity_everybuild(status, d):
                 continue
 
             if mirror.startswith('file://'):
-                import urlparse
-                check_symlink(urlparse.urlparse(mirror).path, d)
+                import urllib
+                check_symlink(urllib.parse.urlparse(mirror).path, d)
                 # SSTATE_MIRROR ends with a /PATH string
                 if mirror.endswith('/PATH'):
                     # remove /PATH$ from SSTATE_MIRROR to get a working
                     # base directory path
-                    mirror_base = urlparse.urlparse(mirror[:-1*len('/PATH')]).path
+                    mirror_base = urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
                     check_symlink(mirror_base, d)
 
     # Check that TMPDIR hasn't changed location since the last time we were run
-- 
2.6.2


