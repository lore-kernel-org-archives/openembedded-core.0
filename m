Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 87D8375F1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:05:46 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so3364274wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zrsLCeU+tw8nzyGmniKzukuo3mZji4Yfm6Lyp45iAww=;
	b=S7t6DLNDZ7TQUDM5vV1XG89RBguldOrxCGy5ZARBSQ3h0WVStBHskiVFZdRfoq67LY
	Li/wJWs+UoEyU6wuDjd/88TqC0t2BtvtSqVuP68Li4wrAoM3p/Js2MtR6+vWPbp7jvTP
	1aN8eqpGB8TIDE1phiF+4TydQhNudH/p2a/ZddjT6wMLBCvt2qlwvE/+6E0onoQu+kOR
	FxEdOpMLiFIdO8upGuJURmgY9E1757LY7nTpq0hYQx1EUWj0tlmX5iMQVVBoPUeQAu4e
	AeMxqAYNRtb2Jb4p2xDr2mOHFKFst7VV/2SA4bJKrm9SzDLocXxZb6TzCNmMJjj/indq
	6ZTQ==
X-Gm-Message-State: ALoCoQk4vDkir+7XDyMPBsaRvHjI/a/mCvAX8jQUw8/APXwrV+8pWIyJv0yVykRxf91wY3jXhlyl
X-Received: by 10.194.121.163 with SMTP id ll3mr20802738wjb.142.1437689146582; 
	Thu, 23 Jul 2015 15:05:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm9479436wja.15.2015.07.23.15.05.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 15:05:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 22:59:49 +0100
Message-Id: <1437688790-31620-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
References: <1437688790-31620-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] oeqa/runtime/parselogs: don't use uname to get MACHINE
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
X-List-Received-Date: Thu, 23 Jul 2015 22:05:46 -0000

Instead of running "uname -n" on the target (which actually returns the
hostname) to get something approximating the hostname (or not, if that has been
overriden), simply fetch MACHINE from the datastore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index ce9c162..ed43510 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -124,8 +124,7 @@ class ParseLogsTest(oeRuntimeTest):
         self.msg = ""
 
     def getMachine(self):
-        (status, output) = self.target.run("uname -n")
-        return output
+        return oeRuntimeTest.tc.d.getVar("MACHINE", True)
 
     #get some information on the CPU of the machine to display at the beginning of the output. This info might be useful in some cases.
     def getHardwareInfo(self):
-- 
2.1.4


