Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8346B7EF49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:47:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so25788559wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3hLrTxnTdJNQKsCWEnXpzIVZDTSQiEeObSV4rwVAGp4=;
	b=P7ArPMPx0XA6bzFm8I+Ue8bRVn+/q3KDSYmtCaV9/yy6Ybc0LxRTTpUt91DSVd1Hxx
	5ofXnM1opzDuZ5uccEOf+0Hf7Y+Qp76BBgEk104r/OVwBtpEqC21qFygW/Q4T/D1HX9v
	mt1UjObpRH6GVlhTbt5wJu4QLz6uEeOZVfslA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3hLrTxnTdJNQKsCWEnXpzIVZDTSQiEeObSV4rwVAGp4=;
	b=XkBqacdSIwZMnN4BuCV+B8zAllhuXMV9UnNz+b4+z28B/tThpNsJEKvmrnFDrzWSGy
	ElcMzOxPOCF79zF54+dgOKm1qZJIxHOSeWMBSOcl6QM8PUxQ8Y2NxOYeUGptxa0CnpVd
	7+1EeEvyQ4AHFjGblUMZyzbONk2Ye+z3YqWGIWEy5Rd05NQ861KHXvH/7qHE+1Xu6Pov
	oe/tIVuT61AW/L5oW95kTm44jw+P66EiuuEZzhSApdG9c6tLLNBL5ft7C93/T+CRNlTb
	kqNQJvrthBt7sPlzBUSDdews12edCSPNeC6Zfm5Uwhj7R/g10M2K3dmiag6na+GgjC1+
	pyhg==
X-Gm-Message-State: APjAAAVYM65hroWa7g7M86pYL2eCuEVn/agMvD5q95NgAF2USu0roBdR
	jm1gUeyZ86FkDsT/uYA4ClNDm0KKwbb8p1Gu6j0Y/TNSmHKhogCV17cxB7a23OKXsiy/+fxkIDE
	ce6gUYYfE5KqVfva1lrjT4M5F0GNIDuIGEjwJFMKzl1dVqXbDbjEkUirTvZrv7Jt3i6MVzs2ExH
	Vn51wU6hv1XrkOVWtuVjyqFkyUQuxCIta/
X-Google-Smtp-Source: APXvYqxfB40SZ6RJPZewMfhGayYWFMXsCcYTnMuzHUvBKxXawkZJ/yxrQXjyqN2wz78ikjTzuHxUFA==
X-Received: by 2002:a1c:ac81:: with SMTP id
	v123mr44048934wme.145.1563457635915; 
	Thu, 18 Jul 2019 06:47:15 -0700 (PDT)
Received: from jt-laptop-pro.localdomain ([185.116.129.142])
	by smtp.gmail.com with ESMTPSA id
	t6sm27184328wmb.29.2019.07.18.06.47.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 06:47:15 -0700 (PDT)
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 15:46:52 +0200
Message-Id: <20190718134652.867-1-jean-tiare.le-bigot@easymile.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@easymile.com>
Subject: [thud][PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 13:47:15 -0000
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
index 66e423e999..29a742c169 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1203,7 +1203,8 @@ python populate_packages () {
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


