Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.35812.1607956669667677239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2MQK3QM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id w4so12536843pgg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=J8ewtVp+tV/YYc5qAZn4aZQx+S1cqAdf0ntllTRhYLI=;
        b=2MQK3QM03pitbn6cofJGSjxYHN4WXneE2BCtBn0wV3umpN6DX3kQPh9mx8UAohVbj2
         +opUdd6Rz20v/o7+bHFpWQclDpZW1zfZsulGkDoD4CkGNscHLstkfqQDaisAT/VQR13G
         GTuzCqjmCvTC8mbtgL2yS/W6szTxVuBDIec8/QsTCRNZwZoncBDXFolUJ77BL+aKA3qY
         TXUsobo14b5TlNn4nmX/TdeMEv3HeTShK0xz3ZA+gs8RhUclt6jF559U37Mdc6Rc9QmY
         jkwubuwNgUCp8mnoA4fcKOx3CB72Poi0CK45tRX8AUormfUbqchIonZla5IeXqwMQZta
         0aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=J8ewtVp+tV/YYc5qAZn4aZQx+S1cqAdf0ntllTRhYLI=;
        b=UZRA+OjEVuOL6MDp+3BXZiwfB0uusSHjEP6Nf4f4zME5QBXYi75cUo590hH1JYgDvh
         6M/RY/v0fi2YFBsjNQ/mjfuJHn7hLq5F5p0JEWtll76qcNhM6N7hCm4N2oDuuZde8l87
         vCH8/iKh+xat1q/9aaGauQ6P0+nsnwJngxkH14JxaazhGbcyh4eZX33MnNQEmDzbRVOH
         5ljOT5O+0KuteKEIhYMu0f/BKeSPyCbxvaa7KIRqtCuKZ0rbLOvTcP8DP6SN8WX3b7yY
         xaHYrJheYhtu+8CYTOX4OrHI33z9ScFjsQ1klvTtOTRbBEfrk48EJjCeghrYgRUz9n1w
         I7fg==
X-Gm-Message-State: AOAM533CHzWSIuNaaMpBDPvn6Y4wAS1whaTfPpnYYQbkGnnkIP6tSzwa
	9ODp+BmY+9/djk69ntWXt8rVMxwnhSCG1gdj
X-Google-Smtp-Source: ABdhPJw9ZIDTJPhR//ht0h2vtFVWYUSCUtgT6FEDR/xS7KSXcR636M/vwZBXSKI1vDB9F0g/JuTovQ==
X-Received: by 2002:a63:5416:: with SMTP id i22mr24342214pgb.8.1607956668839;
        Mon, 14 Dec 2020 06:37:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/25] kernel-module-split.bbclass: fix kernel modules getting marked as CONFFILES
Date: Mon, 14 Dec 2020 04:36:43 -1000
Message-Id: <f1f904ebf2aef54c4c867d5d2c842ec5d53d3c78.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Gratian Crisan <gratian.crisan@ni.com>

Yi pointed out that commit 1a70a92d1f10 ("kernel-module-split.bbclass:
identify kernel modconf files as configuration files") is
unintentionally adding the actual kernel /lib/modules .ko files to the
CONFFILES variable.

The root cause is the re-use of the 'files' variable in that commit.
Fix it by using a separate variable to keep track of the generated
module .conf files that need to be marked as configuration files.

Fixes: 1a70a92d1f10 ("kernel-module-split.bbclass: identify kernel modconf files as configuration files")
Reported-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db5f2ca532db4f0d2e05b7cb5f9d146e1dd76ab3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-module-split.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index c8ede26996..baa32e0a90 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,7 +120,10 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
-        d.setVar('CONFFILES_%s' % pkg, files)
+
+        conffiles = d.getVar('CONFFILES_%s' % pkg)
+        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
+        d.setVar('CONFFILES_%s' % pkg, conffiles)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
-- 
2.17.1

