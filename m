Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 50FB77C3D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 16:59:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t200so7363698wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o/PijOk1ASKyOnRCGevyvPA8BqbCPrGfwq1AbW0Wkhk=;
	b=Ynfe8VzBzPlD5k/6eUxnrZAy0zUT2slN6tpTgqOTWHZ2azTEfTlbKph2s0fTEUiZjo
	lwfAXnWkXt2yyHVIEUsZBxJSC7Zpf8qU9gmAs78z30C4B2BiBLOvrJifdMBTaG1nNn5d
	Def5LIdUH+QPkWg3ax2nvUzo8ocM+5M43lzpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o/PijOk1ASKyOnRCGevyvPA8BqbCPrGfwq1AbW0Wkhk=;
	b=IjBkKNsJ6eQJE29rrIeIPndts1530wgIgXJ8L4A0jrpdkcZRNdR0EJ/+a4MpCSkYZv
	a2rZgEcZVk2OUnV2SaBoUZoiHEubj4zi/jED7aLdBY7Z9SlUEEn/j5apyan+dmtJoOAh
	I7RvzmVJxmioVFQMsYk8FuCmifzGEziOnmyzmQmSvErx29WpZ4Zs07cdBxfS647onNdC
	peiZ/l5Iq9QzLjfpi7iZCDqASpbx5BQDjtOgBhhEj99p9fh6/5Qduwe4h+X3IGbuED1R
	cYASl8reRwVNCPWTym76hCXdCRdPG37kVPMdzttl4Adzn1kFCOcEhohd3HQl4w+zP45q
	8rgg==
X-Gm-Message-State: AJcUukcukcy+EjfJafRsvE5rybJvOaq+zb+S0IlXeYpzbk0cuq/igGl6
	4nnA4VFz/ywmoFA2FlaTE3lIOyqOySs=
X-Google-Smtp-Source: ALg8bN69NP5KjykJxbOfFD/hdFRAhtZlpkuSIK55n7m9jN1cY/PlJR3wDWb4L19BUaaUgSsNmkt/dA==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr7844709wme.35.1548435555692; 
	Fri, 25 Jan 2019 08:59:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e9sm89003453wro.16.2019.01.25.08.59.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:59:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2019 16:59:14 +0000
Message-Id: <20190125165914.4708-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] package: Add pkg_postinst_ontarget to PACKAGEVARS
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
X-List-Received-Date: Fri, 25 Jan 2019 16:59:15 -0000
Content-Transfer-Encoding: 8bit

Changes to pkg_postinst_ontarget were not triggering rebuilds, this fixes
that.

[YOCTO #13127]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 853735f0c64..7dd1b09a874 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2123,7 +2123,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
 
 def gen_packagevar(d):
     ret = []
-- 
2.19.1


