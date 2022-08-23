Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7C1C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.4509.1661294181689775320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kKV9jEOY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id r69so13469232pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=zLtitkJKXhSH+dDOveUGyQ0nPohExkL4XLDNr4YQR9Y=;
        b=kKV9jEOYrDnEHnidWHMIoXoPOEJvrEQaU2GF+kEG9DJes12xvlfKj9Mf/mkGleWMkg
         m7OA/q3d+482SoELXrZO6p30SBw6cHRL997S7M1f++V1z57fbKe7wSegzaSivxlhqGhQ
         jC5b3oo+azyE6TVx54QOPp7ctfpnW+pZWenj1A9DGnqn+6HL4l5Foe9kDPLIE/jKMB+r
         qALqJ1g0Vt6ARFX2pfWegBtZmu9i5DRm81z2y386okrNR5C9LN2w5SAl6G9zfwVYvs+v
         B8cm52wVTsamdSBiLuywpQ6mX9f//g2iepLP1TTdZUF0UxyqSeZ0tAgSHiwgaZUVt11v
         //XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=zLtitkJKXhSH+dDOveUGyQ0nPohExkL4XLDNr4YQR9Y=;
        b=hh0jkrhrIztiHXUWXwCXGhZgIhPxjiFVelhd1IFBJEoB3Rp4K9P2gHD7xMKe8MMHhI
         odSQyi2a0/Sz4fBiRS1fGb/PkNjtvtjNU3Fixm+P4JAgQs0ms0JfliCcpYfYyBBTZUho
         K+AbEt4DydmLVyS4rGD3PZSXK3Tx133Q7U4bmQAjjPmPeD3hPKe3scoEx6zaquO0uaK8
         npuYmT8y3Da+ZX91ErxQUSdyav/oJwPImVChpREdwMPXLnGMKQ0IEN0Q6XwPifhnPT3o
         XbZJaDvKr5pBsj7iZL4s6ILMERPzeSbIECe/8QJSp8uL0pFq1wy2XkuuYdeuy644J34R
         o2qg==
X-Gm-Message-State: ACgBeo0lZtfb8XQOTTooBKtKlXBF0AcnWGyHF9C/cwQ9dccKHenFZ5AV
	lF63mGcEhnz6fWRJpAqLX51uFs1XSBaM4Ix4
X-Google-Smtp-Source: 
 AA6agR59XWdkkcoYD07NzkJmqgpDKKm0mfv52oDp9j5dYEOyKLfmO2pRSmFeq+IPTA+Mq7VjSjJFVA==
X-Received: by 2002:a05:6a00:1a91:b0:52f:29e7:c32c with SMTP id
 e17-20020a056a001a9100b0052f29e7c32cmr27468537pfv.10.1661294205032;
        Tue, 23 Aug 2022 15:36:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/28] create-spdx: handle links to inaccessible
 locations
Date: Tue, 23 Aug 2022 12:35:39 -1000
Message-Id: 
 <9661656987e547290cecb94cbf9b34335ae9d903.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169759

From: Peter Marko <peter.marko@siemens.com>

When a link is pointing to location inaccessible to build user (e.g. "/root/something"),
filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
Fix this by first checking if it is a link.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e105befbe4ee0d85e94c2048a744f0373e2dbcdf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index ae484328fb..d735f20c20 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -210,7 +210,7 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
             filepath = Path(subdir) / file
             filename = str(filepath.relative_to(topdir))
 
-            if filepath.is_file() and not filepath.is_symlink():
+            if not filepath.is_symlink() and filepath.is_file():
                 spdx_file = oe.spdx.SPDXFile()
                 spdx_file.SPDXID = get_spdxid(file_counter)
                 for t in get_types(filepath):
-- 
2.25.1


