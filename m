Return-Path: <matt@madison.systems>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C0E9E601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 17:09:33 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so115137353pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 09:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YJGFJ4A9bteS/RUeFriT9uYB8MVCwD4cjWIlnCmFXwI=;
	b=SPZvOqGJbl0leJ8QDk0TAhdm9ZuEvrttB/EPM+GiLdMo5aBi9DzWvJexvBmR3io4mq
	CelniEEfGPeKUQNfZLsc4Z1/XABuQGwpZlM+QNtDiEBLiIzcJ1YW3VRqxTv/mgcFXK3C
	o7CWJIyS5vODRVF/ZKYxOb+WP7gTgv1CwHObUjdCJR2ois6DIDYRd3WXmUXFN4rOtlJZ
	WzsNt2l10sTmKaWUWvKk/itPPqcPCvuc5MBk1QxDbLjfkw9HEHyQiUMH9v7G2osSjnIY
	A6Tp5K/ctHZgodsMyoNKk9K1ZDtL+Az5WEbQX/jg+E18DEx5EOdy0kxv4Ln0PyqDwDdp
	C3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YJGFJ4A9bteS/RUeFriT9uYB8MVCwD4cjWIlnCmFXwI=;
	b=KivTH+qEBC5+TO78b2C7Q+zVM47lExCCq/4NTymCKeU4TiTyVOk9qQwAfaXHFm36yp
	7r780KPOw9tqAK9j+aRK9gy5/CaIHLQSGmWAwNTEjHbghjICqgM7ZZFaRoogyMos5O/F
	p3noaTBtWX2JdkL4nkGbyDfPeN1HmMYljeIWlotGwuva/afMrTtpbiqAWkff41kdhejG
	MEpGMFi3kDRJSyIxkFVG3AxvJ/uznh6aZVoqT4msQAVc4f2fBzcA66ZD7p92jf692Yay
	uqysBmgS/UvgjkfFFhsoUoxmnQWgL9I/Q9pxj/njyduxibkFxlW+WbMCLYeCsT0gt3L+
	i+tQ==
X-Gm-Message-State: ALoCoQmvWB9bnbI5eQ9VfcPXffoILHIoee1aNrQfeTuKW4zYJ2EVh7X8L106MHPQSWtPUIFWHyIk
X-Received: by 10.66.192.7 with SMTP id hc7mr364422pac.48.1449421774141;
	Sun, 06 Dec 2015 09:09:34 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	h10sm29367381pat.7.2015.12.06.09.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Dec 2015 09:09:33 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 09:09:10 -0800
Message-Id: <1449421751-12670-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Sun, 06 Dec 2015 17:09:33 -0000

I was trying some multilib ARM builds and ran into an issue.  For
armv7ahf-neon-vfpv4, PACKAGE_EXTRA_ARCHS is coded as "armv7ahf-vfp-neon-vfpv4",
but the ARMPKGSFX_FPU suffix was getting constructed as "-vfp-vfpv4-neon", resulting
in 32-bit packages not getting found due to the name mismatch.

The following patch fixes this by changing ARMPKGSFX_FPU.  I'm not sure if it
would be more correct to change the PACKAGE_EXTRA_ARCHS settings, but the
'neon-vfpv4' more closely aligns to the tune names, so I took this route.

Matt Madison (1):
  feature-arm-neon.inc, feature-arm-vfp.inc: fix vfpv4 suffix ordering

 meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.5.0


