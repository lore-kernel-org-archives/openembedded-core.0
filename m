Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 041A67EF5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:47:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x4so28757905wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oJty01mZusnYjqG1dhnfm4hXSn0/7cyuI8WThfRB0K8=;
	b=JDKPGv/jTrlGN/vrKz0CZ9pZ5kHxBphBL8KdJCMjtIaYMNH5Nv4rvb0lrHeiPg5pTc
	tgSH/MTXOc9skVSCL8NYZmqKuPtI18+ELrH8+7e5d1zRhRkzRedjBO1ef2Yv8hDkc2P3
	W/fpD1BCoy7VC1grxjoql7rpbYct9YGLYlPec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oJty01mZusnYjqG1dhnfm4hXSn0/7cyuI8WThfRB0K8=;
	b=JeCx7Cvee+MvViKhkNja3yJl+9U3p3xFLNO0M8nbj3qKDu+XBtPTlo+IjdFhjSrwGm
	+MUsm8jQaD2oh5Mn9wNzLHUjBnMAZOLHsJUop9TMTViSZwK2Ok7+Ex54wbFj6vmf9N8n
	gG8x7JJvjbPTKqghNndncCaNeEgRD1giDj6/HBKhCbRZAqNG2ZdcYgQJGbX4ZTV4NREj
	a+DCNrbzWyZlVQc6P607/7X0kuFwH+aIBOn0AlO29QU3BH1NEH3SqmKpDy28ZBnYGKp3
	O4286i90i+MV2bL/B9AXtz5N0PhgtCMq3o1S6YJWbMvrrm7RoCpnpFhC4qngA3kemHV1
	xBxw==
X-Gm-Message-State: APjAAAWOG5DiA4eyieu4DcOtG4D2tIBfaVXiVpIYTYtEBB6wwfJEPX7x
	DZLROfaWEW+eusMVAiaGIf/a52Ywe0bnjzaQtE1ZDF+g6R7PNdHDT/hTAKJ1/fuzovGN2abW9pZ
	w00NeTZt/W3McAAixGGZWwYU/3M2Aqxt4wE3Dfbkc8sY7gDmm3sGAEhcut8SM1L7KI6S2iS8dbe
	VCBm9Gvm1ccbwboWiX0epYIIMKd1CpW9pG
X-Google-Smtp-Source: APXvYqxizMRsbUxxARaeXqX04xrglwEjgmwMlI+MkOP1vwde0yZbIyWi7szSCmADZVFkqu0u9b1sdQ==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr48383576wrj.272.1563457665578;
	Thu, 18 Jul 2019 06:47:45 -0700 (PDT)
Received: from jt-laptop-pro.localdomain ([185.116.129.142])
	by smtp.gmail.com with ESMTPSA id
	j10sm25631675wrw.96.2019.07.18.06.47.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 06:47:45 -0700 (PDT)
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 15:47:39 +0200
Message-Id: <20190718134739.1644-1-jean-tiare.le-bigot@easymile.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@easymile.com>
Subject: [warrior][PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 13:47:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index eef1f7b945..e1ddf63cc5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1210,7 +1210,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.19.1


