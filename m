Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B9DED6157F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:42:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t3so23982999wru.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nm8A1JiF/9qnUDeWW4QVF/GmdZrZfVxL89vJVHk+yM4=;
	b=fI6owN/9nDMDPZbpgpB7TkWBkQ5p7boGZlxNhV/ip42nD7SZaWAuM/OD10AbJj/SOE
	fgYQhtkLGVoy7/6cILUbp95p8HANbiVXL/BNH10/Yad3zKUWfqiR4jGQgNe6FqV/qr4J
	hovr05sVX3uinUMk+8Cn7lWofU0R4O/KZuGhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nm8A1JiF/9qnUDeWW4QVF/GmdZrZfVxL89vJVHk+yM4=;
	b=mNSG0vj18tw8IjShT4ikUXywKy0Q4FWD7wvIUAgqaxzUMr7GG/L20xX46CxCn9xmHV
	2rO+F0nqZgzelrLqc+8Nd7dVDKU3N7ffLLnpHtv7f/9uEbu3Rs7oWlkDx3btFROS7uMK
	AtQJkKgv5Gz27boCUq3kGKbyyoTkxzwEY+nJ/zUGUzo/r4V+xFAzDaNZjDZF5L9NCiTU
	Odril/l9cztgHmtxODT4JexbDmBxHYaTlY0Jx3MOYrbQm0NLVYCQrCZVGKaEEuQAfE+u
	7MFWtc5qTdiuCHm8kyjhs1Q5aboY6ZX3luSY4klTqpJKtWFlRUks9eEMuXMEJoYUmd2l
	BTZw==
X-Gm-Message-State: APjAAAWxYqVgXGuRw4pS4vjUS6CCOIFYfCIJALFCyJYO7cj5NLSvTBzL
	fi1vOmbyv3TwwD6zCa2eHP2fxLmdC4U=
X-Google-Smtp-Source: APXvYqwoGxbjWCUFDyXojFuok8BO4/wgjFcoe60JEPRqBtOjZt9l0tMmtv9J+XyTHfVljAJMQfPNlQ==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr27392750wru.99.1582033367946; 
	Tue, 18 Feb 2020 05:42:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z6sm1827185wrs.96.2020.02.18.05.42.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 05:42:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 13:42:46 +0000
Message-Id: <20200218134246.59893-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: Fix errors when api-documentation is enabled
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
X-List-Received-Date: Tue, 18 Feb 2020 13:42:48 -0000
Content-Transfer-Encoding: 8bit

This recipe hasn't built correctly since we removed "python" from HOSTTOOLS
when api-documentation is enabled.

Add in an extra symlink to "python" rather than trying to fix the multiple
scripts in webkit to refer to python3.

The autobuilder didn't detect this as wekbkit was excluded from the API docs
world build but that is changed now so this fixes build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index c7f0d5e9836..3eb27a15506 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -58,6 +58,12 @@ PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
 PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 
+# webkitgtk is full of /usr/bin/env python, particular for generating docs
+do_configure[postfuncs] += "setup_python_link"
+setup_python_link() {
+	ln -s `which python3` ${STAGING_BINDIR_NATIVE}/python
+}
+
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
-- 
2.25.0


