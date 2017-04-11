Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E703477CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:38:57 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id a103so13841533ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nhRhRw5tGkigmhWbB9niun2L4bRJell1f10buTnB4qs=;
	b=SS3G9dp6DP4vUfj2RUCjBgOj5SOSbVWDiZRfuPq3nv17oBsOAWyygGkaIwA14dwItb
	Aqs2nnhvSYCA1MKYtklcoMGfSWYj6457GBsJkkdv4+IgKI/Bvl6+ui+Zy1NPe74lQbpV
	jokw120VkVGlxGyMiRRbz5K17mPkO4656UYfCmThE9hjmFMSXclvA1+YFm1ccUoQIpZq
	lPjuRkbUJmdvxJh4Mr7g1rVlwOf/eG/4Lk21i3xdDZ6hg7VNhK/FC9zZeRkUoJm9hu9c
	cipU0cDkSyXLdqcUoeoa4Uc107qabqv+UMJCDu9+BfonyDJbxeQN4HbsOaCn+NoZvk4+
	vEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nhRhRw5tGkigmhWbB9niun2L4bRJell1f10buTnB4qs=;
	b=m77ecTp6TI6Sw/mKm7wlDSsCy/M/Em2ZzeFo5G/OQNSi2SQT+g4yNzmmbjaAHrTpRP
	DSf1FFrgOcQ+1+U5qL2xeOlVuYrZQVgpRC6FxhCgqzaAqUHTIMBoax5/USsvQXXNA+5s
	PbdrrM8OV5R7rFnpM6BSQ63CWT0kWiIhBeYBv06vZPo+s5jrTfKv8xhuSgGhSIlZuC3E
	eoFqeT0C+6ZoGuwOnabZEi+2HsevcTucZPHxi0TDQbc+d9geifVOA6S4yYRqbz4QlYO+
	SbRNFxT8mNjp7X/Wioh4sMGt6zqaucrm3wdYM0SqXasBQCv0tIMe2Wv5XQ7qmcQkjvGz
	HGhQ==
X-Gm-Message-State: AN3rC/7KsEgpXlgAiww8BIGenvZ16jBHlYU3EoGO88HViWy68fPntsQwHIi3WHnE2oZ4JA7e
X-Received: by 10.107.138.151 with SMTP id c23mr14144415ioj.235.1491935938841; 
	Tue, 11 Apr 2017 11:38:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:38:57 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:37 +0200
Message-Id: <13c39e0231235f3f65f97a1849d8ebfd50d9eabf.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 18:38:58 -0000

gdb-cross used to be specific to the tune flags, but isn't
anymore. Therefore it is enough to use TARGET_SYS instead of
TUNE_PKGARCH to create a unique path.

Fixes a sstate signature difference that was found via
yocto-compat-layer.py's test_machine_signatures check. In practice it
probably showed up as unnecessarily rebuilding gdb-cross when
switching between machines like intel-corei7-64 and qemux86-64.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index a34223e..d92f31f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -24,4 +24,4 @@ BPN = "gdb"
 inherit cross
 inherit gettext
 
-datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+datadir .= "/gdb-${TARGET_SYS}${TARGET_VENDOR}-${TARGET_OS}"
-- 
git-series 0.9.1

