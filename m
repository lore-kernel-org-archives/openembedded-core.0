Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB107F3B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 19:41:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4634kq05FYz56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565120483;
	bh=3coE89QkU3SMLA6ZacFxWWE+47H9UhA2voOxsRwKy5M=;
	h=From:To:Subject:Date:From;
	b=gdE7XhbjReZ3HooBt2fOtadUeqLDcM3ygKKgcDlQaa98kNs1kuylV846Vv97S4f+F
	E43J9NsWPCVj1V/p9s9NV99zcSNVCzEZ2WPjvuhMoAaGWeUIjpgS+8ZrkGuwzN7uVN
	mRxNOGekmP7pwy4NqyPSZHWIl1wTr/SbUrASHKQVzz3Ikm6buLS5vdzKi74qkvHmnc
	fGv77nZ6BBjOI6wDBqT+TV0Z4ghdAOqYeUfnDziX8TnPK/3hoUQX/oaDL2MGXhpuWs
	KTdzH2HuJVYk/GZOvKuwONokrZ2cCTuYhKR7kOrUCd9gD6ruHSfoWE/IkTCeKQsJj1
	Glaaa9LncYFTMkfIM05hJ6/1G6eQwk3oMZdL1NfftgPOGUu2sp1lmxRYkHHEzzHZ2F
	jotOyuf3LZUOgZdUgS/GNDTRA26bXiUfrwSDCauy0xwvBU63mhnkrObD8uewjQ3CiO
	vm7S/bEJiwAN5o5Wf3KOOdwQXW9eXH5RHtUzAXQkaJbBSBcYa7aC8MfxFEp0+t20at
	VNRI5zMDWnu2eSH+zsi++Gabg9GCvsLPl28DWfc6RR4wF2p4i1ZENkjy0K2KnHqHLU
	22nEhBPvtjC0RToXJ9YSHVCtxCwhYilKMkvt5OGz7sVSWx9a+FpjZrLFMXTCz8efBa
	X/y5gn0KMSe/WWvfuWTYXBh0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 22:41:21 +0300
Message-Id: <20190806194122.22430-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] psmisc: Fix dependency for USE_NLS=no
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
X-List-Received-Date: Tue, 06 Aug 2019 19:41:23 -0000

From: Jason Wessel <jason.wessel@windriver.com>

When using USE_NLS="no" in the local.conf psmisc will fail to
compile as follows:

| autoreconf: Entering directory `.'
| autoreconf: running: autopoint --force
| autoreconf: failed to run autopoint: No such file or directory
| autoreconf: autopoint is needed because this package uses Gettext
| ERROR: autoreconf execution failed.

This is because the gettext.bbclass returns gettext-minimal-native for
the host dependency which does not include autopoint.  The autopoint
utility is required to build psmisc, so it needs to list
gettext-native as a dependency.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947709..594a10cf22 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "ncurses virtual/libintl gettext-native"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.17.1


