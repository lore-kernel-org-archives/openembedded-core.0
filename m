Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F08C5DF67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:44 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21621.1786634557066563205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0Dl5obdo;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1568263f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634555; x=1787239355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PnjXWgKuyINB6iWMQFf7SpFbBIxTD0IjEWmMCEkIjpo=;
        b=0Dl5obdoUfhmHhcxq67VYIqpwsXdKddWF7zjVzrluFH8dWN+XvRdLIvKDX10SAhVAX
         uDnDGifgzq0hbw0oPTNpVN4fMYHO4TO4PRGlRfCA7vxfHCHDeVZb9edwPdD9ZjYNgDs2
         2j9/xJ+kXJUTydJTYcUyQMHRNY8V+qvgqvTwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634555; x=1787239355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PnjXWgKuyINB6iWMQFf7SpFbBIxTD0IjEWmMCEkIjpo=;
        b=T6W9eknFuYseyJablIHo74VC0gOrscB6+wk4O8fy1IsAfc2ybCSo/XtCA5fJl4Ir+r
         1Trfha0tleS407X1HLe6pNBQ4hQcwi7d24z7QwG9ji+a37DipvjHltlN7/wSvVxAJaKp
         LrT0FnUb/x5/iPNvKlpjOvK5PplRnY0n0H/59HhmxYWWQkiTN55FArcx7fi0iTyG+q+9
         +Oa6AxYVtuWmMGxEn7VHA2Pwxg3ZAPoUwqgzAedNCwXzXebEA+3RF+mQrQ4OzSaob6Mp
         zHIIa+2uY6cP/pWo+w0HYQNGkI5eG935tKnR84DHPyocQy98n57Ss8z9H+E1TSxgA/+Y
         HcAA==
X-Gm-Message-State: AOJu0YzJypaHoxBbhVZ/9i70MNwKhMid/TSt/ICg1Rc9TdvR9lwz6E1c
	QL7Df8MiF1D9xhxlM6K4IUZ5VUIu9KOadSQAVSbQYDX/qN2dJdwcWyPZST1B4E5mBj3iqTUCiOJ
	omvu8VsTt1w==
X-Gm-Gg: AR+sD10vLKvuVFuqITHXyi4QiY+1s43siKDpG19jXtL0XK8DR4IB9cAJC6kJ4uMzkxR
	i0cs8LcsQJm5cinUYIkI6Tftb0F956P+nRsS41Wp3vGL7QvF+wzVU182QShSywyBnqQ1FV5oR2l
	zceiVrbp1bk5nD8J/qWgXIKDhH3oeqWhciArsqTvNHiwNQwGPvwCboBqghWsX5UUD9mM34tRo+K
	JJZS56ZRVBBN3B+clGLux0FD2nuQ6gB/wfpv5Tgrcwe2rPZuAkfGra/7PiYSOJozN8C8vYgjwZ5
	BZ7qWCuSZZD7voMJOzse3R9nu5klvn2tkEh2aqv3J77XmFfbcgPiWvYkaqNTcPr7Y5lhtBII1ZO
	32Yyj3/HJDdeh69ZwuS9iuJJNYnR+TQCoSt2C8go6Hi25Ajx0SjtRfD2FmLmASu+vYrJjUeCt2Q
	dHY8SQm+WMkzo+y+YfVY0OaN7vLGerkz8Xa6fZQfuBOkHh+fBj78DNiU/JwZbdJGihNspjrGw01
	DHvbI5EGBzPfRIHoiUY0DUowRAMySNJMoFNRtIcfQmNbRPkZ8rONPlNFjxB8aepTXMEk5pYcTow
	8HJVkuAH79OjSH9XLuJVgxb2HkxoeyDPbMyHn/Ob
X-Received: by 2002:a05:6000:25fc:b0:47f:9759:7f0e with SMTP id ffacd0b85a97d-48159ee41c9mr10742688f8f.7.1786634555203;
        Thu, 13 Aug 2026 08:22:35 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:34 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/17] kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
Date: Thu, 13 Aug 2026 17:22:05 +0200
Message-ID: <e4c6961ce0ffeff67d7a1d2dfb4b71bf2a647c87.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243372

From: Marek Vasut <marek.vasut@mailbox.org>

In the case KERNEL_DTBVENDORED = "1" , the fitImage configuration
subnode names used to contain the vendor prefix in OE 5.0 , e.g.:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-freescale_imx8mn-board.dtb)
                       ^^^^^^^^^^
...
"

With OE 6.0 this is no longer the case and KERNEL_DTBVENDORED = "1"
and KERNEL_DTBVENDORED = "0" behave exactly the same way:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-imx8mn-board.dtb)
...
"

Users depend on the correct configuration subnode names as those
are used in the U-Boot "bootm" command when booting fitImages.

Fix this by converting each entry in the KERNEL_DEVICETREE list
into the configuration subnode name by replacing all of its path
separators with underscores.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image implementation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4297b94c3728cd2e320d75b68c508e12ab127719)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ae8f3c6688..448a88ccb1 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -94,6 +94,13 @@ python do_compile() {
         for dtb in kernel_devicetree.split():
             # In deploy_dir the DTBs are without sub-directories also with KERNEL_DTBVENDORED = "1"
             dtb_name = os.path.basename(dtb)
+            # With vendored DTs, use the DT name as listed in KERNEL_DEVICETREE
+            # and replace any path separators with underscores, this behaves the
+            # same way as KERNEL_DTBVENDORED = "1" did in OE 5.0 and older.
+            if d.getVar('KERNEL_DTBVENDORED') != "1":
+                conf_name = dtb_name
+            else:
+                conf_name = dtb.replace('/', '_')
 
             # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
             if external_kernel_devicetree:
@@ -103,7 +110,7 @@ python do_compile() {
 
             # Copy the dtb or dtbo file into the FIT image assembly directory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dtb_name)
-            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+            root_node.fitimage_emit_section_dtb(conf_name, dtb_name,
                 d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_LOADADDRESS"))
 
     if external_kernel_devicetree:

