Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0423EC54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:21 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1939.1709071033024216872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DdjOLc7I;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e4e7e2594cso2715554b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071032; x=1709675832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0iq8lT/QRFaHWmZOJYB5DfWQpI/c8c4LN02QJ5KwSs=;
        b=DdjOLc7Ifj4LCSL/F9LcSAXhTBEUTXRGkDdw/9qclkKzsipSZvRsrOW0I/bJ3xvJsK
         dce0OFKVEQRM/wWaAax2Nil3f+IG9lLWpCxIo625sA6mfIn3xi87Y62P4rj873Fww1FB
         YEkpTcyYxeJOte4I8JlJx1t9wTxUT+eUpJCpBdMotaxso4BDJ2/ta73gyjiJlq/hzh2U
         xlxeFpF4Hjg/etgYZ884kVVWVZwoVx0prik5w9mRY1vjZg10m5ed7E+LS2KpHHbbEJiQ
         WIGlD6Li8Dm3GlOUB2td04qWm5NmrdE6SF4vPewA+m5a+VS1CkYeQhaH3j8cSWdY7VKy
         k1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071032; x=1709675832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0iq8lT/QRFaHWmZOJYB5DfWQpI/c8c4LN02QJ5KwSs=;
        b=qEyRkwdWtqmqj9LeKY5OY4nYzDUIvBFAw3eTDe3sUBqg6VAScUr+hloKvslDD6gGxk
         8G5pjSQaCwqoWOjYCOpZ85ee+RGqsSu1zjc42KXIP32Dc86AFEqL6pRSNikd9jFcBDtL
         HkqaDG5fNfPBaelGZjNBJX8HelWCP+ldQKtqYN9qdKqPrQtZRRmbPjKxtjgcWUb5e6k3
         BPjf4CZVF/yEq0p6ZgyzcRKz/CowE3wEIm/PAFq8h4a8AlQSysOpk6XrYOVF/aVJ0dxR
         c7EL6cBnRdXzF8CT5IcOgU28FWrdvvvYetTSOO866Tl/9RHAlFY071WanGus0uRH+CKy
         GR6A==
X-Gm-Message-State: AOJu0Yw99E/sLyWrY1o6G/tAF3lx56nDlySYpUOOsogIlNcgfZ9mKh7x
	lRmbRE7xaUPRVa0klqaNlSBneq8P4eDfnC50Q+PYlI7IJ4VI/4+FAqSx1B4txMbw0QRE6lUbGLl
	wOIs=
X-Google-Smtp-Source: AGHT+IFwqqMAT7P7HGHTNv6aqtIw1cGhR7+4UvuKfnTCJcXmn314ureuoDg3yPcVQYTzl0ON5BVd9A==
X-Received: by 2002:a05:6a00:1e13:b0:6e4:e43e:dc1f with SMTP id gx19-20020a056a001e1300b006e4e43edc1fmr10465034pfb.32.1709071032311;
        Tue, 27 Feb 2024 13:57:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] scripts/runqemu: fix regex escape sequences
Date: Tue, 27 Feb 2024 11:56:49 -1000
Message-Id: <2f8982ef4c903f43867da56fcfd080a6556daa8b.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196301

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8e5d22888d..81d95133b6 100755
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
2.34.1


