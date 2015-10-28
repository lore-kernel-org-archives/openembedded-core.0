Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D296760232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:31:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S5VnAX013212
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 22:31:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 22:31:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 13:22:52 +0800
Message-ID: <cover.1446009435.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix libxml2 unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 05:31:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The patch is from:

https://bugzilla.gnome.org/show_bug.cgi?id=746048

Build image with packagegroup-core-buildessential, boot the image and compile following c code:

==================================================
#include "string.h"

#include <libxml/HTMLparser.h>
#include <libxml/HTMLtree.h>

int main(int argc, char** argv)
{
  // Nokogiri::HTML::fragment("<!-- ")

  htmlDocPtr doc ;
  int options = HTML_PARSE_RECOVER | HTML_PARSE_NOERROR | HTML_PARSE_NOWARNING | HTML_PARSE_NONET ;

  char* HTMLFRAG_GOOD = "<html><body><!-- x" ;
  char* HTMLFRAG_BAD  = "<html><body><!--" ;

  char* HTMLFRAG = HTMLFRAG_BAD ;

  xmlInitParser();

  doc = htmlReadMemory(HTMLFRAG, strlen(HTMLFRAG),
                       NULL,
                       "UTF-8",
                       options);

  xmlFreeDoc(doc);
}
==================================================

Run with valgrind, there is no warning.



The following changes since commit 8a0d8eee432924433c3e70198aaeab3161476c5f:

  toaster manual: Updated the set up and use chapter (2015-10-27 07:28:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/libxml2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/libxml2

Kai Kang (1):
  libxml2: fix unsafe memory access

 .../libxml2/libxml2-fix-unsafe-memory-access.patch | 97 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |  3 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch

-- 
2.6.1


