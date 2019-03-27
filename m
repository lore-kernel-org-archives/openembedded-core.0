Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBA67D088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:45:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w15so584198wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=23D8KDjWtzE06FUHMoJ+RgL8hmgoQN67i2CiHAeb2Rg=;
	b=c6q5vnNs9ByuIm+TTIlwVgo4p3hcSgkjTqkZyF+QEoDEruUoqF8qjt8C0hkSQFEKzD
	Vc8KTlenj3OjOkkVCcjDVAvizhBoB2sOHqfTFqhMA0gKPp6vTaIkUAWabyo1FHWHCeW4
	3SJsiKVbcF3f3O7NNB+z2QTBk7TMN9Mtg/V1FpT7UyR9oaJ2CdMsvV2zcLat57hO/TvP
	5PbKrlIeuRy92fhNq66i/8hIrSZ8uUeGnRyAJ8OoDZIx+jjxJTVmVLKQgMONIejZO7f+
	nD2ZjCDefOeVMZmf66RnxCEkPAqGqnlbaTZZEnbm/MdPNcq7RTgFyQ+EE49jqmlpA22J
	+zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=23D8KDjWtzE06FUHMoJ+RgL8hmgoQN67i2CiHAeb2Rg=;
	b=paFGZiabUjr0XNkpo5JcAbybpa7KGujW830krESszhiqwcUT+0sSkfoUYvg4pjOGdh
	QwsUynD3MO1Hh6RmVZl0VUaGnNNuifU5tcEkdGPDGJl+WQbhmEWEypXJpRjQ2OL/+TUZ
	Lq7CGyLkX0hBJ4Jdd6wI3vHNvxjSEfowzG4d8GyVtaROVWvjiHCDTPxZ2hyJfwb2ow/b
	RnSfxB+O5yWeKOpeF4F/EPnlpHDPYwL8emXsp2Hm1T7JNcMfPK0v122xv9V8f5xsWKWy
	8fXSp5MlZ/o5JKJ7WGntU/V4HJYgx+URNB8XvDnxy1LRjCzsAd7rxxaA87wDn5I0+Y2u
	Mxkg==
X-Gm-Message-State: APjAAAXn7d+1aCauJFAcwgDZ1vHB6dYccThZQUMxyqMeYlpX7shRRmCN
	wZmaMTsgzKoMGhlNwRsl6WkGWKb4
X-Google-Smtp-Source: APXvYqyytuOO8ZhtuVY7JtGSavuv41DbBfsC7ck4Kn4qk+djFufc34z3wYlkzJ1Ghoox8q1esq+W/A==
X-Received: by 2002:a1c:b702:: with SMTP id h2mr12106207wmf.94.1553701519243; 
	Wed, 27 Mar 2019 08:45:19 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1095:d009:ce8:edec:2e63:c571])
	by smtp.gmail.com with ESMTPSA id
	k4sm15593396wro.33.2019.03.27.08.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Mar 2019 08:45:18 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kiernan@gmail.com
Date: Wed, 27 Mar 2019 16:45:11 +0100
Message-Id: <1553701511-32475-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 15:45:19 -0000

libpcre2 is needed to enable grep option to journalctl.

Changes in v2:
- Fix false case option

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index a12b9ab..bfbfc81 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
-- 
2.7.4


