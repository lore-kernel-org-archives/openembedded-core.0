Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB912E75455
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 12:28:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.106616.1696336118835728347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 05:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d9704eKy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-323168869daso895433f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696336117; x=1696940917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPBV381j0hQemxovMI36UChkMArxq/VqQ9HPOdCOc6M=;
        b=d9704eKyFvC5LEzTVeenQb347Vo0SWZw8P9ZIX8DT0RFV5hSXSphw+KBpR/TurhOmy
         QjXvHV2fx65fy858w6I7Pl0hcCL48VZAbJOKvgmZua4t/35lWi6Tsp3BPBA4zSEEd8Bm
         Ftv7A8gqc3noxH0TSgHvOpjqnNyLScfGcrTlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696336117; x=1696940917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPBV381j0hQemxovMI36UChkMArxq/VqQ9HPOdCOc6M=;
        b=jzAhVAttAbyUaL0YPxYAk1wv5JF9jkHCyNRXTq8x0/MIzFU9y6lyOAW6k4t975FDal
         hWJPq+84hZZ3Ndn240PI9GJxM1FrkS7VywnJpplcYBfttKd9rIA7Ci1MJ30cfQGwf7Ni
         YV/jMkYPpG+aTg9DKTlqnYK3d3ysKC/TL4ydxvAKx+m5CyCIw04u9paPGoBRJrjrLDGF
         HXZhdp0fgK6nK3jWAfJwFulLlt7PFF/2vHvMgszsN3kMcUuMwn1H3QGn1cn7nxRFCPaz
         QQT3O1MjT3uSzwN8voVf7afmcK7MUVnHuyqkooQSMv7fT7o2cIOCVylH8Jyow3uIO+R7
         C/vA==
X-Gm-Message-State: AOJu0YwVMfClNLBNi5A5FbSd+aMEQWRMpZZ33cv61+46HKA3nMQd6ETA
	RXYrERnRkrK9t24OE4RhRMdOEi02Z3BhjGflPeY=
X-Google-Smtp-Source: AGHT+IFIaXo/fUOQlyShsxvpkKDduxZKCbnpclOWjs9EbB8KBXJzihcA/UFmdtWtCsylp7DuOvvGZw==
X-Received: by 2002:a5d:595e:0:b0:318:f7a:e3c8 with SMTP id e30-20020a5d595e000000b003180f7ae3c8mr11766184wri.57.1696336116690;
        Tue, 03 Oct 2023 05:28:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9590:242d:879:8d54])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6402000000b003197efd1e7bsm1472353wru.114.2023.10.03.05.28.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 05:28:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scritps/runqemu: Ensure we only have two serial ports
Date: Tue,  3 Oct 2023 13:28:34 +0100
Message-Id: <20231003122834.2872845-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188635

I have a theory that some of the console boot issues we're seeing are due to
starting images with three serial ports yet only starting gettys on two of them.

This means that occasionally, depending on the port numbering we may not get
a login prompt on the console we expect it on.

To fix this, change the runqemu code so that if serial ports are passed in on
the commandline (as is the case in automated testing), we don't add any other
GUI serial consoles.

We do need to make sure we do have at least two serial ports since we don't want
getty timeout warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3a170332689..0668e12e616 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1467,6 +1467,19 @@ to your build configuration.
             for entry in self.get('SERIAL_CONSOLES').split(' '):
                 self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
 
+        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
+        # If no serial or serialtcp options were specified, only ttyS0 is created
+        # and sysvinit shows an error trying to enable ttyS1:
+        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
+        serial_num = len(re.findall("-serial", self.qemu_opt))
+
+        # Assume if the user passed serial options, they know what they want
+        # and pad to two devices
+        if serial_num == 1:
+            self.qemu_opt += " -serial null"
+        elif serial_num >= 2:
+            return
+
         if self.serialstdio == True or self.nographic == True:
             self.qemu_opt += " -serial mon:stdio"
         else:
@@ -1478,10 +1491,6 @@ to your build configuration.
 
                 self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
 
-        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
-        # If no serial or serialtcp options were specified, only ttyS0 is created
-        # and sysvinit shows an error trying to enable ttyS1:
-        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
         serial_num = len(re.findall("-serial", self.qemu_opt))
         if serial_num < 2:
             self.qemu_opt += " -serial null"
-- 
2.39.2


