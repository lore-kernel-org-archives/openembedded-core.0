Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC567FC9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302822"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C8FA5010EC4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:41 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:49 -0800
Message-ID: <1579523214-47426-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1C8FA5010EC4.A2F91
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iw: upgrade 5.3 -> 5.4
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:38 -0000
Content-Type: text/plain

Refresh the following patch:
separate-objdir.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iw/iw/separate-objdir.patch               | 21 ++++++++++++-------
 .../iw/{iw_5.3.bb => iw_5.4.bb}               |  4 ++--
 2 files changed, 15 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.3.bb => iw_5.4.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
index eb01a5a14e..b011a3abc7 100644
--- a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -11,12 +11,12 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 33aaf6a..9030796 100644
+index 90f2251..714cdb9 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,5 +1,9 @@
  MAKEFLAGS += --no-print-directory
-
+ 
 +SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
 +OBJDIR ?= $(PWD)
 +VPATH = $(SRCDIR)
@@ -24,19 +24,24 @@ index 33aaf6a..9030796 100644
  PREFIX ?= /usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
-@@ -103,11 +107,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
+@@ -92,7 +96,7 @@ all: $(ALL)
  version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h Makefile \
  		$(wildcard .git/index .git/refs/tags)
  	@$(NQ) ' GEN ' $@
 -	$(Q)./version.sh $@
 +	$(Q)cd $(SRCDIR) && ./version.sh $(OBJDIR)/$@
-
- %.o: %.c iw.h nl80211.h
+ 
+ nl80211-commands.inc: nl80211.h
+ 	@$(NQ) ' GEN ' $@
+@@ -100,7 +104,7 @@ nl80211-commands.inc: nl80211.h
+ 
+ %.o: %.c iw.h nl80211.h nl80211-commands.inc
  	@$(NQ) ' CC  ' $@
 -	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
 +	$(Q)$(CC) -I$(SRCDIR) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-
+ 
  ifeq ($(IW_ANDROID_BUILD),)
  iw:	$(OBJS)
---
-2.20.1 (Apple Git-117)
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/iw/iw_5.3.bb b/meta/recipes-connectivity/iw/iw_5.4.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.3.bb
rename to meta/recipes-connectivity/iw/iw_5.4.bb
index f7f13f5a30..9f58e49709 100644
--- a/meta/recipes-connectivity/iw/iw_5.3.bb
+++ b/meta/recipes-connectivity/iw/iw_5.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "6d4d1c0ee34f3a7bda0e6aafcd7aaf31"
-SRC_URI[sha256sum] = "175abbfce86348c0b70e778c13a94c0bfc9abc7a506d2bd608261583aeedf64a"
+SRC_URI[md5sum] = "08a4f581a39dc62fa85d3af796d844b6"
+SRC_URI[sha256sum] = "943cd2446a6c7242fded3766d054ab2a214a3514b9a8b7e942fed8fb13c1370c"
 
 inherit pkgconfig
 
-- 
2.17.1




