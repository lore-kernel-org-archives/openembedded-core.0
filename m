Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id A757B60034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 08:53:47 +0000 (UTC)
Received: by wetk59 with SMTP id k59so32852179wet.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YEu88MUgvU+TaBQItmu4qNTfpZ6Nq3ThSBGHmiXAzBc=;
	b=lU1LeF2LpIcAyNIZNELrkId1nALH2qv1Rqt2n/Efcn1kNadh9fsoZLcqBjKkx9Xn9k
	1igAzbgLb0K9YpJIs24BFnobGHKW2SFRyKYLz4CMLFLBpj9EwrztzAZD9pIHDXW32fNl
	6xdrn2929cBwOto3GE/F+/mO9McxGnFc0TerNei9TeUt3JwlQtkYVhQ9/Wa9GD+NjJJs
	y70tJGbeJxu1ekt0vrY8Ynbx2YcUw/qGFrA9QHdZuVZm0YiDU2Ip81j7j6CJXsevpGQH
	3OUhZ2P1+on4vwYOJMXSxcLBx+r3F0cXxmKb4q5Mm01FtENzOuSAj7ZW3dw/CTzSyW7F
	WXFQ==
X-Received: by 10.180.77.199 with SMTP id u7mr59284856wiw.42.1426496028211;
	Mon, 16 Mar 2015 01:53:48 -0700 (PDT)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249]) by mx.google.com with ESMTPSA id
	dn7sm14346180wid.12.2015.03.16.01.53.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 01:53:47 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YXQmQ-00071E-Gm; Mon, 16 Mar 2015 09:53:46 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 09:53:45 +0100
Message-Id: <1426496025-26942-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 3/3] packagegroup zeroconf: nss-mdns is libc dependant
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
X-List-Received-Date: Mon, 16 Mar 2015 08:53:48 -0000

glibc provides NSS, other libc do not, so only add libnss-mdns to the
zeroconf package group for glibc.
This fixes the build of core-image-sato for e.g. uClibc

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb |    4 +++-
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
1.7.10.4


