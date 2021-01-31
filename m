Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.16665.1612089853044092193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 02:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UkwEVMhN;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id a12so18714124lfb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UG3rxQ4GJtMZgwmirNCkWUAOhgkZ2Zd27KJ5/rZPSm8=;
        b=UkwEVMhNqczI+B3pj6mU5r9oyA9nln+GyOwHQ/DyN5+aPy9A2OS+gklCrqINbKybmM
         hGRYksd9Jgi+1cgdGiTSrU0d2OlDJIHgoyrThTLT2wLf7yq9WmSJ/7M+VUGkceBW6MfI
         VRIQXGGCsSwTOfEWOltvwWpFYnSi7IAHvYfqrtb5lNzJGwndPztRiyZaYOjqS9AcPAAf
         wclaGRftV4qqoq5ZaU/PXTLjl5FwgJButGj7n4ndepb8EepNKUwlUjFR5RLUOUeNsxsg
         VtEXYvWENTs+Gn+LCHR+BVwsRNXXhhC1UIi92Z1aV9TkgiJK8Y0BvGgGi4x1zTGnwTe1
         P/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UG3rxQ4GJtMZgwmirNCkWUAOhgkZ2Zd27KJ5/rZPSm8=;
        b=aYWtd+lDLe4u/e2y3+wjX2v1XOqhRkvar49Q8+bPfuUIO7M8lxBO/bA35XKaE6bdnQ
         I5ElW/iJpDh26jJ3//6DL3ai1AwLqWzVArOKRrPgg82aGfCedh7HWPEHw5FjY6lUgldi
         Bptr7vKYueGcrv0YXOocLhXB+ADFLzTHTOXb4Ilg3PMjZSuS41LEdP266sFAv5EXhyfs
         A0aEjWpQz5o/47KxjSDMul4S95zLvZ+RZndqz+LP57cMogzvOxzZ1RxUcIZdbrm9B9Fo
         bWamDPjgFhnbH2xfo8JKLfCiAveHY9O1UKw6b+yh3p1brXlK46eFw2OvqFcrDOqVmOpl
         0U3A==
X-Gm-Message-State: AOAM532cZeBXwPbli/0aY4FPUwmQSgNGf3qBQWXO+HvLC9eVEUOtZwPZ
	BxvE9BA38vo3ZooI260hPr1qvt2HJSHQYw==
X-Google-Smtp-Source: ABdhPJxMbtgswHnYOzcgfnVNdX5smh6id6R2yuGoSUI5/Vqjxs1G5V+y8tFvpblM1NwWsN4/ttanoA==
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr5899912lfu.577.1612089850919;
        Sun, 31 Jan 2021 02:44:10 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id f21sm3381448ljh.18.2021.01.31.02.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 02:44:10 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] lib/oe/patch.py: Ignore scissors line on applying patch
Date: Sun, 31 Jan 2021 11:46:49 +0100
Message-Id: <20210131104649.2494-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "devtool modify" could remove message body before scissors line, so
patches re-generated from git tree were incorrectly modified.
Adding --no-scissors to "git am" invocation to prevent this behaviour.

[YOCTO #12674]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 8ad70f53f1..fccbedb519 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -516,7 +516,7 @@ class GitApplyTree(PatchTree):
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
-                shellcmd += ["am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd += ["am", "-3", "--keep-cr", "--no-scissors", "-p%s" % patch['strippath']]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
-- 
2.30.0

