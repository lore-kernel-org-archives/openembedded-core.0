Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 13D5578240
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:31 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 7so2242751qtz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=mYkZmLSKY/uznA5CYAJxF7+9CgrnOfnmKsZhZl/Aig8=;
	b=CIlZl/4Th5pYBAABZ0ESwZlLOfqEdREpOyMJafPxDnoWoUXxf4Xy79vH6K2JQe8fmV
	VN5VFPuAxtvDGGt3F7LPFWi7HDwy2xfKKE5C1jmSBbbxhv4j2r/pI1BVhl/V2RVsKX3E
	gnqYNuZzMjmUD1Ygb71UfYl7rofJQ6EePtUvBAeLWJs49Nt1n7YrJsCn8h+2TQlinGV4
	UPQaZN1NhoQ0wTQrIRHvOTqGpSEBaxdYeaH4oNBt1NjAM9d2DNXMB2WfgqIxYRpeWCtv
	QlLrkcVglVJzYOSROu2EX5BNQyvdb6fPfYshDYRmfD7wE/lPYASPi2ezETeVXFXZi36B
	HwXg==
X-Gm-Message-State: AHPjjUhyJpRqrEI4yVZmKRu5PeVlTJnWV3fOxZgyFqwXzNuhsNI3CMHB
	bAAWG5p81POJuG+D
X-Google-Smtp-Source: AOwi7QDVDOZ8Ztcb0dTpQoQerhV/fNJaiwprEvSYA7ZyWF6YO5qhD6RPNOdJw2fBX4XjIWiZdm9dHQ==
X-Received: by 10.200.25.183 with SMTP id u52mr5777057qtj.102.1504904792719;
	Fri, 08 Sep 2017 14:06:32 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id s3sm1888857qtg.79.2017.09.08.14.06.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:30 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:41 -0300
Message-Id: <20170908210444.25763-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 11/14] go.bbclass: add do_unpack function to handle common cases
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:32 -0000

From: Matt Madison <matt@madison.systems>

Go source trees have a particular structure, with all
sources located under ${GOROOT}/src/<import-path>.
The fetcher step implemented by the 'go get' command
automatically follows this structure, so we need
to do the same here.

Since most Go packages are hosted in git repositories,
this adds a custom do_unpack() function that sets
the destsuffix to match the expected directory structure,
for any git SRC_URIs that haven't had a destsuffix
explicitly set in the recipe.

This simplifies recipe writing for the most common
cases.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- new patch

Changes in v2: None

 meta/classes/go.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cfe773e13d..c1ef01fafe 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -55,6 +55,24 @@ GO_INSTALL ?= "${GO_IMPORT}/..."
 
 B = "${WORKDIR}/build"
 
+python go_do_unpack() {
+    src_uri = (d.getVar('SRC_URI') or "").split()
+    if len(src_uri) == 0:
+        return
+
+    try:
+        fetcher = bb.fetch2.Fetch(src_uri, d)
+        for url in fetcher.urls:
+            if fetcher.ud[url].type == 'git':
+                if fetcher.ud[url].parm.get('destsuffix') is None:
+                    s_dirname = os.path.basename(d.getVar('S'))
+                    fetcher.ud[url].parm['destsuffix'] = os.path.join(s_dirname, 'src',
+                                                                      d.getVar('GO_IMPORT')) + '/'
+        fetcher.unpack(d.getVar('WORKDIR'))
+    except bb.fetch2.BBFetchException as e:
+        raise bb.build.FuncFailed(e)
+}
+
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
@@ -79,4 +97,4 @@ go_do_install() {
 	fi
 }
 
-EXPORT_FUNCTIONS do_configure do_compile do_install
+EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
-- 
2.14.1


