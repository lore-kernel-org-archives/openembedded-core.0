Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D9AC98310
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:45 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2825.1790154704437413649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rK5DccH/;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2174715e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154703; x=1790759503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ERdyuwfWxXAt5hzGKW33Sn540WPLwfT/SY/IPEqWssU=;
        b=rK5DccH/46nwytrB9xkMc87KKkF/aE79Jq9uVSbGDQrBzXKPPXDWPMGYtgZ5L0z56I
         +zFyRwOBnB7UzDv0keQx9Ukxzb4NOTmilX9SZ1eye4lMW8dMrMVsXZoYQ4bvZVpbtKfm
         dz3nUW1VEimgB5HydYZvfB+f++MwnyIjtMCEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154703; x=1790759503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ERdyuwfWxXAt5hzGKW33Sn540WPLwfT/SY/IPEqWssU=;
        b=YfYFtAtYi4ES0JePIO02cKssEwdr+vnlGdWBV0eXmyP8jgsU0XLt7aWMPPCirkXQ1L
         +GzFcHnaX6H3HuiFUkh+jjN7hIS7/3qmDvEe/Gsljvv/8EpGWGgQkmqWMW9g47Dbd3x1
         swEdYeXq6/yrW5LcObkrSPMyRjHIeFbjOFLS+AQhmp9BO+7EbrbnH9lHv6I+HXHAYcN5
         c0sPGVdWil/ryZzwry1gd1R734Q4v04/jJtxw91ByxYNZmLklTB5dIAXQcjTiGCg1pme
         nYtEEBiYdGlHCwT+m6vFgOk0fYMnUo1S5m6xcMc/y/YA0YRx5gNMJ/+jjB+VcLAR9MvC
         Losg==
X-Gm-Message-State: AFuF++lTKcnCT6+jPN9GR0onI07X8fXviMWfxiSZhbgexuFIpYqCb+TR
	rm4ciJ5t/VRmtCccDxgqPBNPHjHHpJngm+YpG0TC5RYT9A6LYbbiIHeW68ADW/wxV36bwm5w7IQ
	ewSi9YGQ=
X-Gm-Gg: AYBFou3Nb8WgVNCUbIRWrrBwijD6kUpMu4OUA/ReJhAuFLcWXj73JgrbzYA3ybQJtMc
	J3V28VzCRHxkdY8oTvFxq5YVOhcyAANWpMv3QESceo8B7TrQ0r/ZPNwUzS2YOXlFA5DbW1xt9mF
	4SJ5Nde/+msH8KJfqXsUBspnbsqjvFd2nrh4zySLJCmRDbKmPppSj5THvpoE6aVAUGx6P9y2QIe
	15X6UV6kFFV1oRbiYnEt4m2/7Px0aqKcrxutTclUb4N688+A9UvlL5Hy92MurZK8FQBCfwYY4i1
	bdbpkfwYX5GBP6q3Jq0slEEGX1lbnSxlot8qTNuUZoKwqV9uU8KZyqew9oYYxXC7Avy4tx0151D
	ZM8YQDVdPSHuR4cyVMlEpK5UW2/kCt0/huMvjWGJ5/baduqTwRwfubNgfKK5fOgwgeVzHhttbgs
	zgDnBqT1CP8giQL5sJe1h0hE4PMlocMsZ5vR86Rbk+1bYukEdTVeF1R5/BVJCEiDfSqDrRKX5WT
	yIN7rH5yR566D69vYItnqkfAfgMEnC1XRk3cCoeyo1R1ZgG8RrvEJlf/KmJCquXyNSZBZom
X-Received: by 2002:a05:600c:c176:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fde49755dmr28698115e9.12.1790154702718;
        Wed, 23 Sep 2026 02:11:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/48] improve_kernel_cve_report: fix backported-patch check
Date: Wed, 23 Sep 2026 11:10:25 +0200
Message-ID: <ff8709c6ea17ef64e660c12f225c839865b3facb.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246485

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

AI-Generated: Uses Claude (claude-opus-5)
Fixes: 80ff4903ea1b ("improve_kernel_cve_report: validate that cve details field exists")
Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5da16b0d3c8f889dab061ba1d8808aba95d4c67)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index dc961d59389..dd59d93146f 100755
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

