Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.38489.1610387574825549521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 09:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNB4FbYL;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: mostthingsweb@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id z20so322025qtq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4NwEbwbPb/h9ERLawJw4YBQOZtirIZ6y7XdKidw3kv0=;
        b=LNB4FbYLT5C0c2247Q2XvnDSKtnX4vGmXApdf1UZJrSOupkQ321R9+9VgE5XfaMvuX
         8mmpqtZbyKm8Hj0vxP+FJbq3ZvU75Ab12bOJ8NiryaOSccXEEEdaiFALF+4OfkD695BP
         ouBSrp03xOe3JlwD8JVlMl//ETbT/xuSs9Ego+sWQ2TomYHedVI5ClDo7qIwCE6G8DYk
         8UNNxw9u273FirpstMF2aL1rESFy5SHNFFKJuFOUDWjAy+nug+5GIedcF8hcF9iWpT8D
         C6CSugg4FLJSARbTbviaxnK5PQyUyNgoGR7feB3rsBv4wCa8g3OTaaaV9SJwmKPvFnhn
         wSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4NwEbwbPb/h9ERLawJw4YBQOZtirIZ6y7XdKidw3kv0=;
        b=o9NsPk82oxGQYkUxAd9wKDsYx1FThFyOy0mLQxvqBMdUVzL2Q11N8HG8hdRjQsKo0U
         HvwWQt+ocnoVGWtDraAhx6sEbT9G9yStp3Vl8k1v1SCSvnpRVwPwNxJNGbQAopqwJjg1
         EnR7YqguVNJ5+l1fUzQjjsLwkaQbcEKbpU6p+JkrJWA+5wizCbhiDFYEg5yeAsQmGqNo
         GGwUU9Hp5Ljgdud2Y6OXcypFlno4Lxc94LJUNayXSzGcTdS5xliGNj5UeM8ADbDMum5U
         RgcmVsB+D+mofWxtu0TJ1d2AVpzA+UFeOF0VmYzQTKF5x0c5U+uvZsoIziWX2XLcMxvb
         lgmw==
X-Gm-Message-State: AOAM5306NJJ7y1qQfyXBnRhwbV4jeC3mv2LAsliK4KnSugGlMVV1OoVL
	hz0LTIpMdbrUNfn0r8iGIuR+J3Ei1hSt/reo
X-Google-Smtp-Source: ABdhPJy6FKEoji/2L6tHI6M037X27iG07SP3D1c3ay64UL9OOBX1yopLUCm25A3dxjQuJZ4nQ7sYNQ==
X-Received: by 2002:ac8:7c8e:: with SMTP id y14mr699481qtv.161.1610387573587;
        Mon, 11 Jan 2021 09:52:53 -0800 (PST)
Return-Path: <mostthingsweb@gmail.com>
Received: from localhost.localdomain (c-76-99-179-205.hsd1.de.comcast.net. [76.99.179.205])
        by smtp.gmail.com with ESMTPSA id g3sm186303qtc.3.2021.01.11.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 09:52:52 -0800 (PST)
From: "Chris Laplante" <mostthingsweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Laplante <mostthingsweb@gmail.com>
Subject: [PATCH] systemd.bbclass: improve error message when a service unit specified in SYSTEMD_SERVICE is not found
Date: Mon, 11 Jan 2021 12:52:49 -0500
Message-Id: <20210111175249.1067914-1-mostthingsweb@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous message was fairly useless without diving into the bbclass.

Signed-off-by: Chris Laplante <mostthingsweb@gmail.com>
---
 meta/classes/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9ec465c759..db5d109545 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -174,7 +174,8 @@ python systemd_populate_packages() {
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-                    bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
+                    bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE_{1}. {2}".format(
+                        service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
     def systemd_create_presets(pkg, action):
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
-- 
2.30.0

