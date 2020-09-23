Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.992.1600881267813313784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 10:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ej0SKQDk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g4so860292wrs.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nTgD2x6tnbpKalFLdU/sbFbXFWEFzGoIuao5688FiJU=;
        b=ej0SKQDkfk+Rd95GIg/yCUcJGMTytukqzGibrtZtdu6Enps65N9qk9P3ML3cWaXAFS
         hewuFzAJiNhGJlDmRehX+OEAc4fZBmCNW3X/uh/SfKh1nxCrsufBI77N0KqBN4QlazZx
         y/+R80HRJ6xG141uX66XSSLZhGzF9kI634iKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nTgD2x6tnbpKalFLdU/sbFbXFWEFzGoIuao5688FiJU=;
        b=q0gq+2b9IquvXLHWG+QVv5xqJZtaLRC8BKOQkmwqjNii0j3OQ16C4rJwEx1K614Rwo
         D/TUM4yOeGopTTG4M8kbJgwfwKaNn2CH7b0ug2Gzu1xqa2OX06S85SQ/KHS4S1ERRfkk
         igFBwL6DKGgAhRCB1xv7av34gWiknCQZg7/2+MRJM2m4tZ13xNBCof/uXFhTjX9xY4uK
         HEYF/i/e/RjJ/w9NtREgwqYl77DA/orCnPVcUy27nrjzXAA4vUqO3bnwQcfKhUbw8HwB
         UqF7Ap1tMGYjyca5r4lcmwuuZlwB6f5JnCU7TdISAENKQByLIaC9+lTNgDg6NEzvYTCJ
         b7TQ==
X-Gm-Message-State: AOAM533Ch7iOtKluzYL5+036ogpeRygIokmb2BE09OenpZvUvrJCWavo
	esz/VIMLUUQXW6k+VX7QuOJFuQ/t0AQJTQ==
X-Google-Smtp-Source: ABdhPJxcMp2Ih6yu6hY9fLq5YkY5xsO3ImIJ50hARIi64OQQGFAgZ5ydF8AvvCBBU7T2AcP7ci6UkA==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr708980wrx.251.1600881265761;
        Wed, 23 Sep 2020 10:14:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (3.5.b.6.d.4.1.e.4.a.2.6.1.0.d.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4d01:62a4:e14d:6b53])
        by smtp.gmail.com with ESMTPSA id b188sm10771403wmb.2.2020.09.23.10.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 10:14:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/containerimage: Update to match assumptions in configuration
Date: Wed, 23 Sep 2020 18:14:24 +0100
Message-Id: <20200923171424.2555394-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assumptions in the test mean it doesn't work with ssh-pregen-hostkeys.
It also doesn't work with systemd. Update the configuration to make
sure neither of these effect the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/containerimage.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index c0998e319e0..4ad7f0e6543 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -42,6 +42,9 @@ IMAGE_FSTYPES = "container"
 PACKAGE_CLASSES = "package_ipk"
 IMAGE_FEATURES = ""
 IMAGE_BUILDINFO_FILE = ""
+INIT_MANAGER = "sysvinit"
+IMAGE_INSTALL_remove = "ssh-pregen-hostkeys"
+
 """)
 
         bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
-- 
2.25.1

