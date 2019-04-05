Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 565477D53C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h4so6557626wre.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=C+BW3MpRUOgdwTaYkrOG02yxubK+GXTqdztbEq1RP6Y=;
	b=LFz/wwnh+VOkSxAmQWkTtcWPqogZD0aYB+YwaCkytKxZHLZ6HJbAH90qMHoE8c2MDb
	BSwwmzYK0sMiQEuBR4wfc9PaenaWzVpeD8M2WLhoDorYGh/CAz1BWozmDAmsiRz+mLVX
	I67mWA7HuXsUMHwDrdomqpMtqvf+Ksd21cXUYaDnn4LKqhmLhh/+TIO+UUUYzLV27YmO
	Hm7XIyCurAloP+AcfrcAj3diV7mRhJE8VetdMOMyBJtd0sSyBsgQtB+ynTf2pxMWaZCw
	cX9RBzfJXz0UatxYEYtY5YBG52HxmBc1A7c5w2rpQMHc8l6ZDnTLwkZohJg+eNruJeNn
	mvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C+BW3MpRUOgdwTaYkrOG02yxubK+GXTqdztbEq1RP6Y=;
	b=TegL5JwWCFNpC4DPyh6CP6s0xrsV3lCntx60hj5NIEjNqJz5KBX5LD+E4irUBLHCzt
	5CGwlz395hV/9osZM9fmwxCqUjMdl4wAvP0E+unjJtquZ2aEHtF5OEWLZbZf8hrbda39
	jsXB0hvjz3opg6pFQz0oXbov0YtrBCYFybdEgZt30Udi20LcTdx4ZKLw11m/S7bhGImO
	zs+1qBItG1LTjSsDJAXblSdnGouOOOTDW+GIamRF0JjZsw3tZXj2OEYv7/iecfPCmt3k
	kDzmzUYVWVYhx77UfzPDfw6FBqtxmtXkeYl1BE3dR2pTBo/T1dAOdLuKSTeZXKICbL4g
	9GGA==
X-Gm-Message-State: APjAAAU6G8xteiwC5XhOwCMQJX0dYyjEwXzSNG8usPJXj1eRNmvG6dYh
	ypvm32vGbEh1QCDneOlzwSwQn9Ne
X-Google-Smtp-Source: APXvYqwcZGw3xkMomb3WOhhWmDU6v3qztC5ie/j3CdHu+RmX4v2TwMMsBmrhFlzjQggPx8uyvkCKdw==
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr7172011wro.274.1554446272849; 
	Thu, 04 Apr 2019 23:37:52 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:29 +0200
Message-Id: <20190405063736.29750-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] libdazzle: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
index 3779b15af9..c112857f2c 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
@@ -11,10 +11,6 @@ SRC_URI += " file://0001-Add-a-define-so-that-gir-compilation-succeeds.patch"
 SRC_URI[archive.md5sum] = "24e2e1b914a34f5b8868a9507d1f3c4c"
 SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf72933119e36dbd90b36d5"
 
-GI_ENABLE_FLAG = "-Dwith_introspection=true"
-GI_DISABLE_FLAG = "-Dwith_introspection=false"
+GIR_MESON_OPTION = 'with_introspection'
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-- 
2.20.1


