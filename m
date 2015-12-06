Return-Path: <matt@madison.systems>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED9B601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 17:25:35 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so112330074pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5ZLUiT/IBNJ+XJrllMQH6Pw9zcwSZ0F6GCASIJaH/u0=;
	b=ZLB7+RJIXXGuMuWJcgw3doiZe+V4BV0MF0142IZ7mvJL/GR5Wq/wl7H39BfgMjk7CI
	Qc8I6KpnY5ATsZ36YCt6wIpYe4SbDXwhbXiUHohwqcvukRwojOHmiykrModzUfCk+uNb
	PTg/uMH1ncGJ0mvQXU7lG8KeuauE4/6cbZqSYh0lAoxQEw2DXJx4CixoFlFCiXHMunee
	UnQ4ta7f5QP7Q/YDxid/gonLh55eVuFjChWZFP6dPpYiXDZFX/MTkDwlIu7siqPIM7XE
	AaAmGPewwrx21xjFlOO++VICCknefndSZxdP+4N5pd952aVanMhPhwpP2mLK4+SERqqt
	JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5ZLUiT/IBNJ+XJrllMQH6Pw9zcwSZ0F6GCASIJaH/u0=;
	b=kJgIV+/p2DdWTAsiOttNu75Wdaw6kwvifu7bHpMDF9RZS59qRnNy4HYipaRGeGzCU/
	FlySPulCVvxX+wPfy+vs7UdwR/lnTQs4VBl/o4qBmLcs7IEIBPrVZDU1k6eB1hFKR9BI
	Zxwn1EO2fHxrGPCMCHXRBzS6uFAdABuYpxzmzWESui7w1vTWNujbHd6m8MdRo8vPq0qb
	ES6TaSrI9QKyOmykol0w2yEZ7sC7ANRh1um2+dkGzTBU8B2onf/Zf/u+ShvWGZ3dUpdC
	eNf4+5gVpJuPPiBN8wpEp0SizG8aEgcUcai5JLEn77IBtWt2Kz6BN7ZneZ0C9LG0C4iQ
	Rpow==
X-Gm-Message-State: ALoCoQksp7jFpoxGcphQQ4/F21ZVHfmGrNTEhY4QUJZO1i7/IscO/RVUgWG4h8+p4xRT8e8wrbkl
X-Received: by 10.66.65.234 with SMTP id a10mr37300143pat.129.1449422736706;
	Sun, 06 Dec 2015 09:25:36 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	134sm29280465pfa.30.2015.12.06.09.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Dec 2015 09:25:35 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 09:25:30 -0800
Message-Id: <1449422732-12975-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] Debian multilib packaging fixes
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
X-List-Received-Date: Sun, 06 Dec 2015 17:25:36 -0000

I ran into sevearl issues while trying to build an ARM multilib rootfs
using Debian packaging.  After several go-rounds, it looked like the
cleanest solution was to tweak how DPKG_ARCH gets constructed and
to have the DpkgPM class in oe/package_manager.py use that variable
to locate multilib variants (similar to RpmPM).  I also took the
liberty of expanding the Debian architecture mappings so the names
align better with what's documented on the Debian wiki, for those
cases where a direct mapping is possible.

Matt Madison (2):
  package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
    function
  package_manager.py: fixes for multilib deb packaging builds

 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++----------
 meta/lib/oe/package_manager.py      | 17 +++++++++++------
 3 files changed, 37 insertions(+), 17 deletions(-)

-- 
2.5.0


