Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98DD87FCA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:00:09 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so31366703iof.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tkOXFD5YOsczRx0UVH0zQ7hgVqH/cEYSt48+obmS/7Q=;
	b=OvyQ+ROPuLOV+gkMhtSqogJt9LQtF5cMyOHxGDABMGvhsDCxCXTBc+hjlZAEzDv+M6
	YoWxt5nhJMCNrNQpCa5T1t/CAvv/kmO3JcSSTlZKLie83wnPOCJe4Ek5sucK0XUOSUUH
	fgGvb5ZMA/UsGIo/AJaXguCQ1LsiEdEGHgKpQR14+tnc6yUhzz6F3ntEkS4YNmmsVE40
	si1lvC6zpS+6cQsakUczNOqvODFZX2eEE7MJ6c0foIVvhV2t0Q+KohW3GNcFX52nM0+l
	uoAhcB1CZy5gMBiZh59Sptx1q71haQOu82elWArUXnB+Sp/Ajo1ImcLggMQcao17FWHu
	FUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tkOXFD5YOsczRx0UVH0zQ7hgVqH/cEYSt48+obmS/7Q=;
	b=CsOrdjJsLzezJxu3n/tdvWrWCErtjtsUn5X/mK8BJI7CBBWbjHFuIsw9yGSVKo86gP
	tTPOIUSRWxX3fndHBirA5/y9uJpDvI4xp5i6bknQOLj4jp5+LcTktFnFB4+QaG+vs6qT
	lJTRULs9j32RsoNRqniY/dLExizpqpFDadkdXRateEfrihc09bFMb3tZiOBfaJIqnxK9
	RSDJrLwYR70n3dByEKtyNd6crd2M5ECUwBEw+91MKhVRq2ieyTF6SsIsXsNFnTaWpoTZ
	jxLc0qE1/u8WCU270JV7u2JlGz/d3mRlKMx5lr/bG1Vev91kseaeEtCWGgYPAqP8gGae
	rsOA==
X-Gm-Message-State: APjAAAVZVaNJlDd4nQnbinGApi5ZfttTDiHOqGBwdM9ZWW9XzsukdPFE
	Arj6IK2rtoG3BnuoqvlL8dYYVFG8
X-Google-Smtp-Source: APXvYqxjSP4+yJK+9D5+5nho7lBkikLnZeimKjFCCd+nIV+cPezL8ySMSZJl+k1SB1Yh964zc19n6A==
X-Received: by 2002:a02:ce8a:: with SMTP id y10mr24340008jaq.21.1579460410325; 
	Sun, 19 Jan 2020 11:00:10 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x77sm10726714ilk.34.2020.01.19.11.00.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:00:09 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 12:59:59 -0600
Message-Id: <20200119185959.406212-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200119185959.406212-1-JPEWhacker@gmail.com>
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa: reproducible: Do not strip packages
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
X-List-Received-Date: Sun, 19 Jan 2020 19:00:09 -0000
Content-Transfer-Encoding: 8bit

Do not strip packages when testing reproducible builds. In some cases,
stripped data differs between builds, but then gets removed. However,
the contents affect the generation of the GCC build-id, which then
differs in the resulting ELF files, even though the data that caused
this is no longer there. Inhibit stripping so that their causes can be
evaluated.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c00b92d2e90..34462a0b3a4 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -149,6 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
         config = textwrap.dedent('''\
             INHERIT += "reproducible_build"
             PACKAGE_CLASSES = "{package_classes}"
+            INHIBIT_PACKAGE_STRIP = "1"
             TMPDIR = "{tmpdir}"
             ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
                         tmpdir=tmpdir)
-- 
2.24.1


