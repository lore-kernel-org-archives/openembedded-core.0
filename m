Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0673F9146A
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:22 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c9so2478701plo.1
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v3Ie9asqY1Czt1lwZVfLd78S1JBCQLjx+cONRntPeTU=;
	b=EuUtyvFH8wryvwXlW/45J2AT5o1FBtWZxBBFEzz2yEIUIgy7ToE1ggWjgYXxbxgZRl
	/J5kFRcz5FpnqfqKf3gSfpRSoQoWeAqaCtKsu3GFTxDOZdNSqw8uNh+1rVe/Jxv66l1e
	aa9Cg9co71v+Txb8R25c7B0Lk22rYmm5GQ6BL0DruGudMooIbKiVLXMjr6eT+QNtlLT6
	vm8jaINCofZsgkrvAnGUtXd7uMrO9oSpJtJjqn8YV9IJv+4SjwO+52Gi+2FgfZilRKTd
	ghHwVDPQlP/3xs92NJ6hYxiU8ydIIqwXkvdrwdCrddhTZSVuKwgnUNrI5gtSEVrJBf6e
	URYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v3Ie9asqY1Czt1lwZVfLd78S1JBCQLjx+cONRntPeTU=;
	b=r1pLf2bxNTVGpAFQMcKIwQlod+OqkG0e7CWYgeOttlu0bAxFp7OGRehXMqOFMphx0o
	3Bf7IE1ha5pT1A6OtZmSDEt7XdZuXvlyP9OlIRh56nSZ54IgSEVW08gTyFiMnSItGyWa
	T+wJHElahIKgAERmdK3Tr0zDOcLaom09xFIcJUG8gmk/2wPzvdFw5kdvq1rzB/Z2HRnv
	6N+py8eJRWywcgdLdBClcHxq9SdqpHrZeCKNHfRfezvLJ7J+qFW6lPItSFlVw47ZKhEF
	Zkx0DeN63cxEccX75OYYoGu2R/0juZpBhii/ymDadDKQKRUVYKj2S6pWhA6u1i11GQS7
	lKLQ==
X-Gm-Message-State: APjAAAXMk360If2biGuuwRGHnznL3yyajY2pj7CnZaSCuDg62+BYyjEf
	N8tm2QxTlpEKB/EMryMn51q5kgjU
X-Google-Smtp-Source: APXvYqxOwRR3sALd8p/pBUpXO4XFI58NWqYAnvc0iVqkJfwHBjK6fk57j3Mol8kEJF7EDgvnI+KtZw==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
	iq15mr1153980pjb.86.1579672103897; 
	Tue, 21 Jan 2020 21:48:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.23
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:11 -0800
Message-Id: <70efe880589df1dfe7d71451d62d9d8e4afd7981.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 06/11] linuxloader: Correct loader for glibc on armhf
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:23 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

Fix the naming of the loader on armhf to match what glibc expects:

  #define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
  #define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ad531093d620f18c04d487d79e9dad9f5a96232)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index c0fbf26836..e2876cec7a 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -41,7 +41,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader = "${base_libdir}/ld-linux.so.2"
     elif targetarch == "arm":
-        dynamic_loader = "${base_libdir}/ld-linux.so.3"
+        dynamic_loader = "${base_libdir}/ld-linux${@['-armhf', ''][d.getVar('TARGET_FPU') == 'soft']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
-- 
2.17.1


