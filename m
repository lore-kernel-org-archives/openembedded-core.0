Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E196747E9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 13:39:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h10-v6so5186714wre.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H1xHZ4FWeAsK1RdqRh/atUHYugioGh3QmPt0Vs/YX6U=;
	b=nhOvowQISRn7TDCVPYDd0Io1pMx+JGIAzsh73Ca9Sdxy9Agxfy6q/BzY2Wc0UeiTqr
	v0fJ+ahOaUEBC/q5BUYa/kfYOwb+B4jNiaVWPn16z3sk+xwsk5Rk+3xgyKSMQSEUfzcA
	kSU3fY9lAsRCGN4QoxoH89I1ySnUrfqrBsDRusPPdIrO5CxZH97oWkE6ubSuI7ume52A
	fXrH1E3MjZCYQdML63iZAia5lJibCNt+PLAarqRpHCYpOLt3S2qtY5NzmLpRMRKhNz+3
	Neya0WFdX/eIYHAvVBIee+5CiEfXlC8WP2Cf5KIv1TjOTVKnTomKt4rnSqf+YXDGJeJd
	D7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H1xHZ4FWeAsK1RdqRh/atUHYugioGh3QmPt0Vs/YX6U=;
	b=U/IUmO8ZAhFzj7cPyhc5/x5V49XSUxvHzoVJjqa0vDQUc58sSCkY1ZNGOePlZGKukj
	XTv8CkMKhIIJv6pci+5CYP+jooWFykavZBpjJEbYGoKT7Jq3q3zT1UAOEhWZz1nbraUj
	8NHHSdtGbVFT93fbjrbiK+lXr6w3uguXZuoR3fkajdVNCaOjXz0kZv0WH+tlJyAEJuXH
	TaTCb7i3PPgtGKUBz3++RUx05nRSg/hm3z4CiL0+Lv6E5Utyzya/TtH7XstoCcVKBwpe
	0p4+zuR87I4uX5UleZcHIMknB7dre/ROgsg4ANvkpcSKPSEu+BIlfmzhiTKQALOB82qm
	MZqQ==
X-Gm-Message-State: AOUpUlFQvL17RzUgiXAHtoTvDFBladWezafcPUyqr1ZT8i8M9cBp9lje
	e6AEWKXCMUusN1l/G1gtlyb8UkR5
X-Google-Smtp-Source: AA+uWPy0ks573nhF4cgw6Z299LXD6njgdX6eCDT8yPkbtJP4EEWoux5dvj938xleBHpbSprfwkNCOA==
X-Received: by 2002:adf:e584:: with SMTP id
	l4-v6mr1414968wrm.190.1533821986009; 
	Thu, 09 Aug 2018 06:39:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f23-v6sm4572224wmc.42.2018.08.09.06.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 06:39:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 13:39:45 +0000
Message-Id: <20180809133945.26779-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] man-pages: respect api-documentation
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
X-List-Received-Date: Thu, 09 Aug 2018 13:39:45 -0000

* let manpages.bbclass to enable manpages PACKAGECONFIG based on
  api-documentation DISTRO_FEATURES
  PACKAGECONFIG_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages','', d)}"
* it's true that building man-pages without manpages being enabled
  doesn't make much sense, but it's included through couple
  packagegroups:
  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb:    man-pages \
  meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb:    man-pages \
  or in world even for people who might not be interested
  in man-pages

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/man-pages/man-pages_4.16.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.16.bb b/meta/recipes-extended/man-pages/man-pages_4.16.bb
index 0fa124fe7c..a64587cf0b 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.16.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.16.bb
@@ -14,8 +14,7 @@ inherit manpages
 
 MAN_PKG = "${PN}"
 
-# help manpages.bbclass deal with RDEPNDS and postinstall scripts
-PACKAGECONFIG = "manpages"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = ""
 
 do_configure[noexec] = "1"
-- 
2.17.1


