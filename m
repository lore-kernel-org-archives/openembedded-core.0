Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id CCF2960797
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:10 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x7so34421615qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=zhoKtJsKjmG1xKW1CCPHdX882Qst6GeG/WM+mEEWRf8=;
	b=kDga3UMWZJ4oiH/S3uI3CJ+DuCb9+q9gktKhyZCAChWkfecpHlT+WORmKkUNk3f+KG
	S30iR180QWYvwZHRsB2PN/gc7B8N6n440Z7y+Jr1U3D0DZ9NXpnn+C+CoXIB7GOvgBZi
	PygT8bwKYX239ykCc/H/tJNFH/ri0D11lgeFxqCMNjVagU0uNGS2bUo6apwq/42vRx6r
	S+wqKMt4PnDZpuv9Zd017UxdsB6HhGxsdegppBcfCtRgy7Tz3k3pOkp/BAgKVKw8Nvcd
	D7KFvZ2IZ9xIxhOREXHwTRZEFZ0UOAcAGICTGa/VmH9uqCzzBjHaae9lsQJHCBrIelNN
	hjCg==
X-Gm-Message-State: AOPr4FXH0LTwi9eUpY3Ht9kk1UIzeYFpzcwWBonIZ/dClsK33y08JVYajdJoGuOKL+0Tqw==
X-Received: by 10.55.154.80 with SMTP id c77mr11809705qke.63.1462402211118;
	Wed, 04 May 2016 15:50:11 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id e11sm2235846qhe.2.2016.05.04.15.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:50:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:35 -0300
Message-Id: <1462402180-16861-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 3/8] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Wed, 04 May 2016 22:50:11 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 653541e..4ad62cf 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -8,11 +8,8 @@ SRC_URI = "file://init \
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 }
 
 inherit allarch update-rc.d distro_features_check systemd
-- 
2.8.2


