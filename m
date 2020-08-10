Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.37307.1597028429387181148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kBGgtaKI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id o13so4111162pgf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+hd+Twf+zoi/PB7caMfMeuPNqMvRCoRamsntRZbnw5s=;
        b=kBGgtaKIDQoiaMCY4Tfrkq90dkKCdMCbse5EE4U6mQ4kB87j7DuFDllcWMV6mRQWGU
         K5x3axZIePnYDnUGeNZ+dupmpFNcKxL2ieK4wrlxuGhIZTem4ZgiEXDkideykqQdZnBK
         YP36Mi2asZZaf63LnBbhsOIqCRzY98Rfwx1I+wFRi7ftML1lfVtBoGtf2R7CLs0m8/h5
         w1wErdBF33Ui8pSK+5nGcJhDH7wT8CWxXhqJgjNpLiDXiSvuvuN/x4XAIKt6m/oSs8Ro
         1Gw0CTHdK63G/8i2wtnsg1Vxu+BMxIPHjfKGEtE5j4IcpBPjIKM+ym9CJfNEJna9q8kj
         kzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+hd+Twf+zoi/PB7caMfMeuPNqMvRCoRamsntRZbnw5s=;
        b=KsfWDmSF6rTOfN7Lk2uwyxwVAL3F8sujxsJg+9ipmBaVXiXwu5d43djVr0YAmETTyw
         jQOkBLC7+s8N5ngDvy8tSFbmGfvuiBJIRwDU8bMW3gNksVeAwISPJ9GnSFRruj0o3Vtt
         v+/WWhrlrkqc7Jfx9fsQlYwpO9KKMPlgUJsrxNNNAU0gkLBqGIXBkq5Kd1vyUdzdh18O
         V3sYWo168jC3kB6dJd00yWzigZPcCd57Q9gazL9/wCN8VrvJ5ZO/h61/F23hHgUTsP38
         BDUIQZ0GwkF4foWzQm0EcfvoUR8KoYF2oH74JgFOTglx0ba6Vt8eD33alnZ7siWcwUcn
         amyw==
X-Gm-Message-State: AOAM531FJtrKZjUgNVRyvhWgptgI6R+D14J2z4KNLJ45YdI7yGmnleeT
	O/fl5e+WBoguuap0KK8hEeV4j+ytmxqJaA==
X-Google-Smtp-Source: ABdhPJzJEQexuaGTQOdnvvzvkGy4AHu25oZM8FHoIdEjpDgM8K94lDLE/DDAWQte70WayoQx/wrxow==
X-Received: by 2002:a63:3241:: with SMTP id y62mr2582145pgy.305.1597028428289;
        Sun, 09 Aug 2020 20:00:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/19] uninative: Handle PREMIRRORS generically
Date: Sun,  9 Aug 2020 16:59:25 -1000
Message-Id: <b95d6aeafb70765e22d2e1254e749a48f508d489.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently uninative handles SOURCE_MIRROR_URL but not generic PREMIRRORS.
It can handle this better, attempt to iterate PREMIRRORS entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6426c952b5ade48ea94fb647efc464e603989b97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 70799bbf6d..316c0f0616 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -56,12 +56,17 @@ python uninative_event_fetchloader() {
             # Our games with path manipulation of DL_DIR mean standard PREMIRRORS don't work
             # and we can't easily put 'chksum' into the url path from a url parameter with
             # the current fetcher url handling
-            ownmirror = d.getVar('SOURCE_MIRROR_URL')
-            if ownmirror:
-                localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} ${SOURCE_MIRROR_URL}/uninative/%s/${UNINATIVE_TARBALL}" % chksum)
+            premirrors = bb.fetch2.mirror_from_string(localdata.getVar("PREMIRRORS"))
+            for line in premirrors:
+                try:
+                    (find, replace) = line
+                except ValueError:
+                    continue
+                if find.startswith("http"):
+                    localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} %s/uninative/%s/${UNINATIVE_TARBALL}" % (replace, chksum))
 
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
-            bb.note("Fetching uninative binary shim from %s" % srcuri)
+            bb.note("Fetching uninative binary shim %s (will check PREMIRRORS first)" % srcuri)
 
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             fetcher.download()
-- 
2.17.1

