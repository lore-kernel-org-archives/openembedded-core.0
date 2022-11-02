Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F05C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 19:18:17 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.10538.1667416692121755547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 12:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=gF5RG+EV;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Flgj9yq9iOP5O8SMvBvfCB/p5hQFkbL/CyhsGie/dJ4=; b=gF5RG+EVI1kICBbPsla/El67dH
	teWXdIvQ06ZszuwsQNHb6AOeMUep8OJvIUwrJVwLWMPBPqXptoAXc8NEz+tylPnUF55t6MGk9S6y5
	ZjSRy4qimmsOpADyEzVDuo9HlWLwttwFXRyLnQKt/m2tG7CBw25uMfwU+ge88ydFGR1KqX7jGkE75
	zkmieqY+vP1qQzvHepb7m8QvUjE7ee6OgNW+VaRf7z9vp3yO1hRAWoKnt2iCsHjT1tIiPFckpPqvw
	P2zMYSmNBoFV/cQaM82eJi8LOGFybPVm1R+bdj2KaQZ7/AcaGSUOPfZakyjDRpm5thZYm1jPa5b9u
	aZYmw6AA==;
Received: from lan.nucleusys.com ([92.247.61.126]:36906 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqJH6-0008kU-3d;
	Wed, 02 Nov 2022 21:18:11 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] get_module_deps3.py: Check attribute '__file__'
Date: Wed,  2 Nov 2022 21:18:00 +0200
Message-Id: <20221102191800.1702295-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 19:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172599

Check if the module object has attribute '__file__' to fix and
avoid errors like:

AttributeError: module '_abc' has no attribute '__file__'. Did you mean: '__name__'?

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 1f4c982aed..0ca687d2eb 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -56,7 +56,7 @@ if debug == True:
 try:
     m = importlib.import_module(current_module)
     # handle python packages which may not include all modules in the __init__
-    if os.path.basename(m.__file__) == "__init__.py":
+    if hasattr(m, '__file__') and os.path.basename(m.__file__) == "__init__.py":
         modulepath = os.path.dirname(m.__file__)
         for i in os.listdir(modulepath):
             if i.startswith("_") or not(i.endswith(".py")):
-- 
2.30.2


