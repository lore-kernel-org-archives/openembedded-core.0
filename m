Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC8DE75F1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:05:44 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so3448728wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9+YTM4zOCTHFP8P5qmJU+lx2J9CPY8AAqHEPquXrRYc=;
	b=hDn5TGCL55W4CBcMVPKv84BIDT9Ii+NQdFA2W8lqvJ71D9b+q5OO7bcOr7JmUpMWGn
	itGqLt/NB1+TRWNNfPX55J/mT07ELBwILs3y+HL9aWhSTE2e6gbI5FQqeSEaTv5NxJAE
	tYJR9Tl6AIqMXb1zR0F0mrULtPLi1q2qucoS+BNSrAzINufW7cAXZrmdqLluMwiJnqBh
	2zEoIh/0ty/cyUF30wzuFTR7JecjEagSy9Q5XzFDB4Ub9o/2dyDWOdslGqS3CVsOOi5V
	8ajoJ2RyJppTltzBtYJ/VGuRBhIVrHPmok/HTwlVbV3TGkC9Bc07L8ofIfHbP0lf9sAz
	2OhA==
X-Gm-Message-State: ALoCoQlioOBbeyf4WOomDKmYvhisr3FN3ueRdmiLD7/dhitbvee5ydDj2G79kVo6rQXHHYNS/eJW
X-Received: by 10.194.63.42 with SMTP id d10mr21995784wjs.92.1437689144204;
	Thu, 23 Jul 2015 15:05:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm9479436wja.15.2015.07.23.15.05.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:05:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 22:59:47 +0100
Message-Id: <1437688790-31620-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
References: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] oeqa/runtime/parselogs: add more x86 log exceptions
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
X-List-Received-Date: Thu, 23 Jul 2015 22:05:45 -0000

Move "fail to add MMCONFIG..." to qemux86_common as we started to also see it on
x86-64 with Linux 4.1.

Add "can't claim BAR..." to qemux86_common.

Generalise "Failed to access perfctr MSR" as the MSR number can change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 8d0a1db..ce9c162 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -46,13 +46,14 @@ x86_common = [
 qemux86_common = [
     'Fast TSC calibration', 
     'wrong ELF class',
+    "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
+    "can't claim BAR ",
 ] + common_errors
 
 ignore_errors = { 
     'default' : common_errors,
     'qemux86' : [
-        'Failed to access perfctr msr (MSR c1 is 0)',
-        "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
+        'Failed to access perfctr msr (MSR',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
@@ -248,4 +249,4 @@ class ParseLogsTest(oeRuntimeTest):
                 self.msg +=  result[str(log)][str(error)]+"\n"
                 self.msg +=  "***********************\n"
         self.msg += "%s errors found in logs." % errcount
-        self.assertEqual(errcount, 0, msg=self.msg)
\ No newline at end of file
+        self.assertEqual(errcount, 0, msg=self.msg)
-- 
2.1.4


