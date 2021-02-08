Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.35353.1612792479441910786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c6Gp7lOd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id r21so5711939otk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lTZGq9lkS024/9KvLqFTpHM0XJYa8Sp7bNKzWsnHkrg=;
        b=c6Gp7lOdyeKlyFYVYKfQo3lhAKEiDdUlrOdE0tj+Bu40agTvMf0jPo/ofnNYWh2y+u
         Ig2+N7cKz8WNbnfOFyuscFBwkV+qmqPGzvYrT8+Mzix3z7jYR/fCsBE/RVZsV5cmBMMb
         l8mFvrT2nROrna4vn1oyWUyM+maX/xY5JODTaAMm8+Z0DkTnYt1gcEZGUvPcIALM/Kfj
         /H8aMT9noTwLHr94oOUzgbnfjrpb3bUkmtA3N2vd8AGCumm2P4iYikVjlPUVZ9EjccTo
         LzEsgp4wgtAsynayVg+591B6H9AFaH7Z/BT0/fXxPSCZPAjVdx1ANVHZa6bZebD963qv
         NN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lTZGq9lkS024/9KvLqFTpHM0XJYa8Sp7bNKzWsnHkrg=;
        b=OkT8iMwOMgZtKm+pjWIUTQMi+YHNEmHmPZgA3ODPqxRXkQQ9//Q7n0Offv+2TL4gCV
         FZTF+QMyK9lmv2osVJtGeKzBFph7imokXE8zrMsJCpY7jTI1AmmVUe3MZzMzyXacG7x6
         /3BTnIJ4p9vpdiofC/Fa7uKD3d/mIhJNZ3zJ7/u+oWgs5lYhDPz7WYsuSN/V+FEW/wLj
         LZabD0vEmBAxRQuQMJTsjbn/ksAydE3eomqEWNBHn1IJzMw107kspLykJwQJjH3XJhW7
         50RubadR2sxCOks2OYuwDrQgw4FWj3YWVd6U5itbhPscsH7uk9SJe4iOlOEHXWvucuQK
         DRGQ==
X-Gm-Message-State: AOAM532Yrk2NuTRIpsY2ocizv9+DR8jQLVW2QWe6gQfsg2BWhUkDp1b/
	fv+IeYRj6Vcf3du1HzsJy9uWVHfjPLIorWIT9lY=
X-Google-Smtp-Source: ABdhPJxQMHR7vY3tj7+XZIFti/frRLPYKLIkRzc8afpnl1ED4BfljzktkH1dJCpXPWrxxEs2M/K+ig==
X-Received: by 2002:a9d:3ea4:: with SMTP id b33mr7592901otc.185.1612792478061;
        Mon, 08 Feb 2021 05:54:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/28] npm.bbclass: use python3 for npm config
Date: Mon,  8 Feb 2021 03:52:08 -1000
Message-Id: <1a0ac4d51bdc502ff56a7b57b3a9e72b25ccd7ae.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

python2-native executable is not available in sysroot anymore, which
causes compilation of some nodejs modules to fail. Switch to python3 as a
default python version.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d21f50ecf8e8683a92b7d234fa8225c2c1470595)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 068032a1e5..f83c6e496e 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -17,6 +17,8 @@
 #  NPM_INSTALL_DEV:
 #       Set to 1 to also install devDependencies.
 
+inherit python3native
+
 DEPENDS_prepend = "nodejs-native "
 RDEPENDS_${PN}_prepend = "nodejs "
 
@@ -237,9 +239,7 @@ python npm_do_compile() {
         sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
         nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
         configs.append(("nodedir", nodedir))
-        bindir = os.path.join(sysroot, d.getVar("bindir_native").strip("/"))
-        pythondir = os.path.join(bindir, "python-native", "python")
-        configs.append(("python", pythondir))
+        configs.append(("python", d.getVar("PYTHON")))
 
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
-- 
2.25.1

