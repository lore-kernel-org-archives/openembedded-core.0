Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.10006.1614349683181652786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mnwzpFn6;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.49, mailfrom: steve@sakoman.com)
Received: by mail-io1-f49.google.com with SMTP id g27so8429009iox.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hGv0uVjb3bIYv7oQ+nGxeZ3vxJ/+JA6ZEVmD3u9OXV0=;
        b=mnwzpFn6wNFVwIWQ2ihySTf2NO1Ckw1PoiEjNN8zLDCFA6Zs8pL869AEQzBFWU9y+h
         iAKwBcRu3LYdQXgA04L3uQPZ5a3be9Z29aRSuy/F8taIzA1mT/F6+O6mX7CMTFZrCJRV
         F0rocg6yVcXXNl9B4cBKEdf6OvFo4RNKCeVtxXnDyxS/lS3GTORs4RaetDwAB4F/rj8W
         DfT9CzWJVF9qmtpO4YLJmm0Vr+km/efTfw2TLjHJ97SigS5HZeJIt5HpNFo9xwcBLPz0
         F/g8hpaXJcN+4nTSyWKCNLn+5RQ31PXXvu3ci4ULto51suYI92pnwVcvsjCQB58kZx8i
         mDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGv0uVjb3bIYv7oQ+nGxeZ3vxJ/+JA6ZEVmD3u9OXV0=;
        b=OcUcCcV0a7PuDTwQLlw6y8wYZgAKGMHMXzZpjBaltsUkITpz1ukq0j7Ib9u2BXX9ox
         E1BIw8DTQqQi/CCceeqlMapY/xoT0qh6Khv2cl3lM4gH3InftrSZ/rTvH+6j9hyqxdmr
         pScfFqVs+pLyv8BDyVDr1fJ2bbGGJ3BEbfrSPWR7tTGObWROPO7VgTk7NjLoloHBOYr2
         fKepan4LdhWUtUrV8sqf84FgLL5EhRT5okXPYJGIIMDzmvPd+8dbTZPV7H/y+j53z7NZ
         kAZQQXQXKAET2TlIe6HMkx44ule4RNhMacFUWqIKbkofyjI+kJhg44htJh4uzeLRXkTW
         6J8w==
X-Gm-Message-State: AOAM530z2NqLGSuWgx9FsW9l05866kfhSUp7qzDJ/mLH6PInGqs1pFde
	fB8Y5Sf26EzFeGYlAQguZI0S9o5l180HFYal
X-Google-Smtp-Source: ABdhPJxZUn/cHEhcGK67+1K7tN6AR5vYbzsYTzzsPW1IRx5OaaVJHnh+aes3MB2tC/LquEMrZmU2cw==
X-Received: by 2002:a05:6602:1406:: with SMTP id t6mr3032993iov.154.1614349681935;
        Fri, 26 Feb 2021 06:28:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.27.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:28:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/40] wpebackend-fdo: Fix missing .so symlink when using dev package
Date: Fri, 26 Feb 2021 04:24:19 -1000
Message-Id: <4af5fe75d7b28421cd775b37d4b2cf5857468576.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zbigniew Bodek <zbigniew.bodek@huawei.com>

Problem spotted on dunfell-23.0.4

Normally, unversioned .so is removed from -dev (default) package
however it is still being referred by other agents, such as webkitgtk.
That can be observed while executing i.e. Epiphany Browser.

For instance:
platformInitializeWebProcess()
calls
wpe_loader_init("libWPEBackend-fdo-1.0.so")

as a result one can see:
--------------------
wpe_loader_init could not load the library 'libWPEBackend-fdo-1.0.so':
libWPEBackend-fdo-1.0.so: cannot open shared object file:
No such file or directory
--------------------

"master" branch contains a bumped-up version of webkitgtk
to which this issue does not apply (the code has changed).

Forcefully keep this .so symlink to resolve the problem in dunfell.

Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
index cd2f7fabda..165fc74dde 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
@@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
 
+FILES_${PN} += "${libdir}/libWPEBackend-fdo-1.0.so"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} += "dev-so"
-- 
2.25.1

