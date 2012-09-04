Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T8lhh-0005l0-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 07:29:37 +0200
Received: by pbcwy7 with SMTP id wy7so9320025pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7dXUyVfonkt/aIx9nZFmnuszJxWR2sdYw14iTQQFMrY=;
	b=ZEonjzFNw/tZiNbigyDfDUVVndYhlJL0aIwWyE5DOKXDGAYUWVzPZWaWd0wzf4Bt65
	+2CycDBpt+ppxB1682fBd1S/OYuCTHW0yNMQS4f2jgCk2do1kXCWLhpen6sW1x9q3sx0
	eKRyNqjMXq6jsX3R/TFfzoT6Mi4Dnpjd8sgbaVr40EzdYfCfcZVJl6awxUYSIFTh5yU/
	EUalZ7vaiBTTPeUkj6uZNKRKr3Fubt+F9G4MjWgg0y/qqiMFmavaYZZl3tNcRKXv8JCI
	fQ/zif9H2cYg1JI30ch0DehrvVbH58z7vwBJlS4gGOLv8d5WjII7OLMdP6tyRiqcTAPw
	cLsg==
Received: by 10.68.242.231 with SMTP id wt7mr42713724pbc.99.1346735835201;
	Mon, 03 Sep 2012 22:17:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tq4sm11411714pbc.11.2012.09.03.22.17.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 22:17:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 22:16:23 -0700
Message-Id: <1346735783-30393-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] tclibc-uclibc, tclibc-eglibc: Prefer nativesdk-eglibc to provide libintl
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
X-List-Received-Date: Tue, 04 Sep 2012 05:29:37 -0000

Currently gettext and eglibc compete to provide for libintl on
nativesdk. So make choices to select eglibc nativesdk to provide
for both eglibc as well as uclibc based systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc |    1 +
 meta/conf/distro/include/tclibc-uclibc.inc |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 1c9e7e9..15f5ee5 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -10,6 +10,7 @@ OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 3984235..9245112 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -11,6 +11,8 @@ OVERRIDES .= "${LIBCOVERRIDE}"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
 PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
 
 USE_NLS ?= "no"
 
-- 
1.7.9.5



