Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDE2CDB482
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 08:11:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.83886.1697357484913538887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 01:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NmunuvTS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso28057955e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697357483; x=1697962283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=okjk4wL/1vAL5VJuIMhwYrlfdzFMjY+rR0QjIpRiyZc=;
        b=NmunuvTS2e8FYA6O5QDyypMuTXTH05adQvLFou7xNxtiY9J8Q05UdsaXI5pptSxIgq
         SfLQUjt1rP4JwhbMiYbOlBSlbcfr7SYMtqDnu+tRB06sCohw+PYvyb1yCijT8MxCjJPo
         MPqWw9ga5a1I8+ZVviY49FUDF11Ncl6s8hjhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697357483; x=1697962283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okjk4wL/1vAL5VJuIMhwYrlfdzFMjY+rR0QjIpRiyZc=;
        b=BsBm6MGbXPD7zoV5O5dX1ZHLyczIb8JvFHJZCsDDyWDNlIZpYi2GrxhQV4YV4pZPdD
         sWV9JfskLuXACb9Xu8+QK1L9H1T/a1fh1T4ebuxxTHki7zKRE+qC0PMpZ2M2G5xXIcOO
         qe3TgnyjffIXyQVYbxKzhjOTzP/v3w5JKaR3EBhZPlzSgzY/rjmm6i1gmg1rt6hOpCuL
         +i7xh7NKkeZnR/iBq2Y9LvOhX9uFJXTMlgso8EV+K8BBTzFDerU/jChznT/L8I+1+ZzV
         Yux2xPmTApzOKHSMq4Q416i4kn3xoSVf/7u9/xMWc597eMwksKJOJb4qSdgU8mMkYkJ+
         awGw==
X-Gm-Message-State: AOJu0YyhzGoFw9uyJaQ/kW6R3KFEly+ZKHTh/ZElMU8ECFi+vrMx5noe
	SVq7JaQ6QHcTh94zbVT0mSoi3hjUAkbYbA0dHXo=
X-Google-Smtp-Source: AGHT+IFUBOCAQP385g4k2CEWKiiEDcFbVinUGYmu4Y/AJJc4QNCY/NbF1piL32jy1VXYTVlNiLoiBQ==
X-Received: by 2002:a05:600c:3501:b0:402:ea8c:ea57 with SMTP id h1-20020a05600c350100b00402ea8cea57mr3206098wmq.7.1697357482899;
        Sun, 15 Oct 2023 01:11:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7e01:6bdd:8c85:9c17])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600c46c900b004064ac107cfsm3871070wmo.39.2023.10.15.01.11.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 01:11:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Drop newlines serial workaround
Date: Sun, 15 Oct 2023 09:11:21 +0100
Message-Id: <20231015081121.371323-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 08:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189138

Drop the newlines serial workaround, it doesn't seem to fix things
enough of the time to be useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f1df6f97d2e..08cca6d8355 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -445,11 +445,9 @@ class QemuRunner:
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
-        newlinetime = time.time() + 120
         filelist = [self.server_socket, self.runqemu.stdout]
         reachedlogin = False
         stopread = False
-        sentnewlines = False
         qemusock = None
         bootlog = b''
         data = b''
@@ -458,16 +456,6 @@ class QemuRunner:
                 sread, swrite, serror = select.select(filelist, [], [], 5)
             except InterruptedError:
                 continue
-            # With the 6.5 kernel, the serial port getty sometimes fails to appear, the data
-            # appears lost in some buffer somewhere. Wait two minutes, then if we've not had a login,
-            # try and provoke one. This is a workaround until we can work out the root cause.
-            if time.time() > newlinetime and not sentnewlines:
-                self.logger.warning('Probing the serial port to wake it up!')
-                try:
-                    self.server_socket.sendall(bytes("\n\n", "utf-8"))
-                    sentnewlines = True
-                except BrokenPipeError as e:
-                    self.logger.debug('Probe failed %s' % repr(e))
             for file in sread:
                 if file is self.server_socket:
                     qemusock, addr = self.server_socket.accept()
-- 
2.39.2


