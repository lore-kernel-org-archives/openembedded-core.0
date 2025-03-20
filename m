Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E09C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:30:37 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.3314.1742463032163637819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 02:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=UfZNiQ8L;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=oeWCkqCs;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742463031; x=1773999031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hPgZlYEnZhmnHh+7AwsqoCqK9Pun2M/xgklM4mL012Y=;
  b=UfZNiQ8L85i4I1yCOJhMK7dohaUsIHwtIUmVbjzn/qYNqad7ehMQky8z
   +kIRGoxd7uUWyXUpcNQn5a1xb/Nc21MJbI1AUrAriDHxUxSI0i2wnXi3n
   90uyZT8eEKG47J1LheBkHqNFRP6pyc20fxAWiPr+4RyfG5H2n/5a2o2lX
   SLWr4vWxRbqLPIJ8SeWfWsoddMtGzMRO2rrdDtBdZWY44YmcuZeJxkrOq
   OTasBP7btHtiWUTKSYjLhe3HT4K/Maxri7cqYM/w0hnHg1qnf5AJz1f8s
   JNLtNYOpEC9Loduil+e2NEMOg+8SD1qx2YygXbt/aSU8Ka0tFSD7tE5Ai
   w==;
X-CSE-ConnectionGUID: qfatkbxPSH60Ng+30gkXfQ==
X-CSE-MsgGUID: PCzbllSDSg+K5fMwzZGRFw==
X-IronPort-AV: E=Sophos;i="6.14,261,1736809200"; 
   d="scan'208";a="43065429"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Mar 2025 10:30:28 +0100
X-CheckPoint: {67DBE036-6-2417938-F0170C2B}
X-MAIL-CPID: EF7E842DFC55187C6A76AAA60D1BD8D2_2
X-Control-Analysis: str=0001.0A00636E.67DBE03D.008C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A53F163D9F;
	Thu, 20 Mar 2025 10:30:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742463025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hPgZlYEnZhmnHh+7AwsqoCqK9Pun2M/xgklM4mL012Y=;
	b=oeWCkqCswGBu4r1iB9NiUAa3YL+nlM4l2hmBjkMbc2iRQdbqDZDbIGbxDkuRKAxc+cpEIC
	fKiACyFUDBf0D3mC9Fe2g87Ojt9z/jyHiWFy9CxbHVgSwP9r3WkP2ISjcX080kES8tqBLX
	uvH8VNTFyajFfA+ILjlUOI8+WYPHr4ry9ieZ82qZ7p8tQ9TNJ3jTEP6HKXsOWfITjA1oYZ
	CsS6C6jwTzRiGQZQjOLFfyOaVPfuN96WwS8gwQDNT/H+288+Nad/aJVPdg8Ur82IMGeuyQ
	3q2Iza2xHV4cJDm4thY8ClMSTIa6BL+VigqktlOn8jSYwJ9G7pKseTXIASm91Q==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] Revert "git: git-replacement-native: depend on ca-certificate"
Date: Thu, 20 Mar 2025 10:29:59 +0100
Message-ID: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213375

This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.

git-replacement-native is used only to provide a newer version than may
be installed on the system; apart from that, it should work more or less
the same. In particular, it is using the host system's /etc/gitconfig;
it should also use the system CA certificates, otherwise it will break
HTTPS connections in environments that need local certificates, for
example for a corporate HTTP proxy.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.0.bb
index 66082d0bde..2ca8711f75 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "Git is a free and open source distributed version control system
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
-DEPENDS:class-native += "ca-certificates"
 
 PROVIDES:append:class-native = " git-replacement-native"
 
@@ -97,7 +96,6 @@ perl_native_fixup () {
 
 REL_GIT_EXEC_PATH = "${@os.path.relpath(libexecdir, bindir)}/git-core"
 REL_GIT_TEMPLATE_DIR = "${@os.path.relpath(datadir, bindir)}/git-core/templates"
-REL_GIT_SSL_CAINFO = "${@os.path.relpath(sysconfdir, bindir)}/ssl/certs/ca-certificates.crt"
 
 do_install:append:class-target () {
 	perl_native_fixup
@@ -106,7 +104,6 @@ do_install:append:class-target () {
 do_install:append:class-native() {
 	create_wrapper ${D}${bindir}/git \
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
-		GIT_SSL_CAINFO='`dirname $''realpath`'/${REL_GIT_SSL_CAINFO} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 }
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


