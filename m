Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2F760853
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:03:08 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id pp5so54052255pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CfOHnxTK1JXKERrpPgcLu8XiJt7NGfKFeZD2uv5qhLI=;
	b=bFNOGhJtZVJRNMZ1tm2dGubeFtD2mA+K0kj40wURy61/a/OuhKmw3Wvhgw6N8b3kWU
	UYs6OOwUMNKXF9+y99H/GP6OL7wdCQcYg3sm20zR27Q9Awem9vnRXknVlLhrahCO4AmI
	EgTyJFm3aRX2qjh+JAwT/s0gdJvge/IPwsGUMcv0PPrkRk3gsfNjt1A3uyX5AZnGbsMw
	G04v9bZnA70vP6Ha3UJ544yTnkchmqdJJy7CGOjrVXvhNpEyLlFoeM0rOysFvO63cGl7
	5HKcUGg6XrBrGwsk629bB0cYfOzwosG7VNQiCQ2Yj5lw7Ljy4+QoMHNPiF+XhEoorhjV
	r+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CfOHnxTK1JXKERrpPgcLu8XiJt7NGfKFeZD2uv5qhLI=;
	b=I8cMJhRj9k+a3Xu0iA5HrZeVA019VIgNriJ2w/d1KeNDsxkZRJzHuD0FKlM15WcL2S
	3xaWC+oJeW3nStXiwqxVeQ8wSmvG2zCvbZljRyZ63pbLZnSFuSeu/q9uxTAILwQEXJv7
	OLHE5SCvfkSzM4AbAz8wmkdPoRgkMqK0akPmWbxUMYukL4KhJYHpJ/lbDW4tiIKaX4M8
	DJ8HI9bgo4kX1d170gDcPcr4YjlDLMBUXaGGKczWBgqLFcwAnLUWmj5+aTolC7IdvDJp
	3DoDJ6NXGunYEfMoeV6r9JZswLRG0s5JFgvbNT/raaHEshVVJJNFUBk6pv/bAr/icdPm
	v+Rw==
X-Gm-Message-State: AEkoouuQ4AGJfeDNtVb0ALNG9UchKcS9QXHdVTurdpRc9xr9pIICJ7Ue9U/UBFKknDaER2pW
X-Received: by 10.66.24.148 with SMTP id u20mr3475822paf.72.1470067388993;
	Mon, 01 Aug 2016 09:03:08 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	q4sm46807076pfb.18.2016.08.01.09.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Aug 2016 09:03:08 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 09:02:54 -0700
Message-Id: <1470067375-24907-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 1/2] Fix random python backtrace in mutlilib handling code.
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
X-List-Received-Date: Mon, 01 Aug 2016 16:03:09 -0000

newval is not defined in all cases. Set to None and check if it is set.

  File
"/local/foo/builds/x86/layers/openembedded-core/meta/classes/multilib_global.bbclass",
line 90, in preferred_ml_updates(d=<bb.data_smart.DataSmart object at
0xf6fd528c>):
                 if not d.getVar(newname, False):
    >                d.setVar(newname, localdata.expand(newval))
             # Avoid future variable key expansion
UnboundLocalError: local variable 'newval' referenced before assignment

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/classes/multilib_global.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 67dc72b..11ae268 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -72,6 +72,7 @@ def preferred_ml_updates(d):
             pkg = pkg.replace("virtual/", "")
             virt = "virtual/"
         for p in prefixes:
+            newval = None
             if pkg != "kernel":
                 newval = p + "-" + val
 
@@ -86,7 +87,7 @@ def preferred_ml_updates(d):
 
             # implement alternative multilib name
             newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
-            if not d.getVar(newname, False):
+            if not d.getVar(newname, False) and newval != None:
                 d.setVar(newname, localdata.expand(newval))
         # Avoid future variable key expansion
         provexp = d.expand(prov)
-- 
2.6.2


