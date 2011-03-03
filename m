Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pv51l-0000D0-3f
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 10:40:57 +0100
Received: by fxm8 with SMTP id 8so912681fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 01:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=zyPBPjoAoyrsxLSc1XyF8V1HwniE8og3RrRuKBz2mTU=;
	b=piSh4euya/1FgGcHzIibSIVpKB0NpQmR69axK5GffjTY0zLRUa6zbmrYppt+VFuthj
	QWRNNLzefU3M84Rsp36O88vObznDzECiQKHKjL7BetC1uexFhWiFhcc5CHdrnaDDi1SN
	UJ0UHYmvCihwIPvEZRvQeyC3tICGE5+ecbNE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hH1Wgv7Z0dZtgjTt1bl0xkQ/BcIkzXsoyiLL5iZF5S2Hi2BxpqgoPhVqeLgMg2Li61
	jEdJzSim2weYnX0KIPiTSSGwozQZt7q3XCh01RWfBH/7mNdvh3qW3rDdWiXdJnKIPtru
	6l9v2G1iIQLirxMJqdqVU8jkLkUEHkGPifiYo=
Received: by 10.223.96.12 with SMTP id f12mr1208759fan.79.1299145165930;
	Thu, 03 Mar 2011 01:39:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z1sm443044fau.45.2011.03.03.01.39.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 01:39:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2011 10:39:16 +0100
Message-Id: <1299145156-32150-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] sanity.bbclass: some multilib systems have symlink /lib -> /lib64
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
X-List-Received-Date: Thu, 03 Mar 2011 09:40:57 -0000

* ie gentoo has /lib -> /lib64
* old test assumed only /lib64 -> /lib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 13940f8..433313b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -211,7 +211,7 @@ def check_sanity(e):
     nolibs = data.getVar('NO32LIBS', e.data, True)
     if not nolibs:
         lib32path = '/lib'
-        if os.path.exists('/lib64') and os.path.islink('/lib64'):
+        if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
            lib32path = '/lib32'
 
         if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
-- 
1.7.4.1



