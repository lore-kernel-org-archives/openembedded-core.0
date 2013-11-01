Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 51FFB6D123
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 03:52:04 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id wp4so4006192obc.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 20:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jWLLOS92M7Rq+n4eYn/UiekTfI9oSwFf3R8ctv4EywQ=;
	b=BLj5MW3ufTU/mre9+TP1Yy44aodnWprMCXYi8HlRNz2kgCNC8ufA0sfj9brYaiZG9K
	U+S1j7aRNvrS0o4s5OAd6DfQ7a35eSB2ssBo9UuwI8Ci2YrNNv7GQ9e+Y3vjM3OwT8Q6
	2A6aKf3j9jd2oBQtleqbeItuvia/Ud0GDKuYFGzGvZVCLewRFJ6BSJRTBus56QB/DCP+
	X4lvn1RhxYwoJN11TdooIL2yVWp0MRuFHEXIOZSPUT/3StnbAkfmzSGW+yBdTWru21gv
	sxjifdf732wsEyKGC7fEAPtKYUPhP9G3noosGX7mzCNL3+4mivtKcVGbayRxoIDWEG4a
	JAOw==
X-Gm-Message-State: ALoCoQkkQByLYy7O6hlUFqzeRQoI9ek74xGlvA8F0BddRZkDOwoAY7GXbGSoKnS7RnnxeIMg2G9v
X-Received: by 10.182.107.164 with SMTP id hd4mr151957obb.58.1383277926119;
	Thu, 31 Oct 2013 20:52:06 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id eg8sm10911622obd.6.2013.10.31.20.52.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 20:52:05 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 20:51:51 -0700
Message-Id: <1383277911-8416-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH][v2] package.bbclass: Fix split_and_strip_files when file has single quote (')
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
X-List-Received-Date: Fri, 01 Nov 2013 03:52:05 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Fix false error report when a file that has a single quote by escaping
the single quote. Some packages might install files with quotes, such
as music files and other types, that will cause the problem.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b0f44c7..48bb982 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -747,7 +747,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
+        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.8.3.1


