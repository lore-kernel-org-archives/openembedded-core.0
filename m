Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F05E83046
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 06:42:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14193.1770187348982084066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 22:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GGU5zZ06;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e2cb21520so3030182e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770187347; x=1770792147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H23kBU37Y05D2SmTgwSlxbIny9JdvXLYu/zrG3SDP8w=;
        b=GGU5zZ06wHK3r7baqdxdGAGxcWWumCs1hBtUACK+t5DHv+1DF9MEFcIgG0oSmY0vQq
         UMktPwTFxqJGUNacWPwWy1jfODjWHmBElRWZlmbtbTsu5jrau+FKKhVrhoVTMqX+xDBH
         52KyHPU1/Q9UwCZW7JcMSaGqxfi5Mdw9SR/NFZ5Iqcx8T7nFivHYjDAsaSaKmUxGyc/i
         7nrRZrhVLnODNQoTzhl0ccG/RySdd4PhwJUpLcPW6+GivGze4uudj6NYKU62FCnT1AKw
         5QARw68IIXKealRPffngxGi5+VD1CCKdsvZZzd6zYDrlJA6PqjPDbw4EIPXdjyZXmVHm
         r4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187347; x=1770792147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H23kBU37Y05D2SmTgwSlxbIny9JdvXLYu/zrG3SDP8w=;
        b=Tq1YMEUcgMuxrAbFhlUN1afuC7/H17ntBNVpOO27MhCTPdFd4WA9uSXvBRiA9jZ3JU
         qAScHKOdEXAs29s2OKnvjxnwQf8xXcOc3RuujlaOKLWnUltSMk1br2rGopaoJ7HXlFUs
         XKjmYOGvQe7HWRMqu5eyQO63S7C80leBwIsk9XW3DGaUMAaoH+QXNwrpqhfdspIy4Wly
         7Z4YyXt5BnzEJqGXtkbL0Of5fbviuwnRofO+MyG9eMkFxi2OMAYy0Aqcxrb4v/ASdCZQ
         he75OGWoyn0oAU79Mo9bAN3K6cFCic+ZDqXxn9U+Xz6zkaOV3k0TTAWuCOo6t0Wf0bQi
         l1Dw==
X-Gm-Message-State: AOJu0YyLCd2CiTMYV/SGlGtnitlELXBabvU4N5x3dkGbxW0t9RokY/LR
	meGMrz9UHCbMnlOrhz5xyQj8sdywGup5Q7L2OHLDl7M4eUOBEamL3/y8AfC4/A==
X-Gm-Gg: AZuq6aJFQ/Vgn5bvfmhl35YGCDPs8hTs+A5dewZiYIA1boKs6/UP60uohqbVRmJEJgz
	A1mefBvQxeiWSs52pRDpYGZsBjALGnC0ztCAC+vljCEJqhVkEVRKvrfi+wbtDcUPX6HcDvba3SC
	kkpPMvc27PFXQA2qJ4fSaxXCQ1A9TWQ0ibySAhr0J4w/KfKFm4rVOh7umJ3Mqm0lmKL/iLjtx4s
	QIEazg2UG1IieW4u+3L6t0AKTCA5naZ6xXktblFxROQWBV83FjtgpiHQ9GbtSLsg9SPept0GGTm
	/0bG9JO0yfjzg0yy5wdtsWIcLXXMJQK8BTLqI2nDhIsqk2giRXijnuk/YqJcgK0bvvzGgmupNcQ
	PqgJnQUc2WiVK5fBZy1u5LMsAn0lnwFYBgHx7cGtl2lsd4QwBbvl8sajICIjzCOso2atcqf3X6l
	lEU45m6Q6HhKWJ/QwYBayJsK4BM/H1K7AVs3J6gigYl9YXnV23osCKvNPsp9Vc/fPGl68+318Lz
	w==
X-Received: by 2002:a05:6512:3b22:b0:59d:e774:db0e with SMTP id 2adb3069b0e04-59e38c1183dmr765069e87.23.1770187346207;
        Tue, 03 Feb 2026 22:42:26 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3881b23dsm415857e87.59.2026.02.03.22.42.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 22:42:25 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oe/utils: filter license packages
Date: Wed,  4 Feb 2026 06:42:05 +0000
Message-ID: <20260204064206.3122637-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230498

The packages_filter_out_system() function is used in PACKAGESPLITFUNCS
to filter out "system" packages (-dbg, -dev). The filtered packages
should include license packages (-lic) as well, when they are generated
with LICENSE_CREATE_PACKAGE = "1", otherwise the license packages will
get pulled into images unintentionally.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0128ee411d..2b39d4e0dd 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -236,7 +236,7 @@ def packages_filter_out_system(d):
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
     pn = d.getVar('PN')
-    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
+    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src', '-lic')]
     localepkg = pn + "-locale-"
     pkgs = []
 
-- 
2.43.0


