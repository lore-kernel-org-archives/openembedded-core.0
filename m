Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web09.13948.1604233955884654429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 04:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PeY0MR32;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id e2so6865351wme.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1yE0RzamLO7mjtMafPuMfa2fznet9CRAd8KVsnx/qc=;
        b=PeY0MR32uch9uHFytSwiiGKQyDiWqpeEMyGuUCSzGNWYnQxb8r3nqYBggba1NM09gn
         DRpls0nVf19o+HMNxIQfNDlBppkP0xVurmf5bp8XFi7JkEbv7yWEKcYiYkv2FOUK+53u
         x/67myHfcKfk2mfLNps6M7DN/bfv0cXDTjC5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1yE0RzamLO7mjtMafPuMfa2fznet9CRAd8KVsnx/qc=;
        b=DB7+svOPVVhmIo7kaTpYgW/Mw6OMmhoosvD2r7rF8xxWYGshAtZ2ISIVPjfQ7G6vM9
         O+dQB/M+8OVu1HEM1b9B+varOF7lyt8zgdfUtKPy9HO2eFTgDoy0HVyr8nkXmOmP2bOd
         H/+VPnhBFxECtyfUbpwsCpBtkKPtx9RzwFFb57m40tukrIY3b4jShNO+cE3e6zvt5bgX
         znXs1twNjXOe0mrKZv2IRATlJP0V0lOdiLwpf/VHJckz9aZbPf6O+yKTeLmJFUjh9y2h
         SQoDqozsT8JbC5KH1CP6RLq58ZQnzrX6bCLW0ZQ7QLZz9lh+AZ1Fget9jdFGyJcLskOW
         c2WA==
X-Gm-Message-State: AOAM532wZHfE+lN51Rni+G+IMYJ+gLWi+OkIw+3JIWf4O23mMgPuESJL
	gwSko8UwqH03KZJPVMWz6OT+bpCytRExbg==
X-Google-Smtp-Source: ABdhPJwRirWt6wajxdFqPTUsP7EIzm7pPKqqMRf5WyhNZRBHdtIrEZY8gqCd3zGN20de4gML0z3zpg==
X-Received: by 2002:a1c:b1d7:: with SMTP id a206mr13196685wmf.117.1604233954060;
        Sun, 01 Nov 2020 04:32:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id y201sm12305164wmd.27.2020.11.01.04.32.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 04:32:33 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxcb: Fix install file owner/group
Date: Sun,  1 Nov 2020 12:32:33 +0000
Message-Id: <20201101123233.349497-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The makefile uses cp -P behind the scenes for installing the tutorial files
and this preserves the build user identity. Fix this to the correct
owner/group. Usually do_package fixes and hides this but it can be seen
in do_install.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
index f27c5daa617..e9f6051b6e1 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
@@ -30,6 +30,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 export PYTHON = "python3"
 
+do_install_append () {
+	chown root.root ${D}${datadir}/doc/${BPN}/tutorial -R
+}
+
 python populate_packages_prepend () {
     do_split_packages(d, '${libdir}', r'^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
 }
-- 
2.25.1

