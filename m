Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0121A6D0C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:46:54 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so554089eek.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 01:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=89J9nBz4f1kgs8jtNVwdLVmAHeMgVVb81DCcJK0p6I0=;
	b=mnyCIje/R+NsCWsK1JrwCkSQ/eXE20IZqvwezrvS83K2JTAFDr5FlsbXci5EXXQVnT
	wNt9dKHEWNi8Hv1Vy877NLRE93MskfrmqwSw23HsUBqu5AhktG8DDqoEkc9IwfrqwlQj
	D7djiEnEVGcKEXdLrF/fNUSWU0p5c0/BLIBmnIvrvFmnkcmBlfSL9Vs4fOPMHvpL7zwY
	WFRVcbFNtJBv5WA4Mb0RngY2mWlwYChRrxbCsKqAEdxJptMS3XLu8XyZbSK1cAlrTXX+
	5S4JsWaW/oXQ1uDRvX5Y79ITRlMhhraqDy3CBQFKnMOqzObxwH8rsnf81J6fXSpwVy/3
	A2Ng==
X-Received: by 10.15.74.200 with SMTP id j48mr12175096eey.102.1389174415007;
	Wed, 08 Jan 2014 01:46:55 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248]) by mx.google.com with ESMTPSA id
	o47sm188001041eem.21.2014.01.08.01.46.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 01:46:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 10:46:46 +0100
Message-Id: <1389174406-14345-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] shadow: set correct entries for pseudo terminals in /etc/securetty
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
X-List-Received-Date: Wed, 08 Jan 2014 09:46:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In

commit 10cdd66fe800cffe3f2cbf5c95550b4f7902a311
Author: Ming Liu <ming.liu@windriver.com>
Date:   Thu Jul 18 10:04:22 2013 +0800

    libpam: add a new 'nullok_secure' option support to pam_unix

'null_ok_secure' option was fixed. Since that commit 'su' stopped working in
pseudo terminals (created in X environments) for root-accounts with empty
password.

Background: The PAM configuration for 'su' includes 'common-auth' which uses
'nullok_secure' option for pam_unix.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-extended/shadow/files/securetty | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 467fc04..0b1629f 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -124,18 +124,10 @@ tty62
 tty63
 
 # Local X displays (allows empty passwords with pam_unix's nullok_secure)
-:0
-:0.0
-:0.1
-:1
-:1.0
-:1.1
-:2
-:2.0
-:2.1
-:3
-:3.0
-:3.1
+pts/0
+pts/1
+pts/2
+pts/3
 
 # Embedded Freescale i.MX ports
 ttymxc0
-- 
1.8.3.1


