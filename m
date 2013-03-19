Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UHnCk-0004RD-2p
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 04:27:14 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2J26H4r007718
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 19:06:17 -0700 (PDT)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 18 Mar 2013 19:06:16 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 10:07:00 +0800
Message-ID: <1363658821-23679-1-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] [RFC] Perl packages shouldn't be allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 03:27:14 -0000
Content-Type: text/plain

Hi,

I recently found that perl packages are broken in multilib builds. On a lib32
image, everything including perl is lib32 and installs to /usr/lib. These perl
packages are "all" arch, which is fine except that they install to /usr/lib64.
They won't work because the lib32 perl thinks its vendorlib is under /usr/lib.

Removing allarch seems to solve the problem, but I want to see if people have
some comments.

I found the original commit that introduced the change, which was to fix an
sstate related issue (https://bugzilla.yoctoproject.org/show_bug.cgi?id=1075).
But I don't think these packages fit well with allarch, since they install into
arch-specific dirs.

jesse

Jesse Zhang (1):
  Perl packages shouldn't be allarch

 meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb         | 2 +-
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb             | 2 +-
 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb | 2 +-
 meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb         | 2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb              | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.11.7



