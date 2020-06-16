Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.144.1592323293557046668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 09:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2bW8yZr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q25so3676247wmj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EA4zZTGDq0EV5b9bfaf6ee+CjJEv56kmh8HnQApnoA8=;
        b=V2bW8yZry+iqRaNZHbKQCnvaQ8uaWrCcst21LF92ZUyCVUNfwG3dufYS+An4fOxBEm
         CSBEex9WpiXv9qdwdg+a/26H04wgyMmQEuHq11rXPn1w5NYjxdfiUP+8zZLC6TgTr/cn
         T/AmP3T2P1iPUW+Gp71j8sRBRJHSgNlP52Thc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EA4zZTGDq0EV5b9bfaf6ee+CjJEv56kmh8HnQApnoA8=;
        b=L/eEMgqorjuV6v8OgQDuQ6bpNl8DxKiEX4g8XLM44+RiofPR+cRy+puumQH/EE2vix
         f79ZHAPNanna3khB/I8S8LkS4QBJd2WcIvnX5UXg342okJheB/vRhcDnm9jA37X6k343
         xKrmQC8xAJ3ewK8VeY156c2OJLrRATo7bjeERj0bhedGRpucfbj43V+cUzNqkKQQq+1b
         ihLAFNA01TkMnsmWQzr1dXHiLxihfSz5hmr9kDZjCAyV7pergSZqifQchNSH55hbRdFh
         pyQndL/Lbvrj/NrXXYlp1hPaOk4EKw6nc146HhcDXdDly0pIMQpVrjPXWfZDKt5ggvuJ
         CR7A==
X-Gm-Message-State: AOAM5314fqzIAV2H9a8IPV9NlvkrYjAQqBtS0yHlPESueXafyb6pFEPc
	lPPp6YvK+WE8oZCe6NmkrNawusiSPIdZXA==
X-Google-Smtp-Source: ABdhPJy1TZxainq45NZ+wO6eMGbo6Y0xc/gpCy7OqUL4jatGf7FtV79Vyoh88kQLyEzDjB3SX82UcQ==
X-Received: by 2002:a7b:cb56:: with SMTP id v22mr4026081wmj.180.1592323291592;
        Tue, 16 Jun 2020 09:01:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s132sm4858118wmf.12.2020.06.16.09.01.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:01:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Fix host specific modules problems
Date: Tue, 16 Jun 2020 17:01:29 +0100
Message-Id: <20200616160129.373921-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We were seeing a ton of empty perl modules being created such as
"perl-module-x86-64-linux-encoding" where the name would include
${TARGET_ARCH}-linux. These files were already being filtered in an
earlier do_split_packages() expression so exclude them from the latter
one to remove the pointless empty modules in PACKAGES.

This doesn't explain why some were not deterministic but will recude
the do_package execution time and clean up the build directories
at the very least.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/perl_5.30.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.2.bb b/meta/recipes-devtools/perl/perl_5.30.2.bb
index 26138ea9e55..804520d8856 100644
--- a/meta/recipes-devtools/perl/perl_5.30.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
@@ -306,7 +306,7 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-- 
2.25.1

