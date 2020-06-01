Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.38024.1591020748518718170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YDLLM2Wf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id y11so4315939plt.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5+0UOEjOyEldVRR01j/CdzMInWKHr2EzbN7xkuSPNAc=;
        b=YDLLM2Wf8ia5ZUNs0UlVZBGR+6gmok3uZOhuPzeHj88F1c2vgfS4khWoCw3Txn/46J
         sqThVqvAitYaxUOxe7rEcEXSHoghp5LcJ8szVhZGf4jx/ud0gIp++34nJSIcFLg4YIOC
         jrFs27jgMLxk/pmzcy5LAzTE8jI8Ljys6IODO98fl6WPrp46trdXvJYwePTrf3ioUqR/
         KqDBTe+Epp+0heeBhxYJQUQZM1H896rf68oOC1UJJRMR5N3YiyreOdyMAafiQU6V4qY1
         cM4yakQ0pv5s/9unpQc6ybe8aJ8MeLenG9lPPd6YajNAhZ9/8ikYKA+HLsoH6xyIIlWS
         J76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5+0UOEjOyEldVRR01j/CdzMInWKHr2EzbN7xkuSPNAc=;
        b=tKvl2OSV0aRb03tJSxidx3RfNyEPDob2Dc/9h9pBx6dvb75yqfSRj/HL+34Hbf2t+W
         b2KsJpIyZmFl2LSEmAFATR837iaqIMsOihaA6uiUTwA05QWbHV4EDdDYD5/teU6tsrE4
         hf94GROeu9tkghjgNNXHlB7YBnZ8LNvBnY3ObL0tmmyBt+cxRd8WGybvE7+Q6U3IsBJF
         dcWha+YXvN91iBaqYmfDFGHhCv0F7Kb8MP1NwPcJKXqCuVu/W3k6Vs3WsW9KbH/QWxxZ
         TRY9rGmuutIgvIxNsupMGNxSNlSDr+UPosFqfo9eDTgFlTm17uFJw16I2nYJceYyDrgo
         xG5g==
X-Gm-Message-State: AOAM532QdgZGfEmWkJ//onve6uLGaw5drPAsBzqIBeng2GshI4s1Vz7t
	UVueaTBsKOTCzETanKKaKwB367SAF7w=
X-Google-Smtp-Source: ABdhPJwdPEZjh9NZ/TuTl2td3Jdd/2c5Rm3Tb71zdK2t38tsD/ZoLHhf/z6aS2oJ9kMUPuMhp470AA==
X-Received: by 2002:a17:902:d711:: with SMTP id w17mr21049691ply.122.1591020747201;
        Mon, 01 Jun 2020 07:12:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/16] sstate.bbclass: When siginfo or sig files are missing, stop fetcher errors
Date: Mon,  1 Jun 2020 04:11:23 -1000
Message-Id: <9fbdfb64c55fea942f14b201b35af2b2ec91a6f7.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Mark Hatle <mark.hatle@xilinx.com>

Prior to fetching, the system checks if the sstate file is present
either locally or on the mirror.  If it is, then it goes to the fetch
stage.  Up to three files can be fetched, sstate, sstate.siginfo and
sstate.sig (if signature validation is enabled).

The previous pstaging_fetch function would iterate over these, and if
a download error occurred would spew forth a great amount of fetcher
failure messages as well as stop fetching the next item in the set.

This was resolved by adding a fetcher.checkstatus() call prior to
the download.  If the file isn't present, then the exception will
be triggered, and no fetcher failure messages will reach the user.

The exception handler is then modified to be a pass so that it will
loop and pull the rest of the files that that are requested.

Additionally, a check for the existance of the .sig file was added
to the sstate_installpkg to avoid an error trying to load the .sig
if it wasn't downloaded.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9085140434e2d26c0bb75bb53fcb7f7c19ef86d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index aa9c30b4e1..375196ef21 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -355,6 +355,9 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_INSTDIR', sstateinst)
 
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
+        if not os.path.isfile(sstatepkg + '.sig'):
+            bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
+            return False
         signer = get_signer(d, 'local')
         if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
@@ -733,10 +736,11 @@ def pstaging_fetch(sstatefetch, d):
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
+            fetcher.checkstatus()
             fetcher.download()
 
         except bb.fetch2.BBFetchException:
-            break
+            pass
 
 def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
-- 
2.17.1

