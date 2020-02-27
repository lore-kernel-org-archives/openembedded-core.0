Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 25AD16116B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:25:01 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7BfS-00077F-Jp
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 06:25:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9JSZxq9gnx7cZeC95R3jAz9qnNgbRZpvhRYSsBdhiaM=;
	b=ACPfVj0g72I1R58kVOij5WJIuN
	YQWH1YTsmCHApzUq5lucvuvClokPgXuoo4QeuOa3oJqaOl5VF2ZJbRpd1ru8mez6WekcFfR/hXoGd
	iOwMVYdCofT34+tWrtUmCnje9uQ0BysiQKzsjRJc+eSaR1icBbACTVXLGitdHbrXkkshuq4eXDJD4
	S5tIvf2U34nP4IDX9M346i1eOyeVx8M0NLGfJmiIyt9KE6uZMJZkRQy0rwpCvUgbR0XKKubpbDVxC
	/SDfxykMbA1jRowwmNINkW3sI5M/AMWCEVb7CuHhW+0O6CDrijpl8oHkHvq1rAmo0K6TMEAArmEp8
	Af65sdHA==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7BfO-00020C-BN; Thu, 27 Feb 2020 06:25:00 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 06:24:46 +0100
Message-Id: <20200227052448.65435-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227052448.65435-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: c6025692b75800ad60ff0631e8044444
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200227052500Z
Subject: [PATCH v2 2/4] libva-initial: New bootstrap recipe
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mesa needs libva.pc and libva headers to enable the VAAPI
state tracker and drivers.

This recipe is a variant of the full libva package build as in:
* it only depends on libdrm to build so it doesn't introduce
  the circular dependency between mesa and libva, and
* it doesn't include the libraries in the final package.

However, there is another issue with build dependency handling
in Yocto. libva depends on mesa and mesa depends on this package.
Any package that depends on libva therefore would pull in libva
and this package resulting in an error in the prepare-sysroot
phase because they would install identical files into the
per-recipe sysroot.

Using the package name "*-initial" avoids this because of the
interaction between sstate.bbclass and staging.bbclass: any
package with the pattern "*-initial" in the name is excluded
from the dependency list unless explicitly added to DEPENDS.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: The include file is not versioned, more verbose commit message

 meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 9 +++++++++
 meta/recipes-graphics/libva/libva.inc              | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb

diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
new file mode 100644
index 0000000000..a3b04eb02a
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
@@ -0,0 +1,9 @@
+require libva.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
+SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
+
+do_install_append () {
+	rm -f ${D}${libdir}/*.so*
+}
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 058581f7d1..6a3427b5b1 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -16,7 +16,9 @@ BUGTRACKER = "https://github.com/intel/libva/issues"
 SECTION = "x11"
 LICENSE = "MIT"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
+
+S = "${WORKDIR}/libva-${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.24.1


