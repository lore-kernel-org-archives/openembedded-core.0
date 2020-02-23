Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E805361731
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 10:55:14 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r11so6969334wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 02:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X/GENvoszb6GJGT3cy0kZMOsfW4GagSEeWndUfbfc6Y=;
	b=AOIjTZmAGY1y5+oDYm2BXqdkUaRQgF0WbzyYvtgRXmcMM1NQeXBGk1uWPEdAkRFflq
	QKH/o8iw/l/QB1SdAJS4SX3T3bdFQWxQEmNEKDtmme9VWgtCz3XknyQmQdUx0v0Ubjbx
	6nj9R4esqNIA0YSxv4ZlTMyqWS5vMMvq7sum0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X/GENvoszb6GJGT3cy0kZMOsfW4GagSEeWndUfbfc6Y=;
	b=V87C/7nVZkGax3txsxN7BgdV7d6JS7U9ePi2iu37NZO7R7wz2tlT2LQR7nj3uP/g5g
	e/I1gH047xbhXLIBWaO0Vc/rCQkg//TfZvWUikSfrpCZOBI84YupnM8qmBRuN3GgR6xf
	yltv1weMIVH5P1gmaL4i2M2sKPlI5+V/XAATlN7LFyTr3rhi4xyjxrdvCG+sAA6H8maX
	ZqS9uVhBHkySeVN52097QwWVbQ0OB9JBF/5h4QgmPqf98MoCdtHBqaPv9jn+IGkZyhyv
	+0898an+O2b2H9y2VdUI4lv2fv4MLzzyfJm8fjTUlKPieWUY6MLGxZOr4CpDxIFQdahn
	HqaA==
X-Gm-Message-State: APjAAAVrmjXo+HyRyD7uh90MACtszYw+Ps+oHGgn4uqXATVH+586EJ0l
	OGQf1Y/HQvODTjEEKQN2++ZuCzVME5E=
X-Google-Smtp-Source: APXvYqwXDm3V7h4fvGYjonJbrbgBQaPQ4is310k2eXtVZ915q198XOvDtOSwDD2qtfvNhz92l7rGjA==
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr8505413wru.55.1582455315098; 
	Sun, 23 Feb 2020 02:55:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v1sm6286810wrp.16.2020.02.23.02.55.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 02:55:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 10:55:12 +0000
Message-Id: <20200223105513.285315-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/2] package: Correct variable dependecies
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
X-List-Received-Date: Sun, 23 Feb 2020 10:55:15 -0000
Content-Transfer-Encoding: 8bit

Ensure that the plain variable X is also added to the dependencies
as well as X_<pkg>.

Allow the funciton to be called with a different variable list too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1efc396ac64..d4c6a90e846 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2171,10 +2171,12 @@ python package_depchains() {
 # iteration, we need to list them here:
 PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
 
-def gen_packagevar(d):
+def gen_packagevar(d, pkgvars="PACKAGEVARS"):
     ret = []
     pkgs = (d.getVar("PACKAGES") or "").split()
-    vars = (d.getVar("PACKAGEVARS") or "").split()
+    vars = (d.getVar(pkgvars) or "").split()
+    for v in vars:
+        ret.append(v)
     for p in pkgs:
         for v in vars:
             ret.append(v + "_" + p)
-- 
2.25.0


