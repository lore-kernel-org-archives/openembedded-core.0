Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30990.1794845354150093144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UDGYuHS7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 878D31A169E
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 534966023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A508311BC118D;
	Mon, 16 Nov 2026 17:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=erSVqWI78lEnhpLf5UUPNQfFpKsZAeF7SptVYVYEBhU=;
	b=UDGYuHS7/qVCSMCgYqTjrHqmBvJGYRSsHxXaGk6iY5lcnfR9JjTnR+EWgoJWTv0ZryK0UK
	nIXv4AUguAr1ZaKYxdiRTR9JoAeG7omzVyF+1dvNL/F/78MP4uPDggdf3gntrh1yJbuVqs
	uloSERrzhxLjQKOvv0As/bCiq8O5O6WXotw42+mnSvdOdMpuP21K+WWOGzPTr3bJKYuYB/
	Pnb2lMKHzra9+WivoFYcOM9eojReOcNU1CLNhgsXneQcgMkrHg4FQNUAK/n6m+LWennqs9
	5M1p659jXf6ta2RaHfeODxGZ5HAp0SuB5CTHLTzEkLVzqQh/jntL2fOko3TFog==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:00 +0100
Subject: [PATCH 02/13] oe/path: simplify replace_absolute_symlinks()
 signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-2-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=q7pMTPCD5vnTHQe370SEIfvRBunRiQ+NtLjn/hH9tZ4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqeML78+LPk6oa+bo1b+QHZUNmGLnsRNYG1M
 XSCML4irrSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqngAKCRDRgEFAKaOo
 NpmAEACZvqW3LF2DoDjHFnDaXXaPmY6E+Xwwrh2xF3AJD7wHUoMEaWfBaVn6ODfp0gJ0Ki6nJEL
 rCM8GIUFOaI1P1fGkt4pFv/hz6PEl4hF5A61Pv1+jMZB6p2HKOoZaSbWiju36wnyd0NraO0wyHZ
 pJhq58ArrUuuHCRYnykirbqcdlEGG4oCZ1na3HbOIpq3dO71+jmywfO8USKdbrbfwwdIMSXi/IA
 PRTrokwVpVmcDV26BPkfhCmHGLjlaV+MrW/gutjXFBIeS/GWk1BTsixquo2fFZB4W5/ypBMpDKO
 5fFiN1DoVf+sV1XLpa73T5gO1Wh0asG/UdT4A0qhdNE7yhrsL7pE2XpP87HfQhrjFjlxWre/n3z
 ktF1BQt9sNjGADL6Bzj8rbt1Fim8nZsNXHVZdkSPp9EwZNnlz1gVJK9swsLOA/BAkkoQksvNcqM
 2ukQuk9vcdA59+u9J+vseCmUn4d+d+sF0HG2FTec0heJzu/6HNB2ILQooNL2An/kY2N3fWsw8Zt
 EJIjQw4TTQE3RLM9j/PF9i2PZikE7GVpDSwvTXbrM9dtSCakgnWKXc/xrIqHftbWPGcskY/1iB0
 JcZkPmeWopZOUFh5QQRbuwD8CAMrsXJLqghVFMrD7k4PjvYAnLcg9sXic+h0vTBoZIVbhTahHdx
 ZE7efhHvxyRzgqg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250352

In replace_absolute_symlinks(), the datastore (d) argument is never
used. Remove it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes/relative_symlinks.bbclass | 2 +-
 meta/lib/oe/path.py                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/relative_symlinks.bbclass b/meta/classes/relative_symlinks.bbclass
index 9ee20e0d09..d2279028f2 100644
--- a/meta/classes/relative_symlinks.bbclass
+++ b/meta/classes/relative_symlinks.bbclass
@@ -7,5 +7,5 @@
 do_install[postfuncs] += "install_relative_symlinks"
 
 python install_relative_symlinks () {
-    oe.path.replace_absolute_symlinks(d.getVar('D'), d)
+    oe.path.replace_absolute_symlinks(d.getVar('D'))
 }
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 8fe5bbc7fb..366ab9720a 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -59,7 +59,7 @@ def make_relative_symlink(path):
     os.remove(path)
     os.symlink(base, path)
 
-def replace_absolute_symlinks(basedir, d):
+def replace_absolute_symlinks(basedir):
     """
     Walk basedir looking for absolute symlinks and replacing them with relative ones.
     The absolute links are assumed to be relative to basedir

-- 
2.56.0

