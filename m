Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B5C624D0
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 19:31:10 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3260.1788291069184569845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=WI2jjPCJ;
 spf=pass (domain: baylibre.com, ip: 74.125.224.52, mailfrom: hfranco@baylibre.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66f7f62e915so349387d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788291068; x=1788895868; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ts2yjj8+SvATXjhHp7HGE4GHt4bKfhYRVLAiu8vXTBA=;
        b=WI2jjPCJgqZMBi0KjAaeB2R9v9epA6kuQUOIBwgb+BxJqVa8ypcAruex49BViTzjxY
         wUVtbjUt+WO636AGZfViepEQtalmF3eMkopq3/ruPUM7/zTBC3x+yVbqonKuQhuVy97m
         2TKuHRDyIyNgMTWNRXfUXIpqe1DlH6iaLZqcj+Lrcgk6O7x7hYjg0lY2+8RahpFJyd/C
         yleWPUZvxh3elhrzzmeWBrrerfmx4CpG+4AN/Gt+8S2zdaWRylqIZ6UMX9gru/gAkKW0
         Xwr9Jy+xbRJ6EMhXnEOylQn9aGxp5NL90/uZ9Y7JkHpOlStDw8f7iOQZMrh/OIfqFxC8
         wi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291068; x=1788895868;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ts2yjj8+SvATXjhHp7HGE4GHt4bKfhYRVLAiu8vXTBA=;
        b=itvsh4XltCJb7G1SPD5Kux9HdCeW4NaosITxR7/+Mv1cplmgVpFmG2qFlg5jSxLHTk
         hpiMZA/m1hQ1AyVJ3DpgPNOIesrtjwZHbDE1WzIGivTItswJ0DbXFJ7wiSqpzoc+HF04
         L9/HXzwqlx6rsihY+mNIDmWghtYoVgVi8NtiiHscrAORrrfdLYQMRoajQUmq4ABcBNM0
         kTwjRg5d/xjyAY6O1jCzQlL4XOarU1InAmu5Mad3cYAOttIgU5GOAdUXeF5+J5kPN65B
         GSVAYL0FoengvmwXlB1wxKQQqsu5L4tf2wOrKesa8z7zaQ/hQELHOy5dCIIvD2Se7sYS
         zHWQ==
X-Gm-Message-State: AFuF++n4I02c619GXm7CBBG95PuGqJjQR5LhqMiFSxudoeKfSRUWA8dD
	9jX/ywfxekinUqhQw0OwwajfQCMSplDmC7Ttbd8JuCctKZTEsEF9aYTVu5EWgGLEkO/DWrQONid
	dPOTt
X-Gm-Gg: AYBFou0YNaRs498qQaeZsl8gcVEKU0pDOV7M+rM9Bt8K1nsEabYID6yDa752u4IIU98
	eyws0odZHwyRFg7DLJIVpswzuwNAdpI0A+FdNZJ5UVr2QBSG+T3LCllUMtjTuB1MktEi7zPIuRH
	KAAQN8VVofKyiWcHuwwoUZM4bwmlQ6FaQYSlkg4yV3Fti5BemjDdiiim31InGhe7OuuLZP0fM5b
	KBSxjY9IgSXgxwTPbl5quuk7QZ+G26+L4+l7k2oVBrTPDZrc64Xc22XWmqJuBUrilTQIOKEDlg9
	UFOSy7+dqoSkBSh6Tti5iIDDnwOXmpmKaQ1MacfjHaybbCgLKMCEnVIGm3LCNtX0quvCdocGxpc
	lz8W4/obO1nuRtC6LvHb6MBlRKQKSi28NuH1ln3W3GEBI4zfHWunpbC8gmX3By/jNy4z1fcGTvP
	zldFNa7qjZ5I3IU12re7Si4eZDST9sU6jeqBNsjyDWbj/cI8bZ7P/Ef+G3fEa7Jw0slJbR8Vjmr
	ihgrJqJHEv4k9Xu+CyYdaHjFJcy
X-Received: by 2002:a53:b542:0:b0:668:8dfd:8c7f with SMTP id 956f58d0204a3-66e4c801026mr9153441d50.43.1788291067835;
        Tue, 01 Sep 2026 12:31:07 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14c:4c5:9534::3ef6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f9850c9d7sm312760d50.1.2026.09.01.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:07 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 01 Sep 2026 16:30:36 -0300
Subject: [wrynose][PATCH] improve_kernel_cve_report: fix backported-patch
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fix-kernel-cve-wrynose-v1-1-fc42cff074c5@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MzQ6CMBAGX4Xs2U3ahmD0VQgH2n5o1RSzi6ghv
 Dv15zjJzCykkASlY7WQYE6axlzA7ioK5z6fwCkWJmdcYw7G8pBefIVk3DjM4Ke886jgffS2jm6
 ofe+pxHdBMb/jtvuxPvwFYfrc2n/W0bpu74YFvoMAAAA=
X-Change-ID: 20260901-fix-kernel-cve-wrynose-7db14d2f4bab
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244848

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
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index b386c9383a..f0e471be45 100755
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
base-commit: f7397af248e1e338929d70a910b0fbc2341528ec
change-id: 20260901-fix-kernel-cve-wrynose-7db14d2f4bab

Best regards,
--  
Hiago


