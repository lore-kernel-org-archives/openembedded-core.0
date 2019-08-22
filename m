Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 513E07F270
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 12:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7MCT7Vv028583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 05:29:07 -0700 (PDT)
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 22 Aug 2019 05:29:07 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2019 08:29:05 -0400
Message-ID: <1566476945-27499-2-git-send-email-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566476945-27499-1-git-send-email-Trevor.Gamblin@windriver.com>
References: <1566476945-27499-1-git-send-email-Trevor.Gamblin@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] quilt: added less to RDEPENDS list
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
X-List-Received-Date: Thu, 22 Aug 2019 12:29:06 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The quilt "series" option relies on "less -R" but, since that
option is not enabled by busybox in oe-core by default,
hard-code the dependency on 'less'.

From 'man less':
   -r or --raw-control-chars
      Causes "raw" control characters to be displayed. ...
   -R or --RAW-CONTROL-CHARS
      Like -r, but only ANSI "color" escape sequences are
      output in "raw" form.  ...

In 2018, BusyBox's less added:
   8528d3d4f less: optional support of -R
but it is not enable by default for oe-core. While we could
enable the option, all known use-cases involve larger, more
developer-oriented recipes such as quilt or man pages.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index dcba62c..433e9b4 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -78,7 +78,7 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux"
+RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux less"
 RDEPENDS_${PN}_class-native = "diffstat-native patch-native bzip2-native"
 
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
-- 
2.7.4


