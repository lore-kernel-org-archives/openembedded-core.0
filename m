Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 12A4678612
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:33:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o33so3449091wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rm+LSN6pSWVewHrT7eDkXMe/6Q28iOLGEtGl3czKT94=;
	b=sZJ7PFajD8ObbYzF0xfXvmsYTs3AiwNjYWFvMqoDvH8hvPEb2Oowa7wOoj+NtUXWmj
	3ad+BWtrdmouhpyPCLcIM678IdvtBSMBtxZs3B62MqtIVxC4hPwvaA3d7NBpQmqtZKqd
	rPsAYh58u7OfXxLwE5B+kN2eKbev3PfyyJkZuifa2kJVhvenHZHzejuN5tbT62qLtfRQ
	VuaYeFHgqQtx3iDEl8hcEL1KEXGnr7/H5cq208Qe6vrbQfH4fnIR9+DOZwWUHMQhBkUi
	6o7msk3VxQQus4zFxXQtyKPHQEXp1WARLl+30weiuqlwIcN69HlUZIH1Ad12ypaUQgw0
	v4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rm+LSN6pSWVewHrT7eDkXMe/6Q28iOLGEtGl3czKT94=;
	b=Al4OtITQ4CHvYnxyAEwZEYMZTcD8Pj+715emwNtmUJGfJwZ8m/O3inmSU+Ka2oklOD
	8nrn0llLogLv5fJEJrcn7xbbTOT97AtHTP5RXyjdtnnPCh0hoYPEiloX/lS6+wo9IA6u
	jup6wDJxLtIqtWwAP5ntBD96PvXClSIALtCdlWZi2j3v189OlK9yj9Z+dMh/ywbQDukC
	twZAxg6qA0CHDHihwDWd22YZDjXm2JoNggW6RyCsZZGTW2W1Ep8Fij7jUwBKY0+mOFN8
	09CSVG8gJTzqdOmWm43d42txaEjDuRYj/Qr6Eh1wvwxWKRQjd4Zpzu9IqbVP58yVqD+A
	SbAg==
X-Gm-Message-State: AHYfb5iQrpZd/ubYUeClgKp06fcFsxZhfTw4CTk3CkM09U8yjlWV0N2J
	r28AQHwn5QM1Xi6t
X-Received: by 10.223.134.39 with SMTP id 36mr12462516wrv.244.1502498009112;
	Fri, 11 Aug 2017 17:33:29 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m189sm334638wmb.9.2017.08.11.17.33.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:33:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:34:54 +0200
Message-Id: <20170812003455.27183-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812003455.27183-1-Martin.Jansa@gmail.com>
References: <20170812003455.27183-1-Martin.Jansa@gmail.com>
Cc: Gan Yau Wai <yau.wai.gan@intel.com>
Subject: [PATCH][pyro 3/4] insane.bbclass: fix override handling in RDEPENDS QA
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
X-List-Received-Date: Sat, 12 Aug 2017 00:33:28 -0000

From: Gan Yau Wai <yau.wai.gan@intel.com>

The package_qa_check_rdepends() in insane.bbclass has
incorrectly replace its localdata OVERRIDES value with
the package name. Fixing it by appending the package name
to the existing OVERRIDES value. This resolves RDEPENDS QA
error when setting PACKAGECONFIG using a pn- override at
local.conf.

Cherry picked from master 60d28dd72daee235150ab6605cbf953f1ea691df

[YOCTO #11374]

Signed-off-by: Gan Yau Wai <yau.wai.gan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dc1c2f8d41..5a3d017004 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -867,7 +867,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
 
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES') + ':' + pkg)
 
         # Now check the RDEPENDS
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or "")
-- 
2.14.0


