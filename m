Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web11.14454.1605132914271611682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 14:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=fe/mXj0e;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=vrzPBWzAuTjznc4PbWBlFLKlc6jTm5TpTLDLxAesSNE=;
	b=fe/mXj0ea+1aslNxelOOMwNrNHEUkR58EjEU2hUHPJEIVbxsO91heb49MolSWchxApZ+vIKAl5VLW
	 yY8+o0d2v0HnKiS4EMAtn6xcz3m0i5xZ95RUKpWCVJXMSxWAcJMIulxEFqT0lERW0nRUPIGfqu/rfF
	 EZxleMVFJrtY9zcXU6cU1ArGvLIt+c2qig0w9vuAi2nbtRefXO2nluqHYJBpf6D6i90EZlj2DEvtXX
	 dMRfEwWZi3GA30Jmnc+LlWn2oJg9kM1UsZSHhW8EG5cfQFrpgq3iRMGMs+ZIb/Oh8SpZ0SHRV+TYMo
	 4hZ+MYLijMU3DN6scvGxL+qa7ZrRhhw==
X-HalOne-Cookie: 36fd2ac187302085bafbc63601a33d9411eed482
X-HalOne-ID: 5c160fac-246b-11eb-bb81-d0431ea8bb10
Received: from localhost.localdomain (c188-151-59-206.bredband.comhem.se [188.151.59.206])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 5c160fac-246b-11eb-bb81-d0431ea8bb10;
	Wed, 11 Nov 2020 22:15:12 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 0/2] Make rt-tests buildable for all architectures
Date: Wed, 11 Nov 2020 23:15:01 +0100
Message-Id: <20201111221503.2194455-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As rt-tests has added frc() to oslat and frc() function is not present
on all architectures the rt-tests recipe was recently updated in commit
44010756b0ae91e0ac7715b7840285d59f991141 to avoid those.
rt-tests repo has a commit that makes another workaround for the issue.
With that commit the build always work but oslat fails in run-time if frc() is missing.
This commit series will backport that patch from rt-tets and revert oe-core
commit to allow builds for all architectures again.

Peter Bergin (2):
  rt-tests: backport patch that enable build for all archs
  Revert "rt-tests: Enable only for x86/ppc64 architectures"

 meta/recipes-rt/images/core-image-rt-sdk.bb   |  8 +--
 ...-Allow-build-for-not-supported-archs.patch | 52 +++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_1.9.bb      |  2 +-
 3 files changed, 54 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-oslat-Allow-build-for-not-supported-archs.patch

-- 
2.25.1

