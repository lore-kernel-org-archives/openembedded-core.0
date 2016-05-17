Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 408A375C51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:38:21 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id f74so1848367qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=cEqh5BF4LCKR4chJ5vv6voL679qbG3WA+0PYRJ9u9Qk=;
	b=jJe9r9Qste5mKSaozRKweN4hfUTpQAVgNPf5z00Iq47dlWWBHShaJ6veZ7pAJwBDOr
	4QjYMFJtHEDF5MxK436WBXmFOpk1+7UTqf6eYRus9MT9YiCny4keOair1/2jjrkqPor/
	Db+KfgmOpCTPyd4FYaR3ZEtxT3xEec4sUBEC4+2s094Hg0E5aMnsV+2+5dYHo4SQjiv5
	WJ6dV1xb6T7b3n7/XqnDf+f22BQwaYepaBKDUx+VlJ06foWbS0KyYQmFWIRa2YpRdFnS
	Z2P49XxRdeuTZGNDxX6/rii+UY5kHgbQzeKkN0UHtAPqMadkWMbDQmqgNplHH6QRspTq
	5xMA==
X-Gm-Message-State: AOPr4FUePe7/zqU9mv9SJA2rfiUrYeSlZ27USZtFXjNETjFsUVXf/VNMjhYmjRWb7UnM+w==
X-Received: by 10.140.217.208 with SMTP id n199mr2790988qhb.31.1463503102302; 
	Tue, 17 May 2016 09:38:22 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	v30sm1706098qge.41.2016.05.17.09.38.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:38:21 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:38:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:22 -0300
Message-Id: <1463502985-5428-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 10/13] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Tue, 17 May 2016 16:38:22 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
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


