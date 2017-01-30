Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id F0A377321C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:50:25 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 3so40560800pgj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=ye26UaP76rI13XZkszkWMztPyYa6+0lcGrmtwj5GGkU=;
	b=CCqExTJT+WLKbFgkmNp+zn9seyrxpAXBsrYY4FlSg3R+d0jbXjWDH55Xt9KlYGT87M
	4LesB1Mh+FKcxnmrBW6YGxLP0KAl1dB1ENPsDjf+WJXJoVZC4qPlpc9Z9ke54SKipoH5
	SYz0Jt3ZPyMYTB93tcRK/kbIZTKboywFui8LUE5ALVlYnZpS0l69x8XhKDrWD8qzPiln
	T1p4QHe2RjS4Ge8yZChFGw2t735HPJrAcKdsU5lbuOyofl+/zzr1gDgp/R1psVH/NL6b
	amiKMDovYYSMI70SJSbmmfhHs3+/7d8W+C1geFscv+nvxVNF5tZr9SuMnUg0sptBSCes
	d7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=ye26UaP76rI13XZkszkWMztPyYa6+0lcGrmtwj5GGkU=;
	b=iqpbHOWV5X8f3MzZ7gupvKebsHBVRZsQ1sj1esQTre22kCDie9biVfFCslolBbe5LC
	s4r/8jpXv7ScZ8bsxkxLquYJ7s9G/AwBHaulsVyuMbAD70ozhbs9fA3BSHG5bstJmuNu
	wQJLspnsQ8qXqLY0ekJK4EBEwtdNhFUmY78TbTTNqx5BR3DZidnG+IS8jX6wXvJ1BO2v
	OdcC1Uhxk/hGrk5+OlrQjMN88DgBPXrOvYU0N31tCAlSVrY9khKolJKIZmkfAP1VNBbF
	ynBcGBC9/euGMpe4sW2P21wUxNHNsQ82/MtK85iodS+iAWoDbf6oaZ7axZj3jmwxbk6m
	PelQ==
X-Gm-Message-State: AIkVDXKsS2wNGviYj3di0q4mznghkInd0ktFdIF7kmKFPd2UETRaF1+Al3gcHdNEvdLh1Q==
X-Received: by 10.99.226.83 with SMTP id y19mr22505938pgj.34.1485762625997;
	Sun, 29 Jan 2017 23:50:25 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	o1sm16778583pgf.25.2017.01.29.23.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:50:25 -0800 (PST)
Date: Mon, 30 Jan 2017 17:50:21 +1000
Message-Id: <20170130075021.1725-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 0/4] Make qemu.inc useful for generic use
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
X-List-Received-Date: Mon, 30 Jan 2017 07:50:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series is intended to make the qemu.inc more generic and useful for
other recipes to use. This is achieved by moving version specific
patches, task steps and ptest support into the qemu_*.bb recipe,
additionally improvements are made to the PACKAGECONFIG options and
changes to the configure step are made to allow for the configuration to
be more complete as well as easier to override/modify.

Nathan Rossi (4):
  qemu: Improve and add PACKAGECONFIG options
  qemu: Consolidate EXTRA_OECONF
  qemu: Convert KVMOPTS to PACKAGECONFIG
  qemu: Move recipe version specific patches and features to recipe

 meta/recipes-devtools/qemu/qemu.inc      | 85 +++++++++++++-------------------
 meta/recipes-devtools/qemu/qemu_2.7.1.bb | 34 ++++++++++++-
 2 files changed, 66 insertions(+), 53 deletions(-)

-- 
2.11.0

