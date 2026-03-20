Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A211090252
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2624.1773966513023505015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q7PzMTHC;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so671055e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966511; x=1774571311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orXkvDVc17+ZJFfXn3xd6Wb8qQRjC4r3GGADA0O0z/U=;
        b=q7PzMTHCJL7Z7fSq46Kq2Z1hiq/X6RvMyBZ0rkBGkxqy3PrmfOlp5+xdGg3qO0lcEA
         STk9iNSwrB5POIBcjtz5Jvmsq3nYPL8I87rRAK9JgNVuZu9UV6ZWAzYNsU6lf/B92TuV
         M53N1928jQ1IUxBUsxJmw/QeBK1xqjsRkt2FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966511; x=1774571311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=orXkvDVc17+ZJFfXn3xd6Wb8qQRjC4r3GGADA0O0z/U=;
        b=SKrtzVVT5z9FkN4Wl0OOdFxzzDD+yv6CHN5naMEHR8KpPJXG0NXnapZeCQWf+VU6aV
         e8OygrVHlY9Q7sP0MjVEIlQ3mEPYhWdeoRQoMavRJs6/rfheq8DTTlBdraCsREr0CkXK
         CTEH9tS0QYHULJI+IfqZoVSS/8n4Xi2PMV+j+ix+JOCjKKLSxoPEJLYQOYPSLGYengF/
         6TLn4X/2qmxE3XuxaGhoJnoozXI6eY1RN4UDWGnyy7ssACLZ9MVohbMy+AxtFDPwLIRs
         ioQzrZBcASShGn3cG5Nfxmtu8XMd43gc9A+hkK95pLX4ld77ZlLY73TSOqL6bRgF1ZsG
         yhrg==
X-Gm-Message-State: AOJu0YwGqBBW7KvieAqyZ/dNSg/BMIygz5KZz0onS6wRi9PBmQiJAj55
	vqKzmo15mhtrGG8RktXHYJSGmtblr5lEZSwxVD9mqk7vTg1zmmHS2D8dvwR98LvO5knWQwCwrky
	d7Qff
X-Gm-Gg: ATEYQzx1THojzLFf4VlcRuwX1RB+XjUVW5bteufRp/8lIWAMCq/u8TEUfhGdjZ2Zhfi
	m9qrt3QXsAFl6lxX+nkSbA6W57vbDrozePW8drSuProyCJxsxThubaCzGTONPb7MuOM68P2q02t
	7rEu2GxYhySTWMy13CFsZ1zBQPjKWNeMuh011ZGnrm2SZjxRCulwEabTrH430fMxa0tkzhKEgnX
	ojsq7s62488lP75bRP4WaSBhbXvnQLxU2SQV7lOYwI1WIjYj8BsU5rB8VKldattY/SLUpinimjH
	pDXXf4VjfCCV062tAGYuuhi/e7l7kenY+hmNmOrNr7d4kntmCUZL23nWm3u4NTJCa7YppG5+wJp
	KoDspOBQ26GGOWu/Y8FphixiEw0R6FbJ/rWk8fWgyjPkbB++YFDR4OOSDD1UL4fkbU9WfvNORdN
	bJ1G3/7FjNSJWLSWC+i8zd/6vMK5SmFBdwBidnzF8ShLjWCS/m3pFAq2GBv/w23vMcvo50/bwdS
	qPvDeiPKfOxtDl9jft9fszfgKM=
X-Received: by 2002:a05:600c:3b07:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486fedab40emr13888205e9.6.1773966511032;
        Thu, 19 Mar 2026 17:28:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/15] improve_kernel_cve_report: do not use custom version
Date: Fri, 20 Mar 2026 01:28:13 +0100
Message-ID: <caa804f222fcf710895e687b042bad677e1001cf.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233567

From: Daniel Turull <daniel.turull@ericsson.com>

When using the version specified in cve-summary.json, we need to
remove the suffix containing the custom version to match the
versions from the CVEs.

This patch truncates the version from cve-summary.json to use only
the base version of the kernel.

This is only applicable for kernels where the user has added their
own version.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3942d40e96989268e8d1030f9d8c3859044d9635)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index a81aa0ff943..5c39df05a5a 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -445,10 +445,12 @@ def main():
                 is_kernel=True
         if not is_kernel:
             continue
-
+        # We remove custom versions after -
+        upstream_version = Version(pkg["version"].split("-")[0])
+        logging.info("Checking kernel %s", upstream_version)
         kernel_cves = get_kernel_cves(args.datadir,
                                       compiled_files,
-                                      Version(pkg["version"]))
+                                      upstream_version)
         logging.info("Total kernel cves from kernel CNA: %s", len(kernel_cves))
         cves = {issue["id"]: issue for issue in pkg["issue"]}
         logging.info("Total kernel before processing cves: %s", len(cves))

