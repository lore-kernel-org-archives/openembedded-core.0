Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 31B81731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:36 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 77so14915467pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=o/4bq427tPiInjxlUKp7vfW4cn6nKj0vOuYN4nzjj08=;
	b=P3jTjaXUiQBZnhFcCp3vlwz2bgHiM0v9H+K6lKmq1yjjG+NnrhMt84Q2C0ohQS7gO1
	dGbXqXfgmf/ycRoO9OSWcz4uORR2ZWZPuHlVntKXW695bMFhqrujxSSPHW6XNemeXWkV
	ASeT9H2TGCRvUmMRRTXLxzAaGi0Es7UepTknuWJclgrjuKqgnGXFGz1emNiJUPdtEEvT
	J2zcx6OBkoBRQna3VjIv7K9212/ZLw+Scd0NuSCSTMicGiSUr+OvutgmzBNtww+dqui7
	mJ/aH3v/sRxY73zOxzU0c8AakBzDSYHScA5uz4YfrjUwg0S+7xyusWmoESrzzEhq6EAO
	c6Jg==
X-Gm-Message-State: AOPr4FUOHtG66IBgG4Tw3C1qzzJXLEt5z5IsDobuZDA78zKCsU9vmMe09x11YVyKZz9yUg==
X-Received: by 10.98.93.5 with SMTP id r5mr6223820pfb.15.1462305697808;
	Tue, 03 May 2016 13:01:37 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id y2sm85868pfi.39.2016.05.03.13.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:36 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:49 -0300
Message-Id: <1462305651-16593-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 5/7] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Tue, 03 May 2016 20:01:37 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

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


