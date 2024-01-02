Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD3BC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:56:18 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.33555.1704214575183233976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ar7nEbFJ;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-781b9922f44so178548485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704214574; x=1704819374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W30Cw8QG5fGl2ruMCgPc6DP34bpF07t0eYdoVEXb4oo=;
        b=Ar7nEbFJsHRS1LPTNeK87A6FI9QfkNlLDVN72wMKk4ZYLG1Yl2CAJqvxYppU3bgXIX
         UjG5aJCqHnjGJ+uPIfwYByJ57SOSn+E/CRNBxilxONqnnA0ID8FVeBA25jSXmRZGpYgP
         O9VEL1zoCFD+2KZP4z6WJDS9wHUzSRVsf2qwoIgR2lqSI63fqzGIqZvXgyLzPN65Hw+H
         +FEGDZUWPQMRaHm8ivxSaLdQhybBwtQ1rVs+2nL65rQK6ATFPuUzt2g6LcedleTGho0l
         /az4esOVT7VN4JHqV9pH0M4C9SXN1w5q2n9lk/i7lCxavLI+1g0HKhOE/IEcoJ2Tf4st
         fDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214574; x=1704819374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W30Cw8QG5fGl2ruMCgPc6DP34bpF07t0eYdoVEXb4oo=;
        b=uqjOgTwCdYPGTsujzlq34+fDHObaiDStUWq/Ddnl3tw/bu5nuagwA8JlprQESdTZnU
         qOs+ikNacOQRun3/sKg7zCUzk9d4kmNsvPJUU3dKhxFx/CWacUoAOcLkCWg9QVP/88Xu
         8Y2Sjr5hQHPFlRaE6tGDqsz8gSH52cpLH0nkumNotMSrTq0VdG4j/04YEkH5a/WEY0uV
         ayaeYY7bl0hlxn2JiJxp6H19AawboG9u0xZMVzJ8URbhUhAwdazHcQzR+pmDNsQRBivY
         yjs/FvUxGT5FXSRfJcamYqb2QvZUS0uBRI1ZEAAsQyvtA5Inpct+eTMso/7sh5C6TOIW
         5nwQ==
X-Gm-Message-State: AOJu0Yzp4IEVGrPQ/B594GGqTvRy759HX6qzYG2fxB2rvtt79gMAVmoN
	iBM6wM+6eM64+2sTrcuF+JSjHCLlitwMOnr6p1kao9eVrNc=
X-Google-Smtp-Source: AGHT+IHsJrh+v6K0nZdoBwn0yIWW/rST8P+tdq1DtSpVthRPjylIo8XnPqmyOTbp77qjmZzA0O2WNw==
X-Received: by 2002:a05:620a:3948:b0:781:e4b2:9d61 with SMTP id qs8-20020a05620a394800b00781e4b29d61mr3488qkn.60.1704214573709;
        Tue, 02 Jan 2024 08:56:13 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ou30-20020a05620a621e00b0078172403677sm4249918qkn.72.2024.01.02.08.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:56:13 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] scripts/runqemu: fix regex escape sequences
Date: Tue,  2 Jan 2024 11:56:12 -0500
Message-ID: <20240102165612.2706280-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193249

When invoking runqemu with Python 3.12, the following warning is
encountered:

|SyntaxWarning: invalid escape sequence '\.'

This is because the interpreter scans the string before it is processed
by the regex module, and it interprets the backslash as part of an
escape sequence, but not a standard one. This will be registered as an
error rather than a warning in future Python versions. To avoid it,
simply add an extra backslash so that Python doesn't misinterpret the
string, while the regex parser still sees an escaped '.' character.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 fixes a typo in the patch description. 

 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6a5a6451daf..f4d04201092 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -371,7 +371,7 @@ class BaseConfig(object):
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\.bin$', p) or re.search('bzImage', p) or \
+        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
@@ -385,19 +385,19 @@ class BaseConfig(object):
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
2.43.0


