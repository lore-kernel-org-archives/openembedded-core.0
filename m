Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DDACD6110
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:53:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.68580.1696870414381244316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GH+DoG7V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32615eaa312so4375736f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696870412; x=1697475212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Flgg1/3Ga4z1DSTfNGHrj/uiFHk/PRHIidRfK0Unvo4=;
        b=GH+DoG7VUuiNOmHq/m97joKz93C4afSpP9HOQgIMVMH/+y4NYlq24qvdop6EBE4ghg
         QBBFoR0jwydc+nDfFoOykJ/2gmxVwZ8JEwb3/DOScptDE+g5eoPUQMIl/Tb+rNXNKXia
         qa7tfuAfWJFqD3uhI9IYXMPLmhMG/Y8zuCEfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870412; x=1697475212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Flgg1/3Ga4z1DSTfNGHrj/uiFHk/PRHIidRfK0Unvo4=;
        b=c8d83e/HQaVF3oQOuLEDBYGzUdLmYUdr+L3w8pmwbTJImxzlrMMQ5QD+LrtuKLK54u
         h9tvkJ3xP4bIOgGBHb7Smghs4ZzWsmWnamA83j3/NtCU1JLTafXRdRflY5F1smRGA6uc
         wWr36yjlDNjsJ4qyJYt4P6tMN8jQkjdicAPpi5SUh7EOBnji0cGte1HL7kWBDAEq22oP
         j9N9b9WnIHwr2j3p6VlLqrWgocHsnlMnAOLH/HCYhIBQOhUZMaEXOR/T/t3RIOTeWsaB
         PicG98VPUrCLr451BeODfe8bAgGRdd69qxq6aJf7Yuk1MHc8x2QH0osaC0vDLoUEU+cu
         EB6w==
X-Gm-Message-State: AOJu0Yx5ZK2wkCYkF78jfAX4VGorCq/9xtL3OOH+EAmVL1wLtWq/5f8h
	PPdypoeMBWWQrNLbkTKv4yx7Ln2Aemr6U2urAHg=
X-Google-Smtp-Source: AGHT+IFHpX44oRaoSYUnIfubf7tq3HNcvDnVsgt/lXXee7iQ9qDIsf8wX9hgoULx/S8dV8WzDFek3g==
X-Received: by 2002:a5d:46c8:0:b0:323:117b:9780 with SMTP id g8-20020a5d46c8000000b00323117b9780mr13729217wrs.66.1696870412277;
        Mon, 09 Oct 2023 09:53:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8318:8840:ca53:f6f2])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d4bc1000000b00323287186b2sm10133974wrt.29.2023.10.09.09.53.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:53:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/qemurunner: Add newlines serial workaround
Date: Mon,  9 Oct 2023 17:53:29 +0100
Message-Id: <20231009165330.3580227-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188854

We're struggling with the 6.5 kernel as the serial port getty doesn't appears sometimes
leading to failures in CI. Add a workaround of sending some newlines as a way of
unblocking the kernel/release issues whilst we try and work out how to get to the bottom
of the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 387addfcdfe..6c91570d1b5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -444,9 +444,11 @@ class QemuRunner:
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
+        newlinetime = time.time() + 120
         filelist = [self.server_socket, self.runqemu.stdout]
         reachedlogin = False
         stopread = False
+        sentnewlines = False
         qemusock = None
         bootlog = b''
         data = b''
@@ -455,6 +457,13 @@ class QemuRunner:
                 sread, swrite, serror = select.select(filelist, [], [], 5)
             except InterruptedError:
                 continue
+            # With the 6.5 kernel, the serial port getty sometimes fails to appear, the data
+            # appears lost in some buffer somewhere. Wait two minutes, then if we've not had a login,
+            # try and provoke one. This is a workaround until we can work out the root cause.
+            if time.time() > newlinetime and not sentnewlines:
+                self.logger.warning('Probing the serial port to wake it up!')
+                self.server_socket.sendall(bytes("\n\n", "utf-8"))
+                sentnewlines = True
             for file in sread:
                 if file is self.server_socket:
                     qemusock, addr = self.server_socket.accept()
-- 
2.39.2


