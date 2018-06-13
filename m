Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56C7478A8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:17:56 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g20-v6so2164472plq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pb9SINs1PnSTA9XYCoiD2Lokj7C9kW0LY/tSEnU5vp8=;
	b=MWPqTZBVyUVE/c4nXxVvH/5MY5XJyRwaayu2WS43dGYOeLdCcOJ3n1CBWozVq63+lI
	vGNrN71Niq0VAoePd6CuGuARHOyNKwFDGRU/tJrldA75AY/54ath1caEjS+yki2PxShY
	qBgjI6+5IKv1yOkyRXS6rtrJ+I7RIcHhvbtnOvMPmAaFuWbQIDnaZN7z11wDXtxmSEER
	xChCy4bXWV8t6z5qhOMd3DtNqeitahHtnu1Et2vu4cJREGSkmF9jFebzf0iUKp/wc89c
	xsJxgjRl/lp0thu5HlbYCUAZYulbiuFJyewn/v+Efb0MFmctijZ/aJZMhwHMtQ35pFJ4
	AZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pb9SINs1PnSTA9XYCoiD2Lokj7C9kW0LY/tSEnU5vp8=;
	b=kW5BsAFSqZHCEcfhhiYPs3ZIYfXCW21Bq9BcSUIit097Xj7uXtJOTIuFlj3KiTB15q
	j8jk0uV7FkKhAjI2pLUwB3Nm86UQKCdl/6qLJ4cUWMmge5BbotpVm2Xjcxjb65nN0SLR
	Z5g94M34NPyywTfcDhzxL8zAi6Vi1xYmHqma4tLuulVNvQdygZ8TIjU47jDtJFNQ8LiA
	DZ3fBEsNA7MreJpaZBPU3nUkCfstEuD/GxHkVlZdkCXYKf34W2rRcoU204cXzFrnkyZN
	WHaHnZ4DUrSEsaurIGpyzccTnIMRFUKy0MlApKmqCUKhWYbZ3+2rORlC+OTpxre4x9dl
	tlDQ==
X-Gm-Message-State: APt69E3U2/e6Ikp8GZIhJvcdolq0bcNK+hmlolu90VFxmZcVF52Lk5n0
	Q1dCo94AOh9pBzNrPIWIScCR/QMKs8o=
X-Google-Smtp-Source: ADUXVKI3Yl04IHN+Vg6gpD9lG1zlknGbpX/B831iwoi1YnZ3IkLszE4C5q4Gj4TxC1XJVN/TXVIJhA==
X-Received: by 2002:a17:902:bccc:: with SMTP id
	o12-v6mr6633808pls.169.1528921077259; 
	Wed, 13 Jun 2018 13:17:57 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm11783596pfa.34.2018.06.13.13.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 13:17:56 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 13:15:05 -0700
Message-Id: <1528920905-21801-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] atk: Correct multilib conflict in header.
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
X-List-Received-Date: Wed, 13 Jun 2018 20:17:56 -0000

The headers don't contain any code differences, but they include the full paths
to the build location in the header file. Removing the build location resolves
the install conflict.

Error: Transaction check error:
  file /usr/include/atk-1.0/atk/atk-enum-types.h conflicts between attempted installs of atk-dev-2.28.1-r0.corei7_64 and lib32-atk-dev-2.28.1-r0.i586
---
 meta/recipes-support/atk/atk_2.28.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
index 657c69d..aedb036 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -33,3 +33,8 @@ SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6
 
 BBCLASSEXTEND = "native"
 
+do_install_append () {
+   if [ -e ${D}${includedir}/atk-1.0/atk/atk-enum-types.h ] ; then
+      sed -i ${D}${includedir}/atk-1.0/atk/atk-enum-types.h -e "s,${B},,"
+   fi
+}
-- 
2.6.4


