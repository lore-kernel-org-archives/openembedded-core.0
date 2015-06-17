Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC7F60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:04:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HH4h3h006092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:04:43 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 10:04:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 12:04:39 -0500
Message-ID: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] RPM bug fixes...
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
X-List-Received-Date: Wed, 17 Jun 2015 17:04:43 -0000
Content-Type: text/plain

This set fixes a few problems that I recently noticed with RPM5.

The first item is a pure bug fix, the second and third are either bugs or an 
enhancements depending on how you look at it.

To test the first bug, you will need to enable 'lua' in the rpm recipe's
PACKAGECONFIG.  You can then verify behavor by running:

rpm --eval "%{_defaultdocdir} %{lua:print 'after'}"

If 'after' appears BEFORE the defaultdocdir value, then the bug is not fixed.

For the second/third items, if you install the necessary runtime environment
to use rpmbuild, you can attempt to build various spec files that use the
updated variables and verify the usage was correct.  (Not all spec files use
__cc, __cxx, etc.. so you may have to hand craft them.)

Mark Hatle (3):
  rpm: Fix lua 'print' statement capture
  rpm: Rebrand rpm custom macro paths to be distro specific
  rpm: Generate per distribution and multilib macro files

 .../rpm/rpm/rpm-lua-fix-print.patch                | 104 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  87 ++++++++++++++++-
 2 files changed, 188 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch

-- 
1.9.3


