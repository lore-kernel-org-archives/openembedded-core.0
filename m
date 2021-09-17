Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.9801.1631866095483741232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 01:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=TX1iSZqi;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-207-026-172.002.207.pools.vodafone-ip.de [2.207.26.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6AB768319C;
	Fri, 17 Sep 2021 10:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1631866092;
	bh=TBwAVspItDQZ6JvMU8KDyZMHYXoFTYwKc0aOIpxzHaA=;
	h=From:To:Cc:Subject:Date:From;
	b=TX1iSZqizYW4UFo/Lf5hFHDaW1N58xHywF1YwJ5BaKL6PO212vrxZ81w2iFcLh+LJ
	 YYdQXOkxFQIEe79QTvwRmwilkWexopOnXDGlZ+QuZS3JYzICy5aeTwpZSoAnUDw6qo
	 RWVFBwii88ZHT+XtkhcWSuQw2er8iqilSiTUx0gSlD4KGsUJsJ0QZlsAFpwlYtLS7x
	 Y24lNHVy4gTaRlm1de9WF1XE0dipFyZbq7kkrMg6w2FtCBibFnNBPkWyy/OcV99GZv
	 drh+2+S9t8fwU6KLcARKHKlKlTqvF2PKVvVWsBoSU5sFJ/gntKgMBAFyDw4ZaxqxfM
	 qhma/4wfBU1Iw==
From: "Claudius Heine" <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alban Bedel <alban.bedel@aerq.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH] rng-tools: add systemd-udev-settle wants to service
Date: Fri, 17 Sep 2021 10:08:04 +0200
Message-Id: <20210917080804.2545478-1-ch@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

rngd needs to start after `systemd-udev-settle` in order for the kernel
modules of the random source hardware to be loaded before it is started.

However, since the `rngd.service` does not require or want
`systemd-udev-settle.service` it might not be scheduled for start and
the `After=3Dsystemd-udev-settle.service` there has no effect.

Adding `Wants=3Dsystemd-udev-settle.service` provides a weak requirement
to it, so that the `rngd` is started after it, if possible.

Signed-off-by: Claudius Heine <ch@denx.de>
---

Hi,

this is a fix, which should probably be backported to the maintained rele=
ases.

regards,
Claudius

 meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta=
/recipes-support/rng-tools/rng-tools/rngd.service
index 0559b97991..568686e80e 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,6 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon
 DefaultDependencies=3Dno
 After=3Dsystemd-udev-settle.service
 Before=3Dsysinit.target shutdown.target
+Wants=3Dsystemd-udev-settle.service
 Conflicts=3Dshutdown.target
=20
 [Service]
--=20
2.33.0

