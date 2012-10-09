Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TLVRZ-0000Jz-TW
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 10:45:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q998WPK0017300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2012 01:32:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 9 Oct 2012 01:32:25 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Oct 2012 16:32:46 +0800
Message-ID: <5638b12dc40290cff09fc211d14b472ef7c2c8c0.1349770454.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349770454.git.kai.kang@windriver.com>
References: <cover.1349770454.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/1] perl: fix @INC
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
X-List-Received-Date: Tue, 09 Oct 2012 08:45:38 -0000
Content-Type: text/plain

perl @INC path includes native perl modules path. When run "perl -V",
the output at the end is something like:
  @INC:
    /etc/perl
    /usr/lib/perl/site_perl/5.14.2/
    /usr/lib/perl/site_perl/5.14.2
    /usr/lib/perl/vendor_perl/5.14.2/
    /usr/lib/perl/vendor_perl/5.14.2
    /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.14.2/
    /usr/lib/perl/5.14.2
    /usr/local/lib/site_perl
    /usr/lib/perl/5.14.2
    .

And this is caused by commit aeca6512f3a5468b8f65e2986024ab07d2ce45b4.
Because the native path is compiled into libperl.so that sed in
perl_package_preprocess() could NOT remove it. So revert the commit.

[Yocto #3099]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
index 0d4ca1c..dbfabb5 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
@@ -68,7 +68,7 @@ api_version='14'
 api_versionstring='5.14.0'
 ar='ar'
 archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+archlibexp='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
-- 
1.7.5.4



