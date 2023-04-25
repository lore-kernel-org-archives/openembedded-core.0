Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDB0C77B7F
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.79760.1682431090462998127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=09f55DzS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b60365f53so7258385b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431089; x=1685023089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwmokFIQiNhkemWCbtb5ETQ7SEZtjum/BQXn1zfcoj0=;
        b=09f55DzS/BM5qGbFUKLgc3gNX8se7nH0J8wn8eRYzAO/pNvWnznv4D7qP06lLC/+Nc
         vbvzmB9EeuUUDqru9OXXPdRyfBBe9wm/J88WMC3+6MGxNLgPOL+mAc6iO94bFiQuSrTe
         IjvCh+LLKdU1gT7V7jkeaunTZ9N1G4MpSmnhxj/eCMu7tLWAq6uKIFqK2S6pfL20BtRP
         FS1f8tNQamj8cvAGAsOVMWtHBTRhzgrVRK89ySaW+ADVLY/a7OGODh1zfDBprFro0BXa
         hbH7gidrzfU9kxOHlcs+pOHmiUKg6Xl+TC4Ct9ah+ikBKRt7hzYhfnTDBbFOaUsT4yoV
         9Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431089; x=1685023089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwmokFIQiNhkemWCbtb5ETQ7SEZtjum/BQXn1zfcoj0=;
        b=Yzjz/VddrITOmt6YZUf5RKA8sIdlA4dtsf+x4n5Txtnqp7Y/7DNyU0lKOO1Op3q1Nh
         4h7/SNHXwrNtZaCuRik7rZD0psPGe4LLh73P0EFW7wNXqTQ6p7DLtJ+uzo1NfabIVBup
         Fb3tFcmzwmte864eTNElzSJJ5Q5s2hLU0VLbZMhPibH0BssBa09SBr0SWC3QS4XhSEqb
         zs+r41u3Y/Zo4ucl/3C4RAY0hMB0ErH6FZB2A+GCXCt/PBjwvcjbYd8A3TNNKF7r4yNH
         kw+EY4iPE8XrW/41N+/jbJZ4bl1C7zM4IKO5z23pcLWQaM0+oL7+soudTDcUoa5HpxJ8
         WcNg==
X-Gm-Message-State: AAQBX9d7ixTgqj+uFGVMwb8F57C9vVJAj0DrWZl1IIFFaJUiNbafqwlO
	zvKAcUUw9pGq7KlD23gumoxsIx48phGg3gpP4tk=
X-Google-Smtp-Source: AKy350bH7TwHJmORdaI8aK5miZDWvnizCWLZ1L2EbeMQyPwCIotkZaT6DMO9ILcfDu0OeDUNxRVLQw==
X-Received: by 2002:a05:6a20:160c:b0:ee:f5a4:c064 with SMTP id l12-20020a056a20160c00b000eef5a4c064mr21919959pzj.62.1682431089532;
        Tue, 25 Apr 2023 06:58:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/10] oeqa ping.py: avoid busylooping failing ping command
Date: Tue, 25 Apr 2023 03:57:39 -1000
Message-Id: <5e5975b199e161936471824aabc43da5097219fa.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180383

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Use a sleep on error path before trying again. For example
when oeqa runtime tests are executed without setting target
IP address correctly, the tests are drowning logs with messages:

2023-04-04 07:19:24,985 - runtime - INFO - test_ping (ping.PingTest.test_ping)
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
ping: usage error: Destination address required
...
2023-04-04 07:19:55,002 - runtime - INFO -  ... FAIL
2023-04-04 07:19:55,002 - runtime - INFO - Traceback (most recent call
last):
  File \"/lava-62618/3/tests/3_oeqa-runtime-tests/image/lib/oeqa/runtime/cases/ping.py\", line 23, in test_ping
    output += proc.communicate()[0].decode('utf-8')
              ^^^^^^^^^^^^^^^^^^
  File \"/usr/lib/python3.11/subprocess.py\", line 1194, in communicate
    stdout = self.stdout.read()
             ^^^^^^^^^^^^^^^^^^
  File \"/lava-62618/3/tests/3_oeqa-runtime-tests/image/lib/oeqa/core/decorator/oetimeout.py\", line 18, in _timeoutHandler
    raise OEQATimeoutError(\"Timed out after %s \"
oeqa.core.exception.OEQATimeoutError: Timed out after 30 seconds of execution

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87ec75710b5cd7b3f35d886003844d62d3182b54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ping.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index 967b44175f..fcb72d4543 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -5,6 +5,7 @@
 #
 
 from subprocess import Popen, PIPE
+from time import sleep
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.oetimeout import OETimeout
@@ -25,6 +26,7 @@ class PingTest(OERuntimeTestCase):
                     count += 1
                 else:
                     count = 0
+                    sleep(1)
         except OEQATimeoutError:
             self.fail("Ping timeout error for address %s, count %s, output: %s" % (self.target.ip, count, output))
         msg = ('Expected 5 consecutive, got %d.\n'
-- 
2.34.1


