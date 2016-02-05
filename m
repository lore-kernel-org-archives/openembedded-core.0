Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C27477227
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:04 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so2900887pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5o17Q7ogP7w8V3Da29pSX8qlzbz5NUYg2EFKD3gU6qA=;
	b=yNeDG3w3nPQUJykX2pUrNepVLoUkuncmCsHge6fkmdJOOXHTTY4Jf6a36L178Fr7S9
	CEPkb2VsxQBnzUGan8nnIvBhcUHWNJhSPxrf4QaiiNEohVtCLHGXv5oMtX1eJLRB5mmQ
	JldhyvBH63qCPL+5sQ9K1YXCTrFJAFPeUDVVzaYofteNeAcgaG3wKc6Sky/r1W7AYunB
	ct3upM7kap03A2gLDlELdglMbbchq1y3NVNx2I2oG8pJOHnIJTKmKfClNMh01gWdrd13
	H5a4M/wLlCo0q9t6GAuS5O8rZFzmqbDvZWmJijbPaQi6FfJDMWwWDYmMXfviEdH+6q4I
	Rpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5o17Q7ogP7w8V3Da29pSX8qlzbz5NUYg2EFKD3gU6qA=;
	b=OhRMGGd5R4vTEbRDUQX+YsSSt4xHtwms7Vpvpl8X6PRAqicMIy1hPEb6CWYIjbzMQE
	vhavI3i48rH4Yl6ydqe2ZP4dcYPW6kRf/NlC58Uzi6fwTaevZ6TxcmAVLnCkHtxmCG42
	JHpImS+mR59umxveNLhBkFxcnx0Gruto7MNQZnzHjNYgRMZY1JwzZ2angZJXfXyEaGKv
	vydGKqhO/MeJZnyWjwrPtDbVdQOmaQS1DpbZTcb/wgCsF3TziHAMQKiCoOKZEHpixGQ0
	z5allw5tW8XST03gsKo63PnK1l7E+nlKNdOBaseg4Fe+vz6hKx01ascMy4r6qwCVdM+8
	alog==
X-Gm-Message-State: AG10YORBF3vQQ3bZylhovAC1hcFOiZGzZq6P9O7nCx1oaSaOtgga4nEiHdG8rXwsfjZXcg==
X-Received: by 10.66.144.37 with SMTP id sj5mr22939483pab.69.1454708105841;
	Fri, 05 Feb 2016 13:35:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:05 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:52 -0800
Message-Id: <1454708096-1570-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
References: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/5] gstreamer1.0: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:05 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

The warnings only cause problems for the git versions (-Werror is
turned off for GStreamer stable releases), but since <sys/poll.h> can
be conviently disabled via configure let's avoid it for all versions.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 218b4b3..662cd1a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -24,6 +24,9 @@ EXTRA_OECONF = " \
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
+# musl libc generates warnings if <sys/poll.h> is included directly
+CACHED_CONFIGUREVARS += "ac_cv_header_sys_poll_h=no"
+
 PACKAGES += "${PN}-bash-completion"
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-- 
1.9.1


