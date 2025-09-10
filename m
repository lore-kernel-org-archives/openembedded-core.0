Return-Path: <gregor.herburger@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE30CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 11:38:21 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.15201.1757504297066744060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 04:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=mIwevcY9;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=HMAYSfej;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: gregor.herburger@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1757504297; x=1789040297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Coo4vjUDaqyP7gG/kHAHigr+Ifk8DVRLMhODQC7DWAM=;
  b=mIwevcY94sXJ4rwsVpNe3XXyn3VRQyHgeyBAbpqFnyY0zAYd2172u0mQ
   CzXYDJh2MPAJpBcgPQcyVNrOgebjoZZMKoKV5JSMBZba73HYgtyxskBru
   ebJL+Nq9/hTM6Rgwngh9SFFI94yxrF3nJlT0XhCo+72fQpyIwLgI6C2fq
   ICBkUgAOO/dUjY6ilnlguBOFShzYhxkJQJJh4PsYAKKIpYYubwLp5Ink7
   iZvz1P4hFgUW4cxiA7EWwIRvw9+8XU0O3vlEP0O7isMb7aeU5iQzBxrnZ
   135d1YhBsi1jSSI6+ACXI8nA8ITPYP3lCb010k1OA19BHZnwxyUt8sSZn
   w==;
X-CSE-ConnectionGUID: USgTpOtgRhOaUE5F6zOXEQ==
X-CSE-MsgGUID: lrdxGGqQTyaw/xRPjcrfeA==
X-IronPort-AV: E=Sophos;i="6.18,254,1751234400"; 
   d="scan'208";a="46140350"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Sep 2025 13:38:14 +0200
X-CheckPoint: {68C16326-4-410E8DD8-CEA8F0F8}
X-MAIL-CPID: D497C1D25F8BDFD86CD94DEC269B5323_3
X-Control-Analysis: str=0001.0A2D031F.68C16326.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15CAB170961;
	Wed, 10 Sep 2025 13:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1757504290; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Coo4vjUDaqyP7gG/kHAHigr+Ifk8DVRLMhODQC7DWAM=;
	b=HMAYSfejdVLCQ7xofXCdsjByPz9EKBoQ0B+kwc5s09NFFJR7VOhrty4KIldrHJnNu6NezU
	XKujl7I+dSuTxeqidnvA/9UNbxDGuHin8BZ0s2ZM0trBuoaNRS146z6oj5FECt0Nku9l9A
	aLEixC1ieGjjdyK33NUJNqrBkfVu9EIiJyx5S496f7aWL7ENyLrF9w/jJ6iVJDS1hhTMN9
	+XdtAL9DQlU5Wy7qBZET8rG1RuQ0bqYyzl35fcTIRWlcSuXZZw4yjt39HfkfJzu2w38bSC
	lrNIxJf3DtDiN4FtqFJeSbvi+flZs/ijc6UJol1e9oLnb5Zk4IPpCkBaoqXZGQ==
From: Gregor Herburger <gregor.herburger@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Subject: [PATCH] gcc: fix local include path for nativesdk-gcc
Date: Wed, 10 Sep 2025 13:38:02 +0200
Message-Id: <20250910113802.1331526-1-gregor.herburger@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 11:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223205

By default GCC uses /usr/local/include as the local include prefix.
When building the nativesdk-gcc package, this makes gcc look in the
hosts /usr/local/include and may use non-SDK headers.

Example from current poky:
$# x86_64-pokysdk-linux-gcc -v -E - </dev/null
 #include <...> search starts here:
  /opt/poky/5.2.99+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/15.2.0/include
  /usr/local/include
  /opt/poky/5.2.99+snapshot/sysroots/x86_64-pokysdk-linux/usr/include
  /opt/poky/5.2.99+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/15.2.0/include-fixed

Define LOCAL_INCLUDE_DIR along with the other include directories in
defaults.h to set the local include directory to the directory in the
sysroot.

Signed-off-by: Gregor Herburger <gregor.herburger@ew.tq-group.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 50ff0d2e820a..f152ae55555d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -72,6 +72,7 @@ CPPFLAGS = ""
 SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
+SYSTEMLOCALHEADERS = "${target_prefix}/local/include"
 
 do_configure:prepend () {
 	# teach gcc to find correct target includedir when checking libc ssp support
@@ -83,6 +84,7 @@ do_configure:prepend () {
 #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
 #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
+#define LOCAL_INCLUDE_DIR "${SYSTEMLOCALHEADERS}"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF
 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h

