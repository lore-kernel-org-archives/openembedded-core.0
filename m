Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D33A579163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 11:52:26 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c14-v6so4970622wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZiIlZMOkNyAYxMhgGP0yzhrDTo1HMTnJs9xTO01nhPc=;
	b=SQJ447Zw9HfvfsX9d2wXe1/PgrCeAUX6mF31O3qaWyEGgDitMvuSO/dQ5a4sBBZ7I5
	qLKkPPLJ41XG6U/YGBwUzdXnyniQmWnHk7bzMlumyVzhBTypf+GAmu/YHBjv6SP+Tqug
	GyA5F1YuQuGFeApOQHuOc6/gYN9+4neGxaAZtaknF39r+1d0eQmul2OQtgEsluqfFJuG
	xh5KxT15JLr4KdpcpVfTLqb5Qr+KNWz/7PBcje2XG8BD5qasSDkk22QxYGfdquLVY8Oc
	h33LKUkOdrfaZKUH4ck6rdp0oCeUlXVCcJcYWU2Z3aD03FWehPWapYzvMSvsUfE7dc8V
	1HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZiIlZMOkNyAYxMhgGP0yzhrDTo1HMTnJs9xTO01nhPc=;
	b=P+XyEElkDp8qp/6j2BSzsH4SKujpL0kpmajVZvUQAOzbTjznCfOdFbBE2ZrmQ+cVtj
	4PRFmb82x1taDxfsq9Mg1reMqw6F2kz3Ahe797JfTF9TyX0UrLkNzPQED/BiKtWvUK1n
	A80T8BWyvakN1xfCk7CMXdYDmaAlDHGFoKnUyriz5xEmztBHOo09Rz7lSeGuE6ZxKGIH
	NWT4q0dbOiwoB3JYpVjrzW/laMaH53OQVM4bQSW4uEtoI1ez7CVFVqXi5mQhDi5q2yRR
	Aa6019sYUvZkLuHv8ZIJm8WeB8WHoZKmZt6lnpZVn6AjOecwidcGOLbZvP9y28SlhzxK
	SxpQ==
X-Gm-Message-State: APzg51AE6udPSNfbO5LwDaUm92LqJ108tPZAwcU8UmDkKTuVMG7VcFfT
	PjCPxoIR6tQyxdKe8YQjc1V8z0PaJ6M=
X-Google-Smtp-Source: ANB0Vdaane+HBUPPzZ87Vorf5oRml3D0iBtWqb7otEPeV3+T1nrg71leBVOOPqWTIUPAFW7MMJJFBA==
X-Received: by 2002:a1c:9616:: with SMTP id
	y22-v6mr4514739wmd.72.1535716347232; 
	Fri, 31 Aug 2018 04:52:27 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	t9-v6sm24313516wra.91.2018.08.31.04.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 04:52:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 11:52:23 +0000
Message-Id: <1535716343-27025-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] sudo: Add missing dep on virtual/crypt
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
X-List-Received-Date: Fri, 31 Aug 2018 11:52:27 -0000

Ensure we have virtual/crypt even if building without PAM; fixes:

  sudo: error in /etc/sudo.conf, line 0 while loading plugin "sudoers_policy"
  sudo: unable to load /usr/libexec/sudo/sudoers.so: /usr/libexec/sudo/sudoers.so: undefined symbol: crypt
  sudo: fatal error, unable to load plugins

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- include virtual/crypt unconditionally so it's not just satisfied by a
  transitive dependency through libpam

 meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
index ab9c8cb..ce32bd1 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -10,7 +10,7 @@ PAM_SRC_URI = "file://sudo.pam"
 SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
 SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
 
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
 EXTRA_OECONF += " \
-- 
2.7.4


