Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2327A77047
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:29:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9JFToi6018493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:29:50 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 19 Oct 2015 08:29:50 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 10:29:48 -0500
Message-ID: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Mon, 19 Oct 2015 15:29:51 -0000
Content-Type: text/plain

Without this patch, the wrong header fragments can be used to generate the
nativesdk, cross-canadian, and other variations.  Generally this works 
fine.  However, when there is enough variation from the build machine to the
target runtime it will break.. (Such as SDKMACHINE=i686-mingw32)

The bugs can also how up on a Linux -> Linux build, but it's signficiantly
more rare.  It would require some set of options that make the host
headers and flags incompatible with the target.  (Such as various profiling
options.)

This has been tested with a set of meta-mingw patches that will be sent
to the Yocto Project mailing list soon.

Mark Hatle (1):
  gcc-5.2: Fix various _FOR_BUILD and related variables

 meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
 .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch

-- 
1.9.3


