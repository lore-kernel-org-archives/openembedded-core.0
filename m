Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A62C87FCE
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.5116.1753392945756581694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OhChhZwi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1058411b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392945; x=1753997745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeKfLn/Ai9KqNq9TKY4D1m/M1h95WFGX1eKLuy/Fb5I=;
        b=OhChhZwi78gk2PR3E0UN5p1Muc8yCZKW0TODF3JO1tRAfGBU1b9Noh0zl2D4G/u1aw
         biFGlM1zzKRKfjuIQSXoO6GvtqcuRnzvgsyMnLRoQY6Ge/eIHyXyq4mWRn3Ij5bzJn1n
         zqXf09um+/2P94hbx7uDC5RFxMN+vHuAlsuaRVy3A3pJ0oGy9D9neLwK2x1fXG7sUDTW
         wnRFsZRMNrk47xABMkxRMvPpvm/fsNhwWYkeTF0FP/i4AGd7/AjKvsITGBa5uyTDo6Ar
         OR1FxByk7wGM3wxQldz/AeyFDrAYwnE9DAYuPUYM9/xLeKy2M76WBbMDyZhsjVpaaMDv
         NLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392945; x=1753997745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeKfLn/Ai9KqNq9TKY4D1m/M1h95WFGX1eKLuy/Fb5I=;
        b=XRNpon56PkuulANwrOLVlVHpAQp5FAgtIpsD0P3iaEPCgiNQwzsXkcg6Knj/W+xagz
         tnFH1FJDB6Y72hxR79TLFIxyl7XsXlj1/UNGf894vBnpSPu5VrIS8C0FgV+ukzWuE/m8
         svg4HLOir07qk1+APvwq2lxxmWI+LT8QWr+iPQXBKzsYVF+mxK6dJIikX/ptrz9+T8dj
         Fdh1n8F+JS4l0w5LuWlw+2+gberbmLourrgQmqFrTC/fyQUYTCYe/2snKEm6L3I5KWbv
         nifwRrEDtTj3lOzankFiMNT5+S6QZj2kaHxUBc+Zskkh6Ck9ZTIomo1kCceu06i+kJRB
         Hc4Q==
X-Gm-Message-State: AOJu0YwiH4CAxwxpSvyWGaMHB9rTvI4UNn35CQcXFIA3yPS1v4PD/ZXP
	J0uDvwOcPngwFgk2HdKyOaJjhhkCfFMQ2XqGMIY3zYWhxFDNXwKL4s/7OPp0QgxX00s0VOXJe+h
	Rw28A
X-Gm-Gg: ASbGncsWnq+h6RYWdqsERZQ418Kwsj4tJcdLyg4n0Ju2Bl0bIAnNa6dMeVd8yzMocd3
	w/n8ABM30F5nYH/Fe2j+6istwIxKrEaDXiLHIb58TtW2ZoBsD+0Vmppjo2pOhGKrpBJzbQk3+nN
	w8OYPSKYkUMbiadTmyulAz3GVvZWdhvhcZWFCGjOmPmgpICK4T5VrtfH+X7tSrpVvPIF6hQxqFP
	00ymM7R7kz3dPDA6Ks9v4ulGWBta910ut2mG0KQE8Efv/cMNz74bkMDzV20osu3ZjwUV6tJi8oV
	HIwW0D3fYOncynEurerjbNADTdg/pE/UmkHImeg4cmZOjHFjuupTCYydTioJ8sLuMAFBX9trzgu
	rz5o6TM9gmFoL
X-Google-Smtp-Source: AGHT+IFH+pp7MetT8aAHO4hciMG3tpDlQFKrRL20NDRFenKIy5+W5rW2hlASCTOzB5DE+YVivAB2mQ==
X-Received: by 2002:a05:6a00:188e:b0:758:b81:603a with SMTP id d2e1a72fcca58-76034c002d2mr11688956b3a.2.1753392944868;
        Thu, 24 Jul 2025 14:35:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/16] binutils: Fix CVE-2025-7545
Date: Thu, 24 Jul 2025 14:35:19 -0700
Message-ID: <5c0c7058484fd8b1a82c2c810f7bccf016ea482b.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220876

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

objcopy: Don't extend the output section size
Since the output section contents are copied from the input, don't
extend the output section size beyond the input section size.

Backport a patch from upstream to fix CVE-2025-7545
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  4 ++
 .../binutils/0023-CVE-2025-7545.patch         | 39 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index a3ad655dbe..9aa3096b4f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -53,6 +53,10 @@ SRC_URI = "\
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
      file://0022-CVE-2025-5244.patch \
+<<<<<<< HEAD
      file://0023-CVE-2025-7546.patch \
+=======
+     file://0023-CVE-2025-7545.patch \
+>>>>>>> binutils: Fix CVE-2025-7545
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
new file mode 100644
index 0000000000..de132f74fc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
@@ -0,0 +1,39 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 21 Jun 2025 06:36:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
+CVE: CVE-2025-7545
+
+Since the output section contents are copied from the input, don't
+extend the output section size beyond the input section size.
+
+	PR binutils/33049
+	* objcopy.c (copy_section): Don't extend the output section
+	size beyond the input section size.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/objcopy.c b/binutils/objcopy.c
+index a85d2620..18cd1bfd 100644
+--- a/binutils/objcopy.c
++++ b/binutils/objcopy.c
+@@ -4547,6 +4547,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	  char *to = (char *) memhunk;
+ 	  char *end = (char *) memhunk + size;
+ 	  int i;
++	  bfd_size_type memhunk_size = size;
+ 
+ 	  /* If the section address is not exactly divisible by the interleave,
+ 	     then we must bias the from address.  If the copy_byte is less than
+@@ -4566,6 +4567,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *obfdarg)
+ 	      }
+ 
+ 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
++
++         /* Don't extend the output section size.  */
++         if (size > memhunk_size)
++           size = memhunk_size;
++	  
+ 	  osection->lma /= interleave;
+ 	  if (copy_byte < extra)
+ 	    osection->lma++;
-- 
2.43.0


