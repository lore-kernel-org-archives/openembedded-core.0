Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id E46AF74E4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 01:41:46 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id m22-v6so25495336otf.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vl1zZCwutG3GpAnuxVsGGQmNPMr4OVzFefRv+r7j/XI=;
	b=MYDclFT0GboFHLTbR7bhCSCahjXa2OXmlHWNGgNdcJnbE/K9WHanHhIWPBrX9p4iKN
	Kk3OxImnA5aTN2d5AaVq23JzpLOP8qKrtWWS+n2dxZjVbxEyGP7zR7y83lF+vMbncj6n
	6ydZlK5Lj1lOL23OY5xtQe7rHf3ViHEK6hzaDXYerD1IWXtMQipX9Jm32Kkz1T35YN06
	eMrn5BibTuwkA8Hzp49NeC1ql37W+QkxddV/fT8++hIKsyfvc+UCYcxTm4RGoLI2Etas
	aYqRokoDeB0FHiJ9swb09i++uXPkQTeRQVN9NVJqKyRC0l2v1q8ET1BY2SMW9/IyL/rG
	444g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vl1zZCwutG3GpAnuxVsGGQmNPMr4OVzFefRv+r7j/XI=;
	b=BK9okz65SOOFjNRjwsm/MeP2ELAZxqYdEen/dUO0Sc88qTh9/J5qV3UtZT+D0016mI
	p8qonMUP6jTfaOqUYg2UTiTz7iouQ+hGyWSbH2PU0TUx8cggpA52sxpDT55uSta9A7W4
	RifvmUEw3pUmNZxylhWhV+j6p/Sy+FpWtebZ+glPPnkEWzHqRNOtVB5JepyBBN1KvzN0
	Z9D2a6PH0/9LrcbZEVQliEAS7uCxA0Vg2Pzf1qxH3OMDqDCHlaMgHSQVWnQtpioELsfC
	OVoZ2vWCMqWlzXfZUlsKsh9LZ7WOfsbKq3LJEA41fHmMh0FzHevN/fcbzQPi5Ib/a9q/
	JfEQ==
X-Gm-Message-State: ALQs6tBEk7QjasdoHlLa8sJSRfVoNNMt7ctVPtw2cfWJ0J/D55rMh2IU
	crzgYEPgBhWtsbtsvLy2j6wXLw==
X-Google-Smtp-Source: AIpwx4+ZQGU0rfpA0GeHVYDk8YtzLJb+/T68ml41bbL4h4ITNLjSWNcA8Z1RPicH4YUGkfhoSaJCug==
X-Received: by 2002:a9d:5ccb:: with SMTP id
	r11-v6mr6927548oti.356.1522892507305; 
	Wed, 04 Apr 2018 18:41:47 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	j23-v6sm3883754oiy.22.2018.04.04.18.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Apr 2018 18:41:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:41:40 -0700
Message-Id: <1522892500-25670-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Thu, 05 Apr 2018 01:41:47 -0000

From: Juro Bystricky <juro.bystricky@intel.com>

When a non-existing MACHINE is specified, sanity check issues
the following message:

    Please set a valid MACHINE in your local.conf or environment

However, MACHINE can also be set in multiconfig .conf file(s).
Hence we may have several different MACHINE settings within one
(multiconfig) build, so the present error message is fairly
ambiguous.

This patch remedies this by explicitly naming the offending MACHINE and
by amending the list of places where this erroneous MACHINE definition
could have originated.

    MACHINE=xyz is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.

[YOCTO#10810]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7cb408dd784178197687a2129e936620bf6a0d3)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a11b581..68fd440 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -816,7 +816,7 @@ def check_sanity_everybuild(status, d):
     machinevalid = True
     if d.getVar('MACHINE', True):
         if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
-            status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
+            status.addresult('MACHINE=%s is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.\n' % (d.getVar('MACHINE', True)))
             machinevalid = False
         else:
             status.addresult(check_sanity_validmachine(d))
-- 
1.9.1


