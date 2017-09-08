Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1624D78213
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:49:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r66so1395491qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Q5x2/1p65nfrlz2DmXR6WZvo9r0HFtBZKj0vNy21ALk=;
	b=OqQipMXmwis7TqvMXtR89DD4rMKBliq8/HbBBnUwPuHJ6k7e/Tj8QobPK5FUdOfo7+
	aQD4qMQGaIdw21u8ng4S62cmBt9GHFV+rm8ca9idsZpimaj/NGfqu7Y1iRc0iq0n+44U
	zLXVNd8wXxHctgkJI2rCBrErLmAk0jc6YdqzMarq6w4oTgnR+OO2O3T81DlNIzpBgG5R
	UIeTw8GnsJKiC7vLI19F6gAr9ph9wxKx9+wzSrZrPEKtX60pzy8/7RGUfIM+D4hA6D4w
	Nl4wZculy1LlZecnDIdhM9ZDC6NvWt7PDzlMBAUOGRggsf3P16V+lxfXv5THNgj7zIoz
	DngQ==
X-Gm-Message-State: AHPjjUgg0YhHHSE0dKfuprbKmrFg1i3T/Y3BRVcUiFQHTfW3xRBD2YLa
	M+dClNs4fyLfJlrf
X-Google-Smtp-Source: AOwi7QANQBJjrRq5n/tUAQrtSVNjoevDg9Kg0fmDvRCoMXdwHCJaVW58Z6OvYlBkDD/Gcdx3vK2DIg==
X-Received: by 10.55.203.149 with SMTP id u21mr3961303qkl.327.1504878574971;
	Fri, 08 Sep 2017 06:49:34 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id p7sm1262147qke.78.2017.09.08.06.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:49:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:49:25 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:58 -0300
Message-Id: <20170908134758.7570-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 11/11] go.bbclass: add do_unpack function to handle common cases
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
X-List-Received-Date: Fri, 08 Sep 2017 13:49:34 -0000

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


