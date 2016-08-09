Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4431A766E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 07:53:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so1464945wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KBKb4XQsNZTaafEpwVzqSmJRP5oGKPgSJH1DGOvhmys=;
	b=KwHLELTQg6e0k1+9tL6JkOB+W4Cv6x2h7+VwRQXanAmgY64imqPDQmR+jMooItj3bB
	kwDHLi0FuG1qweuu+PGDaV6cBatX4WAHkRsipBNSo18N2StPiFQUo9JGbO95CnYlok5F
	VEAFq4zDZGg+GDKbFyYnXqigo65bSHg6btGUu+rWhtn5HYCGjQiZ4dmWIor7Ll/FJRJb
	mSrjh2LRDW1PKcWvVs0qPFgpPLSm86lEQrSgYk5uJA2Otoe7D3Dc7AlJvKgEsuoTIguY
	8wyFuUg5Y8G1EgNwnBo2I5cU2tt5QMTiysG8wJUsQXaBem6p3YL3Eu7nfagJhAz5nE1Z
	SfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KBKb4XQsNZTaafEpwVzqSmJRP5oGKPgSJH1DGOvhmys=;
	b=Xx+zMBV6ITQiF/TtAxzmqEImlOdMIe11LF+SP09kRuufK1iVt9pPfC5LWYiDIZjEhi
	sZ7t4DDi5ay2PaWqo1mEzEvjJDUdFQmnDgbbMdRfEV7YXA9mI673qQg7bHXN5rzIRRFN
	OTEKxbFBr+QjV3j21KTGBgSotO72RmJaNKkFuQAd1kqvJDUiFrrxWHFPnA/wnqos98XK
	RrKArZp9nIze1jBgzHO+uiFoabg9ufcb0I0QGt4vJ4Ag7h3xdjFo5+sA+tAAUqpW0DEY
	SFfA1Tu+oszFIQSxgbUp1IqnyVRNkTyLRQldCND1rVpgRyBrB05y6VdkQ8ftAT+qanx2
	ojSA==
X-Gm-Message-State: AEkoouvnTswLvVl2SF8SJuJ2kJ5PWtW/3sSLQ11Dx+mfqKJEc2MlQLoyzAk8eUCwoQwWXQ==
X-Received: by 10.25.217.151 with SMTP id s23mr30313406lfi.16.1470729194957;
	Tue, 09 Aug 2016 00:53:14 -0700 (PDT)
Received: from localhost.localdomain (m77-218-224-24.cust.tele2.se.
	[77.218.224.24]) by smtp.gmail.com with ESMTPSA id
	p102sm6178853lfi.9.2016.08.09.00.53.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 00:53:13 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 09:53:08 +0200
Message-Id: <1470729188-24979-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] xmlto: adds libxslt to DEPENDS
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
X-List-Received-Date: Tue, 09 Aug 2016 07:53:15 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The native libxslt-bin is needed by xmlto-native, but it's not in either
DEPENDS or RDEPENDS of native xmlto.

This fixes a following error per test:
| xmlto: Can't continue, xsltproc tool not found or not executable.
| make[2]: *** [/mnt/OE/build/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0/perf-annotate.1] Error 3
| make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 886e7b4..cc4bccd 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -14,6 +14,9 @@ SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51f
 
 inherit autotools
 
+# xmlto-native needs libxslt-native
+DEPENDS = "libxslt"
+
 # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
 RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
-- 
1.9.1


