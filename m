Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC95731D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:42:39 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e35so4638975qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=+QncG7CIy673EIN1wz/5N/tcAIttWeMPnCrRKQxtBmo=;
	b=MXb9KgOWWMjsc6xBrgofLY5Q6dig1O5kYotj7McZq0PwjhhuZ+E+NAufWgYV7D3Qbq
	kf9ht/fWoKMSEb0zLTxQnsg3wKm8K+S77hpcszq8TcxnlP5hzRVZunqLqMdgRUaCSPx8
	eW2AKLBa6C3EBLqfkYkRH+Efhg6kW9CUe67Eelwb+IrNCL+APM4P83WostkhEdKgQVS+
	yLZXHWEDbYHgZzG4E1FGWi2kRexgo8xkNUQ7D4WMA2lJVgNHBeseyqvqNaylAZEkKv91
	SpNPZ0vXTAo2wx28X/wxv99ybvOuK0rKVkyvgei54J01zTCWQKu7BArf2j//OLPrHcxN
	CkiA==
X-Gm-Message-State: AOPr4FWL+RAipGTFXcSKRlNZOUSKYfl9w04bQvVLGpM9S9AnKOORB4inCS/IsEjMRpMapA==
X-Received: by 10.140.83.200 with SMTP id j66mr8399814qgd.59.1463589760039;
	Wed, 18 May 2016 09:42:40 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	u78sm4539717qku.31.2016.05.18.09.42.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:42:38 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:42:30 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:44 -0300
Message-Id: <1463589648-28641-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 09/13] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Wed, 18 May 2016 16:42:39 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
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


