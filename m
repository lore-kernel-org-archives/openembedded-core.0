Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95295C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8983.1708689708260554441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PS3vVqql;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3d484a58f6so105299466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689707; x=1709294507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdrlJHj/g07klK3ZoNzn0msgnWO21kpNTXnGgIls6lE=;
        b=PS3vVqql6aKoNdDpOABDAq44DioUT4+WCAiLNPt989hJT445IhXHDL29TiCgbPNcII
         L9e8did4IQdMjp/gx3valekzutmL9JKpJJOwCkK1SylZhduCigg/0A9jIcWwtUzZCQyi
         yF7P+TSx6QKWbgCjuh7MwcC644++YdHdglZx6KtCU8QPobyA35iew8iOMGYPbvZE/an4
         RphJGSCkl+PMUEWt5L73/UIxy+3+P7IFwaeOIEtTov1oCO0COgwGuyH7asNBscvpMMEC
         GIwstW6n52RWCd8KcwOYADkdiYT8YGqU3/3Zfjrud2YA9bVparO5k88IbhW6ksAu5MTj
         S4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689707; x=1709294507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdrlJHj/g07klK3ZoNzn0msgnWO21kpNTXnGgIls6lE=;
        b=qdpHa882EWz89CLpKVm7JYY7TfdOBYBOGvZVgiXFQblpq1Lw7iv/th0VSeWPfCkzia
         zQl9a2D8knsfJ/Uhmfez8IksqjpNdXVwZ7PpNiV/z01OULcSqC9xrY0LJDRqfM9cEtM1
         TnckWI2wH4gNDlC9qjSKaOBhYuVv5EKSsqHCnu/Xodf+K+qCCtBLxvUEjur3aKjMX/EI
         DOXKMsxl/q6/siSz9s7dHKW3sopPUpeZQuSMpATT/+FvYb6pVcfl+prUdcG6hjbjRwSK
         dTGI4PI02Nrui+EGzz/kwtoTyAyve8G+PL9ePrloS0wrVWMJzgCMet88WdBJ8lTDR9SM
         yRbA==
X-Gm-Message-State: AOJu0YzTzcw/lf+uIcRMjg3zqEyVr1hVKTY9N1wTCFKleXaqcGu+GJZL
	166hRMnDorTcPpIFX0M2oyyNt7S/IkAq1lH8Z6AhgUogyIxanwimOP0iDcOn
X-Google-Smtp-Source: AGHT+IF60POsEh3ymmVX/jg2iaSZp6Q3RCO0GmfD7tg/CToZ7AAZuUKMtb+VcoYK5HRbOPhYUzQTmA==
X-Received: by 2002:a17:906:a10e:b0:a3f:3aa:7dcf with SMTP id t14-20020a170906a10e00b00a3f03aa7dcfmr1118782ejy.0.1708689706673;
        Fri, 23 Feb 2024 04:01:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 08/10] selftest/sstatetests: separate sstate presence check into its own class
Date: Fri, 23 Feb 2024 13:01:32 +0100
Message-Id: <20240223120134.3713127-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196068

This allows reusing the check function in tests other than CDN/local mirror
ones, such as sstate bundle testing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 56dfcdb0f39..8d41ead8abf 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -890,8 +890,7 @@ INHERIT += "base-do-configure-modified"
 """,
 expected_sametmp_output, expected_difftmp_output)
 
-@OETestTag("yocto-mirrors")
-class SStateMirrors(SStateBase):
+class SStateCheckObjectPresence(SStateBase):
     def check_bb_output(self, output, exceptions, check_cdn):
         def is_exception(object, exceptions):
             for e in exceptions:
@@ -933,6 +932,8 @@ class SStateMirrors(SStateBase):
         self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}\nFetcher diagnostics:\n{}".format(missing_objects, "\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
         self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}\nFetcher diagnostics:\n{}".format("\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
 
+@OETestTag("yocto-mirrors")
+class SStateMirrors(SStateCheckObjectPresence):
     def run_test(self, machine, targets, exceptions, check_cdn = True):
         # sstate is checked for existence of these, but they never get written out to begin with
         exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
-- 
2.39.2


