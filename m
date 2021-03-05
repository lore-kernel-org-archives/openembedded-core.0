Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.2125.1614978269484097606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 13:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=euGJIBa/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ci14so6093283ejc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 13:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSPoCdqTvL6TckWBxHS8qyZY6TFnTI8VuGSyCWJbb4=;
        b=euGJIBa/LfeeOz1TAn+iYzCryREenBleiNzPkocHbtTcc6CKMHkd0UIiZhnmMxiV+R
         3S0ZIc7IB/KFtIELAeEI0l7hRhj3NfIGcLrqhl14hpVfO1QTH48aWwZlGpFbtzqrYrjb
         CiE79NRRP8kSdt3rf5VYCg5B4tO78xRe9K7ad6EeFDVg4ytIrybo3lD9EhEEqAhgQUpk
         WcpyiscygifCEBv19IMqFOS6mlcGx5jb/ByQb7oGqhO/1fx3sKvOG6/2X+JmEgICRw0k
         U1YyEk64P/H58NSkLJYgSzIyHO+oXhPQm7O8bRK4dGJBNAXiqfypnNMGa5yTXvQk+5pJ
         Nadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuSPoCdqTvL6TckWBxHS8qyZY6TFnTI8VuGSyCWJbb4=;
        b=eN1QR7vB+RC6A69MtyW/h+zlfZK4n1k7RmmQJAcvquTuycJ0iy8lSMJd/uKqqdCgJE
         6uWPP0ux6AA6IioRht56nBcAmvg84v4ojBbidCOm5fKORIDntswbAtcx8X7Zs9TSv245
         KPkAhCg7+lcaPijvm+MEeMmQj3LGWJWkISEOO/VBRVpYfQulZNzHBRN3usQT4VTE4HeZ
         HVFCuyOyRF46skpTBwtNSvQTkNh73knO27v15U3dizc/l2yg497PPOUS7Lp37EebkGdb
         tZ98lf/T6nZKeTcYiVrZOrswhq0f2G18w3AysbOM34cWPcT0Lg25naj48V2liZL0aZqG
         m0AQ==
X-Gm-Message-State: AOAM530svxNOQwhdKLxAl+nX07e2YB3L7TFfTMaDYOBJsx5jTCB0xBgo
	56vBc79+HvPheSoWm+jWjAS1gnHqw+M=
X-Google-Smtp-Source: ABdhPJyoIqJBxlyIxu40xLtUD5flYqw9iHUGsD7Q0PfivNYTVgkkVKXLdrHTzCzW8XDM6ncH/+WG2A==
X-Received: by 2002:a17:906:86c1:: with SMTP id j1mr4330282ejy.373.1614978267905;
        Fri, 05 Mar 2021 13:04:27 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b18sm2112907ejb.77.2021.03.05.13.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:04:27 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] glib-2.0: show an error about --cross-file only when such file exists
Date: Fri,  5 Mar 2021 22:04:25 +0100
Message-Id: <20210305210425.2137540-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index a2fa5345b4..4176dbd207 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -41,7 +41,8 @@ def find_meson_cross_files(d):
             filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
             sanitized_path = filename.replace(thisdir, "${THISDIR}")
             if sanitized_path == filename:
-                bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
+                if os.path.exists(filename):
+                    bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
                 continue
             files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
 
-- 
2.30.1

