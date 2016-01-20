Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 847806FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:47:56 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x140so15055745oif.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jU3uMIBGaXGkRqs7p6u97cX97Q/jhg89AejOn7ubnQE=;
	b=kwusYplJN7IrzV2EIFlMAAOZ/nDjBTd1YEKB/8CMpSVvQom5Nf5Acw9xEFLm0SRorW
	rQpdtagQJqhpvcF6nGNMxWm3rs4tx+NzZJ2rNNQY33qLp/W9hyJw97BD3ON9d3V0eZ9B
	eTr5a9xU1aDx/R0zfuZpap7aODNzwug++UT8fFqvxFbtsmTuM0LRdwrUkkpHEF2a5b8L
	BL9DsWksWLdDTesrr4FJ80p5T4Kho2XpIY4njcAtIOoMuZ6yLjumD4VpfiggW7UzvWjR
	fIq4V6LnDDF1mk/YapvdlUdr6jRazb6i+h2qjsqs0fO8UfxUo4EdCb6JY1ssa1+TifBz
	QrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jU3uMIBGaXGkRqs7p6u97cX97Q/jhg89AejOn7ubnQE=;
	b=jb4nzqOLfQ8JQZeV2iI5UEW1btFCf/T2SI4esZVBipHaiac+vHUH8pbOE9/jr88COK
	lhJ+8r0cRqo+r1NZKv1uJ0uuPHtin0JtVlSpfaDJbI6j0V1qJzVWxG2W4GRxI0xV4Pzx
	LseuoKFXdG2TFw0QATTr8tpFe2pJ4dgwJxQpPDpzprNzWoXH9arQv3r8EzAuKrIHzNeh
	6tLHIGeKkYBaoQeGsIc2vJSDUQg/dxtmj807gygbyooJ1JjJ0YkcQzhPdPi2KvxusO8H
	hEBiZ/llc5v47uvjilSQV7pcJFRIekeNAN2rq5kpJGuPFQ88zsZtE4BT4OEvVxF9AIJG
	Zp8Q==
X-Gm-Message-State: ALoCoQllx69CkS0j49wg1OSukBe4PKpGNk1MJMbcob7x4KALgj6c0c+WGg6GtlHXbYDHPehiIDL2+4V0SM15B1bqgD3W4Gtq3A==
X-Received: by 10.202.102.102 with SMTP id a99mr25546913oic.113.1453258076814; 
	Tue, 19 Jan 2016 18:47:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	v142sm17042620oie.28.2016.01.19.18.47.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 18:47:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:47:48 -0800
Message-Id: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/3] valgrind cleanup + fix for armv7a without vfp/neon
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
X-List-Received-Date: Wed, 20 Jan 2016 02:47:56 -0000

v2: fix issue with intdiv test if TUNE_CCARGS sets -march instead of -mcpu

Andre McCurdy (3):
  valgrind: let valgrind determine its own optimisation flags
  valgrind: re-enable ARM intdiv and vcvt_fixed_float_VFP tests
  valgrind: avoid neon for targets which don't support it

 ...d-neon-for-targets-which-don-t-support-it.patch | 33 +++++++++++
 .../valgrind/remove-arm-variant-specific.patch     | 66 ----------------------
 ...opriate-march-mcpu-mfpu-for-ARM-test-apps.patch | 44 +++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  | 12 ++--
 4 files changed, 85 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch

-- 
1.9.1


