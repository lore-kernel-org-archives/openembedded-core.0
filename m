Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7249DC624D0
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 19:43:00 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3497.1788291773977035266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 12:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Do5Lk6ZM;
 spf=pass (domain: baylibre.com, ip: 209.85.128.172, mailfrom: hfranco@baylibre.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-867a943b149so6747137b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788291773; x=1788896573; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EtVB2p8cixn6m3TWKydTI3oBV3m5aURlClhpinF0GE0=;
        b=Do5Lk6ZMdmMUrrlBE+nxBS/EKM6EAI0EI3G256XasV136wU3Wxxy7IlC979I08stU6
         m52Br6jCrwF4dJ24uESwACdC6QqTJz3/9RZIA6WXZmBSNdfJmd8WLG/WobPBrF9xEw+0
         UC7JZClRQGfjfpbrivPxOdnK4Gup987idcwRuKch2QOR8IIa0J+kjLb054l3EnJP1htd
         3nptmdRNrVM+LkkidkJuJ99uI2zjg8MTh+bokiCFI/3RNR+OanZecU8prFe6+WNaJc8J
         Ijn+WVVx45i1VI57HyvOq6tH5GNVS3MIDuBTD1X6q7bhdOeR1suFcNGhe2GJlLg76drv
         TgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291773; x=1788896573;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EtVB2p8cixn6m3TWKydTI3oBV3m5aURlClhpinF0GE0=;
        b=qn94MUvNrMQkBfSlckp5N4qOk6WocM8+iKAYW5c9ARJngUWv+W/1lEQP/Ciq2y5STZ
         NYEA3rGO8Wog7EyGJYoxk/qf6XvYovredt2Vpzs8u8rCbOb58FNUR+w3npbYeLDkzYII
         GziSHZWbupDtMU28wbDJ83VkI8mb/q3FaCyC/n+AmpDgPqh7U5oRV4f/R/CFbolCtHSO
         GvemwDbY547GTNYKTMEivTnouV6AhYgkIZaYwaQnTXFGvmwxOMXKISsx+8LUKyzP5JKj
         vu1YITh14xtR2aGi74Ri5KcxEjnK4KQjwc6b3XBQgPszT+xV95LLPm9I+OMWCxKSS2+0
         Wh2w==
X-Gm-Message-State: AFuF++m/l/lWmfZ9rxA4M91sxfgT0TW6sdUNzn2tC+pFXuT2Z7k2GVAz
	Tfchm8LmfXcLUA2HFCVDZcYTQd8sQXDS2fRojEpN3UORgJGH6/1abMucoOxdamMuhMxDW46wBTz
	nHKTU
X-Gm-Gg: AYBFou1P1cq4YdiElOaTV1fQhelqt6kL+/2zynLDDS7yvUtnCXcW3kvpo7oc8yVNArL
	94GjHifYJ6iUgoM71e7xioO48Yvae2ROwiIjnmTyMUL1pDwQn1Jgk1b50nxTWe6VYAg79f7150W
	Q7AhtX4n64S3ozVqyFEWlY/Vmtfp0/4LeLsFFzaxA60zb4J1sXtD7FDdhbdq1Xf4a0+T4dbXQDo
	Ph0xlYulIN4YqT6YbGiQl56uII2+bQaWKVwTQDxieGj5zbVRWF9OMz/R28g0MInkjP26Z5EVz/G
	xeboins3tE8CxWMVcJfr44n9xhwIo+WdDxuXKT9rnTESc4JxQL0rqWNHrxzPSsyfRT1esEwRKta
	GblPGvqWI2tmpoSsp+o9favAode5wk74IxmZZLPmlynM23+Ceyd3XaROIkn9EfQjupfAg2DWDbs
	hMXpydHdvQNOU59ky/IakV3qC5uf3TpEzDNGyeRH2byySUEefe/UCq22cah09wCz0fXF7nLxYDP
	V/5FtsnjxHjgpnzFEiFX7CwtxwHiDpJ4wQr9rBX
X-Received: by 2002:a05:690c:c4e6:b0:7fe:4069:d3fe with SMTP id 00721157ae682-868747fe33emr43120927b3.30.1788291772969;
        Tue, 01 Sep 2026 12:42:52 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::3ef6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c186d64e4sm1211357b3.35.2026.09.01.12.42.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:42:52 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 01 Sep 2026 16:42:29 -0300
Subject: [scarthgap][PATCH] improve_kernel_cve_report: fix crash on entries
 without detail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fix-kernel-cve-scarthgap-v1-1-405f5d7a8957@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2MwQqDMBAFf0X23IUYg2B/RTzE9KlpSyq7KgXx3
 5ta6HFgZnZSSITStdhJsEWNr5ShvBQUJp9GcLxlJmtsbRpT8hDf/IAkPDlsYA1elmn0M7veGme
 rqoZrKOezILvnuu1+rGt/R1i+v/YfdnQcH2zZoBeHAAAA
X-Change-ID: 20260901-fix-kernel-cve-scarthgap-4b2042336e49
To: openembedded-core@lists.openembedded.org
Cc: 
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 19:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244849

When the CNA reports Unpatched and the scan reports Patched, cve_update()
reads cve_data[cve]['detail'] unguarded. cve-check only writes 'detail'
for CVEs carrying a CVE_STATUS varflag, so an entry marked Patched by an
NVD version comparison has no such key and the script aborts with
KeyError: 'detail' on ordinary cve-check output. The unhandled-update
warning below makes the same assumption.

Use .get() in both places. A missing detail falls through to the CNA
verdict, and only an explicit CVE_STATUS = "backported-patch" outranks
it, which is what the guard was added for.

Tested by calling cve_update() with a Patched entry carrying no detail:
before it raises KeyError, after it takes the CNA's Unpatched verdict,
while an entry with detail = "backported-patch" stays Patched either way.

AI-Generated: Uses Claude (claude-opus-5)
Fixes: d317e2a52bd2 ("improve_kernel_cve_report: do not override backported-patch")
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 3a15b1ed26..dd59d93146 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -362,7 +362,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
         # has priority over unpatch from CNA
-        if cve_data[cve]['detail'] == "backported-patch":
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

---
base-commit: 310eec2cb646d7d1a3ca99bad7e37495bb418a0d
change-id: 20260901-fix-kernel-cve-scarthgap-4b2042336e49

Best regards,
--  
Hiago


