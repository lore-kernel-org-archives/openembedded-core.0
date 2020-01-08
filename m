Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 413397FE96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:25 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y11so3378626wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GxQwIN1tlnM5f2q0H47bW2rp66UcLJLukwvWk93oA1M=;
	b=CFZfg874B/7ySQz5suvx2PwtLLyyobXV1pGRBGHo9mdcA0GApCGt+fqhk72aVmo+G6
	JsWGZyMjRMShEnrok5QhcyV/l4PppVVJPUUm6AW/nqdzoGq+4TKwO+FnDuIfM62qv+wF
	KjAW0Gh5J3y71lNIhcppXmKy4kbZzBstB+owD6YUglMBtijI+3G/PPB6U3+Ylc8onySy
	j8vHrUUWo/FB91l+5nLKTVUs8XD1BU+6hg50nkaa4cO4J7KZlU6Yr+L5HGw/NoRGekq4
	ZKS6MfJwSbusuQ5/tDnjSwZsMLozwOjI9OgtcrIMbDBkIoLyP88ASRkqJOYYWOrKUxE9
	SKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GxQwIN1tlnM5f2q0H47bW2rp66UcLJLukwvWk93oA1M=;
	b=Yf+x7Ez04S2HanBUgoWpCpmSqkHf3dB8Q7WjI0whoOexK6ND5MYq2fapjWH4ChbIu+
	XDJdmCP+SUIL7uVpTum/+f8mwYswaGsCQ6LYNrTONB6ez8IBllP38/dgZ7f2iMQ7iQlm
	35WCdJtWhd0f9UV74SiI/VWZwfAsBVqzUrOa+8YrF3zcYCihmzw/i9v2M35b7OeweSTg
	H1UzYQZ5IMrs4FknKowYN+jIoYvJ0Asy+U2jiktrHD8eEfYX+Gs2tji8sx0vlNGNntIf
	zrSnuX8H5nUO3XPktpCM2b2WCSiqOdn8+Lb0O8VhAFwI0Q7geTLuGgHWGsKM4S20yVxT
	YtEg==
X-Gm-Message-State: APjAAAUVTpPZIl+i0z03j//1Sr/xKduxFfCIUkzinhLNL2nNSmYHKZQp
	gRlgmy6297pAbbMv87gATs5fq4BaaX0=
X-Google-Smtp-Source: APXvYqwbH2F8k7tuf7O+NQIYQ7FqLq6lduY33olbHX8VmfYrdBvgLSVNmytAP9Q0MDYM08gnRc/YTg==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr4564142wrp.1.1578490105807;
	Wed, 08 Jan 2020 05:28:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:50 +0100
Message-Id: <20200108132759.95603-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/28] staging.bbclass: correctly exclude ptest directories
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:25 -0000

They were not excluded when multilib variants were being built.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 7e108950f5f..4dd2ed01010 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -32,7 +32,7 @@ SYSROOT_DIRS_BLACKLIST = " \
     ${datadir}/gtk-doc/html \
     ${datadir}/locale \
     ${datadir}/pixmaps \
-    ${libdir}/${PN}/ptest \
+    ${libdir}/${BPN}/ptest \
 "
 
 sysroot_stage_dir() {
-- 
2.17.1


