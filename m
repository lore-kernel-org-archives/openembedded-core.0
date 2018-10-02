Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0513F74500
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 21:43:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k64-v6so2801765oia.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UwAt+svAxvulX3rzmyM82n75OQl6JAD3EhSkJtAoH38=;
	b=i56DIOP28cggVa/QkJoLZ68xtQK32yVYjOOM9toDpFRTFCCsWuoKn/xxvjwgRQHhXa
	XYsF5MTuhIbMs6gSvRvKWsfcmbalUnyEctxQVnSNinfzIBQ+IFk3JWABwU7nMRVjftKU
	ZHpOBlPSdMLVZEly4CmQl3/K6gpajkrzv7YJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UwAt+svAxvulX3rzmyM82n75OQl6JAD3EhSkJtAoH38=;
	b=PewJe9GjFzfFDwoBXm95utXnYEK+ez3L33gRFbLM/LOrrLlqrNozXlYxjwSCmKrMRy
	k2MyuXcaToPpXNJHqwxgn5NIji6xi1ryKWJtpHsyvsmN5bdHc7t96oDiSKcYr/K0ZQRn
	KSzI2T+2XyYp7utTck1gQM26xIyYzECjVW6CsIywc2emPE1W6d8jENDcxq1vbMh/ClSs
	UKbNBMXksBVBAx8CIY7Xk3QjeH4mpY5zBWolyd3wZwrGs9ygXbNSJmr0xYzEkBFfWzAB
	qZ/NSrKvt56o3i8eGjDNHCXR4gxSBJsFFfbm401obHRPFqbhvG7wtzN3Wxb3COOdsVYU
	kHJw==
X-Gm-Message-State: ABuFfoiLZweyv+3GGTbA6uHewNSao489qwMMHLjrCyfu7DhCOYo21NF8
	gNXR7pdBbLKTfkpvWBu+3mMkIkG9D7I=
X-Google-Smtp-Source: ACcGV62ym4p8NQPXBTwru+LkURqkNNbLVLpuBc9dPyR9l03LFibOlbr9gckFjxyCdHmJQtraBhHG2g==
X-Received: by 2002:aca:cd87:: with SMTP id
	d129-v6mr7562530oig.350.1538516613599; 
	Tue, 02 Oct 2018 14:43:33 -0700 (PDT)
Received: from blackbox.Home ([200.95.170.218])
	by smtp.gmail.com with ESMTPSA id
	f15-v6sm6013341otf.34.2018.10.02.14.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 14:43:33 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 16:43:23 -0500
Message-Id: <20181002214323.14564-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] scripts/yocto-check-layer: Don't abort when layer fails to get signatures
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
X-List-Received-Date: Tue, 02 Oct 2018 21:43:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When execute in multiple layers like meta-openembedded the execution is
aborted when some sublayer fails to get world signatures, so mark it as
an error and continue the execution in the remaining sublayers.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 scripts/yocto-check-layer | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 5a4fd752ca..9b7e53679b 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -169,7 +169,14 @@ def main():
         td['bbvars'] = get_bb_vars()
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
-        td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+        try:
+            td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+        except RuntimeError as e:
+            logger.info(str(e))
+            results[layer['name']] = None
+            results_status[layer['name']] = 'FAIL (Generating world signatures)'
+            layers_tested = layers_tested + 1
+            continue
         td['machines'] = args.machines
 
         if not add_layer(bblayersconf, layer, dep_layers, logger):
-- 
2.19.0


