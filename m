Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA5865CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 13:27:27 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 190so161839619iow.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/1b8mmNLoPnVgn0/ii/ePKekCQgwIyp/4PwCVDAUXp0=;
	b=ScNBgGDXSFq4EDUCXyJrpEhDLqaBToKB/syiqMu14wnR4gKbU4bo05iYY5brJpx7dN
	dyP7uel29KeQkFeKx1vM6jyNHQuABOxmcLvG1KhPj5Yh72sYVQQ5Lfmp+MjUj4isq+dl
	dUd0GepmVLfjimUg9YeQHwDXmpk/2HjZSDcpc+qao9gjy1x7hHHonYX9/9iTMIzKMqcE
	9vED2WXQgrmAFpsj4yXRrwBvg7PO/jXJqV3YEzS4OGrl2lf+QRmLRAB5gVZZjU/ZXLym
	IXfEVEu+8wDyLHAfrqPxZhZSHhhfNrlERVlT+5qE+ecAVBXGfjSiGZq1e/Pfus3Xyf6I
	1w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/1b8mmNLoPnVgn0/ii/ePKekCQgwIyp/4PwCVDAUXp0=;
	b=CLvB/uxA9KImTFkzQdjit0jl+hwYqzytBJ6YgQLd0JbBOEZQpxrxHKDI3fPJosCj/D
	Ce3ITEepl5uM3akQn7NEQqgBhuqWknNeUJA/KZZBYVb7edYsZeq9rB7bKjaLnhWajzz+
	mgmwV24EmKWO7/r/oMz82l2zNYP4AsJ1cRiJmbaebUMroIxgfHTqC4+XSyU/wewqq2bf
	OYlWMx7Z5RQYLyZD8PuWaHbcfu/6JBqhG3cWPnsDXf+2VINnZl47cC9Ghxg4q8Oh34P9
	pDo6gP1xJiANNXz//IEsnPEGcV8NydKvKXYq98bbLOhXs8TxBOmFDvbkyNYwcVaiSifM
	1wHg==
X-Gm-Message-State: AOPr4FU1XY1NVlkoSBpb5g15TJhp942p9fFLVHFpZSCJwHLG0xh4WFXkEE1gyxl8+c/ZTBtb
X-Received: by 10.107.130.160 with SMTP id m32mr44414850ioi.137.1462195647734; 
	Mon, 02 May 2016 06:27:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DB4C.dip0.t-ipconnect.de.
	[93.232.219.76])
	by smtp.gmail.com with ESMTPSA id au6sm9294874igc.0.2016.05.02.06.27.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 06:27:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:27:20 +0200
Message-Id: <cover.1462195334.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] combo-layer import with history
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
X-List-Received-Date: Mon, 02 May 2016 13:27:30 -0000

In Ostro OS we recently struggled with importing repositories that had
non-linear histories and duplicated patches; traditional "combo-layer
update" fails to import those because it cannot flatten the upstream
changes into a linear set of patches.

This enhanced combo-layer can deal with that by completely
re-implementing the update action such that it copies file trees
around instead of patches.

This adds basically another code path. It could also be maintained
separately, but as it might also be of interest to others, adding this
to OE-core is probably better, even though it makes the code more
complicated.

Probably some serious refactoring is due at some point, but that
should better be done only after defining some good test cases.

The following changes since commit 1a0e56630c5c27d8899dd0979ae0b86bbe227881:

  utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:58 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core combo-layer-update-history
  https://github.com/pohly/openembedded-core/tree/combo-layer-update-history

Patrick Ohly (3):
  combo-layer: dummy "update with history"
  combo-layer: runcmd() enhancements
  combo-layer: implement "update with history"

 scripts/combo-layer | 475 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 449 insertions(+), 26 deletions(-)

-- 
2.1.4


