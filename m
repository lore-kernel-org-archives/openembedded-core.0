Return-Path: <breno.debian@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 386F37DF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:26:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so15515905wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cn3RsGTRBdOhDbNeTaR/svH7TD33xflW/YXImozJR7U=;
	b=b0c3yedMI0foDB9iixsEnBOJTexE9HsU24YaiiuPt8iZyiJFbzZXHkkg8lQERdeHDC
	Z7eG37mIZmiHBCQS5UJ24uJaY0zVy4Uch79ku6v4vnXocYCkXu3B/m21toIJV1kXpT4t
	45HfzZKcgYWruX35J7MeAVdYOE2ANRWratnqpLpKv2EZ4eICEL3jHjQuHdfRu4yqqHVC
	+nqjl8w5uWHVDZPgtWZvjJrNSQ5o8b1yKsw6zRcjy0AjcO3tGhHMamUXreTz1T0VyANp
	8db3ha2DUFTSXlFXH5mhFCH+ZDdnN7fTixEJv5XhIJj39ZnQ0o4HDeVnVehEmzK728ib
	geJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=cn3RsGTRBdOhDbNeTaR/svH7TD33xflW/YXImozJR7U=;
	b=l3dXt132Q7Tly//9o+u9VZ9XIVqzefei3A2t/T1sOfmAjptJH3dLu/RFoZYotBWfJE
	8b95SFtP+NyHS2U3xNCub4EZl5KSY+iitIkjzlwMr29Y8+twBsK7lOlHc+fkf+Zpw3sr
	mYvtokDqZ6P63FnWqbQndVSkZ9idlPDJZ5QcTxP0dUnKvt3sjNgqw0qwM13RVC+CwLXz
	rgkCcM0fk0AI+oGYcgXa2DDTiwdCvFxqp8amyB7eJvW2OBy01eSEVhCV0RMmy/Mt0Zn6
	c/m6+mJGX34UN8xa0ezQn3/YR/8O9sKnvL0Ky2yFFk5OU55x+HVN3VY61e89XtNHPOe2
	e2wQ==
X-Gm-Message-State: APjAAAWoA4Q/xyRsigWDiQpA0nrJjPOXtFoR5SP3x7NqsXwRJSE4mFvS
	pxLAHIcwWqGs6UvIUwemIWPzYjfZ
X-Google-Smtp-Source: APXvYqzXOC+C8MSfEBeLcCugVbyJeeVpWlHXuUxc5PEJb4EKhfCY2XS2hkwgvCTVIDBJnu95S2jUDw==
X-Received: by 2002:a5d:658f:: with SMTP id q15mr7610001wru.213.1557757617526; 
	Mon, 13 May 2019 07:26:57 -0700 (PDT)
Received: from leit-mbp.thefacebook.com ([199.201.66.0])
	by smtp.gmail.com with ESMTPSA id
	d16sm11586582wrs.68.2019.05.13.07.26.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 07:26:56 -0700 (PDT)
Sender: Breno Leitao <breno.debian@gmail.com>
From: Breno Leitao <leitao@debian.org>
X-Google-Original-From: Breno Leitao <leit@fb.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 15:26:52 +0100
Message-Id: <20190513142652.77287-1-leit@fb.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] weston-init: Fix WESTON_USER typo
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
X-List-Received-Date: Mon, 13 May 2019 14:26:57 -0000

From: Breno Leitao <leitao@debian.org>

Commit 837c786d600ba69('weston-init: Add support for non-root start') added a
typo that uses WEST_USER instead of WESTON_USER variable when chwon'ing the
XDG_RUNTIME_DIR directory. Since WEST_USER is not defined, it will `chown
:$WESTON_USER file`, which will work, but that is not 100% correctly and should
be fixed.

This patch basically fix the typo and now the file will be chown'ed to the
WESTON_USER user.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index d19dbcbf75..ccc7093425 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -75,7 +75,7 @@ if test -z "$XDG_RUNTIME_DIR"; then
 	fi
 	if [ -n "$WESTON_USER" ]
 	then
-		chown $WEST_USER:$WESTON_USER $XDG_RUNTIME_DIR
+		chown $WESTON_USER:$WESTON_USER $XDG_RUNTIME_DIR
 	fi
 fi
 
-- 
2.17.1


