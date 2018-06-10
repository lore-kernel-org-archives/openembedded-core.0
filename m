Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id CAFF974DFC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 19:01:20 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id f1-v6so11066501plt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 12:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4YK2q6+V/UPGJNsXj/l1jgHsHX59cmvB2OQLQ1mFwPM=;
	b=Pn1LcEYpFffoikqRRR5WKwJ2AkeABudrj4C7qclzQnb9oNQtiu6yi9fXC6325hYxTY
	b/2uc5NhArjE6k6ArT9eqW/jT62GmAJpcSPuOzJgkkppVNOdUSMpXMJvaOoxGtA8jN1q
	vrFo6OW+pdctjvdX42Vx8fKXhIc2fkx5bhi9xvJWZLhIR1MIarSc50gBwu+nqYd8XkI1
	Qy0oT/OeHPqN7T9fc0gWlUTnxfA6QdYTTrtomW0U/JjPCnShCTnYVr2GcOBPCA+/2mlk
	3czjrbxR98Y/vAwVk6iogDKQjrRxP8geYlNBbM26n67cy4BZJ3A0pixjwJzqLNhvMEFL
	8frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4YK2q6+V/UPGJNsXj/l1jgHsHX59cmvB2OQLQ1mFwPM=;
	b=WKJ6hovDJ29wx+hQbJKOfc+3FXtRdqSOCUllO7Web0p1q3tFT+ymdnNhBlEuiwfksC
	baSh089/SEb7rOIkgbKd3C0lg76K5rnPcmfhEIEQAlrLfylfvfkKureuuZqYkW4UTvr7
	/p8M4y7SqoXRxfBq6v2x6yTUzcQcs5Y6cd1N105JHDPpNeqP9cU7inplyGKSzsH+53c8
	sIbYSI7iChCHFcClW6SyKOXBHmp9qUsNQGy2PtuIF7oqqD+gKPYup5VxZsuQYllmahLm
	X/JNlPAUzRPfL54JMei18LteAktKnMXfs6NnU2h9tiRdE6/EJ33SF7kQFxwMKx9D5keo
	Pq9Q==
X-Gm-Message-State: APt69E15wDPltwTk0rzekwMOgFDXNx5HFrhGMhmAczsqqT1V7vxplcuj
	h9Cth0DrO0U+0iV6oT/2mPWz2y7/
X-Google-Smtp-Source: ADUXVKLUVL3322uRpoU4McHiR1xIF81vmFcYDodd0j4gvUgbgEBGkpVJyRbN0c/NB04KO1+YBywqeQ==
X-Received: by 2002:a17:902:8a87:: with SMTP id
	p7-v6mr6768467plo.281.1528657281781; 
	Sun, 10 Jun 2018 12:01:21 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	r74-v6sm32848517pfi.174.2018.06.10.12.01.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 12:01:20 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Jun 2018 12:01:13 -0700
Message-Id: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] xorgproto: Install .pc files in ${libdir}/pkgconfig
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
X-List-Received-Date: Sun, 10 Jun 2018 19:01:20 -0000

* --data dir config option is only used to install pkgconfig
* Installing into ${datadir} causes mutlilib conficts on install

  file /usr/share/pkgconfig/applewmproto.pc conflicts between attempted
installs of lib32-xorgproto-dev-2018.4-r0.i586 and
xorgproto-dev-2018.4-r0.corei7_64
  file /usr/share/pkgconfig/bigreqsproto.pc conflicts between attempted
installs of lib32-xorgproto-dev-2018.4-r0.i586 and
xorgproto-dev-2018.4-r0.corei7_64

and so on.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 7a417c9..7377283 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
-EXTRA_OECONF = "--without-fop"
+EXTRA_OECONF = "--without-fop --datadir=${libdir}"
 
 UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto --with-xmlto"
 
-- 
2.6.2


