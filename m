Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHnn-0005ZM-Uk
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDRBbr014176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:12 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:03 -0700
Message-ID: <81e6b47d5dfb48716e2a438153e3081684403cfb.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] kern-tools: fix excluded configuration processing
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
X-List-Received-Date: Thu, 11 Apr 2013 13:44:58 -0000
Content-Type: text/plain

One of the features introduced early on in the 1.4 release cycle was the
ability to include a kernel feature, but only get its patches and not configs
(and vice versa).

As it turns out, this only was exercised recently and once a single include
with dropped configs was started, ALL configuration values following the
commit were dropped.

To fix the problem, the processing of kernel features has been split into
two. Where the features are preprocessed and the assembled/complete file is
used to generate the meta-series (which is later applied to the tree). The
logic of the tools is the same, but the two phases of processing allows
configuration values to be excluded properly and simply, while keeping the
logic for modifying the tree in a separate step.

All changes are invisible to the user, and are done within the existing
scripts and build system bindings. Output series and manipulations to
the tree are the same as they were before this change.

Updating the kern-tools SRCREV to pickup the kern-tools changes for this.

(From OE-Core rev: 961ab0ac53de317c22409d90244a313998959714)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index affd66e..5334f75 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "d484e3f731f38f5b4e05e13102c97d06106edfb5"
+SRCREV = "89821213a5df891254f40c9ddccdcfd780d25c3f"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



