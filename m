Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B9BC79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6324.1788939006705575568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ndRyPrlE;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so659103f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939005; x=1789543805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bbArBX4HetqxVJjoJY154xuSgKYocpRWjv4fOr1V2M4=;
        b=ndRyPrlEQbCIOwsHIs/OJMjqqO3VKWtOvkLIrXI6hfs9M3RBrE2kGA8KtN1b0VGE0o
         S92/xEtcVyyB8Ia42+ll6M8Fh2T0vOsVaa5Vxepopli55wjlNAUbg0Ffm3EkjFS5Bf13
         wXF2N/XTrk6J3jvfnmqVO3dPekKTA2HHBez8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939005; x=1789543805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bbArBX4HetqxVJjoJY154xuSgKYocpRWjv4fOr1V2M4=;
        b=ZAXTXn6qefFMwFJUF5eN1tMKuvtMPh+H2xrIPMj4vC//s+gu1cJXOuilGTKlbT3GLC
         S8cYKqv4oRJSCuDOop7aUOBHLvAbDhDwu50i7Y03m2G6CgZ4ueTKEjn2UQCyOSzIRxVV
         RD0BbHqVEaJ0Q9CoWaFMaMAlb3cEY8xV+rDQXKAs9zmE0zzyvdSZ4lfUkMm/ny+nA7Ti
         7VbRlq1vHV9W9hV68JW6wFbth/LmMjQDZG1TjylcHiPZ/Ta4uGEznav5wkAhIbvtJOV4
         W1x9onVxv5Xtme55kVdcWTPTuXSjtHM5ZxlxtoTlHkbEV8zrEFibAuC66vHVZH+WKbHU
         BXwg==
X-Gm-Message-State: AFuF++kx4UlPHMu8LnuMeCufPEx9yg7bHDXziMNvjoxJN8amvobyflPn
	AAlpNqtJbozzleGuwkCQPh6+eqXQ0V38vVk4JfTP6cP/VlVhrvTznc5gupjHVNLgLrBfUmp9Vu8
	PxvvUb8M=
X-Gm-Gg: AYBFou3l6dNZ45iUamUaIcHBO+tv3hzjTBUN0HMoxhXj/Sxcd8dNuJk4szTVmn+4HLO
	IkVJdogFlJe6y7E1SAw52dzJkrU2FGtsB3YLBp/VmkAa760xwSaWBo/Lv2vML7ratVrJyLQJUo9
	ehB9hJKzDHG6OKuItbJJFaxTy25EnjDL0/fEF3ou+UF9Bx0nz41YImNJ96w3K1le/HWJT0A8o6X
	knIfscwVnTU4ma2z+2irodzXkR4hP97sjhw42/XADrcntzY6ipjU7Qu/EXG1SIgN6XkYMdBZoOC
	VyCYlnTI/UC4vJlPI+jjTSkJEHawtuUtBkdm3cI3SPC6SsfTWQcfIedI6J3Di4et2F35crlCfKn
	Sl/c+5ya1as8/3bsxyKoPjgOTiuSzZlhaCxDd7SB5AS5KcHs0vJ/oh5J+J6a6YQW3e5kjukpfrC
	nImcpI7POCJLuoa6hAjspw9GWiHDfcCsbo+UFbtm9fK08si3RJhd3xY4iPMm1Dbn5FkC96WP5qF
	rZ3yPIjoosWQFl0WOFbFGqy9WY7icRcHGBGbthge4tLp9KCkr75i1nJNwNwXAn3JQ54hCB7+qk=
X-Received: by 2002:adf:e007:0:10b0:484:42d7:50fe with SMTP id ffacd0b85a97d-485a23c686amr10005417f8f.4.1788939004863;
        Wed, 09 Sep 2026 00:30:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/38] improve_kernel_cve_report: fix backported-patch check
Date: Wed,  9 Sep 2026 09:29:17 +0200
Message-ID: <d77fb5d4e6e8a1c956b16f00005337faf5068ebb.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245427

From: Hiago De Franco <hfranco@baylibre.com>

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

(cherry picked from commit f5da16b0d3c8f889dab061ba1d8808aba95d4c67)

AI-Generated: Uses Claude (claude-opus-5)
Fixes: 80ff4903ea1b ("improve_kernel_cve_report: validate that cve details field exists")
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index b386c9383a7..f0e471be459 100755
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

