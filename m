Received: from www50.your-server.de (www50.your-server.de [213.133.104.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13327.1795773186046175134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@triplebit-solutions.de header.s=default2507 header.b=h6VTzNLL;
 spf=pass (domain: triplebit-solutions.de, ip: 213.133.104.50, mailfrom: kmeinecke@triplebit-solutions.de)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=triplebit-solutions.de; s=default2507; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=Gp9fXaC6ryT8QF+Zt/vo5snQeT5nOZTvbFvbxb35UMQ=; b=h6VTzNLLRi4F1diYoxnACfFOKs
	J8TlMJFgmztEb+qtgo6JTcDuimdfKd4b3D9SSCAibaG7T/55xCG2ozZq/P2khhSM9Mfepwjzvl4m/
	oFd8iDf7QCIho3UK4Lw/OI/BqMRb+8OC/3u4NPvZMlEI+KJyQRqA3izCwjebX6WtL4rhT6t1yl9LW
	kRvzdatQv6q5nJAwGE5YMvM5QJ2hCX4M0XPhiPCiJZZqsnfoYU+uCEvqwHbCmry9O438wzJ/jODnH
	LF5wSxMXjRY7l1lUqAArDVb9K9iHSLDuQZFdBNZhxncURWp80GKITPYwaLDeRPTKOV9qDC+6SMV9J
	T/EyOuRQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www50.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <kmeinecke@triplebit-solutions.de>)
	id 1xWsdX-000Bor-2F;
	Fri, 27 Nov 2026 10:52:59 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <kmeinecke@triplebit-solutions.de>)
	id 1xWsdW-000IXX-2p;
	Fri, 27 Nov 2026 10:52:58 +0100
From: Karsten Meinecke <kmeinecke@triplebit-solutions.de>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Maxin John <maxin.john@gehealthcare.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Karsten Meinecke <kmeinecke@triplebit-solutions.de>
Subject: [OE-core][scarthgap][PATCH] insane: fix unimplemented-ptest error handling
Date: Fri, 27 Nov 2026 10:51:35 +0100
Message-ID: <20261127095135.420733-1-kmeinecke@triplebit-solutions.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251379
Content-Type: text/plain; charset="utf-8"

From: Maxin John <maxin.john@gehealthcare.com>

Avoid TypeError when the unimplemented-ptest check encounters
a FileNotFoundError.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b62d5e681741394ad90501a83a1c66b0e3ab7ce3)
Signed-off-by: Karsten Meinecke <kmeinecke@triplebit-solutions.de>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 9004a9dce2..7631d3c730 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1357,7 +1357,7 @@ python do_qa_patch() {
         except FileNotFoundError:
             # pathlib.Path.glob() might throw this when file/directory
             # disappear while scanning.
-            bb.note("unimplemented-ptest: FileNotFoundError exception while scanning (disappearing file while scanning?). Check was ignored." % d.getVar('PN'))
+            bb.note("Recipe %s QA: unimplemented-ptest: FileNotFoundError exception while scanning (disappearing file while scanning?). Check was ignored." % d.getVar('PN'))
             pass
         return False
 
-- 
2.55.0

