Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 820397F69C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az9so1190330plb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KJAVmHQqFrlZiHh5vjVuwe7NvdgEBxMOpIATy37cncQ=;
	b=FhtTLb1XGxpVxopxE+iDtx9XINqv17TCSZ8FgMZ6aLGgi1/fE1Mpi30bXERdORADeJ
	9/xbqGs9KXCVPcmiMZdnaUYhFY/WdOQ/BEHZaDU1Sso/hdaSvZSCAqRQWokQdEb2TzGs
	+QbM0hO+OJ4s6zdj0hTxhmIw+4fRsrp/y8qnqK5UtM3cGAQzcRSsclfi3dk8e2GVFndF
	F4kdptZHq8yBOSKBtpzBY9gwNyBD/+uusixSTK7Y6DjjwxgZUhefXjEoXor2/HY3d65z
	VnYcaLQFI0ilZhvGpRllPH7Bew+XteMF1NKgFn2D8dIYrCrYuMeU0zmr1fEjsvjFzivE
	mthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KJAVmHQqFrlZiHh5vjVuwe7NvdgEBxMOpIATy37cncQ=;
	b=jjzj3KO6Cg7zviOOgv1nmQc2dZMp5dVSIsITgMv0zX6BSw++FRsg7NZl0rMApTllXn
	6vZYpLRBVFCq5SyGaeolGc7PtAuRudypygloWa/vovskBXGg+9oBUgSmWBfn1rAcl6rK
	yDzzoFarujvE9lTS5cORTDsOVtDIy25FBnKoGIuV+L5XjIc4J+SBIZ35Fzf9LnOtAPK0
	tiNi+jMYnlXtyaioPecg4HbUtGCkWh6fYP19ZTeyum5gpvWGvVUVwCkOutMOcfdrif9U
	V8IoTw+EgzIGyn3XU1a6vF9y1EaaEqyetj/xqk+7XJA9sJ3bjUtbbZ+XeTiR6mAusZ9G
	Pvvg==
X-Gm-Message-State: APjAAAVCAWMRHAEQanH2g9kRYSdsiDXRp/BHsbldutcWoxx/86JwAdaJ
	lbLBRw5jyGO3J06fGSrnKArm6bbp
X-Google-Smtp-Source: APXvYqwzikWgvEbl30icRX/DXZlbyCTjal1PDO49RRE3QFfcDfsabsl9vJzgH8N+pEHrBzz1RTIcbw==
X-Received: by 2002:a17:902:9f97:: with SMTP id
	g23mr4298222plq.201.1573658395338; 
	Wed, 13 Nov 2019 07:19:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:12 -0800
Message-Id: <c552c9f0fe0f8aaa230a4c6a410a00e8b99a74ae.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 09/25] lib/oe/lsb: Make sure the distro ID is always lowercased
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:54 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In commit 8689e561 (lib/oe/lsb: attempt to ensure consistent distro id
regardless of source), the distro ID returned by
oe.lsb.distro_identifier() was lowercased, but only if a release
version is also present.

This changes the code to always lowercase the distro ID, including the
default distro ID "unknown", which is used if no other ID can be
identified.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/lsb.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 4f2b419..43e4638 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -110,12 +110,12 @@ def distro_identifier(adjust_hook=None):
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
-        return "Unknown"
-    # Filter out any non-alphanumerics
-    distro_id = re.sub(r'\W', '', distro_id)
+        return "unknown"
+    # Filter out any non-alphanumerics and convert to lowercase
+    distro_id = re.sub(r'\W', '', distro_id).lower()
 
     if release:
-        id_str = '{0}-{1}'.format(distro_id.lower(), release)
+        id_str = '{0}-{1}'.format(distro_id, release)
     else:
         id_str = distro_id
     return id_str.replace(' ','-').replace('/','-')
-- 
2.7.4


