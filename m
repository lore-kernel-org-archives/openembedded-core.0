Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6FF79483
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 06:32:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k5-v6so3575250wre.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=f909gphGLO0RWmpL9cf63rNbmUAY3ZZfhc4Q8B2TeEo=;
	b=B2rCrhTpakPWyjQAN1aZU5mJ4pkWMVjwLDkFqZi2ygRSQDfKwXeq8GCZUEogOCujD/
	tl2BtfGJoFjaw6owJZShxQW+G6Z8p6vqI+MpBGFz9HVLohfwCJ9noHa0tI3v4BMj3FV1
	aeMdI7WFjAwYBSdXVBijivakpGCfLSel3b9WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f909gphGLO0RWmpL9cf63rNbmUAY3ZZfhc4Q8B2TeEo=;
	b=PDxk2/1YhAckoW4YafIOOVnKvnf0nzM51ixcQaP1RL0iD3EzXqjSSIGKEWmJAugKc9
	OU30lCo2dCl8ybBcwe32xxhMgIRfyuTJDN+MgJnFdOKAdSdRsSg9EzVxsGyIIqyhqpBp
	Evmsdgdxw7HqPtvUFIK7JCOj0roftxiHhohje/RQnlBy40sRZEltcWcirwEANlLrKglW
	rxx/eygHN7HJBFnhqNq83cHy+aGVlEQwpvaFpZfeDaiYwsN1mHCFXSScoz/DAbjr26kb
	jPWqwnJNa6Xx5kIsqfTnX98R/KxOD11QdvG+/c+sCvE5NvE3GB2cplIk6x4RVR7Ay1B9
	noRQ==
X-Gm-Message-State: APzg51CdYDYJyG+pMIJFIPmpX9FHxcja1hCymnEIPyKqIwe651b58750
	Tnb8GGFlwdyRqaE5DXSlOMv1Y8XbG6k=
X-Google-Smtp-Source: ANB0VdaOD1NbU9m3Vdoj1PsdZXL3QgxOp9xFg2W5kZvVDnMkfc7iY4XqOkMHpNIXXT1rc8wEgIjHvQ==
X-Received: by 2002:adf:e14f:: with SMTP id
	f15-v6mr13468556wri.42.1535005937745; 
	Wed, 22 Aug 2018 23:32:17 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x125-v6sm4456779wmg.27.2018.08.22.23.32.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Aug 2018 23:32:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 07:32:14 +0100
Message-Id: <20180823063215.24514-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] oeqa/runner: Use the proper logger functions instead of print()
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
X-List-Received-Date: Thu, 23 Aug 2018 06:32:17 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 6650a63ce73..73f41d9f1cf 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -54,7 +54,7 @@ class OETestResult(_TestResult):
         self.endtime[test.id()] = time.time()
         super(OETestResult, self).stopTest(test)
         if test.id() in self.progressinfo:
-            print(self.progressinfo[test.id()])
+            self.tc.logger.info(self.progressinfo[test.id()])
 
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
-- 
2.17.1


