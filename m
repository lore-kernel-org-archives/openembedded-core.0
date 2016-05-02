Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEA073218
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:34 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id xk12so7321720pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=MQQT/dQkDOnZETq8IbAoCN3BP1uz3wS238UALuq5Jxg=;
	b=NKbml2sDVgE/T7TM/+JTjqPBfk7cJYr0vlHcQyyq5G/1VgXwbu1UldvGjM5fsl37Pf
	Xo+F9reYfGqzpEwI6t1FzPTs8n4UGbnamRTP8Ca+9qX3j0ZIZVYPp8l5tIKnhR9Q07CU
	XKWqH0XQKOi0M+/qWzMisehlq57E1baB6W2PuEprPPFNIFEHs7r3NJ6sPaZ9+R+XznpM
	tmfvDiAE6D1uy1xUObdhSMgyR2JzOJjD7bPwjFh7SU4KGK+xClyAXNd0g1DWQH1tVpOS
	O00Mvr2j7982jJVoZE5Wmd5JRG5F75jW/po8Y9wNTx5OWfyBqgAidHBsBZCTvw/+vVPD
	zFyQ==
X-Gm-Message-State: AOPr4FXfM/tgjHil/daFlhnUhDDm41T2Lp1Ivp+Id+EOVW2S6m8ssbRrx585eHLBxFzjLA==
X-Received: by 10.66.52.112 with SMTP id s16mr55054928pao.35.1462220075062;
	Mon, 02 May 2016 13:14:35 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	qb1sm47789085pac.44.2016.05.02.13.14.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:33 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:41 -0300
Message-Id: <1462220023-17811-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 5/7] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Mon, 02 May 2016 20:14:34 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston-init/weston-start | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index eb4b600..ff52ba3 100755
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


