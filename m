Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C640479315
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 15:11:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j15-v6so15982521wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Jc3pr93YNHYO4lL7idfhv4CsfP44Z9UYzI3WchJpayE=;
	b=VoJeJStwYUgBo1MCz/QTgFq8S3JRVxTUfxwRoOanmfXLP9xp6BucEJeZela1Ylqruj
	+SQ29nTjElQ7K3nJ42RKtUgr42gujDekyd5ORDZG29urKk++rIu13UAsJ/9j5lOo0Mf6
	+QoSc4Dhdi+dMJZW6HpBQY+Fmih7P0qp2MhAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jc3pr93YNHYO4lL7idfhv4CsfP44Z9UYzI3WchJpayE=;
	b=IeO/fXlaocwfpKrp/MT2qN9ryio7fccdFGGZm7WQWW9CTBFniUlvxVqA7kJ9PP2fEB
	/OhNZJTuyr+Fkvmc0HjonrVqtTVo33X8lay57RhEZu0xSt085Z3IOEtu9KiQufogUhux
	Af0C7WbYIDmJaULG2cBDz0IqMoAXQZlR1qv1IJJ3wZ+56RD5PJGa+vbutuVnZU2BVSVh
	LywxoDTUf3vijKJeFBScl5b0kcZw6HhtRgMNlI0bt5XZUSqzVotdpMoUyHgI/PZ2uX+z
	OMsxl30z7HWAj5Cp8TYJHS1YyYmI3F9eZPfxu4yP7w8KY4xhJGEnCNUqicO0WTIxeem/
	M+BA==
X-Gm-Message-State: ABuFfoij0GOuBfFoa3k0vwfzOlmViaQxl7B6WAblZdQ3A3huVSzq/cN3
	2WNHvwbT1yby1/lJIRAirIOrJrKVm77Hfg==
X-Google-Smtp-Source: ACcGV61jglIGou5EF5e/aXwmdloK0mzGP3HOdXjf63o4rK7gAOtMDfANk/GMkVk21rAQ+gCD1EgRcw==
X-Received: by 2002:adf:ad65:: with SMTP id p92-v6mr8485637wrc.7.1537801870826;
	Mon, 24 Sep 2018 08:11:10 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm4208076wrj.58.2018.09.24.08.11.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 08:11:09 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 17:07:54 +0200
Message-Id: <20180924150754.7737-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.18.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] checklayer: avoid recursive loop in add_layer_dependencies
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
X-List-Received-Date: Mon, 24 Sep 2018 15:11:11 -0000

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
2.18.0


