Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3295731E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:23 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id w36so31815492qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZJU4k0grJVPFoNRw3Em3iWwZpmXFmG9F0ovafT3yOu4=;
	b=DFSyh+QDFLGZ/znsSG/NtY7ORolLCO/xzr3qiS5R4QsIIFzpJ8hwze4AVUBxoBQ0GA
	xBoFTo7Wf58LoEAXmQkdQzgyfZvAE9hOUh5KOfaBgXVeYL2+KK6FftbXcpBad4ZFh9Wr
	0GqGJX6VDYIkvTFLhZ1LuWhbrFVkM+6+M3FJucG+bas/yWghOjW/0FEKFNADC8ftQk/o
	rVIHo4oxD0Fv3Wpmq/YNFq5IFom9/jVAR6T3cauDcqswp63rK9Y9+OwGlG5AXPDQVdy1
	xaAqqa1WK9FsaLWGYVfgKKneVceSF3wAZvLVvy1VyYoqc6l5O7RfED8Awer6pUluwJUO
	icPQ==
X-Gm-Message-State: AOPr4FWWdo3arMJ3x3tC2w01mlGlwifD1QK6rGOO0wVrJdiJfuax3kSZqHvcYzScUbo1GA==
X-Received: by 10.140.202.67 with SMTP id x64mr11748216qha.50.1462402224185;
	Wed, 04 May 2016 15:50:24 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b124sm2227615qha.36.2016.05.04.15.50.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:23 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:50:17 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:37 -0300
Message-Id: <1462402180-16861-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 5/8] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Wed, 04 May 2016 22:50:25 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston-start | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 5924c68..760a87b 100755
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


