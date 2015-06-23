Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 41B1B74056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:24 +0000 (UTC)
Received: by wgck11 with SMTP id k11so11547664wgc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kMV3JwUmmticmRyLe0Gdknoh+ZkZWxBhSvQpxeDPBXA=;
	b=RNNwvV6hZVfLo7+yRuBX2bLFo0xfNFgiYAk8a5sf8N2XRROpbPsyHMLdotMiRiJ33H
	Ltqgu2MYYptZmnU7Jxa2Kx5REcxn3M4fxwnXMRnd6N3rXtSP4rLFeH8YV5D2PjjAwjpW
	HYqT0RSROiyR0/aHXIfoTf8w2VOhvCTJF+JErUtZlxNE8wJ+q5kHe4q/7h1474rfOCEp
	+TI6GCYmCuirKt4+cWdXmpVNn1o0lEqB/rU8bk1fcOvgX5m1hqKYhEbPPFe6EBQNLfvg
	cOvqEQEUlU7GV4LAXjBoDimvduHSshuzlIxVSGAE7+BhI0SXhZodNT2E06/oXg0iBiTT
	yU8g==
X-Gm-Message-State: ALoCoQkcFKUpOIiabRM/Vcpu4vT+U+4x+jQMA6C/noEPYBUUX8t0CUlaJN6JOeEsjLWnrcS/2T87
X-Received: by 10.180.86.234 with SMTP id s10mr4027474wiz.50.1435070125697;
	Tue, 23 Jun 2015 07:35:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:06 +0100
Message-Id: <1435069807-13557-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/6] weston: fix libdir/libexecdir confusion
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:25 -0000

Weston installs files into $libdir/weston and $libexecdir which may not be
identical, so ensure both get packaged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.6.0.bb b/meta/recipes-graphics/wayland/weston_1.6.0.bb
index d30e48b..74ad816 100644
--- a/meta/recipes-graphics/wayland/weston_1.6.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.6.0.bb
@@ -79,7 +79,7 @@ do_install_append() {
 
 PACKAGES += "${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libdir}/weston ${datadir}"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
2.1.4


