Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9B360D3A
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:16 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id fa20so3090366pjb.1
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dnuRhV5rMWMZvSBv5/CQtW553W2n1Yer/Tftu/YyHpI=;
	b=YZJlZD4ziOnRLg1/ZcP4UjYfRftdfjTOeO8GKWKwDrCCqYkVTpG8zpP7eDxkpNPPLa
	AirKxnCnzzJ12cDSbKg+jbWFftBQXkkYzsJ8dB+mHRypLCNdRevGt8Egz8xaUkKmBZNc
	uV/1H2d2skvycBfG6K+QN5dt4U8HL/OxWm0qxZNrbRrmg/uz4QPUERp8cpZzq268QEaN
	tXeLqgViGN9FePhKKUm16Zv0r3/YmmnNIPm0oEBw+q/Xu38UEOY2b/3nEMMu2Wn2PfSw
	v6bkIbD8LVEiaKOtBg0bdo+/EUxo7A55RWItx0DmRBhqRRhAqKofEXNI1Yy4PMbbvXTz
	ewhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dnuRhV5rMWMZvSBv5/CQtW553W2n1Yer/Tftu/YyHpI=;
	b=lFpX6hIeQrZpjaDs76IOhjmCXMAGH0hm4QPPJqRvBfmUayudH/5v5zkfU/4RrIMWOJ
	fqJjA/QMVq2WNhdUHCLu1QcEow90sHnpp2zOnMduhRc8t7wrFxx9yw21ziyesrvzaLYw
	Yw/GfBNlj2h5PMvU/ud5IXFoXI5QUEsKMwg7uKw23GaU9L2hiS9/g4/ulNwPFhCxfdCj
	A0Lz7ItKZ8kJ3XEm3l07nVCvWiTnZ4iES33RlmZR7Uk646cD3BauSthlR+SuQpy2WbEU
	oxVwIOZgO9scf1qZ5cVgbUlNM8i/3W8R0CFEWFe6if6hwJjX6j6qFNF0dVXqZvK0W/36
	FstA==
X-Gm-Message-State: APjAAAWwJ17ndTfh1dhtNU21eGpNLtpCiaPaXrjhQEm5xXEfpIpOx8bT
	/glTGE6X1Dw22XVMay7iYdx1vw/t
X-Google-Smtp-Source: APXvYqyU9UbDnZp0lrtzuFNw36BLk0dxDtQeStRVOpFhOv7H0oW9WF5J2Y8RXa2caOirw/WXPxgpUA==
X-Received: by 2002:a17:90a:6c26:: with SMTP id
	x35mr15528028pjj.126.1581264617954; 
	Sun, 09 Feb 2020 08:10:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.17
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:46 -0800
Message-Id: <184fd10f91d3f77c7f0726a4672c66678250762a.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 18/29] libidn2: Fix reproducibility issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:17 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous tweak for reproducibility didn't handle the duplicate
whitepace left behind, fix this.

[YOCTO #13771]

(From OE-Core rev: 0392fcbdc85180581ce7392212808ebb822cc2e8)

(From OE-Core rev: ca213de432d8d9d715ef09e17cea2aa1e6666e91)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/libidn/libidn2_2.2.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libidn/libidn2_2.2.0.bb b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
index bcbfdd85b9..71314149e1 100644
--- a/meta/recipes-extended/libidn/libidn2_2.2.0.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
@@ -22,7 +22,8 @@ EXTRA_OECONF += "--disable-rpath \
                  "
 
 do_install_append() {
-	sed -i -e 's|-L${STAGING_LIBDIR}||' ${D}${libdir}/pkgconfig/libidn2.pc
+	# Need to remove any duplicate whitespace too for reproducibility
+	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfig/libidn2.pc
 }
 
 LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
-- 
2.17.1


