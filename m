Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E3210FCAEA
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 21:31:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2657.1775079068402995971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 14:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/I7q14h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso1169575e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775079066; x=1775683866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pv+3ENUMYxpFyg1cbl53ql6xQ7RoBL7EbYekCFNqgS4=;
        b=T/I7q14hOUwdJ0w/+5iJ1ftWkQz+EeQ4U0Pn1u3B7uj1Z1WMPEAQSzr4TcyWqcpfxQ
         2WwUwxjuiHQ+sk041WUDxpBGzQ8GAhhtgSub0J6RGC9L4WoclVUpekMBrPl/dFChqzc4
         R1glZoNGe+oWclLk/F3Z9D3rgKVgl+r/NDXuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775079066; x=1775683866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv+3ENUMYxpFyg1cbl53ql6xQ7RoBL7EbYekCFNqgS4=;
        b=RrRuOP5b11GlrrlaeAsBrZA3U0QZwgRUbXinNcRoBqOKVz+VkPSH0rW14fXufPeDsL
         C4u1qYxYyO/zkp2G8JhtpwEhTtNEkgWLf0qMKUSumEUgQ2aE6zKXNL+WyvcSTfBM0/gj
         a0XKhQEopqmWatIIPEfTNoNQgzpMd2iKR0qIbMmEj1suWfr8u46U1Y+cT+8cgwC2cpM2
         py4VRgmQUsVTbA6ViGt9mxk2NdChVp3qnfmcuu9SFy/FUayV7N89K2toaYKBb3MQm8r5
         RyBlwETSTbeC6kUeBhXcSXpStBu7OaJ9He9xjEGrZXIugL/fR3aDJ49KkBU2y3/S3MXS
         /+Ew==
X-Gm-Message-State: AOJu0Yz9ep1ONe68mUDNpp+2xBJI0Fxk7PC8H1HastHtt3q2kgMswQJe
	0n4ItQ+aRsBSg9tyWDLWubzI8PbBqUFaaOPPGmnkT+cFdEUQDeZNPHIPzAMMoqaFJxWpqa8udvZ
	P0DnM
X-Gm-Gg: ATEYQzyWNCEZvrehCevOEVcax94OA9DmQEtFViiJKn27bCYofzVOkjNPlbvpJOfnBJV
	96MYdvv1GM4ZgEZZ3Euwff51HUTNNSHr2BZBId15Xe+KDs5uhnoc8EmLboen1RXm5t/AMWQlpck
	tQjLurY2oeK1tj6JR8BvxiHGNUeMRfk+shu/rlsaBK1QuvXtnW+t6IdC9cCYwzDCCwSCYmd4E+O
	XRj6vroOO3M1BbVhfBT48FC6dqQOXK2QldvM6YvK1D/k/B6bhBepTOMiYqha7kIJ63TmStK3tpE
	waOowRidz8sMJ4dIIW/a3bbZqfA3E2b4KntiU7P7XaUbqJKde1If6zQXpZ2Bg31+Ddy9C/l9mhS
	aYw82MgoOfRctvkpx/WX56sqtJAGLArSt7mmyVy4SmWS+paiDdMdTK/iZmf4YRPhVrKfJNOMJMd
	yLr+5NDcAkLyX5bcN0UMHhdZRE1kIS7XfKQKusnWgnCUi7f5V/0HHahySBNJ4S31s=
X-Received: by 2002:a05:600c:8903:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48883595db7mr68472455e9.21.1775079066317;
        Wed, 01 Apr 2026 14:31:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d91c:a3aa:733d:be2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e832585sm272528115e9.6.2026.04.01.14.31.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:31:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] archiver: Don't try to preserve all attributes when copying files
Date: Wed,  1 Apr 2026 22:31:04 +0100
Message-ID: <20260401213104.3109152-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 21:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234464

Similar to https://git.openembedded.org/bitbake/commit/?id=2f35dac0c821ab231459922ed98e1b2cc599ca9a
there is a problem in this code when copying from an NFS mount.

We currently use cp -p, which is a shortcut for --preserve=mode,ownership,timestamps.
We shouldn't need to preserve mode/ownership, only timestamps. Update the code
in the same way the bitbake fetcher was fixed for consistency.

This fixes build failures on OpenSUSE 16.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index d963d28f432..1f1ee45bd7a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -398,7 +398,7 @@ python do_ar_mirror() {
 
         # We now have an appropriate localpath
         bb.note('Copying source mirror')
-        cmd = 'cp -fpPRH %s %s' % (localpath, destdir)
+        cmd = 'cp --force --preserve=timestamps --no-dereference --recursive -H %s %s' % (localpath, destdir)
         subprocess.check_call(cmd, shell=True)
 }
 

