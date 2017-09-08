Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 23D647821B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:46:39 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id p55so1682010qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=mtI4Rz/53+rkYYNYcRSnbbwFG8woQY65g1CM2IOxW2Q=;
	b=IVW08mr4l9Ag2YffG4Z8eK4Zh0DhegxEfEck1c24kYWkIz4WJVax110zrVH0QiRzic
	rN+XQIqvwak0S8i8zdq3f+nhkM3TCSlyWiVTQL9n+hq2JO2yqeMSH0wm3alIYB/RdC5Y
	FyClZGS0QQNqhkjP6/5ceJF6nnexd6Kuk1Nv9nfZe1R2fgQ60jVr0gj8dSigX3vCiVbV
	D40g6hSWFMO7/Ar3IA4nzxRpg6GeGBG5igLuBHag/rmYvUf/CGa50oKbHKKxeNKpsQpp
	opH+S/mmxoEZtMZM+XOQSCPT44b2bW0W1xW4Y3QakAnUuq0ptKgboYk2fvtVPsN1cRtx
	Ukow==
X-Gm-Message-State: AHPjjUiUqNe5zoLXAff96dLUPhHdnXXg/h3FblzMRTgWpObs9I+h9Y8U
	HIBy8LvhPlHcL5xi
X-Google-Smtp-Source: AOwi7QCC9uN+rI5s1AWrnRyjCpH54UZFPbclbd9VdvtfWT7wwvM53S8+2xSmF9dlLdTH8hLyAZSI8w==
X-Received: by 10.237.63.124 with SMTP id q57mr4431310qtf.23.1504882001003;
	Fri, 08 Sep 2017 07:46:41 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a207sm1290951qkc.82.2017.09.08.07.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:46:40 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:46:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:54 -0300
Message-Id: <20170908144454.14308-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 12/12] go.bbclass: add do_unpack function to handle common cases
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
X-List-Received-Date: Fri, 08 Sep 2017 14:46:40 -0000

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


