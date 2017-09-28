Return-Path: <matt@madison.systems>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 173177751C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:35:17 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id p5so1315031pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yVael/mJlrTn0KnagcejUjp5IGOk+XZIHK/8Xvf45EQ=;
	b=iR/TBApq6wwDQy5Uv98HXRjQeTSWcwCgQl/dxaqh++DYI5U7ZXf0SqsGFEnpwmdGcY
	bG4DJIJRsiH5uqupblR74C1JTFyd1yHTdEf+Lu+SYCpd+9DfGw0L6HFpbIr0rPlKiYF+
	RGhLdllK5gpFTvWUNLMTT02poSRPnXkYNLlV6KKecE5m5aCZUyI6wfMtMTbX/0TF6KZ9
	vGGJDb8wzns+V7kpwFX5bS2qfz+pZGhDd7BKh25ZMxA4EKOckpHM9Q+oyo5588EPqIiH
	fJDSIu/pa2u4D4jr+3R67DGTg/Acb2bpcw9kPn3zVlgDlGqjXthdn11FK1iKR2geSLuf
	Op0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yVael/mJlrTn0KnagcejUjp5IGOk+XZIHK/8Xvf45EQ=;
	b=VuBLkfB2sBI5m1/YTBZd/Up92jeYwDS+bfL2nUVHWoPmZRvQrF0q2H+rA9B0V45WP4
	1foE5F8hwPyxiXI7EN1YjxVtKEWYVJL/dgcIhXAWnAwAa1fKtSJMmntjFtmbzim+UaIy
	DnrmLzcCyQH+nZ7Mu9zaFHxSBZPoY38MffeK22BXfH3o4aEck64aobtHs/cyKkRI6VGd
	6O57CrBuurpxfoKU8OCluR+Yo2YnAQVQLxT441NEjWgZcPYlWUq1kfINJk6OrUIpTEJa
	xaAwYFsHI8Ezdm4LGhgeT0FbIppsTqu3TGHRvAiRzeEeKgEneELAFX1y1e7f+Ik42AhP
	Vxeg==
X-Gm-Message-State: AHPjjUi4Nd0146icAYzSXNEMDr11OCOleITwGQ53XSplPijmX/QZxpBW
	nkdEfbVoq3CsdUI0TXzxKtwB2jbvBHU=
X-Google-Smtp-Source: AOwi7QCe56UtNhZv3OGV1rX0HyBSyd7a6GcADWxCLwGsLu06msd6W01BpmzCljVApHvLPSr9qoRQyw==
X-Received: by 10.84.229.7 with SMTP id b7mr4437572plk.75.1506620115411;
	Thu, 28 Sep 2017 10:35:15 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	e133sm3159362pfh.177.2017.09.28.10.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 10:35:14 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Sep 2017 10:34:41 -0700
Message-Id: <1506620082-27597-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/1] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Thu, 28 Sep 2017 17:35:18 -0000

New in V2:

 * Replaced the regex matches for mips with straight
   comparisons -- the only mips TUNE_ARCHs that map
   into Go support are 'mips' and 'mipsel'.

* Removed the anonymous python function, and dropped
  rewriting TUNE_FEATURES altogether.  TUNE_CCARGS_remove
  (which had been used in the past) is used to handle
  the compiler flags conflict with cgo for mips.

* Fixed regexes for the mips64 checks, which I missed
  last time.

Matt Madison (1):
  goarch.bbclass: rework mips architecture checks

 meta/classes/goarch.bbclass | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

-- 
2.7.4


