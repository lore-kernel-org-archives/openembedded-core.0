Return-Path: <kergoth@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 110296D6F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:36:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i16so7168126wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ozZCH+9TZAYSV7UuARTeGmRwREc7ArKNCYqUVvESwf8=;
	b=M+q5B+dOh4n2OIl8Sh0rfJd1VoARCNkibPMFDrYr+DkFk3y7cKhLBZIoDnxYhNKmcX
	WrtJ/CU3WjI0R6GRKMpsgIzC6zXOnnGsZfA1raffeZ6cmJ1fknXipHd+MUNZ8jx6R3/Y
	a5G32lzwT6x/JRgavilmmAzlEnttFNMs2X1L2Ojyxmi1xYcQ74QSDGog1VXF06Xzxp/q
	iqwLLuQ1KLg/ANa1WFQcjq5ikT4k3T9BriCvmnPp1Y+p8owJS/uUKAtRH8+NUQGyj+MK
	k22EUv0PjOVmYl3BZ4IX4bDsDHnjgTQXoF3Z5G/t6uAeWpNjgRld5+x7vfcSVQA4sBR9
	uLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ozZCH+9TZAYSV7UuARTeGmRwREc7ArKNCYqUVvESwf8=;
	b=r8olCEXYvgVMoQcFkMDGmi6bbIKT+hgRzKaU/7tgUHvh5Fv6k+VJLvJEjPH80jUyjX
	B31+cnioC56r8Rk/zpvhC5ERJdEF93UkFAHRFkOHYT3XbTnj/B0pLhK6f3Sgs37U8UdD
	KFgxkVM49y3t27W0aXFBad4FSuvszwFz6TbA4x2YkPm33COilDZwnq2I69NnMIGt+DJn
	KKqMYOZf+izIKjNAqgtt34XaKK9kdL5Qmgkdsk8qbqHlmLzdPZVhTy3WnFbovvUkCOFm
	/qAIhSuJKHmRw3/oWdQTrMoeZKYZYJnOVW0ZIfxCgSEu/jh/BBNXA+qGMf8lEbtpb1Lp
	bgOw==
X-Gm-Message-State: APjAAAWlIMckdRUMcQJiL4+YDeWDvKADhqUmn/WiUXNOUmHqaNMfJUnA
	7++/tMAq9rjiT2PMZJNDjfeHzquC
X-Google-Smtp-Source: APXvYqx7Ek10PbP7LhM0BuRlzRMEY6XcXciyltFh6IYJo6sM6l2Rs1WFsz3TjBLRU01jp/aKVBSc7g==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr13790203wrk.65.1551735375315; 
	Mon, 04 Mar 2019 13:36:15 -0800 (PST)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34]) by smtp.gmail.com with ESMTPSA id
	z129sm9774414wmc.33.2019.03.04.13.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:36:13 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:36:07 +0000
Message-Id: <cover.1551735224.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] Improve logger setup in devtool/recipetool/scriptutils
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
X-List-Received-Date: Mon, 04 Mar 2019 21:36:15 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

This improves logger setup in devtool and recipetool to send ERRORs to stderr,
the way bitbake itself does, and also sends WARNINGs there, as those are
essentially out of band as well. This makes it easier to script with devtool
and recipetool, as any *real* subcommand output can be more easily captured
without having to manually filter out the cruft.

The following changes since commit b11725db2d5549dc45d8ae36fbf94a5c8e342d69:

  xserver-xorg: Fix build errors with clang (2019-03-04 14:26:41 +0000)

are available in the Git repository at:

  git@github.com:kergoth/openembedded-core scriptutils-log-improvements

for you to fetch changes up to c4f37568236d2e3d8c40d57399d0b275ad5b7c8b:

  oe.scriptutils: also send WARNING to stderr (2019-03-04 21:31:00 +0000)

----------------------------------------------------------------
Christopher Larson (4):
      oe.scriptutils: enable color in a more flexible way
      oe.scriptutils: add logger_setup_filters
      recipetool, devtool: set up the logging filters
      oe.scriptutils: also send WARNING to stderr

 scripts/devtool            |  2 ++
 scripts/lib/scriptutils.py | 30 ++++++++++++++++++++++++------
 scripts/recipetool         |  2 ++
 3 files changed, 28 insertions(+), 6 deletions(-)

-- 
2.20.1


