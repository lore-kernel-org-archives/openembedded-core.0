Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULL2r-0002US-9w
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 23:11:51 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so1840dae.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=5w++wDvXGxHzosnelJ1TCrd30sg3f7i4ZgX0odCk4gw=;
	b=YuK54dcc5uOeUCjruja/xPHrW4er0wnKtZGE8kQyoGl6tFM+0hdYHBjuf0rNDy04/I
	9uDjfTYnZ1KIlhBWwlgp1P5p4iIVw7hA3DexVM4ni8rzxUKUMpEh5wu8FgiHy8MIhemt
	7kdJMs9Qs0cehDs5vXe7vVSUjAjp8vAkIzpxkps4KkiigYzpBxEZZQVu4jMomQbLA/yH
	6WtInoiaW8GSzC5SLYhltEsJ8LV82KNn2DdyRbV840Kl6w/Ul5otcve8j5St0m+Jg9MW
	Pb5ay9YyfLGvikdvKF4Kte/CjT8Too7X/7tx7d8LCGg5znz7yL75/qIvjNm3In5YcDbe
	NCyQ==
X-Received: by 10.68.224.1 with SMTP id qy1mr238527pbc.169.1364507677538;
	Thu, 28 Mar 2013 14:54:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm263386pbc.20.2013.03.28.14.54.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 14:54:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 22:54:27 +0100
Message-Id: <1364507667-26360-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] tcf-agent: Don't download epl-v10.html just for LIC_FILES_CHKSUM validation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 22:11:51 -0000
X-List-Received-Date: Thu, 28 Mar 2013 22:11:51 -0000

* it's not part of sources, downloading some html from web is not better
  check then using meta/files/common-licenses/EPL-1.0
* http://www.eclipse.org/org/documents/epl-v10.html was changed, plain
  text looks the same, but html formating was changed (from MS Word
  export to valid XHTML 1.0, changing checksums for this new html
  would cause issues for people with old epl-v10.html already on
  PREMIRROR, so lets just remove it.
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 25fccaf..4d43c62 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -3,22 +3,17 @@ HOMEPAGE = "http://wiki.eclipse.org/TCF"
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
 LICENSE = "EPL-1.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f \
-                    file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
+LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
 SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
-           http://www.eclipse.org/legal/epl-v10.html;name=epl \
            file://fix_ranlib.patch \
            file://fix_tcf-agent.init.patch \
           "
 
-SRC_URI[epl.md5sum] = "7aa4215a330a0a4f6a1cbf8da1a0879f"
-SRC_URI[epl.sha256sum] = "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c646d36bc72"
-
 DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
 
-- 
1.8.1.5



