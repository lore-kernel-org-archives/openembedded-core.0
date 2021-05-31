Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.48119.1622488322555918923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 12:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=II0KDXs3;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c13so714472plz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+rTNVWa6MY8qvjQ47HQIremDzATGfBQl/ccHQFPZ2YM=;
        b=II0KDXs3KEhvOt4XXyl71xZwHqFpXlWZvTDNhc2acBIZWa1ntTl6U0VmmJkrp1Ecd4
         K7QurrTG8vLTY4ISWUTzcTwdbYaj5w2amw30Bk26cdzepc/f9RdMBZA47YajXAhfrG3c
         CGDoBeylerggDiEwseYcn1ThlV9IfzZYKTmxTfcHCj8rFaTScebO6ZEL9Cw99XLbMXhr
         /IdI6TZf+YXdTYGlQNXBjH1wQALfkKvUwtMZ1acacV58JM/LQz+ybntRtPWXfvZG5n1Y
         71UsgwFfViq7RsfnFifPCbdwBVfxfHqm2Xx86wQFJ0F8p9kYsMHb/ZvZworey+qApAZ6
         LrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rTNVWa6MY8qvjQ47HQIremDzATGfBQl/ccHQFPZ2YM=;
        b=HGmJcUINPSvoHTSVllXgd/P8PMqhP+ltql2oTmt4wrfz+YDy0cazgqVecxj2UIartv
         ykq6oS4iWIFgBzQJ5ZPKbeYn672ubUJLFT3fbaGlKEN1UlZigiTRG8idZ7ZsYt3tqlrW
         FD5hYO31JogJpE5h9WvUbSQF4vGUvKZqB1qTzN7hEfM3R8zqIve7vSiKGoOEJBvyk1oO
         TL4m3ZCWpahMlFVpj/0rlrZYuoSfLTo8JBWrqWDh2MHe/aUrng5QMCdIDirFk4UKeriD
         VzYbYwg/ZpaQn+spHB737TTUd+tUgleMdJo0Mjm7bqLIOM2tAd+Subfde81iwn9QoaQ0
         tnXQ==
X-Gm-Message-State: AOAM531Hawn9zrKuTDDipz4Tr/BYqdix38aPBw7iaxTB9CMO3rg3Ldwu
	J6mHe1QY9+KwqTAmLzFvq49ru52+YSZAKw==
X-Google-Smtp-Source: ABdhPJwRsvJnog2s/aZZN5oaxXKCq6kYaHV6RDkhdMcE0Ucr03urPhKB4NSSDRQ+uUfb1Vxb8OLOjg==
X-Received: by 2002:a17:90a:bd82:: with SMTP id z2mr19048472pjr.87.1622488322047;
        Mon, 31 May 2021 12:12:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id j5sm10799327pfj.185.2021.05.31.12.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 12:12:01 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] package_manager/rpm: decode systemctl failures
Date: Mon, 31 May 2021 19:11:58 +0000
Message-Id: <20210531191158.964098-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531191158.964098-1-akuster808@gmail.com>
References: <20210531191158.964098-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse systemctl error to provide more info

[Yocto #14395]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 6df0092281..b392581069 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -199,6 +199,9 @@ class RpmPM(PackageManager):
 
         failed_scriptlets_pkgnames = collections.OrderedDict()
         for line in output.splitlines():
+            if line.startswith("Error: Systemctl"):
+                bb.error(line)
+
             if line.startswith("Error in POSTIN scriptlet in rpm package"):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
-- 
2.25.1

