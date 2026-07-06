Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD636C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:02:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147758.1783332134285024710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CJPzuFbH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47362928f65so2778874f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783332132; x=1783936932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u3hJ4RyomRXaFtYlxKKNxNa+CUbe8O9YnXd9ddV8/yg=;
        b=CJPzuFbHXiPJstals29IIu/How7hdPkosuNpVeMU2jhQL1TEgycrOc22jz8HMd3ro7
         xixpd/kGfnhIHc8vCoi74aVhvIRxSEAC+vJWN3wTxlG2/ORxd+MGUgGtyjB+B59roLYt
         2iTIRcAFHqF6HmuIi2bR/XCyAkUZWd9udJljg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332132; x=1783936932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3hJ4RyomRXaFtYlxKKNxNa+CUbe8O9YnXd9ddV8/yg=;
        b=gKmqkjye4IrETu6NL8n8i5+kB33xyyo76HbieIWPtzrTnTsNZ2UXUd0/Lk5trcBmtp
         UqIXoqn7i7jJIAny/sN7j5We9O/gFJWGisqNp1N7+tnGZPQOzQ+cH1sNwBN+8ERMSDBk
         0m+4lWMs3lDQUsPBUI9k5pQ2rOlLCQ5ENpNvUSDNjl58AehdEtK5yAhcjso/ND7Rdbeu
         LDZ3SEhEJQa6CymwlxqSFZQHpRgDDy9TUx2MHwf8B9z6bLp20ksmsiej8e5NcW9csBRq
         bfjk0IbTROwcc/5UA1QjRbtZRRWMpK6aYveKvcDtMQL0qnD0af9eJdsrEy3kGRWprAEE
         JmbQ==
X-Gm-Message-State: AOJu0YxbN8JFUaUegklPAymXFfb3LcQ+XPSLxQPObVLsCWujGRoc6zuw
	wWVY4894WuD2sALkvZ3UatCDKIqFNmRK84s3s9fV7SYO/yr+osR0nPynAEi9ENKPy9EDLEUC72k
	BiqI53uA=
X-Gm-Gg: AfdE7ck/ZDioFwQod7+glFqD14jFvMwmnRINJA6hK7B1nhJnTco98G9yqYV4KugK+g0
	kYHxcSLIxPWfgoVdKeRDIMSHl7gbJTP5p+hAGXnhrkBhs0gvvroxy6IKm9s+MydTsWango5UrM+
	ksRE0+E5nONNu3SsBlEFDHTFMO7f1XjHh3vgCQvj6MWp2wc9hGPytRSrA4Jcblqf7ywQO+CUYsQ
	bnhezWuvMVdl+0Uf1dT066vG6e6ZpIqQaoBl/8MYV0ibxUxWwZcwfskE3fVWhtA/NA6uVoJACYe
	p3kXU65yscMAyofBAHR6PP4eEIsnZKA34bpYjXBoHbwdpMYr/51jhzIhHQWd4vakxalgVdH472S
	C/7I85PbtwTo1EMqSRROySJGu062M+3IO4bHunbmT2RqK4KvX2MGwwNTTEHRv5N/D5Awv72qTcJ
	n5Hqnz0XF0Vo7WoQprieR3E4JpFVB4/p7RO3E1RDrVBQ==
X-Received: by 2002:a05:6000:184a:b0:475:f0d1:eb68 with SMTP id ffacd0b85a97d-47aae69e180mr12778957f8f.53.1783332132109;
        Mon, 06 Jul 2026 03:02:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22738494f8f.14.2026.07.06.03.02.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:02:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/oe-publish-sdk: Convert string subprocess parameters to list
Date: Mon,  6 Jul 2026 11:02:10 +0100
Message-ID: <20260706100210.677278-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240235

Convert string subprocess commands to lists and drop the shell=True. We
can drop the sh indirection in one case too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-publish-sdk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index b8a652e47f5..e24446ce1bf 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -60,8 +60,8 @@ def publish(args):
     if not is_remote:
         mkdir(destination)
     else:
-        cmd = "ssh %s 'mkdir -p %s'" % (host, destdir)
-        ret = subprocess.call(cmd, shell=True)
+        cmd = ['ssh', host, 'mkdir -p %s' % destdir]
+        ret = subprocess.call(cmd)
         if ret != 0:
             logger.error("Making directory %s on %s failed" % (destdir, host))
             return ret
@@ -76,8 +76,8 @@ def publish(args):
         else:
             shutil.copy(target_sdk, dest_sdk)
     else:
-        cmd = "scp %s %s" % (target_sdk, destination)
-        ret = subprocess.call(cmd, shell=True)
+        cmd = ['scp', target_sdk, destination]
+        ret = subprocess.call(cmd)
         if ret != 0:
             logger.error("scp %s %s failed" % (target_sdk, destination))
             return ret
@@ -85,8 +85,8 @@ def publish(args):
     # Unpack the SDK
     logger.info("Unpacking SDK")
     if not is_remote:
-        cmd = "sh %s -p -y -d %s" % (dest_sdk, destination)
-        ret = subprocess.call(cmd, shell=True)
+        cmd = [dest_sdk, '-p', '-y', '-d', destination]
+        ret = subprocess.call(cmd)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destination))
             os.remove(dest_sdk)
@@ -97,8 +97,8 @@ def publish(args):
         rm_or_not = " && rm -f %s" % dest_sdk
         if args.keep_orig:
             rm_or_not = ""
-        cmd = "ssh %s 'sh %s -p -y -d %s%s'" % (host, dest_sdk, destdir, rm_or_not)
-        ret = subprocess.call(cmd, shell=True)
+        cmd = ['ssh', host, 'sh %s -p -y -d %s%s' % (dest_sdk, destdir, rm_or_not)]
+        ret = subprocess.call(cmd)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destdir))
         else:

