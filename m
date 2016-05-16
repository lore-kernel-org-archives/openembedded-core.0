Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14A51731D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:14:22 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id e35so14532817qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gzQ6+dTx/2GVJgAxBMNijGqKWq41mQIFoTnrOnYwIb4=;
	b=k178OhIP/N6YHnAx9qtTLlt8YVr8zK8eSEz26dLq7eHNqDmltKn+XFlB7fvqVpv7eI
	qYxZPtmV0ygx7JszaWba+t4MjdKPjCfUYo7bbhcpMB1t6GvpNY9tfgD3+zv9as4J4hR0
	qv3hluDUpUnsGxS6uSr6QLxffORonoBljAgHCKRT8asX3KKcg6bpyUaXSYXmeKjtAUz/
	hFrsO0gySd/TgfR/6nvdypU76Ju+XHDdgF84Cs9ALEXKz0XUokjlHE8z4EG5U/7EDXba
	73WiVhvwuBDiyc/eiIoq26jeLGlLrcqYrHyJx41cJiiHemv9vqcd44Ig/baYOlQjZbhf
	Fw5Q==
X-Gm-Message-State: AOPr4FVG2NRiI9oyifzgYZSNBwisJ/3LmC+rA+wnrBRHLB8ufzZ+P3RVP0TYvSbesklDmw==
X-Received: by 10.140.195.208 with SMTP id q199mr5365717qha.54.1463426063268; 
	Mon, 16 May 2016 12:14:23 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	t103sm15418808qge.26.2016.05.16.12.14.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:14:21 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:14:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:09 -0300
Message-Id: <1463425932-10080-12-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 11/14] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Mon, 16 May 2016 19:14:23 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston-start | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index b791fd5..dc2b1ef 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -14,6 +14,11 @@ if test $# -lt 2; then
 	exit 1
 fi
 
+if [ -n "$WAYLAND_DISPLAY" ]; then
+	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
+	exit 1
+fi
+
 openvt_args=""
 while [ -n "$1" ]; do
 	openvt_args="$openvt_args $1"
-- 
2.8.2


