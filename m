Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id E092872DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:51 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id e35so3070535qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=wLlDMiFROHlASQREhV85kLEa2LbA6nmz4DFLwF+latE=;
	b=IlHW5ngS22c8Gl5/QmSgIFwrUujL5FR8WMEi97GRhFYxi7kTSxKvViA3q4/piXAWbV
	5m7lLzNPiPRBXMUEpkEoJu+30vHyE+u6stwp7to4UiLX/7SnJpMq6x1iOhbsjRmMtDka
	IT+aqheIjpwaxoiuQre5iD0YhpwZcEOKHn3ipceFfXIbMTwzpKjRZG/abPdpdtofDqud
	CRrHYsZ5v36rKh8aOZLh0Qi7sIyVF+Pq/fRXvDMHRyEP75/Dg4eoW1VG2U9eDsaYCGHh
	AD97hVE1vav+dw1aJukvN0cbR0aQSjCukPCB01Ga0dk1sjSlbxjEt3Q6DO4IGkfnHgql
	gg5w==
X-Gm-Message-State: AOPr4FWOsCLf93XmOlSTdahP62S6Cj7PkBcpZ4TDfy4jqid0DXNujl6AgtdH7Z1QSUzGFQ==
X-Received: by 10.140.22.232 with SMTP id 95mr3840693qgn.24.1462977112232;
	Wed, 11 May 2016 07:31:52 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	k19sm3545276qkl.19.2016.05.11.07.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:39 -0300
Message-Id: <1462977042-7436-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 08/11] weston-init: Error out if loading a nested instance
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
X-List-Received-Date: Wed, 11 May 2016 14:31:52 -0000

The Weston nested instance support is not implemented. This errors out
displaying an informative error message so someone insterested on it
may look at implement this later.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


