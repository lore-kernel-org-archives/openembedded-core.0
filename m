Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7097C7114A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 05:26:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.11496.1750137996326567036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 22:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D8Hbie9Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4664010a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750137995; x=1750742795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtBvHdtjmAvyUcsssT3Ycs972xwIeITTwib+w7hRdJI=;
        b=D8Hbie9Qjoqei+98pX/17s7I1jG7NaY0dfDwRDHSxidQTf4/jwbPYFr+iIzMvUZ5MD
         uuCXRaM24xzNvYrbG6rmIGAuLs8mLNKy7+ndyh4F8fdNSZjCTb9MnkCgN9oP6QAaFeH5
         WM5pRlD/2xG2eF+rgnAq9d2bqwY65wL8SsYRplbuykdnsbYLNxJDHyHOJdMofnG5+QVA
         HxQN05DfcFluJ69upkcKVvBklJflBkR9nKImF+QAoKCmQReOITY9v9VOEqcIYhIN4/cN
         zKli45pVv4jsQf+2iDeYgF/0CcvnbcbEVOg/lLpDz6HPJQJu8i5xI8UosKPiMZKl4vAt
         g48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750137995; x=1750742795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtBvHdtjmAvyUcsssT3Ycs972xwIeITTwib+w7hRdJI=;
        b=wtmlt6rfCwWCjeAlbwCemjVbB+QMFkLqjgz62H0ANFgLH8HM3/y8cHW+ZjNdT48PrB
         V2HTk5llOW96JiCm+0mMCT21FmbEqi+AE/0caqUCTli2H4h6UvYiTXDDdhaiZnYhrui6
         GaGR+lKLRoZM6PCi4XOdZztHL3GqTH9nMu0ddnjF0y0j3ydUVnpNM3Wl+sADMzYfDUHc
         Ryz9rf83SDoghocb72YTMEHm5wFZQ6VSNjlHwdGAz5LB/wnTGP4VJdpzd2KJMDwrmAs6
         cW0LvTXCofnTjp1T9/LpsUPdatxXzg3/m2lMgk/NeF/ceKXCE2EWL9PiAuAtohSO6vEy
         kJ8Q==
X-Gm-Message-State: AOJu0YzmR9TTtJ46bicX+4sBVRThWzF/uQMPll6kSrG416vYp1ajQuVD
	+ViaufnX4x+1nqlWfESMhBGwtY2cIeNR4eG4G/e4lppmJ0dv2CZqZtlv+hRdpA==
X-Gm-Gg: ASbGnctTlWAGnFx3CWU6+YXoTBPA3wCW/gLWB4DHQBtvb+kbEi3Dl4jyPrHEavZcG+p
	9on2IHjqf/Ji1UKV1IYgMjMgVxI5+S/5UGAULCES7X6Pi18IIOi9gJHBqti2QGnCZVB2iNnzvik
	u2cWBJhIvyj9iiE2j8OVy5mM4d1TZ01o3JUvRlTZdMF6KNiHmeZ+FSQWcluYWZG7IxS00Qb9CpB
	owDIfWXm3gXv8rqIIHvtXG/P2WeuV5I4nXVayt0gcsOImkBmAssLrSTmmkWSIDAkkio+9SzW3hP
	lZ3R5VDRpjd6sJFAaDSYMHw4ZnmaDxlmlzPhkePAVICxwmxaaLnH2ngMEw0PYElS1Gj45wA=
X-Google-Smtp-Source: AGHT+IFA3ADmjg30xvifaPoL7qqOxwXsoYmWfUxe53ii/4Jc0A+xcfPK4+8g7DRbjp5jXhGQ0v8JBA==
X-Received: by 2002:a17:90b:2dd2:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-313f1c7dacfmr20098557a91.7.1750137995123;
        Mon, 16 Jun 2025 22:26:35 -0700 (PDT)
Received: from kamensky-p15s.cisco.com ([2601:646:9d86:8270::6b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a19b0sm71125555ad.61.2025.06.16.22.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:26:34 -0700 (PDT)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 2/3] oeqa/runtime/stap: fix module name: stap-hello -> stap_hello
Date: Mon, 16 Jun 2025 22:25:39 -0700
Message-Id: <20250617052540.8256-2-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250617052540.8256-1-victor.kamensky7@gmail.com>
References: <20250617052540.8256-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 05:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218852

Systemtap refuses modules names like stap-hello, it says:
> ERROR: Safety pattern mismatch for -m parameter ('stap-hello' vs. '^[a-z0-9_]+$') rc=1

'stap-hello' was introduced by:
6cf4d23a2d26c2767edd93f2eb317ff759b5a992 (oeqa/runtime/stap: improve systemtap test)
and '-m parameter' regexp check was in SystemTap from 2010,
not sure how this test case ever passed after mentioned change.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 meta/lib/oeqa/runtime/cases/stap.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 3be4162108..23eace7e9d 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -21,11 +21,11 @@ class StapTest(OERuntimeTestCase):
             status, output = self.target.run(cmd, 900)
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
 
-            cmd = 'stap -v -p4 -m stap-hello --disable-cache -DSTP_NO_VERREL_CHECK -e \'probe oneshot { print("Hello, "); println("SystemTap!") }\''
+            cmd = 'stap -v -p4 -m stap_hello --disable-cache -DSTP_NO_VERREL_CHECK -e \'probe oneshot { print("Hello, "); println("SystemTap!") }\''
             status, output = self.target.run(cmd, 900)
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
 
-            cmd = 'staprun -v -R -b1 stap-hello.ko'
+            cmd = 'staprun -v -R -b1 stap_hello.ko'
             self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
             self.assertIn('Hello, SystemTap!', output, msg='\n'.join([cmd, output]))
         except:
-- 
2.45.0


