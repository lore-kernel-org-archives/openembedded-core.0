Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A46AB73689
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 12:27:59 +0000 (UTC)
Received: by wibg7 with SMTP id g7so36295898wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9kG/AgDpCbCRdvuuOaGEACbwUEL5MYzSVdqnuYD8lJI=;
	b=hNOlwBWmcvvU6eXGN9KmWAFLVdvMPkwGtXKqZNT2Gn7xCaRaTxCPHZ9/JdXh6w22qc
	zoRRvw0QmXiapO7f4HffB8PbCIfl0mtlUEMoCDctegGr1JV4yAJsxVrYyZcq0MQja9zM
	1Fcgb+fAOImsOLltittyyesb2/nwgq5AwLPds3gyXjPcMwiMU//ZLbxEDUfhPfJqhv2D
	+hII4MsNm0HllKNcEZj0xKA+XXR2bBLvk7B33tsAuplj66OZUR+4TnEd3syhmifyYCbX
	QW78RtK5fUjBtzPUEWUuBKCEsihns4dppDflmORB6HCTxb4uiYbbnUQl2aauGcqOR/MJ
	Akfg==
X-Received: by 10.180.198.162 with SMTP id jd2mr159717984wic.21.1426508880275; 
	Mon, 16 Mar 2015 05:28:00 -0700 (PDT)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249]) by mx.google.com with ESMTPSA id
	bo1sm15207887wjb.15.2015.03.16.05.27.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 05:27:58 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YXU7h-0007rv-Sk; Mon, 16 Mar 2015 13:27:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 13:27:47 +0100
Message-Id: <8e95be5279f99d4b65205197fa15b79c1f737ecb.1426508573.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1426508573.git.rep.dot.nop@gmail.com>
References: <CAJTo0LYGf7o8G81Sufv44e1e-FwOvCVZzvTc=iCbLnEQO_GMxg@mail.gmail.com>
	<cover.1426508573.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1426508573.git.rep.dot.nop@gmail.com>
References: <cover.1426508573.git.rep.dot.nop@gmail.com>
Subject: [PATCH v2 3/3] packagegroup zeroconf: nss-mdns is libc dependant
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
X-List-Received-Date: Mon, 16 Mar 2015 12:27:59 -0000

glibc provides NSS, other libc do not, so only add libnss-mdns to the
zeroconf package group for glibc.
This fixes the build of core-image-sato for e.g. uClibc

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 369b63e..262d65f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -347,8 +347,10 @@ RRECOMMENDS_packagegroup-base-nfs = "\
 
 SUMMARY_packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS_packagegroup-base-zeroconf = "\
-    libnss-mdns \
     avahi-daemon"
+RDEPENDS_packagegroup-base-zeroconf_append_libc-glibc = "\
+    libnss-mdns \
+    "
 
 SUMMARY_packagegroup-base-ipv6 = "IPv6 support"
 RDEPENDS_packagegroup-base-ipv6 = "\
-- 
2.1.4


