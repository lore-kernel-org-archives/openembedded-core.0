Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303E8C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.23480.1706987702627010047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NqEGa5PZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d7431e702dso26647775ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987702; x=1707592502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuuzckM6nXAWJPgFnOccKDYK/rEADb5F4jGJyzlSoF4=;
        b=NqEGa5PZ2F7+gGT2uay37P6JsURmorU+Wz/d+fBxSKp0ih2wXkbm8lBaMenfGfoRed
         +wyRo+OjsvLRCdNu/7YFGJuxqGYTkxzPjAjy60oUOejmvIzfbH4R1m64Fgnwr/LV0/CZ
         k9euJfGOqn0o1p75WAS1/eWE6IBq3Gf1eZFcBePDtN05dq8xUujI8DVvoVyjZO4SODMw
         mVc8ICp2D9vvrEO3gYvBN5+EPD206kit6EPkxV7bywl26xao/0K9Gkd0euY/0q4Cor8B
         NzVAesUhydfPzTwZap7n+7hlTZ51T4HdJLGNf4IadnGo3QSznbuebZkt0ZwqvMm7GGOC
         ax7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987702; x=1707592502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuuzckM6nXAWJPgFnOccKDYK/rEADb5F4jGJyzlSoF4=;
        b=uQXTu2LB5w6qTnlah40NDfRocf0ELHagtbbttI2bCCrdVKfx6/NYy8FGH1fP3UDHvF
         1w10irA+JoPSDfOvjq8k2BRKCepotzv7Y+Fs6+Gv5b1cVCqB66uNeqGt0FsqW8dJre5Q
         35CRFkPVHrOlAvJALhfv8B441np1Mcwi/EVFbPoQkTePmRv6B0M6oizDWA63thj7wyTw
         Zm53U5YJelFt8YVpTV+Hr+NwsW80rQf38gAf+0PvjCWR5tE/64OfZwsciKZ4W9iNQdd7
         fQPNy1FSlAKl60dEYAiitsJc4w+7yuZF5TidItKgJW7nzO5GsWfNUyiXq4l5z3P+T7jm
         skPQ==
X-Gm-Message-State: AOJu0Yw4Dcq52X5NZe4sepzonMyUpYBYoNFjWiNKJXToGTzqtFBJHqNS
	vxiQHkVgpMf7LheHRuVN0wRs25gqSACg5Y8SqUpTAVVW/7h5HvS1sowTRlbnRY+q5iPpX8H+yzQ
	xoUs=
X-Google-Smtp-Source: AGHT+IH4Pz9fYkOPw697b1tmNTRcc5eVZfWtc5e2vXTGQiEOraCUHYxYGsIBmSNwRLQh6epPoMbUyw==
X-Received: by 2002:a17:90b:391:b0:295:f96c:e75a with SMTP id ga17-20020a17090b039100b00295f96ce75amr9235159pjb.14.1706987701745;
        Sat, 03 Feb 2024 11:15:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/15] scripts/runqemu: fix regex escape sequences
Date: Sat,  3 Feb 2024 09:14:34 -1000
Message-Id: <145672043d6d75a9e5a03afb4c205e8008218a3b.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194851

From: Trevor Gamblin <tgamblin@baylibre.com>

When invoking runqemu with Python 3.12, the following warning is
encountered:

|SyntaxWarning: invalid escape sequence '\.'

This is because the interpreter scans the string before it is processed
by the regex module, and it interprets the backslash as part of an
escape sequence, but not a standard one. This will be registered as an
error rather than a warning in future Python versions. To avoid the it,
simply add an extra backslash so that Python doesn't misinterpret the
string, while the regex parser still sees an escaped '.' character.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e8a4142bb90a92d175df6b2537d24a372356f98)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6fca7439a1..63562cf6dc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -367,7 +367,7 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
@@ -381,19 +381,19 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search('.*\\.(.*)$', self.rootfs)
                 if m:
                     fst =  m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '.qemuboot.conf', self.rootfs)
+                qb = re.sub('\\.' + fst + "$", '.qemuboot.conf', self.rootfs)
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
                 else:
                     logger.warning("%s doesn't exist, will try to remove '.rootfs' from filename" % qb)
                     # They to remove .rootfs (IMAGE_NAME_SUFFIX) as well
-                    qb = re.sub('\.rootfs.qemuboot.conf$', '.qemuboot.conf', qb)
+                    qb = re.sub('\\.rootfs.qemuboot.conf$', '.qemuboot.conf', qb)
                     if os.path.exists(qb):
                         self.qemuboot = qb
                         self.qbconfload = True
-- 
2.34.1


