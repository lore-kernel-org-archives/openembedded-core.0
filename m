Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC8CCD5BB2
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.962.1779233437990004811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3H+2Fd1t;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso22955485e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233436; x=1779838236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyisB7/NWet7jggIZ/bYjpO3yAC66N/q+/ldLyGbY7I=;
        b=3H+2Fd1tQ73uLMvqz8eUbQZIhpIzbvJcP1oRFdUgOt+vxAOT9mcMT7NxMyNDT66DGp
         Ea3y+Wg7ZHFN8oSHxYB8jx4aROyoTY9TYSc1o18yC5TZvftLw7DXdJq999SLH48dNtCa
         TaN2/Dgi5LQ1yvVPyzPrSg3jtKDUEwB6TiSSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233436; x=1779838236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyisB7/NWet7jggIZ/bYjpO3yAC66N/q+/ldLyGbY7I=;
        b=OU/0T7LKv/8z9X0kYVBATeccP/+WJapi99ksVZqGfXFn+/oirLu5I9Bm5pEtuRtfLA
         OWmzomqYeLdEfkksimKpGQWG3oYSvDmau5rTxS91ew75g00oBXXlbIH5gQNRAZdoNaoT
         7LP4YTps1ZOi0fFwX2g1zT1DnFbyRg/s93XOlRsyYuweWNqcYULZPljgMqOKhLMKBfNM
         zW0BuoHMcP6+QIuvsJhRlviUmcvDLtNJe+9j3aUlaek8tRJpOtnKJBoUUaOIkR2rke5T
         nzPNux22mCQe7JmLr7XkjLkqaCW2FcYE0rerx+GLdEzcIkpX8nnJlzxM8pzBOEOTNrnt
         mOsg==
X-Gm-Message-State: AOJu0YxrCc5OEWQIHrFS/1mFxcl4GcMJdKB13MaujJlMQAN7eQRdnj7/
	0mZCxslA42Bb9rusRCpRGRx8wPzPuWRPdGAMsSe72wihD+bs/A5Atme/zNbpHJr56VtBKyLRFZO
	sHSac
X-Gm-Gg: Acq92OHiEjeOVsWtm59KWaS8MjlUof7nlfvGp1s6kpFcC/vdP8uYlDEdmeGnglvSEaY
	LtD6oZTH1frFt7I40220Q8EFtIHQi8qBoYSQPfiGnso3mR94g9yYbHmR1sZ6kK4W5rLmsaPFvsv
	LbROs2V1gAWkPyKqddFe+EBxhrWlUAmWLpn1UfwbMNFQxOB9lXT9hvo6RO6KTalDzjH4M4O7zKF
	5V6ebt+Rpzw7Dblywx1T6sTbjWkPFzZVBEJVMoAu4Qs3zI1tvUcyc3FCcKpodaPhpWYHixYSG0X
	BNwkRy1Nxx/KyZuEbMSZ4u26ArSqaiPkI635yYKPPi73dUHVr1ZZvcxsPHF4ovVluim9UQUNqAG
	IAzhud1MCZ09cGRoreQf9EN/UK9sdb7ABxWHs03uiQeOng5fGhYTWB3LCB6keuANNMTn/OTZyZm
	NWR0QjQ1EGFOBnmjtYcyrevORiifUr/JtmEJcfH/2nKun1ubGW3ck4lSRUUgPEhLXk9pNWS3XLe
	M2O6wMYoOZRJxygfQgywNpfJeQ=
X-Received: by 2002:a05:600c:4e46:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48fe60d576dmr345171815e9.11.1779233436102;
        Tue, 19 May 2026 16:30:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/28] oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error path
Date: Wed, 20 May 2026 01:29:54 +0200
Message-ID: <020a975f71a78a7cc1d38a932a8a8eb33af0d1e7.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237364

From: Thomas Perrot <thomas.perrot@bootlin.com>

Commit 678c1c207731 applied os.path.isdir() + non-empty check to three
functions, but the error-reporting path in lookup_pkg introduced by
commit 46ff3a8d2c18 was left using os.path.exists() + os.listdir().
This is fragile: it raises NotADirectoryError if the path exists but is
a file, and silently falls through to the generic error on an empty
directory rather than skipping the rprovides block.

Apply the same pattern used elsewhere for consistency.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbca656205a7d9a9a9b0aa25b4ad6562af9c5180)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-pkgdata-util | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 904008bd029..acefae24f3a 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -239,8 +239,8 @@ def lookup_pkg(args):
         missing = list(set(pkgs) - set(mappings.keys()))
         for pkg in missing:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
-            if os.path.exists(providepkgpath):
-                providers = os.listdir(providepkgpath)
+            providers = os.listdir(providepkgpath) if os.path.isdir(providepkgpath) else []
+            if providers:
                 for provider in providers:
                     if provider == pkg:
                         continue

