Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 09B9279585
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 21:54:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z25-v6so6283789wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8+Sr8D+ImZHbm310BW7WwCLLvg5gP41qmfAdfQ8vQOM=;
	b=hKKWJ+UwxGwsnZceX7RVVmss1vYN3NMJ01rgsUXqM3QlqadjF+MUw4Xg78rthEjSzn
	zycP+DEz6EaYWdgP0FCFOcrC0MB+/AMsPA4D0V5zoUziguU8ETnuXmuO/kbjP9Bc7mMv
	fxm4b4r0yhFO2/8XECjeWb44IP8QHXUGsDDRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8+Sr8D+ImZHbm310BW7WwCLLvg5gP41qmfAdfQ8vQOM=;
	b=KQDyVY79Ac16s8s8gPe8iZgmVr318VOJLUhYwqxc/Lrh7vcnO0vgjT/kUEzfGgEVUl
	X0qzWOIbfHsy16he/4dRyJehEYT7Du6yJsnTXf1R4uTsciIPcDL1ePDk1uDqOwVU9Muk
	Py0Dh7XF4ri17bKztOPE/0PDNahf7Ba1Gecc9dZC+d8SiIpVNU9HsW5KayWxBFljTKKf
	ap4Vkp7NtRc80/kfqg6Rzc7B6Jn6rTVC3JMe1ZRvTHJ21iySavh/MhCke/pKV+p9/Z/a
	e2SbCpYg24MPMfiSSjA+En0cfpQMzpxMts79h3R+jCrn0RPcM8dI5b8mhQLrCfXt9jsK
	ITDg==
X-Gm-Message-State: ABuFfojKB4ogIc6NbLrOFOA2IWM7ik+4jx6sfKpdFnS7fBwIqN6h1R+M
	XERCA+UAt1IMzP295oGYdndyrA==
X-Google-Smtp-Source: ACcGV60O3vrMoKzkXiflYNPPPbXDMcloDWTZKzgG8spsTYA10tMStRPsvQHDePVnU6rUKVSy6hXtFw==
X-Received: by 2002:a1c:9a4a:: with SMTP id c71-v6mr585388wme.71.1538517293465;
	Tue, 02 Oct 2018 14:54:53 -0700 (PDT)
Received: from localhost.localdomain (rqp06-2-78-234-158-225.fbx.proxad.net.
	[78.234.158.225]) by smtp.gmail.com with ESMTPSA id
	v21-v6sm31155442wrd.4.2018.10.02.14.54.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 14:54:51 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 23:54:45 +0200
Message-Id: <20181002215445.2498-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [sumo][PATCH] checklayer: avoid recursive loop in add_layer_dependencies
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
X-List-Received-Date: Tue, 02 Oct 2018 21:54:53 -0000
Content-Transfer-Encoding: 8bit

When Layer A and Layer B depend on each other, then we will end up in a
recursive loop in function recurse_dependencies(). To avoid such situation
before making the recursive function call we check whether or not we have
already processed this layer.

e.g. without this patch, running this script on layers with dependency loops, we are seeing:

$ yocto-check-layer -d  /srv/work/oe/meta-openembedded/
INFO: Detected layers:
INFO: meta-python: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-python
INFO: meta-filesystems: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-filesystems
INFO: meta-gnome: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-gnome
INFO: meta-xfce: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-xfce
INFO: meta-networking: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-networking
INFO: meta-initramfs: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-initramfs
INFO: meta-oe: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-oe
INFO: meta-multimedia: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-multimedia
INFO: meta-perl: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-perl
INFO: meta-webserver: LayerType.SOFTWARE, /srv/work/oe/meta-openembedded/meta-webserver
INFO:
INFO: Setting up for meta-python(LayerType.SOFTWARE), /srv/work/oe/meta-openembedded/meta-python
DEBUG: Processing dependencies core openembedded-layer for layer meta-python.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
DEBUG: Processing dependencies core networking-layer for layer meta-oe.
DEBUG: Processing dependencies core openembedded-layer meta-python for layer meta-networking.
...
...
...
[keep repeating]

This patch fixes this situation.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 171900b4bcb06416685ce90b63114a10fefe0b94)
---
 scripts/lib/checklayer/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 2618416fab..7788041843 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -167,6 +167,10 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
             # multiple errors at once
             if ret is not None and layer_depend not in ret:
                 ret.append(layer_depend)
+            else:
+                # we might have processed this dependency already, in which case
+                # we should not do it again (avoid recursive loop)
+                continue
 
             # Recursively process...
             if 'collections' not in layer_depend:
-- 
2.19.0


