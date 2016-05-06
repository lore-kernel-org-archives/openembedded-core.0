Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B126075E80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:41 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id f92so62634994qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=fyA3cuS5eJw9YeNfrIjdDjhyznpW6oZwHjYq8Uhvm4k=;
	b=bH+WREVl7aUFHpqYC9kHGaAc3NDDwT9Jjh84LwoiyKHtMKi94OSrVKenkBY7P4OyM/
	EXJPFMOcXrsh/L6jny8idtjHD0h93hFxHZnh8b/Hfut4/TiZFZ7v+l4RZYu7nS5+M8Y5
	a78ms2gmtaDLvh9Cv9iCAQYq/C0MoApoU8kbBM+g+rAR2+Pdnu/bo+NB76L76Tx3RT49
	v+tCzv+RhEJ20VSG7eqzNVajkQFyLgLFiAmR7+Das7xXxZrqiz8a0D6Mc+d59SwNAjds
	CjhRAaDXU/0O4rlzb3USWWK0llm6zhpGRUzA/BWAVVEYHGon5yQy1fiu6ZO9tGuX70MU
	JaRQ==
X-Gm-Message-State: AOPr4FXELNxUOg66EirRfMNyhfvDinAKbxrzVPkcq6Kk/GxvXwqNcKzCghgkRVc1qP5B8Q==
X-Received: by 10.140.216.16 with SMTP id m16mr21407145qhb.37.1462567482167;
	Fri, 06 May 2016 13:44:42 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 94sm6472774qgl.11.2016.05.06.13.44.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:41 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:36 -0300
Message-Id: <1462567419-3459-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 07/10] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Fri, 06 May 2016 20:44:41 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


