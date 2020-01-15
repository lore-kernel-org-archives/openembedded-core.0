Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8662A6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:08:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d73so971830wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lgZ2dQKLxpDSC9Ory7GjSpEuEXxQE0t0lglqAzyz6O0=;
	b=r9ZE+OvBN+ezqv+hmDXdfq0y3Udy82383A4+c6rYouZCzgx0ZSnK63MXTop6MUS9Pw
	j79EbXdA5pxaowqXpxoDnRltzxt4fJe7uHImcpNKgNP8mX/9Cxwn+DPau1i81Va8P6IV
	WnjI7chOEDDcLT2OVbJZfaBHVU090PcjDsfHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lgZ2dQKLxpDSC9Ory7GjSpEuEXxQE0t0lglqAzyz6O0=;
	b=qJ2OfyK2M4gEOviPhLAueWJ/bjvpGnlE6BBY36BeZWvtnOXBimCSg+gz7aGUDOLKrc
	pFHDLOF59hJj8sLl5OI08ykGkWsyuyd7tvCbfD3odf2U5AHNuGMyhhNmaoMeiZne9NbN
	7XkSoukL7QmvIwgKPTu8jtU3ZSqeEPKoREhnhdwKSHmUqp8RIuFpy3UF5E77+25qSU45
	sFNHGVlPxtqAPK7asMWs1ULn+pQIr2VjnRULAWLajJsn6OajY6a+ZV96NTJHmYE4OroA
	rh67z1nXBVLIJFYiDXB6FLJdOlfYraZFG0b9hrmA6vomhJHk8U3uIF7wpOySVcFx4bdK
	tBXA==
X-Gm-Message-State: APjAAAWHebZI2w8/tPA+ALLtHbKzVSfwDMONoZw0lX/SP7N5MNRkJ37h
	lC7XVuX9FofX1DgEEGseZ/LuId8U56iRBw4h
X-Google-Smtp-Source: APXvYqznhAGain2GrO55td8fM0Uf3f44ayj2Uy0zNxkm9hhfpoCWUZwloO7VpwIFUwScY+yq4vxA8w==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr1272957wma.134.1579111725924; 
	Wed, 15 Jan 2020 10:08:45 -0800 (PST)
Received: from ub1910.Hitronhub.home
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net. [82.4.207.62])
	by smtp.gmail.com with ESMTPSA id
	s10sm25407454wrw.12.2020.01.15.10.08.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 10:08:45 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 18:08:25 +0000
Message-Id: <20200115180828.17399-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Make kernel-yocto bbclass usable without linux-yocto.inc
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
X-List-Received-Date: Wed, 15 Jan 2020 18:08:45 -0000
Content-Transfer-Encoding: 8bit

Patch 1 allows the kernel-yocto bbclass to be inherited directly in a recipe
without needing to use linux-yocto.inc. I can then use kconfig fragments in
my kernel recipe without pulling in the whole of linux-yocto.inc (which
includes some things I don't want like KERNEL_FEATURES changes and the
LINUX_VERSION_EXTENSION default).

Patches 2 & 3 fix some minor issues I spotted while working on this.

I've tested that linux-yocto can still be built for qemux86 after these
changes.

Paul Barker (3):
  kernel-yocto: Move defaults and tasks from linux-yocto.inc into
    bbclass
  kernel-yocto: Drop setting of unused variables in do_kernel_metadata
  kernel-yocto: Only override CONFIG_LOCALVERSION if
    LINUX_VERSION_EXTENSION is set

 meta/classes/kernel-yocto.bbclass         | 34 +++++++++++++++++------
 meta/recipes-kernel/linux/linux-yocto.inc | 21 --------------
 2 files changed, 25 insertions(+), 30 deletions(-)

-- 
2.20.1


