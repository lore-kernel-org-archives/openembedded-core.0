Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDE171AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 17:00:08 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v72so7123429ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 10:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=z1u33QOFSUTuN9aa7pIyM3tatObq8jSJuEGFeUCylXk=;
	b=A8wwGjgPN/d3G0dLqU69gg8GF6Tw/j+9cl3KCr+akGJtG7gE4zujXjFOxA4V6wvoM4
	aD69w3OFMWeuzTfB3FHKVHCJNF4yYuJKpVNkExMdbGf7hLWLzxoodtMVRC/8Jib1Fqmm
	swWs8rYZNWvtuTw6BxXdOJo910O/xp/BWEoUK0efBkohr6jH/TeV39gsVdUd3F8IMX/8
	bI+eDC4GfIsIFCgnwXvoyiaHw/MFx+7OVCVO+HyjGvYTxkjsNVGiij4Lloim4c/AjXSM
	JOemBoa24TvtbgkzltmPoFssaOLHKRSjA6mDlnRKn72nuaI2E8l6fSrxVT5uU8vo7NvH
	yjmg==
X-Gm-Message-State: AHPjjUi4BQYg1bKxVEJ9kTXxTmWyvxqXZVQ4EPKWM3f/0d8oZ3uf/LGP
	adN42q/ElCHkJdrzpTZzAa5E
X-Google-Smtp-Source: AOwi7QC18YHTF6hRPOwfUJSbUw9jDLTh799EDX1xe81pFvNdsAYhghY+lWvRex3fFbdRh9TEkf5pjQ==
X-Received: by 10.129.34.198 with SMTP id i189mr1372932ywi.395.1506531609030; 
	Wed, 27 Sep 2017 10:00:09 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	v132sm4780255ywg.15.2017.09.27.10.00.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 10:00:08 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 13:00:09 -0400
Message-Id: <1506531609-5917-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 17:00:08 -0000

With RSS we need to ensure that when making a bmap image that the
python3 that we created is found via /usr/bin/env rather than the host
python3.  Otherwise we're relying on the build host to have bmaptool
support installed.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
I played around with a few ways to try and fix this problem, and this
was the best I could come up with.  Once this is in we need this in pyro
as well as it's broken there too.
---
 meta/classes/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 61dca626311e..3ff960e3a889 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
+
+# bmap requires python3 to be in the PATH
+EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
-- 
1.9.1


