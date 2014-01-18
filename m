Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 99A536DC62
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:37 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so2606161eek.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=f3bbWAzrCu7qjBKoFn+ggOaCvCmh4miuNgxuS+t4DCw=;
	b=CkgWtPduYJVfAcjKcgNsBfzJtIPmj/wIgbcAgzB4Rg0Jh65+SGrBGagI0WVZ1nlnwF
	g25g54pnSAkYYjrg/e9LeffBySvnluWb0vzqgp1EgFiynPeP9MUXl5/AcTo8i2/xj02V
	uENy+F/MGndCwhMpkp466DWcEKUedfyPxO6pzRyNVUXxs8lcgqeVLwrg4qvOGv8gZGzb
	wlQtL61u269L+b6NATUi157ulNl6qT3B1aucTaSF2sPZyqDchWNVnHF3vCeBrZDZHW7L
	C9ffe1BYni6LQMPp9GpthFdPE9WYcyVBEhqGUICz7M1O0FemNrT5uxjwm+U071gq9y2x
	ptDQ==
X-Received: by 10.14.88.5 with SMTP id z5mr158324eee.101.1390053697627;
	Sat, 18 Jan 2014 06:01:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm35485249een.13.2014.01.18.06.01.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:51 +0100
Message-Id: <c09cd914df61fec6ceaee27e0542420a2fc57313.1390052402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/4] icecc: Don't replace non-empty PARALLEL_MAKE with empty ICECC_PARALLEL_MAKE
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:38 -0000

* it's needed for use-case like this:
  # Inherit icecc here, so that all builders have the same sstate signatures
  INHERIT_DISTRO += "icecc"
  # and then disable its function by default (so that people still need to explicity
  # enable it in local.conf if they have configured icecc and want to use it.
  # You need to set _empty_ value in local.conf to enable icecc function:
  # ICECC_DISABLED = ""
  ICECC_DISABLED ??= "1"
* so default ICECC_PARALLEL_MAKE is still empty, but we want build
  to respect our PARALLEL_MAKE, unfortunately we cannot do something
  like ICECC_PARALLEL_MAKE ??= "${PARALLEL_MAKE}", because that would
  cause PARALLEL_MAKE to reference itself.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 7147d2f..5af764d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -147,7 +147,7 @@ def icc_version(bb, d):
         return ""
 
     parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
-    if not d.getVar('PARALLEL_MAKE') == "":
+    if not d.getVar('PARALLEL_MAKE') == "" and parallel:
         d.setVar("PARALLEL_MAKE", parallel)
 
     if icc_is_native(bb, d):
-- 
1.8.5.2


