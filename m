Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QpQZm-0005hl-6C
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 22:00:58 +0200
Received: by gwb11 with SMTP id 11so861141gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2011 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/Q6A11D9SLWUY9Fa7AswIfCWkPKirU+tTbggs2X4aqg=;
	b=QzaY8K5JqKN8yQZY5MESltPjAqUuRb5nS8pa5U2O1AyThuWF+/c43MS3j7QrEhoIJ5
	9pw9R23hs2RMEpWrim9cjHUF+lZaRwcetxTT/frP9eE+sa6D1PGvqW7iZPWcU2aBmXXh
	iizrS3MVvNSa479hk9A5q1HGnCg4nYcE4yTqY=
Received: by 10.142.232.4 with SMTP id e4mr2344712wfh.446.1312574192263;
	Fri, 05 Aug 2011 12:56:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s7sm467711pbj.53.2011.08.05.12.56.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Aug 2011 12:56:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 12:56:17 -0700
Message-Id: <1312574177-20210-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Daniel Lazzari <dlazzari@leapfrog.com>
Subject: [PATCH V2] defaultsetup: Use .= to add TCLIBCAPPEND to TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 20:00:58 -0000

From: Daniel Lazzari <dlazzari@leapfrog.com>

Lazily appending causes a bug where wrong cache is
cleared when BB_SRCREV_POLICY = "clear".

Tested with qemuarm on uclibc/eglibc in same build dir

Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 919ed00..1a29778 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -11,7 +11,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
 
 # Allow single libc distros to disable this code
 TCLIBCAPPEND ?= "-${TCLIBC}"
-TMPDIR_append = "${TCLIBCAPPEND}"
+TMPDIR .= "${TCLIBCAPPEND}"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
 
-- 
1.7.4.1



