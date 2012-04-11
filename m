Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHye6-0004cb-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:35:42 +0200
Received: by wibhj13 with SMTP id hj13so828221wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=i0qFOXQr2afrAGKsDA1YjVF7/13hDB7QF3SOd+bzEAw=;
	b=JImsEWlZX1nv/SAI6ruFsLgcRgb1WoSj3uCBbjg52JSbaMGoj/ApDeRmtjp6XpwV0G
	2e7yfQ4T5Sf3UstlDX4hLlGAy+hKqKXbw/G/OSGBQNv8VYYYz15D06QVh7BYzmAEfRj/
	G+8RboQ5qMm9r8TFrSX6mWz01ViZ+GVuJvd9qmH6d6Us9mme74cVb9/Eye7gOoLjIvcT
	pf1FqcIKIq5Y3Hb5d5r2x8uRIz23shtwXNbit8pW90tdbDK3aptAZBfnHD02MG+QtxYp
	b5PoxcmgnJtl5vyfJH6+sZmGrstUuNdu1fIM23d/oHCsMFyZdVTDe1y4eLc2Wc5t2VNG
	8WNw==
Received: by 10.216.136.13 with SMTP id v13mr8682329wei.32.1334154383735;
	Wed, 11 Apr 2012 07:26:23 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id l5sm45283288wia.11.2012.04.11.07.26.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:26:23 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:26:16 +0300
Message-Id: <06c6cbda1fea51b37677f2cbf4fb98f26ad2b39f.1334154247.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <46a62192da80f228b08dc5412f61143f15dcff57.1334154247.git.andrei@gherzan.ro>
References: <46a62192da80f228b08dc5412f61143f15dcff57.1334154247.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334154247.git.andrei@gherzan.ro>
References: <cover.1334154247.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlzEMGCx8NTCOZmoJEMOQsyXM5gbpE8J/Yp8awU+qr5Twq3TkK/QPMvOaj649lVmcDk31EJ
Subject: [PATCH 2/3] package-index: Force NATIVE python to use modules from STAGING_DIR_NATIVE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 14:35:42 -0000

Export PYTHONHOME to ${STAGING_DIR_NATIVE}/usr. In this way python will search
for modules in native sysroot.

[YOCTO #2134]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/meta/package-index.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index bf3922f..96d54e3 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -21,6 +21,9 @@ do_populate_sysroot[noexec] = "1"
 do_package_index[nostamp] = "1"
 do_package_index[depends] += "${PACKAGEINDEXDEPS}"
 
+# Force NATIVE python to use modules from STAGING_DIR_NATIVE
+export PYTHONHOME = "${STAGING_DIR_NATIVE}/usr"
+
 do_package_index() {
 	set -ex
 	${PACKAGEINDEXES}
-- 
1.7.5.4



