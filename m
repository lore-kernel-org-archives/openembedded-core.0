Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BEAC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:11 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.15357.1634673310883832340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3XtN2ZZY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so709283pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5P+1kKHQzQevgQX5MwYaqq43fG4ml/gaaS4anxPy+NI=;
        b=3XtN2ZZYOuYH8EbD1DZ8tqbcO0K9Jyx+seGATa0Qx0szfiJgE9WjCGLl4WamH70462
         NZvpkSOtu9MVHtQiS7RhZXp935A1qse28R0J7P4dbUrxhQAXvfByr13XzUg7LNIWED/6
         bVHBgANq4aAkpIHUUDkih5ac3OB0NeYXqmBI9UfLAZDbah1XDUaxUw+NCLrUhgfEoLrp
         cTy3jbbkHQ6PyHKkDjwm+jXyrqDL6kwyNpiIOD0LYKgmbuXQPBbpIPptqLfMk6D3Srmc
         gV+KaJA3DlplDyNo+RpUko83lGfBBV8moe5fWD9UZlSSsiBhS6rPTRZnNgQPO8Nu8XcL
         wSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5P+1kKHQzQevgQX5MwYaqq43fG4ml/gaaS4anxPy+NI=;
        b=QO/PsR8ld3Cwt4VCt6BA84uUysETf9GJI5YNllt3usl0S3cowcLydVeOV6vPdFPhGD
         T3RyWfJtXlZyKdlB6oNiXATmlNqhig6CGfidpvjJDYK9l4M5vXdmSbq7VC1lnMCAnZxO
         9hq4WGDQcgsnh9ku3Q5tV9YONCZ0gnUAi1W5OdM9PAxUwNcw7lfpRJ9a7qqNOHeSEUws
         WKgcRqZb+7JtRM3fMMJPTKZLY3b4ZRjTV5PohxE7OdsoS6zYsOlJAjiho4yOCErAh4LL
         m9dPA0asKTo4wHRTpSsC7PitTo9AdtEzCMhqoMM86gJx+5o2cRNytOXDM0PQDhwNVTdO
         KIqw==
X-Gm-Message-State: AOAM530mbWBksro0ppZEOnOu2xiGcb48UeZF+0Je51HcPvvkEUTM0Ybs
	VpX/1hHPlUYkUt2emSwwB6prCqJnPei0dTk5Hb4=
X-Google-Smtp-Source: 
 ABdhPJxBLY2rMvcaKNBvqHepuhwSyZIUmhPqjIB3Q7LTvwW7KhEFMOEKJlDvwzLJDXV9EVsQiBBdDQ==
X-Received: by 2002:a17:90a:8a0a:: with SMTP id
 w10mr2119960pjn.60.1634673309930;
        Tue, 19 Oct 2021 12:55:09 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/38] package: Ensure pclist files are
 deterministic and don't use full paths
Date: Tue, 19 Oct 2021 09:53:37 -1000
Message-Id: 
 <00615c9edb8b9b644e853453603846eddfff2054.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157231

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently the pkgconfig pclist files contain full paths which are build
host specific and the order of entries is not deterministic.

Fix both these issues so the files are deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e422e29bca4af3ab4073e04490f38b05cd7c38c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3ff74c9f31..702427fecc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1989,12 +1989,12 @@ python package_do_pkgconfig () {
     for pkg in packages.split():
         pkgconfig_provided[pkg] = []
         pkgconfig_needed[pkg] = []
-        for file in pkgfiles[pkg]:
+        for file in sorted(pkgfiles[pkg]):
                 m = pc_re.match(file)
                 if m:
                     pd = bb.data.init()
                     name = m.group(1)
-                    pkgconfig_provided[pkg].append(name)
+                    pkgconfig_provided[pkg].append(os.path.basename(name))
                     if not os.access(file, os.R_OK):
                         continue
                     with open(file, 'r') as f:
@@ -2017,7 +2017,7 @@ python package_do_pkgconfig () {
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
         if pkgconfig_provided[pkg] != []:
             with open(pkgs_file, 'w') as f:
-                for p in pkgconfig_provided[pkg]:
+                for p in sorted(pkgconfig_provided[pkg]):
                     f.write('%s\n' % p)
 
     # Go from least to most specific since the last one found wins
-- 
2.25.1


