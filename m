Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C6AC88E56
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:24:31 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39258.1789133069643898547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ZR9VFQJR;
 spf=pass (domain: baylibre.com, ip: 209.85.222.42, mailfrom: hfranco@baylibre.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so327963241.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789133068; x=1789737868; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikBCgHOTbpg+EwUDxrkPkAalk+JdRA64i6HIQcvH2ds=;
        b=ZR9VFQJRgg4bUaM6ju1zNqJLPKsPVMo7z5moNXFlVbd77Bkf4N7Uzj8wE8tCZUry3W
         ca8zebDE8PY1tHea1LprW7vYKMXFeq30ZqoyxejzSztzXySrb6WFF+GpKp7g/tmjAFNV
         Ah58TTNFYTkzoCQMYKaGeIabaz+quikCUVUHA3O1Zwy55k9DFzYH40h7Z34tEJb3MaHH
         20s7WKAZVJFCn3euoZQ2cvlqkoEBsndCL+/mqrioZPBdEeGfaLszdWvSLV1kOXKgNU+o
         sgwe7Xql1YfohKz/+j0B1KA4UWSbQu2c8Hg5LQAKYm1Y483RK5y0pYpVR+dne9r/NT/9
         LP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133068; x=1789737868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikBCgHOTbpg+EwUDxrkPkAalk+JdRA64i6HIQcvH2ds=;
        b=Y+AEgkVzhflPNy0Pz8j47961Q2+E+iDGyg7S09WEQ2mg7DHQSFYxh7SDfOGaD86kTE
         HP3NFe5NBLOWGCalUUoYTAW4lTVK6R5j2ORF8njNor872Vgt6NQ2tgLrZ2Qm3fYWJYO3
         66Vru6D3qOgammyhOv90pcJZSVwGItKETo9K0pIQAFdx7ajRoyYDNHysjqFC194kCPRC
         2XCdWxcw2ypUDHKEOMSe23aqDwOyz2Ux2mzha1Mko44em5vqlrFPvbdyngcRAaTc96/3
         1zKtr6Dr6lLbcKQCVZqmhmKJmsuqy2lqFGiNSrtm0qghR9czWU89MaWx7xdUQkXEx83U
         p4pw==
X-Gm-Message-State: AFuF++ny658Bj9yHbypglMgcFcReBq/KPnfYNj1lSkCJpacdD01d7vXO
	QiqNyka9Ncy/HSCUfh2PM23IjvdWPbQIUXEW6D9mPmTcfsNQK99GQWh2Owv4ePZjzMySw35CBc4
	SjVM3
X-Gm-Gg: AYBFou3ZsHkyay0ldrqXLCCee3tqcsl8SqAxESbULIcz7TNNyIytJakf2aSyjimSBeT
	qW3dkZLCDPyrIs6UvmMoaN0FDdkkBBaOYr14IWzQ+3dIM84esfm/VhF20Nd+NHGN1pfde2LWOTO
	4K2Q2nE43hOHXYfFnJ2j24QbsYSUzMQNyuj6EOkuUDgmwIYJwCQRB1CBmhc+v7xI6GwWtxSJAnK
	ncfADYYbqXaISZlayHjy/vmQZUQEPquSAVhISpE6ce/LrUN6hDcz/sGX55TV0kYD8jIFhHqhLeo
	osu18a8K8egIL0JvsfL21l6lTdFB+lZbFEmKTLaZUUfXpbd303i+9YY+U/alHbjadeKgyOjVvaN
	EA5YZVq+Wrq29kkexT5aPhKtHaqxuQMt0HUM/hd/rWaxjf5GR3WP0kJnfUv3CGiJM3KF5IIA6UX
	gD3qGWroR5qtP/PPj39G0H6qpXi3dDvuhPKvvk0MHw2/takGh05hn3vSouTtFAnoMz1WbjB3krh
	S1VsFS9ZD9GKIo7Ho4Wrdmi9XKI5UuRRXlef58=
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5572023e0c.2.1789133063675;
        Fri, 11 Sep 2026 06:24:23 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::7f1c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470add08sm2596621e0c.3.2026.09.11.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:24:23 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Fri, 11 Sep 2026 10:23:46 -0300
Subject: [scarthgap][PATCH 2/2] improve_kernel_cve_report: fix
 backported-patch check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-fix-cve-scarth-cherry-v1-2-c9d04f8c9b08@baylibre.com>
References: <20260911-fix-cve-scarth-cherry-v1-0-c9d04f8c9b08@baylibre.com>
In-Reply-To: <20260911-fix-cve-scarth-cherry-v1-0-c9d04f8c9b08@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245647

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5da16b0d3c8f889dab061ba1d8808aba95d4c67)
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index dc961d5938..dd59d93146 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -362,7 +362,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
         # has priority over unpatch from CNA
-        if "detail" in cve_data and cve_data[cve]['detail'] == "backported-patch":
+        if cve_data[cve].get('detail') == "backported-patch":
             return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)
@@ -381,7 +381,7 @@ def cve_update(cve_data, cve, entry):
         logging.debug("CVE entry %s updated from Unpatched to Ignored", cve)
         return
     logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s",
-        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['status'], entry['detail'])
+        cve, cve_data[cve]['status'], cve_data[cve].get('detail'),  entry['status'], entry['detail'])
 
 def main():
     parser = argparse.ArgumentParser(

-- 
2.53.0


