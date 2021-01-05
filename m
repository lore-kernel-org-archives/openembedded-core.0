Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.5866.1609856776653535241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pCmKWBzf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id b5so1793835pjl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O25elQXLHi3QpFWMu5FKq3IOBrxPzgXtkslpN+6c6Ts=;
        b=pCmKWBzfLozKuhx6PmYfqAiNk5oE863ZewuxEfAmIhy/LSgkYtjpzNPMW6Td2wlhjl
         tKRZMjn0gmEtrfPSwr/XCwdI4XqzRUdg/vbSZAl8dgDw7ZGdvskYjXH5j+aSFl8phQt5
         Vrdep3C41EA/gdTIRP7xydld+wnoklvzOqJfNqDd7CqCbacXLR+BcsVekOtIfJQbKmMK
         T/vOdrmyTpStaxEvf7FqbaQ1eDF5T3RZ77sGMefr4xxcK1fO0MEntrM0ih55TRxE4GSV
         +3Zgak3s/lM5zCNm1voODkPcJmplcblibApqCWUX0Ng3cgiTAdLUrrhY+PMbX/36vmFp
         IaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O25elQXLHi3QpFWMu5FKq3IOBrxPzgXtkslpN+6c6Ts=;
        b=ET/i3XEzjWBQs0LVhfDnwZNTGnECFPAqXn4cTq4G9p0nbyQ1cK9XMonoGH44RS+kNQ
         lVXPGRJsrNA/Gny5MD1jrmuDecMVLWApjCBQ4VbhTVjKsvewH1hqjdQeJs2JyFZm/CTU
         M09VVdCveLHdRfhjdROm15k9IEAgohyfGYKWzGRvg+XGs3cNJW7qqFfxcMjs5C8ox2HK
         N2CDpx3qwNnMlKHQOygIGgTa5JLpr9m2AfwyPciDDwzPkz5XM2wAx0jy+dM6m/NpB5SX
         9N0zj3R5blSxaZSaPvF7M8j1RhfkNwk9JCNeOgcq+V0TFiOtNStg9Wn13gnqmWza55WD
         OQFQ==
X-Gm-Message-State: AOAM531pL2E1xOB/BXiWyboRv+jcVdTW/PFG+7ahgAnTOqsy6TgZXREU
	bfsmU3PzJ+qxFIqlAOk65x21TrBk4L8vNZvuFhg=
X-Google-Smtp-Source: ABdhPJwPq3zXmZC8qWEKPIGQKx/iiOfxr/fMXpWMiYl7ld49OAs2110sVbts08U+0tPeEfoR3G2kpw==
X-Received: by 2002:a17:90a:e551:: with SMTP id ei17mr4214470pjb.187.1609856775825;
        Tue, 05 Jan 2021 06:26:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/30] grub: Further reproducibility fix
Date: Tue,  5 Jan 2021 04:23:48 -1000
Message-Id: <0071fbd646208357e4f9117a6ce7653a8f30f301.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix the ordering in the generated unidata.c file to aid reproducibility.

[YOCTO #14167]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d9c9f7604fd32ef926726a46ae053bbab6ccb4f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/files/determinism.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-bsp/grub/files/determinism.patch b/meta/recipes-bsp/grub/files/determinism.patch
index fac80e7b54..3c1f562c71 100644
--- a/meta/recipes-bsp/grub/files/determinism.patch
+++ b/meta/recipes-bsp/grub/files/determinism.patch
@@ -8,6 +8,9 @@ Also, the output of the SOURCES lines in grub-core/Makefile.core.am, generated
 from grub-core/Makefile.core.def with gentpl.py is not deterministic due to
 missing sorting of the list used to generate it. Add such a sort.
 
+Also ensure the generated unidata.c file is deterministic by sorting the
+keys of the dict.
+
 Upstream-Status: Pending
 Richard Purdie <richard.purdie@linuxfoundation.org>
 
@@ -38,3 +41,16 @@ Index: grub-2.04/gentpl.py
      return ''.join(r)
  
  def platform_conditional(platform, closure):
+Index: grub-2.04/util/import_unicode.py
+===================================================================
+--- grub-2.04.orig/util/import_unicode.py
++++ grub-2.04/util/import_unicode.py
+@@ -174,7 +174,7 @@ infile.close ()
+ 
+ outfile.write ("struct grub_unicode_arabic_shape grub_unicode_arabic_shapes[] = {\n ")
+ 
+-for x in arabicsubst:
++for x in sorted(arabicsubst):
+     try:
+         if arabicsubst[x]['join'] == "DUAL":
+             outfile.write ("{0x%x, 0x%x, 0x%x, 0x%x, 0x%x},\n " % (arabicsubst[x][0], arabicsubst[x][1], arabicsubst[x][2], arabicsubst[x][3], arabicsubst[x][4]))
-- 
2.17.1

