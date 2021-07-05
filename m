Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.533.1625524593408151186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CJ0O8y4Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id w74so470093oiw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pStRQ1zJ73WrEiqmjGZ8onhuIpO/yY/77L3fmbxrsts=;
        b=CJ0O8y4ZGVKpkoD/9SsInNbbiW+oLhp/5nTULtb+urQhlDwVFqHGXPymw/OqbxodnK
         M2PDpodTvZ46z/THR9J3n2TNk7yr1BfINRgpSgP2CULchaSi+DfC4XUtoo0W0mIzreHr
         BGZwUT+xpkmPxqu5+nlpNXmNu/JHfvzdOdFCJLigz+XZt6UpX5aPulMmxvypk7x/cqmt
         wY904F6XISA5tw0DbaP6GIDTBMkCDXieVdOqrxRb+QEYupfxedrgw3MUo7GokOc5ytZw
         9VjHM7wdR8LTaHlnBbzuO65wPEgbzAVX22h0U17hnvkOH6JUByqe3BNTou1prQMi57DY
         Yc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pStRQ1zJ73WrEiqmjGZ8onhuIpO/yY/77L3fmbxrsts=;
        b=VZAbIauOdTNW0j8ndkAI7bJlctU61MSF+L0V8RHYij3cUoKG4CVWm55dCJV7GRuM+f
         Ova2jSIccEeGPdqLzmlCV9YWIb2nS6OiJgUndteHSfqO8r82363Az2XMdp/PTZwf/1V4
         D3FCEJSNdB5/PkA1imFYuNSWEZ0w6IRTUBhwmUqC2JrDYcXUlzA4tFt2w4scd617NX6C
         aCLnCn7yoMk51ejidseAXVONC0zqzr2cPGBq0kTBI/gZOWD/HVdIAnizfKyOfAfwsTHY
         CpnVBL6Ddg1rzCHFAR7MSsImk/VNuCBbQDj0cxePev1E3/fTB95LC4fAO7s/5Xez2bcs
         6/4A==
X-Gm-Message-State: AOAM530ysphGXFnUYEaLTnevr6rdf52mN8np0cc/jQTqUTRTrXoZkMNv
	IIfvzS8Au5cPyLDWGFocU/4dhLtjbbcqGz9o
X-Google-Smtp-Source: ABdhPJxBkQ2osmrINLn7sqFSLyTf4M35usPXwOLwOMqBJTz1ImCgQauQ8Of8sWM5nWpju2n4aH7i4Q==
X-Received: by 2002:a05:6808:9ae:: with SMTP id e14mr1090371oig.74.1625524592367;
        Mon, 05 Jul 2021 15:36:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/19] perf: Use python3targetconfig to ensure we use target libraries
Date: Mon,  5 Jul 2021 12:34:49 -1000
Message-Id: <8d625ded4a943fe9f0a8134d66cb2908b1947cae.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've seen some reproducibility issues on the autobuilder in perf where the
size of the python module varies slightly between systems. After some head
scratching and removing the --quiet option to the python module build,
you can see it using -Lrecipe-sysroot-native in the linking commandline
for the module. This means it is linking against the native library
on systems where that works, skipping it and using the target one
otherwise, probably with warnings in logs we've not seen.

The fix is to inherit the python3targetconfig class which ensures
that the target sysroot is used, then the byte differences between
the builds go away and things are sane(r) again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e2b6c042edd9ec76cb8281247604e4f81518780)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index b6f50583f7..e04047e85a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -45,7 +45,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.25.1

