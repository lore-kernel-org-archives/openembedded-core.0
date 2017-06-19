Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5B9780BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:12:46 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u195so61391525wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=65D+QzKfz8NqE4b6ybZUL+M70I/yvWbk0DeBCki7D+w=;
	b=LDpGK6vkqVci5GPm9+RdIWDN8J9oPZIlmOtc1nekn/ZWUiNFhSPBfiKrvSh6hPtmp8
	aa0NmEjQ14E63HdCDyV9XnlI/jPyjrLIMls7x3zqD6hQnhFk1/vDw4vQa8saGqts8nN/
	717OxkNhNu/T+bZ1eb9AJQr40jv6HjjNF343mato58BnRVMFrQmkz9awJsdXLgKY8lAw
	Xi3zf+HeMWt5K40tUXgTH/AWQRQ0wyOhXJpC7UTrACP1olPiEm5exGtnY34PFTTMKu2M
	FwVS7DFPfw3hjrNP7h4LQAH8LCUtFngiQ/vORQIKN52dIdjU9TywNaXYdr87s5xuLgFS
	ASlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=65D+QzKfz8NqE4b6ybZUL+M70I/yvWbk0DeBCki7D+w=;
	b=jBwVAyNqmy9N2xQsRG9a1+TmiC4jd97qq7IuuNhXqbLroBrSlx+tune/3kXGpF8rLt
	+aFO+NFcoa8uy23YGuuRN2oVpXg6zJ9n853OYIz5I3aPamXTPT7+vxSpRdv1zx2e7FnT
	bmaWrL37yYDfK7U+HAvt2wC992Y6t8EssL/S0/fik4fex6+HaBUhJFUHaudk1rFgdxYt
	x1gOUaeLcE2WdV59jqbmRr3hz1lrXPoQ28/tzRgKySU9Nq7uWcqhW21RMRXRjQKvMjSh
	XFGUPyqSWYO4YYLdTRXESgnZxaUKMvAofI3OUDRM0LnDRW+c1sA3CSjlYnNz/4ZOsQHz
	UxfQ==
X-Gm-Message-State: AKS2vOxnDOckb5zJ43lP/oTCoKscQiF/Z8PFW980CZH6MjYE6enAfDk4
	m1lsDZ6kuP6mOYLp/1c=
X-Received: by 10.28.95.214 with SMTP id t205mr16288120wmb.90.1497885166985;
	Mon, 19 Jun 2017 08:12:46 -0700 (PDT)
Received: from zeelaptop.luxoft.com (h-79-136-12-196.NA.cust.bahnhof.se.
	[79.136.12.196])
	by smtp.gmail.com with ESMTPSA id c55sm7996108wrc.7.2017.06.19.08.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:12:46 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 17:12:07 +0200
Message-Id: <20170619151210.7692-2-zeenix@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170619151210.7692-1-zeenix@gmail.com>
References: <20170619151210.7692-1-zeenix@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 1/4] masterimage.py: fix issue with calling reboot on masterimage/DUT
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
X-List-Received-Date: Mon, 19 Jun 2017 15:12:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

On systemd systems calling reboot over an ssh connection doesn't
return as expected causing an exception, therefore wrap the call
to reboot in order to avoid this issue.

Also sync the filesystems before rebooting cause otherwise, it will be
done as part of the reboot and could take a very long time and testimage
will fail to access the machine. This issue was observed consistently with
one of our rootfs at Pelagicore.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 9ce3bf8..4525408 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -108,7 +108,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
             time.sleep(10)
             self.power_ctl("cycle")
         else:
-            status, output = conn.run("reboot")
+            status, output = conn.run("sync; { sleep 1; reboot; } > /dev/null &")
             if status != 0:
                 bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
 
-- 
2.9.4


