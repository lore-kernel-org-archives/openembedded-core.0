Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id BDBD377194
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:54:44 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id b35so54666763qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MEauISmg37Mh09Xcz1FLVb6UdQaMVrFeSV+SUQsOdaY=;
	b=1F4p6p1113c7sXIL9zqFzqNkiypN24Ue2Fb+hYpC1U/vvJUa0SzzejquX9IZ3hV+yz
	hOyBhzliefTwj5P6QhZH9gRUxE+98fbhAaCgZ68x9lFAoFPtizCfwHRKIoxqsyQK1BXy
	pvs4q80St1tfXufqe0QcI8GnPf62dNAgECCAsLRRwUBN9o6aiAWGxcv4/XIE/YQxyJoX
	IEAbMCdpHx8yfOSle903JFr8hjjZ8u0Hix87fjwj+aQgOWw3SB/6HydIszeUxR5AI9y5
	mvWc3ktCgEQYOK2gYitnvoan/UOKga/3moqAveff0oMdDwAyxKudpA4tqz0H704T5RZ/
	i6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MEauISmg37Mh09Xcz1FLVb6UdQaMVrFeSV+SUQsOdaY=;
	b=J3xmDZh/T9bhH7Jb48o6u31arfUAybjNrsy4ADr+qjalttWMIyfKxkKjiPzMjtYveb
	4zSXOggtBmCubyMO73BoGMQqybUqgSNO/77NUAr5K+FZvy6bO8Q+ZfdIesd3xneU6/3p
	epJNw3aMTaFrYrgpaVgjfAeVG3YUatPx6f/+q7LCv9akH83d3SpuOVcXXmidjpBUXpzC
	iJ4+hQog+fbmbrSeeRwh1Lm7OGbeE2NbuhN07XvKqKpnliJBLBmwGdoFcDXoiEZ7Afz0
	u/JCicL2Cq1u0zZlHgCHen/cRsT8bC1nCnOvAt6j5C/cgNWHco7FJKLYH37KMT9Iew3p
	yN/g==
X-Gm-Message-State: AG10YOTnzojhyfqHrwrkfNiROIqnY61iF64pM24EaM2rGQnGyUufEY79Gqb2R9uvk8GzIw==
X-Received: by 10.140.96.245 with SMTP id k108mr12907282qge.31.1454626485052; 
	Thu, 04 Feb 2016 14:54:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c107sm4813237qge.45.2016.02.04.14.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:54:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:54:37 +0000
Message-Id: <cover.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH V2 0/6] Fix issues when using security_flags on musl
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
X-List-Received-Date: Thu, 04 Feb 2016 22:54:45 -0000

security_flags enabled builds revealed several issues when building on musl
especially compiling gcc runtime libs we should not use fstack-protector
another change is to replace with -fstack-protector-all with -fstack-protector-strong
which is available since 4.9 and has best of both worlds (stack size usage and security)
gcc on musl/ppc was missing patches as a result images werent booting on qemuppc
that is fixed too. It also revealed some more issues in compiling gcc for musl systems
was not getting all configs right.
Addressed the review comments on nss-myhostname

Changes since v1:
Ignore security flags for non target packages

The following changes since commit 1b2e1eb6f08b6f95cf555d7f6bc6e4de2113aaed:

  libical: Work around hardcoded paths in pkgconfig file (2016-02-04 13:09:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (6):
  nss-myhostname: Fix build on musl
  gcc: Fix build on musl with -fstack-protector
  security_flags: Disable fstack-protector for gcc runtime libs
  security_flags: Replace -fstack-protector-all with
    -fstack-protector-strong
  gcc: Assume libssp and dl_iterate_phdr on musl
  gcc: musl related fixes for unwinding,ppc/secure-plt and gthr

 meta/conf/distro/include/security_flags.inc        | 23 ++++---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  7 +-
 .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch    | 11 ---
 .../0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch    | 28 ++++++++
 .../gcc/gcc-5.3/0048-ssp_nonshared.patch           | 29 ++++++++
 ...-weak-reference-logic-in-gthr.h-for-os-ge.patch | 78 ++++++++++++++++++++++
 ...050-powerpc-pass-secure-plt-to-the-linker.patch | 66 ++++++++++++++++++
 .../gcc-5.3/0051-support-unwinding-on-musl.patch   | 34 ++++++++++
 ...tname-Check-for-nss.h-presense-before-use.patch | 53 +++++++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           |  4 +-
 10 files changed, 311 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-support-unwinding-on-musl.patch
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch

-- 
2.7.0


