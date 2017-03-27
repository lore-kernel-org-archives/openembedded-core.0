Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 81F156FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 09:50:45 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e75so14791273itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=UeC3t01jdJNGcx94AD1E+o6rRrdOHZ6bdbaYnn4pEls=;
	b=o2wOwDokBOOr/PUK48oC32Q5/pPjencbb46AgVYiB8DCYfQ3h5deW9r65+Rem/Qu46
	fiWTtzzDGwKLP6pKRWUpSyzhxQ5euvBgZXeTrtMVrGrD7S5VsvcdU+6tkPiwKGpkIO0O
	YtqvH4v1zml7dopsYw4SfiLnXxBIYxtHZE407oPZyimdko3MmvJMevqA44NJQ5+l51LY
	LLcWpvHr1PFAowbUMdXdBXxefOgWWypxVk6E2f20DOXJJoLgeAiiB5NpigEVtm+4gHmv
	wpQ5Pfgah511P/+Nqcg761x3jXDaa6SMrbGkTll/k2LHUj5df5DLVUUWs3GZiiVdBEso
	k8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UeC3t01jdJNGcx94AD1E+o6rRrdOHZ6bdbaYnn4pEls=;
	b=Y9ikvKezq2tN+IxhwhNay8dmAiyntVn91UHwz8U5GBmTt+6VJt1/2/Yf27Lh8o2VLe
	N8TH6LUif8YzJCoIqXw+9kRsWcA9GOlYvmBKAEczv2UozBIQeC4F7ucNzEm32yLf0vIm
	KVMI223zyd+OeI+CYrcgAt6zoAiSVo3qGz0TReXIj8Q5o8HTEjnT3zRD1NqWLyzTT3j4
	+h/Le3Cv0OHAsxG86CkDJZC7L4oZO3WEsGUuWr5DI1xoU6KXft/fA3Si47/D2w67nSAe
	/O0gbk1bArbzaOsLChheuD+37AtWG2nMfNk6fiEX3NXsFSmJtRWqym5mHnmVB5z9+ES1
	DkjA==
X-Gm-Message-State: AFeK/H05xrFgD+BBg5FRy75nG+Glb/CNQvUx+nBlBzskcyd9nWDZrZyIwPn00Hh9lghkgYHS
X-Received: by 10.107.189.68 with SMTP id n65mr19654472iof.154.1490608247033; 
	Mon, 27 Mar 2017 02:50:47 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id q185sm32060itc.22.2017.03.27.02.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 02:50:45 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:50:37 +0200
Message-Id: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v3 0/3] oeqa: more control over qemu
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
X-List-Received-Date: Mon, 27 Mar 2017 09:50:50 -0000

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

Patrick Ohly (3):
  oeqa: allow extending qemuparams="..."
  oeqa: allow customizing image used by runqemu()
  oeqa: allow persistent image writes in runqemu()

 meta/lib/oeqa/targetcontrol.py    | 6 +++---
 meta/lib/oeqa/utils/commands.py   | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 3 files changed, 9 insertions(+), 7 deletions(-)

base-commit: b2a785f19fe25d244179b8672c846925da6d455a
-- 
git-series 0.9.1

