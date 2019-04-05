Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2AE7D536
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:48 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c1so5445594wml.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BJrLXsWY6rNGlZay9sHUvgmpdmxcCAXW4BWkPKc695o=;
	b=XuP5wFchA5ISqBeTXyQvW24gWkOjlFxih1OeQ868kf8RLV8VS9aJTSFA31viOEWwYa
	HfodW6iwqgKhX7DLt54vxIJb8N9RA3XEthPsmmkDE8qxpQjbYgnSq7uwehN/c75JHJ0B
	8VYON+n5snq+NccpvYahQ/BukV4I9Np5RBgGAclYfEgo6wD94G4RrBB5uhCxaVGQEzMv
	LHli2HU4hPAnW/dVGqsnIBxLHUxoQOKfvN2JJDNK6rWtxoKVGG3hvNotDTzKkJalMfEY
	Xu+hvwnBBJMYlCFBDOwojjGtQe+er0mfYFPNt1LXzZrR6u7QTFO8F567n3r2MMHiT+zA
	UBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BJrLXsWY6rNGlZay9sHUvgmpdmxcCAXW4BWkPKc695o=;
	b=qv9wLIDgIoCvI8HV1aFYSEyYC6mO8xElRDzbwr0ZSlZj5+bglOSl2y1GwzD/+wjNnm
	Qx9Zq6cwfkKRO73pviGtszjt7GLqxbQloRyf23UXnjB7vnLCpB/dZDEh6Hd60FN7bB2Q
	l+oJH4wXuzPrHgowDMy+5k4yfkTMMkHvYL5c5HF3HXA9cQLMRqfC+r9BSi0neATxs8Hv
	qeT2qsSX0KZ6uwJNUiNh8aYugML435Qi8Di+3Ea9eUcM5bG8ccm8ME/PvCtSX0+fJQHe
	iDfidkbDrkBdGeZvCfybENfyKpVqSxPL9f36H3xw2vzRn8pp0k8TeOnQBdF9js4rVRFX
	0kNQ==
X-Gm-Message-State: APjAAAUuikCpZNff4nHr3NYn1U2XctX2MmeZYhjVB9dUss218Gesia07
	S+vAtAga4AxSvQumx8YLiAZi0FBd
X-Google-Smtp-Source: APXvYqw7iW7659C8Zwo9n7cFJsviWaiy3Kx5SP5FUu7+KNSzNGmdIel2O9ogzxxjIcCs0RvUAgy2Gg==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr6880852wmj.111.1554446269530;
	Thu, 04 Apr 2019 23:37:49 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:26 +0200
Message-Id: <20190405063736.29750-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] libmodulemd: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 87e92114c8..84012e4193 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -20,11 +20,6 @@ DEPENDS += "glib-2.0 libyaml glib-2.0-native"
 
 BBCLASSEXTEND = "native nativesdk"
 
-GI_ENABLE_FLAG = "-Dskip_introspection=false"
-GI_DISABLE_FLAG = "-Dskip_introspection=true"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-EXTRA_OEMESON_append_class-native = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
+GIR_MESON_OPTION = 'skip_introspection'
+GIR_MESON_ENABLE_FLAG = 'false'
+GIR_MESON_DISABLE_FLAG = 'true'
-- 
2.20.1


