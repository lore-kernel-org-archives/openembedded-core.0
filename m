Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11459C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:37:05 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.12749.1639409824290766087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YhNTTdFB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso13696749pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bvomz37jQg3XD3bvzXpILiCSiulzIdenkKshm21+YI8=;
        b=YhNTTdFB2BKPVpUmj/zapJP9qM+1xFT8upjZKWANfkYltYzIFgkaN2cPP0iEb0DEyO
         yUNMRMSew6HCI6XJWqScB5/7WzCmFeizrhMVIOi6OPa7Kbam/WgUvbqFuttgM2DiBpUm
         tnTw6nyG0SfRwhBybfDctc8TSG1+n3O5Nt38GpoEDSSnIpJMzR9ofNGiFLiF1gTYd+VW
         nD6DCRICBAapwNnMrruBxWFe4Tkphw4aTBqC8BtBb1wB8KyiANEh6OriHQisQohCQ+GF
         0mb1D1aIvzleDS2Wfb0UXnxxvnQ1tCnL/smBGWkvFXbh0mdzElT8tCDkgErPrBHwcUhy
         T+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bvomz37jQg3XD3bvzXpILiCSiulzIdenkKshm21+YI8=;
        b=PvfHeo7gu3PPplyjxWBFna/IKB4z+KR558w1xnCDGuq9tXXeGXjP1DHszoYSpsPUhO
         ZUp6YA9dRQIM5egefQzlrpWKpbTSoGVgdYKZWcMFDKKlev0N1dED5+b334e9eR9vUsnU
         UoTQacUyk1rLOvNwH0eXKLQLZlT5bG9pJO4Q41EkXY0be/swS2dUSaZdJxom6v4cuoto
         /jtMBFNeV3afGNSNPDzT2W0ddukJHt0I/9z3oGckbmcgSGhUaZ5a8ovbMoHvrhE+Mx3f
         XLX2MWCaFTrZjBPxM1BOvsofTTy4Zc1Q9AnIViLCBDp5QAFi26Vf+FnUp+zNF/P0wH3b
         wTsQ==
X-Gm-Message-State: AOAM532RGd5/LpDDxpdWHBKJNZRZYPrOc31LBk2BX7wdG45kJc+WjOhq
	CXgJK5ef5l67jmX2dUiZILEv+Za1Dz2KWDV/
X-Google-Smtp-Source: 
 ABdhPJwJpZZIbGpcaIfuNP1Dox56hK+ypO6+i5GEmiFIzeYaszXErZUSBMDQKXTxiteUlbdofzCvPA==
X-Received: by 2002:a17:90b:3845:: with SMTP id
 nl5mr44556506pjb.102.1639409823228;
        Mon, 13 Dec 2021 07:37:03 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:37:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/10] runqemu: check the qemu PID has been set
 before kill()ing it
Date: Mon, 13 Dec 2021 05:36:25 -1000
Message-Id: 
 <7f95eb486a2d07cf0c821d5301fd670de34fe2d1.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:37:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159650

From: Ross Burton <ross@burtonini.com>

If runqemu is killed, check that we have a valid PID for the qemu before
sending a kill() to it.

[ YOCTO #14651 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f3afbd3a6a6bef668612f818517df7543c0a683)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 10880ba6bb..51607f10e5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1516,7 +1516,8 @@ def main():
 
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
-            os.kill(config.qemupid, signal.SIGTERM)
+            if config.qemupid:
+                os.kill(config.qemupid, signal.SIGTERM)
             config.cleanup()
             # Deliberately ignore the return code of 'tput smam'.
             subprocess.call(["tput", "smam"])
-- 
2.25.1


