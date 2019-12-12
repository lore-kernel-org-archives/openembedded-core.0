Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id B69A57CECE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:52:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id w8so822732wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:52:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qgXMvDmTyD+p9qeGP1BgBSp4wRsBMrCEUejkfIK+6ks=;
	b=ZK1iroETz49D6QCWUO+Wi444CI78QyAqgloqPoj/RAwvcs5M0P6AOOZ5Tmad2REY+P
	O6ST8lpIPyRUS+jB9STzqtxLdG/0OA0ZDVhjcyb3ortATv/qiaGKL4kxcJzgzN1MEzWz
	xhvL1oS7/c1p69VVrXVfRIHcw19fbvEcK5Of935vxtWtSZxcYqI+WOhIg9jcXkkrRJM5
	idtpi8hQHn6jpknOPNgvVhmw3b2iV3aoE6aW+Xd7+vLTDe+TN6hx+HIYnuG1FOW9V135
	M+06sYoMOJaunzyCGGTdR2/DxfeCIDcQsKp4/NXwBS6HFQEWGwJayrQ1ju0Yaev9oNCy
	KLFA==
X-Gm-Message-State: APjAAAVAzzBPXCC0Uw9uAgKhNdTfwvwGVnW8QjrWwrbtljUakkP5foyK
	8glccaLmceI1KaZKY1eRmAAEKRgT
X-Google-Smtp-Source: APXvYqwERrZmLSs4Yrf8ejsiaHVx0j0SvHd+vvDaC4yliORS011UDC5id5HCsbbrY778IqpCup6JLA==
X-Received: by 2002:a05:600c:24b:: with SMTP id
	11mr9043895wmj.19.1576187535390; 
	Thu, 12 Dec 2019 13:52:15 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	v188sm7723704wma.10.2019.12.12.13.52.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:52:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:52:09 +0000
Message-Id: <20191212215212.27089-2-git@andred.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212215212.27089-1-git@andred.net>
References: <20191212215212.27089-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 1/4] oeqa/utils/httpserver: allow to pass in listening port
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
X-List-Received-Date: Thu, 12 Dec 2019 21:52:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Being able to specify the listening port is useful when
running OEQA from within a docker container, e.g.
crops or any other solution.
In that case, a port on the outside must be mapped to a
specific port inside the container. If no port is specified
for the http server module in this case, the http server
would choose a random port, which is unlikely to be mapped
and thus won't be reachable from the outside.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/utils/httpserver.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index aa435590f0..58d3c3b3f8 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -22,10 +22,10 @@ class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
 
 class HTTPService(object):
 
-    def __init__(self, root_dir, host='', logger=None):
+    def __init__(self, root_dir, host='', port=0, logger=None):
         self.root_dir = root_dir
         self.host = host
-        self.port = 0
+        self.port = port
         self.logger = logger
 
     def start(self):
-- 
2.24.0


