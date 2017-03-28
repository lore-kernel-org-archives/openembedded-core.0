Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 89DA477A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 08:02:26 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id y18so9943357itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=844cH/oO7e77faPNCUdxyQdrdK7JBtKcDtC72PcvHcc=;
	b=Mdem6J+95YTOp/h1XgKphkAVzmTK4asMN2Dj3PLqeRi2NU28hZYD7u02Z2yxD/8Tbl
	OKWMNoipFY/mFn8Cu32iZbaIpxx/XtQrmXpqGLBmO0AmTCuvnG7ZeJlQZ5uyqFqa/jvD
	q9h5AolfovejGEOh7fEwaZ/I2dTsC/t+rgEdQux/wDEJnEyE7ff3CJuJ12Mv1jPdt47P
	+wdJ93WENW/RJnwhNOUBMajrm5Iz7x+Z+Y3t9n0Z1YFJtEU5CLmuldcDDYKNUTI4hxii
	+4wnxadN63D9OyrO6Yp/p7LbAldojOP8plP+O816LeddWUIE+dF287LIWdFeKpF4lax+
	WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=844cH/oO7e77faPNCUdxyQdrdK7JBtKcDtC72PcvHcc=;
	b=HrTvN5d+GgwA21zg8AW6VOzx4eatkOPtvsAW39NehxQSmfeMNm+tK6fvJFHWFVAmPw
	xHNgNL1YvKk/neIGe+VG19oXCBhfxhPMOJTK/iXAE04UvLFk2mFe01pCeIpHCBcJfkgh
	lfn0vSHrCETMeAyeLhr9DzUMpfZ9deb5smkSwGt13mJWfhJSvtm2ELbewJ3xbUPIvdws
	4PAA8zDrYLFTeQZp4ay3u2AhG2fpDT3cPu9ElRVjREZIun6iwgeQ671rTh4fAf57ZEvU
	VlDIb3c6XWpTEIz2gp6oPurWgW/CSF6apZjB9uteUC3E9N9lXFCxlZHZn0WVAQGDa1Z/
	fJ7w==
X-Gm-Message-State: AFeK/H1yBnc9WXpBTTJink1H/n4+AARWC+E+ldyG8pBCGNid4NDDBgu+yYVBdXccIMu4MkzB
X-Received: by 10.107.134.36 with SMTP id i36mr29837419iod.192.1490688147320; 
	Tue, 28 Mar 2017 01:02:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2BA.dip0.t-ipconnect.de.
	[93.232.210.186]) by smtp.gmail.com with ESMTPSA id
	k186sm1137867ita.30.2017.03.28.01.02.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 01:02:26 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 10:02:16 +0200
Message-Id: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v5 0/3] oeqa: more control over qemu
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
X-List-Received-Date: Tue, 28 Mar 2017 08:02:27 -0000

I'm currently working on testing an installer image. During that test
I need to:
- boot with two drives attached to the virtual machine (installer image
  and internal disk)
- install to internal disk
- reboot with just the internal disk

There were several problems doing that:
- attaching second disk via qemuparams was not possible
- run_serial() timed out too early during the long-running install command
- writes to the internal disks were discarded
- booting with only the non-standard internal disk instead of the
  recipe's image was not possible

V2: rebased on top of master-next + Robert's "runqemu: add selftest" series,
    no other changes (merge V1 if not taking Robert's patches first)
V3: rebased on top of current master
V4: QemuTinyRunner.start() also needs to accept the new "discard_writes" parameter
V5: discard_writes must not be passed to launch()

Patrick Ohly (3):
  oeqa: allow extending qemuparams="..."
  oeqa: allow customizing image used by runqemu()
  oeqa: allow persistent image writes in runqemu()

 meta/lib/oeqa/targetcontrol.py        | 4 ++--
 meta/lib/oeqa/utils/commands.py       | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py     | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

base-commit: b2a785f19fe25d244179b8672c846925da6d455a
-- 
git-series 0.9.1

