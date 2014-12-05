Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E56E472468
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 20:46:38 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so1875448wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 12:46:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cNvV+fpqPUoCs/p+90KIj1Am9hQ7N8ECCUupzflJhds=;
	b=d7P56W8ALEtXne5DGt+IIWDYl3HOc6/T/bKEd15Mhah4h/PDxH9sXPUotwFq6efxpq
	cj4jk9zi7qX8YTh9QYREB/jfUSdt+M3rlpE0li2oBi1CYRAetqjgmVX81JE7w8u8PZ8x
	0lfmMB2/nlnKJMnBBCao8c0IJjdxlhtyIVoeRCV98Y5nizLe7jz0yBWFseAp+vR4984v
	bDX5bYaJNID8mY8yi/30UQG8ajfo3YN7Uk9yKh56a0S6i/d3w43oh7TWCpP0F5QMLdCk
	N8qKFy4ytOtxCmbw+5pKf+TrSO6bq4GQUDVo8DNOtZjxT7YPTgtLw9+ghpoR0s+DqPwW
	WugA==
X-Gm-Message-State: ALoCoQmsE4n9X3UU5EBipw4HsthIAK0eIku/4ScBksgS6p/7RbYCC8WO/jd3xdx93Ns7xr3JSmRZ
X-Received: by 10.194.188.39 with SMTP id fx7mr25848370wjc.113.1417812398322; 
	Fri, 05 Dec 2014 12:46:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id gy8sm3596540wib.23.2014.12.05.12.46.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 12:46:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 20:46:04 +0000
Message-Id: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dtc: don't use autotools as this doesn't use autotools
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
X-List-Received-Date: Fri, 05 Dec 2014 20:46:41 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 95023b6..0c409b0 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -4,16 +4,18 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD"
 DEPENDS = "flex-native bison-native"
 
-inherit autotools-brokensep
-
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
 	  "
 
-EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}"'
+EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
 
 S = "${WORKDIR}/git"
 
+do_install () {
+	oe_runmake install
+}
+
 PACKAGES =+ "${PN}-misc"
 FILES_${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
 
-- 
1.7.10.4


