Return-Path: <tonyb@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D89ECD6CA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 16:39:28 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23318.1770827964191563004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 08:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cybernetics.com header.s=mail header.b=dKwGv3vj;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: tonyb@cybernetics.com)
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id psZRgsETlM5YE4Xk for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:39:22 -0500 (EST)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=VMxogwIg3RuofyPedapJtS0Owm0AgOqqiQcL8VjuxIY=;
	h=Content-Transfer-Encoding:Content-Type:Subject:From:To:Content-Language:
	MIME-Version:Date:Message-ID; b=dKwGv3vjjHDsGtAEyAad6NyQ2U6hPssZS09TsC1tX7obf
	ieyVEPmKn/wwMnVlOgQNabiKX994CgJ15YUdIE7WoXzQCcm6WcFePGn+fGtKzbnaN/a7AMc33Vdvl
	4Oig0R55UjCZXk9czb7DxMNDu2HLJfO1qj+DybyeSBEBSU2IQ=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate SPEC SMTP 8.0.5)
  with ESMTPS id 14397326 for openembedded-core@lists.openembedded.org; Wed, 11 Feb 2026 11:39:22 -0500
Message-ID: <e314bff9-bec6-4085-b3f2-7fca14f95bba@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Wed, 11 Feb 2026 11:39:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Tony Battersby <tonyb@cybernetics.com>
Subject: [whinlatter][PATCH] texinfo: Fix gcc 15 compile errors
Content-Type: text/plain; charset=UTF-8
X-ASG-Orig-Subj: [whinlatter][PATCH] texinfo: Fix gcc 15 compile errors
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1770827962
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 0
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 892
X-ASG-Debug-ID: 1770827962-1cf4392850253be0001-7zcVdP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 16:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230996

gcc 15 switches the default from -std=gnu17 to -std=gnu23, wich causes
multiple errors compiling texinfo:

texinfo-7.2/info/terminal.c:164:7:
  error: too many arguments to function 'tputs'; expected 0, have 3
etc.

Fix by specifying -std=gnu17.

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 meta/recipes-extended/texinfo/texinfo_7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-extended/texinfo/texinfo_7.2.bb
index 784f67f65b..08da15deb5 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
@@ -40,6 +40,8 @@ tex_texinfo = "texmf/tex/texinfo"
 
 inherit gettext autotools multilib_script
 
+CFLAGS += "-std=gnu17"
+
 MULTILIB_SCRIPTS = "${PN}:${bindir}/texi2any"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
-- 
2.43.0


