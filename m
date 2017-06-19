Return-Path: <zeenix@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E7FDE780BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:12:49 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y25so11861692wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BkzyEHHZECEdrb58CVvvhbjuF4GorOL7paEDCOV4QSE=;
	b=u3MGEBSvO/hn1NoNj2WMUv5ACI9nt6DToNeKac8FSlQOvmdPoBWW4m2A3W2IDWAH5R
	m5GKFStsqg5ZK2vKH+pA8AetGbOs6G0NbmEsIbFH+FZRm68qJmaihDy6/Nezm77cYox1
	Hl4o7dSEDnyDhYk6jrmqEnOjmKTcrz3cWkNtE4AG7+tMWMJdextqugp+jCr2OA5TEnys
	pFxy1nbZnWsm440GMym5yiAzBqkCQPHAlv/r+IwkeVyeeVuCIkJ6421N9jqk4pTdqCCZ
	IW+AetheAuU5O4x9u2InPv2DWCEWePPOQvqmIRutjXMFyk5n8egisqBfgS2yOu6YLd3t
	78IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BkzyEHHZECEdrb58CVvvhbjuF4GorOL7paEDCOV4QSE=;
	b=kyuc1f0aemGiXin+GbjwQoM5r0T5KCz0S2785Wzn58dJzOiGOYAxWCkVYLxw0A0fWC
	tv7Hr7ITwezE5tc1Likql2+5klzIdv/QJ0QYQd0k5CjBptclsTINBBLLTftInsh5Pgak
	k5TiiX8rER+B5LDspMWyXbgxnx8dvEPdrlBZBt9wVdhSKC5z5lu7IpBuI0bnwqqtXXxS
	FKbBDq3wx0rc/w31I/+nzJZ2UOKC3xVlUuoVDn167KLtHqAXfKlshT9Hs/0b1RWY7fEo
	/FXltV/NgalA4kIcFpjem6YG2Mslq+JCdqLGE/2d0HrWjUyDCzrIgzm0vH8S9XKCZf7a
	PomA==
X-Gm-Message-State: AKS2vOxDnlGfn7DAGePbLPM5vvRNHLYQXBWgfvSc7y0/MXmknWjutuP7
	I3fcA6yxq3CF8w6NP+M=
X-Received: by 10.223.141.146 with SMTP id o18mr13263845wrb.110.1497885170528; 
	Mon, 19 Jun 2017 08:12:50 -0700 (PDT)
Received: from zeelaptop.luxoft.com (h-79-136-12-196.NA.cust.bahnhof.se.
	[79.136.12.196])
	by smtp.gmail.com with ESMTPSA id c55sm7996108wrc.7.2017.06.19.08.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:12:50 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 17:12:09 +0200
Message-Id: <20170619151210.7692-4-zeenix@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170619151210.7692-1-zeenix@gmail.com>
References: <20170619151210.7692-1-zeenix@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 3/4] masterimage.py: fix stop()
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
X-List-Received-Date: Mon, 19 Jun 2017 15:12:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

The stop() function is called in the context of the masterimage,
so self.master should be used instead of self.connection which is
undefined at that time.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index bc783bd..1f87927 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -156,7 +156,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def stop(self):
         bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.connection)
+        self.power_cycle(self.master)
 
 
 class GummibootTarget(MasterImageHardwareTarget):
-- 
2.9.4


