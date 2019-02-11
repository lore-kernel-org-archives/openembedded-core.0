Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 617B178F72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:04:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v26so16528423wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9ovqFRClURPyh0FjX04fsQCbsFKG7yHCcqCBsnfKxXE=;
	b=hEiH3l6dhgVCObtbImE+JkHhelpa/Z77YTXqxVdHNMmBXFGil5jbMEWG0fT0jRJhf0
	AXq3BCMlRQxaqlmRG/m8ax5Ekd4WZScfVLH+kXjIl/+8MzAuN3XVmaGhcNiAK7OmV5s0
	no9UkWx9rGVFcwxuHWbJjUuMySQ4bb9cdcuaSN2i7TjLLQFwdu2Q4gi9eLPhFKEJzsJJ
	FUbNPH6lFgmyg7bhqG2vaQW7b0nulzNMY7N2voQY8q1NI+UesI+uPszBX1VVK5Tf64uN
	WCJ8N7FMEO6/n6/BdCOHaV+tRij+ovujXg2Ve6p0+V7xMZ72l9CYsDNNwlPcS+ZBCf7d
	TFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9ovqFRClURPyh0FjX04fsQCbsFKG7yHCcqCBsnfKxXE=;
	b=tYzXjiFeCiCfCCzeV5E+FrH0J3HKkPn3kBYb1G17DJBrfBZ5JzBGaNK983yJg3pNWe
	IcStQaw930P90enrboClfHFOi8GU5C/myMra9nIN5j3odFQT+JgXWXPPtwSN0DdNYSTF
	QKIAqiLRmZZcUss5vvXxe3TY8tpue3p8McJ3OYn5qb1o4snGF/8X1JPAB7SMRqutWe7H
	NZViiIziS/nIxQ1LoYnXwyfKw99qV8CN3fQbtYXtq6S9mplUjdactWYq7JpRcSLK7YVr
	6JRlboepwApCLgJHdIhXUIZ0APqQp0RV3XhX7srdT7t5F7m7SZUHZ+4HjFrCwjGsFohV
	d17A==
X-Gm-Message-State: AHQUAuaZTj8HQedTq2t6NMmubVaforYoORKtQMaLhREdhyC5QqgEgyoG
	XTSpRisOIz6iVWsLuHs3Tpv84x44OHM=
X-Google-Smtp-Source: AHgI3Ibk829fOoHNmIGs4AYrjGq+34Kp4cyII7O1/mn6ePUvC8D/skqJGhbNFIMNIeR6oI7VDYfKrw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
	z20mr1504660wml.83.1549883072894; 
	Mon, 11 Feb 2019 03:04:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j33sm18215321wre.91.2019.02.11.03.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 03:04:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 11:04:25 +0000
Message-Id: <20190211110425.11105-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190211110425.11105-1-ross.burton@intel.com>
References: <20190211110425.11105-1-ross.burton@intel.com>
Subject: [PATCH 4/4] bitbake: use GCC ar and ranlib wrappers
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
X-List-Received-Date: Mon, 11 Feb 2019 11:04:32 -0000

Instead of calling 'ar' and 'ranlib' directly, set AR=gcc-ar and
RANLIB=gcc-ranlib.  This fixes builds with link-time optimisation where more
arguments would need to be passed to ranlib but gcc-ranlib will do that
automatically.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9452d5ac4fb..21fd93e58d2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -515,9 +515,9 @@ export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
 export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
-export AR = "${HOST_PREFIX}ar"
+export AR = "${HOST_PREFIX}gcc-ar"
 export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-export RANLIB = "${HOST_PREFIX}ranlib"
+export RANLIB = "${HOST_PREFIX}gcc-ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
-- 
2.11.0


