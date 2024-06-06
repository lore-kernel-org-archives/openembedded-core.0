Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C70C27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:19:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8446.1717658372098860422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 00:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=pXM2/3wM;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.54, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421555a4454so7441705e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1717658370; x=1718263170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGyc2wUubMqeyD+SVQ3GQEdh8b8NlC9QRSsaZtT1RqM=;
        b=pXM2/3wMa2v16wOUg8IiTpoR/XzorjoO1c3EYQnux3lYkIfJHj20pwOTA42HKmpDFk
         cS13P+h/3BEMzlbSD4E+moZQCTjWk/kc2Dy5uX7DxSSoT/lVA+wvDmTuMo2CqfjmcCtP
         SHyEXK4wdqDjKIQB3Mj+YlXx0llN7iKrZNc7iyRB4Bue+ji7Rd6J7ErCM7GH5y2JN5Y3
         MSLgT0qsHMs0X/B+Tn+umdvTpOXb/VX3fVmUM45LN6HATtXUORPCCcH8IUmam6b8MTxv
         ybLpRqu5C7X5LM44uGhMAHJm5aD0hyg4PqoGfRQ3sxkeH6e7Vu3swneyipxVcGRcCtz9
         6sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658370; x=1718263170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGyc2wUubMqeyD+SVQ3GQEdh8b8NlC9QRSsaZtT1RqM=;
        b=M9YuSfxbNHe+0u6LeHj7WQfiA+V6YW7W9ADYGL00O/cz+xwWZ5DL22P0Pc8hEGkPet
         IytlXwE/iFCO0YReQ5cmp2IEyvlOVP/yYrX4+mQpMaDRalFVuAbGqm6y1h6y2xrZhgR6
         VRAM0YzC+LaIh6KPraWcqW5pYNXD8f8wptdh+K+viyeejDbNQAPmKN4MeBhzheWXQcUf
         yJzpnv66ghHfMkaGQC/DDZ0mVhKRJH6PITHA8YgKl+DUF5FCyvf9ox0Xy4J0xgoyF1Ob
         m5nI1GRgzDHgz4e+sX3Rr+R5LjQ/4Z9eAb5qBZ+C8CQyy5m1+Ov+GuEUtNRBSQU6+GXY
         WumQ==
X-Gm-Message-State: AOJu0YygZHhwPyI42gpLLY+U7n9R3RFdxsvqfBRdAtpccHCBkeWK0V/Y
	q1U1WgMQOQBd/pwfAXlgrOGwW77zHCy411vtkklTLK1rUz9RfYcy0fqEArhYYlj67HWr+thmG6S
	5k4pcEk400+a44kbSLnot/3hqC7fyU2YnRuZ9Ed92sLnPSi7QnEmlHe2kKgCXFQUWjoma1M/I3a
	gQvLuj5oyQ
X-Google-Smtp-Source: AGHT+IEZ0FVmxLo20o+gVIXm+oTKC5xQ1Qk1aeLaEILW8ybolB2eMLkYGTKiDfkQAn6Gs3DEPiQnZw==
X-Received: by 2002:a05:600c:19c7:b0:421:58f2:3568 with SMTP id 5b1f17b1804b1-42158f236a5mr27998925e9.5.1717658370622;
        Thu, 06 Jun 2024 00:19:30 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2cd2d3sm11344945e9.41.2024.06.06.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:19:30 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] man-pages: remove conflict pages
Date: Thu,  6 Jun 2024 09:19:16 +0200
Message-ID: <20240606071916.23943-3-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606071916.23943-1-jonas.gorski@bisdn.de>
References: <20240606071916.23943-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200386

From: Changqing Li <changqing.li@windriver.com>

Remove the pages which libxcrypt and shadow already have to avoid
following conflicts during install man-pages and libxcrypt/shadow at the
same time.

Error: Transaction test error:
  file /usr/share/man/man3/crypt.3 from install of
  libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
  man-pages-6.04-r0.x86_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 605b4a91dc44d33bd4742841e71645275bc039e8)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 meta/recipes-extended/man-pages/man-pages_5.13.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recip=
es-extended/man-pages/man-pages_5.13.bb
index f8602c699ea5..9afa9274a8e3 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -21,17 +21,12 @@ do_compile[noexec] =3D "1"
=20
 do_install() {
         oe_runmake install prefix=3D${prefix} DESTDIR=3D${D}
+        rm -rf ${D}${mandir}/man3/crypt.3
+        rm -rf ${D}${mandir}/man3/crypt_r.3
+        rm -rf ${D}${mandir}/man3/getspnam.3
+        rm -rf ${D}${mandir}/man5/passwd.5
 }
=20
 # Only deliveres man-pages so FILES:${PN} gets everything
 FILES:${PN}-doc =3D ""
 FILES:${PN} =3D "${mandir}/*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY =3D "100"
-ALTERNATIVE:${PN} =3D "crypt.3 crypt_r.3 getspnam.3 passwd.5"
-ALTERNATIVE_LINK_NAME[crypt.3] =3D "${mandir}/man3/crypt.3"
-ALTERNATIVE_LINK_NAME[crypt_r.3] =3D "${mandir}/man3/crypt_r.3"
-ALTERNATIVE_LINK_NAME[getspnam.3] =3D "${mandir}/man3/getspnam.3"
-ALTERNATIVE_LINK_NAME[passwd.5] =3D "${mandir}/man5/passwd.5"
--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


