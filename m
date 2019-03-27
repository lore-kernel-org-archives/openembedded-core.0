Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2449260116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 12:47:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id h18so16666907wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NoRjEBsw6JD511ao/UMfstQqLZOC9/Gy9/Pwy26j+qU=;
	b=DIERSuk+g3bAxcRCOZMf5v4pb/IETIPpFzFkf4YM8tx4RY/z6vwbLm0MpVyYBCCDnh
	WLXbWLX2vyzQI6HlhhUIMtoD/ZarsdWcSsbVPeJfkHCes1nH4bvEM2O1DRr7uT78b44A
	5WhRNqbvKvBHmeqyyrT/k7bfxnvBxc1CaT5onUJ7uHhpGZ6vaBy6TIs5w+/RWKzksjqE
	XgQe4/E+Xkd0INnzRvTQKUT1Qbj9f3kLt5OAnwgIKG41myhqsL064uSEXTVXQ4B4VKvz
	j9oH435ytUzWDcx/lowYm3zMj3wJRC+gV7mc2BYKw0x/LuYAajJbGPf3TyAN6VGgDcWb
	txMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NoRjEBsw6JD511ao/UMfstQqLZOC9/Gy9/Pwy26j+qU=;
	b=MLOzxgUQSm2E78AcGhg7e+JWteMVIxFr0sIil6+M9H5gn61g1hP1k1QSKbauDf4vti
	n0zRTAqL96Vzj3U65W6Bfbq40L4F/fsOSdmi8kMlaZNNa1GL967zAmBddC1XYisCceMi
	t2R9lyABuuqnjY4Pznc4V6CqodPuJfWz7faSrAQRyUWmpNVCPUlMWcoUvWxGVexAN6oV
	ywQEWEKujPMt/mtKWmqCcDgOBgxJOpY83ZIfI7iVqedjVHhkFpxrr5VqmRqJt3J6hc3E
	QGei2BGWoiUy7S06LaWSSXcCtMeLm+blR5PisqgKKR13oNnMHhG28A32SZsqPw0fjUuo
	OTsA==
X-Gm-Message-State: APjAAAUYim7s+XTlcd90Yn2REpPvmopGjo3sjrviv8ezwvyNqeKYtvUz
	jzGY1ebuDGVHQl3ZYOm4N+xdj4B/
X-Google-Smtp-Source: APXvYqzzO4zu9fjmAVn8vTRvhh3FWX9zCMIetDb72Ubw34zwlNA3KdVAKsY0P28taTZFkTgv0N+jUw==
X-Received: by 2002:a1c:c18d:: with SMTP id
	r135mr17896648wmf.112.1553690832393; 
	Wed, 27 Mar 2019 05:47:12 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.2.55])
	by smtp.gmail.com with ESMTPSA id
	e9sm19395179wrp.35.2019.03.27.05.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Mar 2019 05:47:11 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 13:46:51 +0100
Message-Id: <1553690811-26575-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 12:47:12 -0000

libpcre2 is needed to enable grep option to journalctl.

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index a12b9ab..9e05944 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
+PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=true,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
-- 
2.7.4


