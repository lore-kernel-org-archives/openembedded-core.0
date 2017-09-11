Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3E77821C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q8so5487987qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=e2UuXbMkBZTpUGF5zQ4eao0GHr4XGgx6w8Ob9FI4jJk=;
	b=f2V7CR6oFx9twtP3IFltN/bPgSQ5T7c5WBffjB7DPiZfR1EVrlBRgAOuCma7k1pFPR
	50VuA0UDgAT5IuDWjmdMf9n5tQF518Mf0qCfKLNcqIMYfMDW8lY1Q+kmPOjAfGmfn+uz
	kfAeZnXZ2Clv7rAAUoQ7sLHc6+HR13AF1c/w53RWRZ8qJ/ZwuDDVFeAJybt5vyf4LReI
	qYsV0dw6yv8kEv3RMWcKAVoS6CJZAf3AstzYZ2L3vbKPMxgJgLXfRut/QTJTHzyN2vee
	HRuVlk3Vsq3YE4Lqrthy2Dqsnh3uBdh9k5+4z9+iybtcaH1CR9Lmbj+YK+oVKuk35eLR
	F5gw==
X-Gm-Message-State: AHPjjUiQB5wGH+8SqzGK8yc607B/kAX0Csxqz5M44Lkud3iAcDhiEYmm
	5DlyJtlF7IuSg939
X-Google-Smtp-Source: AOwi7QC/JWqor1CkUK3+hpxZciGADrTpMu8YT7FtFT6LVC7t2irW6KS53coB9V9BXH1ezdjjYaQU/g==
X-Received: by 10.237.36.165 with SMTP id t34mr16393657qtc.65.1505134034808;
	Mon, 11 Sep 2017 05:47:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	e39sm6191923qtb.67.2017.09.11.05.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:43 -0300
Message-Id: <20170911124558.2863-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 11/26] go.bbclass: add do_unpack function to handle common cases
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:13 -0000

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

Changes in v6: None
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


