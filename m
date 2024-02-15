Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF40C48BF4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4901.1708035440203660369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=POlbit6O;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41239bbab1aso543525e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035438; x=1708640238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVL8wByLrW6dg1mHYJG3likhEODBdq7COnQlgST22uo=;
        b=POlbit6O+jYIvYv1oVlfWt+/WA/L9smMPGJkeqoR4y8kCPo28eyeh4TcdbFBitZ8N0
         K/Mo2tEHLprPIMe15d2ZfgcLOlaTR1knV3VnVAX+O2rsdgEz1mpIdpWcSMMUm3B80DXH
         uFJ81EOpZsmERxaBZKrNiA4KiMYcZYehPuDXcH4Vxosfda8rskI8twLl8dUSnm8AtZlY
         17AwEexYM8KPgWX1zLk7bLug72GvA5M1HwpknRIMT/fI21dwc6/vjOoHiKyb10q+rDwY
         56j9/1c+5hr35hq53j2U9LS9mK9ogB+QzPOrgUM/LdHSVnrRKC+giloHy+mmQaDJTqVF
         6lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035438; x=1708640238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVL8wByLrW6dg1mHYJG3likhEODBdq7COnQlgST22uo=;
        b=Zo1UCpxcEbza7BjYrmpNVQ9WgUu5r2CzlEzkPnIa2P3v4KvLwBqup2KhmgZSh27Lar
         hsflbdM9xPT+hQlQRzzj0HgSY9URUPDAh4X6T9M0MKtZXPqk4XV5spQmuO9nTy9zGfMa
         aY63AWW8hpBSULKSx2Omv3+uBin03MXMO8bser89As8ZyJZeHddQKkJ8R/J87lbvrA2L
         y3NJXKHZMIF+sq8NTrLDi3SmJVkhBBELXjiWgHLwBPla5BEu+wYyIHhJ9dJt0KjPoeKN
         PdI/uI5UCayNh3SYDJZM68hxkhzt+j09KrgTh0QIEN4zZwx4pG9rT4oDxN0fAenhnhEE
         9weg==
X-Gm-Message-State: AOJu0YzuE9WTLqg8jmliNiePwew01f5R10RR6jkqM80/fzWL2gyVe3Ww
	jhhW3hQHuNxojnva/1uuBi32RlL8MT1qQsOkrwgPepohw/96R3niFxY17i43ySo=
X-Google-Smtp-Source: AGHT+IEdZ0EJTTiRK5n+PTFxnoLGnVpeWXg4iMeD+doxllWd4DSXT35p0S5nKf1Ex0MFxnEI0T0Z+w==
X-Received: by 2002:a5d:658b:0:b0:33b:641e:ff5d with SMTP id q11-20020a5d658b000000b0033b641eff5dmr2098503wru.27.1708035438192;
        Thu, 15 Feb 2024 14:17:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 02/12] scripts/runqemu: fix regex escape sequences
Date: Thu, 15 Feb 2024 23:13:48 +0100
Message-ID: <20240215221711.332614-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195713

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

Backported from master: 0e8a4142bb90a92d175df6b2537d24a372356f98

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 729b067a9f..b7d7c7b4e7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -362,7 +362,7 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
@@ -376,13 +376,13 @@ class BaseConfig(object):
                     fst = t
                     break
             if not fst:
-                m = re.search('.*\.(.*)$', self.rootfs)
+                m = re.search('.*\\.(.*)$', self.rootfs)
                 if m:
                     fst =  m.group(1)
             if fst:
                 self.check_arg_fstype(fst)
-                qb = re.sub('\.' + fst + "$", '', self.rootfs)
-                qb = '%s%s' % (re.sub('\.rootfs$', '', qb), '.qemuboot.conf')
+                qb = re.sub('\\.' + fst + "$", '', self.rootfs)
+                qb = '%s%s' % (re.sub('\\.rootfs$', '', qb), '.qemuboot.conf')
                 if os.path.exists(qb):
                     self.qemuboot = qb
                     self.qbconfload = True
-- 
2.43.1


