Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 43FC179C92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 09:57:33 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id p197so66329448lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L1MrfA1r4dNNy0zkFPCixn+wUO/JKn1UcOla1JD/Ezg=;
	b=gWKAXTOi+kMa9ocZS3bpxcHdwV+yRDG90v3fHkS9SO0dXh7K3hpVO6j5GZnEP3LA8b
	M6QXEinQjfFlvWbcU174Rasmql4rYCKWGxgSkj+ykfRPL3S/BuRqCayprIXsL9TtE05i
	rFnXzBzc0TNMB+S1CjM6S/gsDEbKc2uEsU7395QEQ6uBdJV0Le/uUab2V+3CJNnzQ7wH
	NuHPk8mhXSxY35t4vhOI3tHiF0wfsnv56GmfW3G+7yPu4JtrQ3ZTQq/tkbt9NV8jGDzU
	qLfDml+Uudk8Q6px/4EepblS0pqQzFaSyWpreayFXtYx5VNNm+gb8T7sq5kqcph6oTdg
	mWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L1MrfA1r4dNNy0zkFPCixn+wUO/JKn1UcOla1JD/Ezg=;
	b=gyG5Q06UVOG4tMwln+aAmlNw26dcs01sfZiDmi6OsyXpcpkXdP7tI/qMq9rwSrXgW2
	VpCemvy4ZMevo8J/SGAmiDAL1HsR1VNK7zEItn52eOHrREOor2+X6cpceoTORiEGJlUH
	df2oG9qapqh8TrXrgyTzgjMSCe1MWrLkAhWd0rCqbvMR/vqdo+G9rIuz9cHZ3CaXYk9e
	m09wPEnDYhas4GvxUQkZuk7zueoIP1vClj1/7IhCdVtsTcWsOjFbppW8i8zWCcJfwl/Z
	QwrXVMtKn3ODTpxYygVL3nYKv+MUSdqS0hk+r6KovyREJYbHFYUbe1QtFpFMjmUj4qmE
	alcw==
X-Gm-Message-State: APjAAAUczRbgvfg3skrwGkgJWLztROV9kbM9wqDF4S3B6Xz7rS+gkFZq
	E9MLB+9pJy6er/vZh+c8PCs40ZlF
X-Google-Smtp-Source: APXvYqxPz+cJiJjULOcLdQPQGgTIp1bDrxhnFsVMQLo7RfQ9rNWJLGYBPuvt3d0rv9h/cxayAGuSDA==
X-Received: by 2002:a19:f819:: with SMTP id a25mr9335335lff.183.1565258253252; 
	Thu, 08 Aug 2019 02:57:33 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.138])
	by smtp.gmail.com with ESMTPSA id
	n124sm16853052lfd.46.2019.08.08.02.57.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 02:57:32 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 12:57:25 +0300
Message-Id: <20190808095725.18596-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH] module.bbclass: do not strip packages if modules signing is enabled
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
X-List-Received-Date: Thu, 08 Aug 2019 09:57:33 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Stripping kernel modules will also remove signature, thus we have to
inhibit package striping in case modules signatures are enabled.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/module.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index c0dfa3506133..31d5a2f21adc 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -72,3 +72,6 @@ EXPORT_FUNCTIONS do_compile do_install
 KERNEL_MODULES_META_PACKAGE = "${PN}"
 FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
+
+# Do not strip modules if modules signing is enabled
+INHIBIT_PACKAGE_STRIP ?= "${@bb.utils.contains('DISTRO_FEATURES', 'modsign', '1', '0', d)}"
-- 
2.20.1


