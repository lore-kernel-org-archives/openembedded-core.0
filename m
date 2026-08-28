Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30B1C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:14:18 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2552.1787944455059440737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=SuwP7hwo;
 spf=pass (domain: baylibre.com, ip: 209.85.221.176, mailfrom: hfranco@baylibre.com)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so845768e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787944454; x=1788549254; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NRlgqWhA9nDESrLsj15IjXhNcZxUF2XyWNWydH/WZwo=;
        b=SuwP7hwovWWT5Fgz+YDpB7BzboiywoltD7xu04Tok196XrP97kqSZSgQFa3iizaYua
         VNComxPUzAsVgf6gJ94toLOr8hurItSJYCcytVN5ghO6IPw24Ptu6knlhc/ewxJjPVHP
         IL84CQFB8XXe+ReNF2bSfb8pQi+sLx2+IHb43LccC6KjpWGF1sfmtcpciQClSDsL8VMm
         w0QGQUypvT/lXNpF7RfSoI34xZa0Ady268ULfa8BEp3OVmptIyxv038NjjW/j0gHbO9N
         FfTzs77TyYkMLbT9iou8v57C2o/1TRK7+6pMJT+cGMS5PD4/unH+r7mSKcKeaMXuIgzJ
         r44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944454; x=1788549254;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NRlgqWhA9nDESrLsj15IjXhNcZxUF2XyWNWydH/WZwo=;
        b=RgUgFb6EVtTsCwb7Qcrh8RCYqv9fCkTBjDx8L92l1gZ4418ukc5fK75mcFB6aSvRHe
         7ecVgW4EeKnoje95qs6PJOoi3xNVeC+AJUsgbJFF+/KU6RqceFQwZYqLHiznkkwZN94w
         mFvO8xdh+0kFPLvnspcqcCMaBVxk+gkggPrHf/ImsLOnePzAw5mhikBdK+8frA0zPHbN
         Yr6OvPlkm6H7On+Zb5yQCyD8TPW837RpquU8QHZi2SJLNjgg6POpdVYF4F3lORN5kCze
         zV31s9cXuLsKbCYDCmTCBK2ICbWhj33VwDj32n3tmJaYd4zjY6iSU3NX+KPSww4n0OXr
         iDfQ==
X-Gm-Message-State: AFuF++ltj4U68215i3JJ8dZKazH+IyHPfbb8s0bDjwHgiR1Cu9kJxcdE
	CiR1csv3kWdGFxfU8aPSms9FZkZ2LzsGQB6eUMTVL0ECgT/CYylZ7of8RAYlXeO20RMpV5QpaVS
	O+aD6
X-Gm-Gg: AR+sD100awH4uwohyL3m+c91vNw/L25lAbaqoO4svU9tdpKmHMRWSDW7q4AjxPzujo0
	UbSmFqJcGhzZAhIhQ++HH95BaurBq2BJWwytiHD5IFR6OogDI/kRpTtZgtGLOcapT3Iphtd9HLe
	tAgQtcetMwFWYHMNJVcXCe8Xk8xjp/vZ9nJyPjvm0P4NMEfqiC6MWr9c8Rpk3jrzN/M6cuMSE4a
	9UNWcrEvM0bT1X5lh2JTC8G+fWrcKNsebcvV6dHMR3kktXKMpx8P5jjVM46e8Sjbm8ZUw0Jn7u+
	csdL1ZJYj5baFpWZ6OnHc9HuKfXN/byadYz+JAhbeKd2fUKUAy3PgzfGTOPhEEPcZC2kPCZ52CU
	BTp7pylMbjBKx5zfaYBeqH27miQhSXpm0SfqWzmewJ7ozZNSt7i0Y+j8HrPekcRkj+dmoycuuVl
	+snx6Q4MEfqstGc8ZssrMOdBC6AtDdwayw52E7MrdAY5bL5PJ4lRFpStvqcO9KqISe9lcNu5P9t
	GOzTR/6vHHOMdIr8ggcf2ceqfq5
X-Received: by 2002:a05:6122:d2a:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c68480365fmr3993396e0c.8.1787944453644;
        Fri, 28 Aug 2026 12:14:13 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::f35c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c72425c2besm2047329e0c.13.2026.08.28.12.14.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:14:13 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Fri, 28 Aug 2026 16:11:54 -0300
Subject: [PATCH] improve_kernel_cve_report: fix backported-patch check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-fix-kernel-cve-v1-1-4d8b18491679@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPrtgY1HpVcQHu050VaIkVgTx7
 k3t4wcz/0kBXhHolZzksWvQxUU80oRkaF0P1i6aTGaKrDIVWz14gneYWXawtM8SZWeslZziafW
 IiztYN3+Hz3uEbL8KXdcXruu5XXIAAAA=
X-Change-ID: 20260828-fix-kernel-cve-ca47e7d2ffc3
To: openembedded-core@lists.openembedded.org
Cc: 
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244560

The guard added in 80ff4903ea tests "detail" in cve_data, but cve_data is
keyed by CVE id, so it asks whether a CVE literally named "detail" was
scanned. That is never true, the condition short-circuits, and the guard
never runs: a CVE_STATUS[CVE-...] = "backported-patch" set for a vendor
cherry-picked patch is silently overwritten to Unpatched by the CNA.

Use .get() on the entry instead. Guard the fallthrough warning the same
way, it makes the same assumption.

Tested against a qemuarm64 linux-yocto report (6.6.142+git, 16221 entries,
4313 of them with no detail). Current master and this version produce
identical output, 18773 entries with no difference. Adding
CVE_STATUS[CVE-2024-42067] = "backported-patch" to that report then makes
the only difference between them: master overwrites it to Unpatched, this
version keeps it Patched. The pre-80ff4903ea code aborts on the same
report with "KeyError: 'detail'".

AI-Generated: Uses Claude (claude-opus-5)
Fixes: 80ff4903ea1b ("improve_kernel_cve_report: validate that cve details field exists")
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 018cff3b65..41cbc1e222 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -363,7 +363,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
         # has priority over unpatch from CNA
-        if "detail" in cve_data and cve_data[cve]['detail'] == "backported-patch":
+        if cve_data[cve].get('detail') == "backported-patch":
             return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)
@@ -382,7 +382,7 @@ def cve_update(cve_data, cve, entry):
         logging.debug("CVE entry %s updated from Unpatched to Ignored", cve)
         return
     logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s",
-        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['status'], entry['detail'])
+        cve, cve_data[cve]['status'], cve_data[cve].get('detail'),  entry['status'], entry['detail'])
 
 def main():
     parser = argparse.ArgumentParser(

---
base-commit: 09df3e534c4f38a033c514d7567006ed35cc34df
change-id: 20260828-fix-kernel-cve-ca47e7d2ffc3

Best regards,
--  
Hiago


