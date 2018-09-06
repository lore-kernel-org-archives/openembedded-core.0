Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6205C796CE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:07:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so11771165wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=e95ObUkbPXM7cHP70tkvHixFlWnrwtL8dTPAppJ4CRs=;
	b=zt67wnAzBbjj1bA+ZaMtFD/YbdsS9o9hn6ZGAhJWg0e4hkULJtzt/AzCrKETBMIbLS
	6dJN5YNkyw1efdYwrSpfFmSA7013WUKCnqqNk+EmzJX1B9+8mLWWdn8lnB0nb5C9bQJ0
	f/iAo5BJJFdyiTtj48U3d7zvnnEJbUrejaUAZVGVELiZFYv/PDj7RNoMhu6AAAhsxX6t
	BjV/19bYEh9j2KBxviPpqOIPFx/QQxA9S0eY53zh6SJs1SPoCfTxv2wogk+VkaEv8S8N
	g+81WvX5S9rTOdiaOKHJ3Etl6YP1sg5nCgfpdEIkhInSZHRJC6P0P/KcFzo73PGQFm3b
	RtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e95ObUkbPXM7cHP70tkvHixFlWnrwtL8dTPAppJ4CRs=;
	b=rLsQtzhwBmxT3v09LMx6ggR6rgB9hyvD194GJdKsQdDJfW0FEXo2oEmaDeQ+PIYYyy
	OJc6udbxOxofRLAoYd+lNX894sQw+Cm0QA8TNqqImbodRxyuNlWmqTfenPZKKs5RrdUf
	Fcu7YNBsppvVB/zdmBG/nHBViggF7a0XInpuAonitMm9lRBP97C6yHAyn6ayh8OFuROP
	+ZNaTKVCY+ZOZe2Q5bTm04lINy7aT1J5/ooJuRSjIhrH+oxz7vN0SlycttEKmQV0MU0q
	BqJTPX/VIvMX+IOW9cBUavgOAMkqm0hxH6QBUslMpIluwXY0BFJDOLQfr+q5/p+x1ArN
	/rWg==
X-Gm-Message-State: APzg51DkIT1MdK/AFcBAu7noHtlASdsAZbPirDpDu3Eshz0NALV9xy4N
	+II2QzfGuICjm4NN0ewJ5xTtci2sRxQ=
X-Google-Smtp-Source: ANB0VdaqNzPg7ltnJOqPgZjq/0oKMsAOxjJEghC9+DIb9X//+e3+4//HFTAW+2Tl9+Uk6XvMxSgmIg==
X-Received: by 2002:a5d:484f:: with SMTP id
	n15-v6mr2595413wrs.234.1536246450673; 
	Thu, 06 Sep 2018 08:07:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x15-v6sm5632924wrt.53.2018.09.06.08.07.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 08:07:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 16:07:27 +0100
Message-Id: <20180906150727.24915-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: disable LLVM on x86
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
X-List-Received-Date: Thu, 06 Sep 2018 15:07:30 -0000

Whilst turning on the LLVM drivers is a honourable goal, the performance impact
is *huge*.  Instead let specific BSPs turn it on as required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index dd626d9f00c..5afd0db4b7d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -48,9 +48,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
-PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
-PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
-
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-- 
2.11.0


