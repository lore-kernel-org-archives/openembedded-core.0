Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532B9CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:37:02 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28962.1781815013508390153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=aSVKRjXr;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-519e7faecf1so1052861cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781815012; x=1782419812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FKO+2b5qBPUqvcsH2GGVveTiFicVBk5WujEYpphcSA=;
        b=aSVKRjXrEEAqpRYMFh2eU3dU/UUXhpMTc9zFuVRlNIh+gRPoGugjb/uilctBJBhcHl
         34Ctmd71WeiLPRPeBtNfvDWMr2NGlpN6T+fY++Jio+Cqa4c0+IIF/gfUFXaUmBYPjFMh
         6efngQ3h7sLh+Uwh6rAPRwnj0Tqx3YZ64bJvthI5t8ACjilB05FvLlYs3tvl59U/lG6/
         rTZ0F6R04SJ4F6MxFvusgA/JKlCwcSy2KVva77LPgN8npvHCUGbnDQJ0oEvEo0Hzda0b
         8rppr2O7plPI3ka+HI77KkrKMO/0NSGoR/mXSY4hiLcBlmKc5KCq6IJmnqPxJW3LvGpT
         6gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815012; x=1782419812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FKO+2b5qBPUqvcsH2GGVveTiFicVBk5WujEYpphcSA=;
        b=Lx3cjBzZPlucAl+oJfrWQJv0xyTYSD8NIP1yqPRHDc+gXN9uO6iTw9J9XXQ3WElCVZ
         kwKnjzZisPX1n3CFguGBGO1IZuUpZh5IXCgaUfwG6CUhcfFI75OyHjnHPw0Qem0TXxi8
         3Ye7S9xmJn9CEkLVwPwKesSFKvd+FF/flCGyu/PDtMbF8agCnk3eI7Bm9tYYMqA3XDpJ
         lXqUQI3CqvRfSLAJLJw48lSxI5brd/xJ4J+0ynh0qBUqpG5reJqnHV5WoTXlQmSfN0On
         omcOjx6Ogs4Fcr6xXYbs6qcoEl15yR8lxAfs4IDZqsEeiX+DAmH6Yo7t7eYnNkUJlaMG
         MEfQ==
X-Gm-Message-State: AOJu0YyThb6N779iumsnKugmv3K5AeJZtGvxHd637pfb1jGvqLrFbmFn
	cl+FFz9hoHwhqgIbcWcCEjmTeElVl9hEReiNaKsoKFU9MZEClR1+J1pzh9U2C34FbJLqkdfKPXu
	59CwHogTl8Q==
X-Gm-Gg: AfdE7cnPz4NwO/e3h4HHF0rIl+5ORI3vcpFaZt5OKnDyZpA9+q44ix6GMxgqub92XNw
	CNZaBgGc7QcwSVImEBKCuTo11O6iPFVnguH1iN/XlQU78t/GwTqnA3Ng+1grJeVZLXI1PaHplwd
	e9gW7N0LR+Y+ok5yxSWhEScbPwGXBJ3pKVRn6aMWwmdvzezO2RuUrK1vF0o/x9eqmTM1FdJ8V0x
	wbCJasqSsmBuFTTPiPrZvMyP7keWt3ZBe5owBTKk/hO/sZJQ6wFpuNfgDL4ruk1GHBJ95+88oJB
	BV7W0tfk6hCmnky8MSoMoOl+TJiWax8oI1xv5ofd0SoIE+B/+LAodc29hU8Vvpn9QGwstojOgEs
	Nfg3foevD6zei+D+v2kJdErMMExgjp7/aLtwAPJI78OG/EgtMNdLyGVehLRHTQ8w4SpoY/PJFc7
	DJ14QiK4XuOebLX5qM
X-Received: by 2002:a05:622a:14d0:b0:517:6665:2a9a with SMTP id d75a77b69052e-519e4e0acdemr11541241cf.50.1781815012371;
        Thu, 18 Jun 2026 13:36:52 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8de61d3add0sm1908816d6.26.2026.06.18.13.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 7/7] scripts/patchtest: check for meta-selftest
Date: Thu, 18 Jun 2026 16:36:32 -0400
Message-ID: <20260618203632.131125-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239108

The patchtest suite (in particular, the selftests) makes use of the
meta-selftest layer for full operation. Make sure that the layer is
added to bblayers.conf before kicking off any test runs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/patchtest b/scripts/patchtest
index 592d91dbb0..b5a9bc2a51 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -174,6 +174,17 @@ def main():
         logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
         return 1
 
+    builddir = os.environ.get('BUILDDIR')
+    if builddir:
+        bblayers_conf = os.path.join(builddir, 'conf', 'bblayers.conf')
+        if os.path.exists(bblayers_conf):
+            with open(bblayers_conf) as f:
+                if 'meta-selftest' not in f.read():
+                    logger.error(
+                        "patchtest: meta-selftest layer not found in %s - add it to BBLAYERS before running patchtest" % bblayers_conf
+                    )
+                    return 1
+
     if os.path.isdir(patch_path):
         patch_list = [os.path.join(patch_path, filename) for filename in sorted(os.listdir(patch_path))]
     else:
-- 
2.54.0


