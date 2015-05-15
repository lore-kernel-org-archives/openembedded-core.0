Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 257F974187
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:44:06 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so42846540wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+TEr+7Rp8RE171eM0WOG5NoMYFkDYfmIchgjviZo4lM=;
	b=Hh8nmqVWE/3Vw8sXUr6kt9B0nZY/K/aC7nmTYyQ40hHiA86G/QTNDHO/UjT2UJVOC1
	9lQrb2zSP/50AskJHWpmNNRDMXwQX6XY1Mm3SbV2DaInFtztWv58hTMZr42DXF7JrrvH
	0XqTkeS7HtAc7uJxKfs5RaBNDhZr8WI0YlOw5jraB2Mp4vyfqkLoODwyNEXznioQBhJB
	AB5tS1FaFWTEXGeXeCPhO7ZXp+cqIHo/OxtzK62buyxQxlpf46wcFgfBlvMhVbo4kQtk
	TkiJBNP1TBzjNekG4MNghzKIkpO6USxib8t1U0yLQA6rShp1rzTJqEG86BuzW/xalFTN
	UQBQ==
X-Gm-Message-State: ALoCoQnvs7ctVFPxG3YrDDTcSIvXX2eZ+2T69wuwQpXxCHchjqJw95WpP6gNgr3eQJxTk7si5mli
X-Received: by 10.194.95.132 with SMTP id dk4mr20505821wjb.88.1431708247115;
	Fri, 15 May 2015 09:44:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ha4sm4081168wib.0.2015.05.15.09.44.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 May 2015 09:44:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 17:39:51 +0100
Message-Id: <1431707991-16826-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431707991-16826-1-git-send-email-ross.burton@intel.com>
References: <1431707991-16826-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] automake: simplify perl location forcing logic
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
X-List-Received-Date: Fri, 15 May 2015 16:44:11 -0000

Instead of letting configure find the host's perl and then use a complicated sed
to replace it at install time, simply pre-seed the configure logic with the path
we want to use.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/automake/automake_1.15.bb | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index d5b6e9e..c33dc22 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -25,18 +25,10 @@ SRC_URI += " file://python-libdir.patch \
 SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
 SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+
 do_install_append () {
     install -d ${D}${datadir}
-
-    # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-    # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-    for i in aclocal aclocal-${NAMEVER} automake automake-${NAMEVER}; do
-        if [ -f ${D}${bindir}/$i ]; then
-            sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/perl,' \
-            -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${USRBINPATH}/perl \1 exec ${USRBINPATH}/perl \2,' \
-            ${D}${bindir}/$i
-        fi
-    done
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


