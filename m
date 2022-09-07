Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B600C6FA8A
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.8334.1662560488595025869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=i23MqRNG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id y136so9845557pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=pzFnDsckVK9zeMjU5yxJI5KqJpdkLmejGLZl0W5jw0s=;
        b=i23MqRNGq2HF3uZvl//iEQ8mGoTXCKZBYVT92b31IhjWIucVCpmf6377HoRqRYYBpW
         H/rGxLiaij4Gr3M3LwANhWHEba7c5TH6/UWzWpW/V86NDldAjgBeAGTy9x0G4m/Tb7zL
         gQIUKoAs6DHe6jlp6KHVr2GD9V2dcRH7zMpYyOfEKFKWf7gmfZ1+3ffbRBmjj0MAn7xx
         hDI0ixvCr80ee9Bp2FxzXYsgkNa8w2W+r17hG48WOCZwjF5Oyp0UUGHn7L4QxkpS3BBO
         4Mx4nL9hjx9YSZVqS51hbpF6JwVQxhmIzOjsURqvvmRTKK/b249F2rv3gCCBXr17Cfo3
         7gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pzFnDsckVK9zeMjU5yxJI5KqJpdkLmejGLZl0W5jw0s=;
        b=Q3rvsZpP0fSOsimbrUNKWkcplRBW5rI0QQuG8RegWTyJIVNn9uYfMgkNNBKWIeKD1N
         aH4k9VA4boFv58g63s1zR53jheHw+4Wu5RunnPY4Ig/d+HeBWYV6Xjy9EF4cguEvnbVW
         j7jDk6jT/zabvF1Ni5WbKY6qcxyh9Fnx76YsFpf2YFypA1sDa1SZXgP1/35ZJB8Pfsoz
         A1wopwFyNa6xhXaVgKNfHJM0cSgsOXwICzuhPZ9Z0T2kGECEIkdyixWaRCM+Y3Y+kfog
         FQXVnTXTgSKCav7+DKeHBK3t5aEKb4+itP9vzmaMkURDOWepWNnbyR3T8mEnXa+SXE6q
         0Cvw==
X-Gm-Message-State: ACgBeo22GSGKWqeW8dsoWYC14YtflYGIAKhbjvz29nK2//9nxisamV8d
	8gPReWrQ4dKNwMuxvlFJFxk+1eaFOEx6vcl0
X-Google-Smtp-Source: 
 AA6agR4tTj+EtaeIRU8BKcEAP5fehwNWMgLO1dfe3WRR2dWGt8Ph0zuQfe3gyXM7dHxJt2EiBhp02A==
X-Received: by 2002:a62:1b12:0:b0:536:715c:4d96 with SMTP id
 b18-20020a621b12000000b00536715c4d96mr4080422pfb.77.1662560487595;
        Wed, 07 Sep 2022 07:21:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/24] npm: take 'version' directly from
 'package.json'
Date: Wed,  7 Sep 2022 04:20:23 -1000
Message-Id: 
 <81ad70619017570779adbc1ca928b2412ad9bce7.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170417

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

We know the content of 'package.json' from earlier patches; there is
no need to parse the tarball name to extract the version.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f553e528e76f7e3925ed1c0950d96e73aec37da9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 014f793450..11c80a738e 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -125,11 +125,6 @@ python npm_do_configure() {
         sha512 = bb.utils.sha512_file(tarball)
         return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decode()
 
-    def _npm_version(tarball):
-        """Return the version of a specified tarball"""
-        regex = r"-(\d+\.\d+\.\d+(-.*)?(\+.*)?)\.tgz"
-        return re.search(regex, tarball).group(1)
-
     def _npmsw_dependency_dict(orig, deptree):
         """
         Return the sub dictionary in the 'orig' dictionary corresponding to the
@@ -190,7 +185,7 @@ python npm_do_configure() {
             _npm_cache_add(tarball)
             # Add its signature to the cached shrinkwrap
             dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
-            dep["version"] = _npm_version(tarball)
+            dep["version"] = pkg['version']
             dep["integrity"] = _npm_integrity(tarball)
             if params.get("dev", False):
                 dep["dev"] = True
-- 
2.25.1


