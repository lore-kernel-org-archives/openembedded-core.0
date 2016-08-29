Return-Path: <sujith.h@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 403F06014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:47:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q11so5082694qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lYXviff3BL+3D9r/orC5QUKPfGemetIOPlRzHJjsOFo=;
	b=XGT4aFAEftIH9GIHtqFn7jIZ3ptImi2S++9Z1WAUW/4CcSApWf307/LNUt38gtUas8
	p085Exy39xXVMySZEtD1Y6T6TpkRMBAjANpveRY1HHH2CAVgpDNcJjcpbBu8u/J1u8lO
	ljrxCacm0vEMi/8vA3wXeb73UdGD1pmykUDlYV6CU5Ff9pIqp7lXxAKCV2KqZheMLQLL
	7iRe06f/I5DjW2SulrsdyJKnkYnocWDM8RfXzQ+LdUOm/BdbQJv3ZLDX5vysZgLDjyG3
	Nyz3ZI29gIYyQeIzqXCfQyX733N2ThsZzlLd/JNIKWTEn/biu+GEVu1KoOX6wp00qcYG
	CZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lYXviff3BL+3D9r/orC5QUKPfGemetIOPlRzHJjsOFo=;
	b=NkmcibIgOLws9Xbkt86ldIx8J4FvyjoSszLAQYJB4+fOl+FhLiAhHtRFryczK/olkM
	r5+rG6XujW9KOSAU6vBY+rOSpC/55qm220zks/iNw1NZQWNKUXLys4VkG+Vn6LmBWIZg
	UNfscB0IPZn6ANnfJnlIyH/XgjkI36G50qVzbyJ0LFkc/idZnGTHDSX8E1xIGdbxXVZw
	kIOqmYFaR8EIz2588vp/qGCjYjrrCCz/ikfD+J84KlfwkShkou9bTZrTe2TIYBlRobl8
	S59vXraKTK86fGvp8V2PMmHfJt/fUo7PgA9amcXxjmPOY+UYA5Y/K1OkdVbwcGCTy/k3
	hoQA==
X-Gm-Message-State: AE9vXwNx6/PTTZVBJ4afbh8VMw/vs4LuGwygJdXPJaizVDzDGv/Zpz+uiOnJae+OCSf3ew==
X-Received: by 10.200.43.47 with SMTP id 44mr18245557qtu.66.1472474830384;
	Mon, 29 Aug 2016 05:47:10 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id
	r184sm18438861qke.0.2016.08.29.05.47.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Aug 2016 05:47:09 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 18:17:04 +0530
Message-Id: <1472474824-22715-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] ruby: ensure that .ext/rdoc is gone in compile
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
X-List-Received-Date: Mon, 29 Aug 2016 12:47:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

rdoc gets unhappy if this already exists, so remove it before building.

Without this, it's possible to hit this error:

    Directory .ext/rdoc already exists, but it looks like it isn't an RDoc
    directory.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index fde67e9..d8f6882 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -37,3 +37,7 @@ do_configure_prepend() {
     sed -i "s#%%TARGET_CFLAGS%%#$TARGET_CFLAGS#; s#%%TARGET_LDFLAGS%%#$TARGET_LDFLAGS#" ${S}/common.mk
     rm -rf ${S}/ruby/
 }
+
+do_compile_prepend () {
+    rm -rf .ext/rdoc
+}
-- 
1.9.1


