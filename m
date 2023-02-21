Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88373C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:57 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.44248.1676990515987886081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MTttBKrK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id fd25so1828545pfb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4/bx/Y+O/mJZYivl8D12tN4Cvb1RymFN4r2mhSHrwQ=;
        b=MTttBKrKtLPtqlKJUZTgbvk7HaMHhx/FVHg53P07QoGVHQcYT9nA7XHlnvrRNCwoGl
         PHYIhfrtNHp5c5iI5Q+qDuNnTMUDISWVmWmpFMo6XZUGDXzdXr0xmbkI5I68zw69CsIX
         G0m2Bc/cjJPH84R6eZfEKBLl1jDNMy/JWNzw/5+75DKzoPxfPoVqQ0oCs4//VR1jQ/hS
         c2RrALUBG/dfjAN5J1bvWOUCB6EWetHIvc3VguVoNJgAvSVzrYuSrY2Dj4rZDvMne8Xq
         NArvfHElLPv2Vgp2HWKYVkwhwgKJFvgChsxohJKYTuGXol6vlj9oF+n2+lX4kgpVw0gY
         DkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4/bx/Y+O/mJZYivl8D12tN4Cvb1RymFN4r2mhSHrwQ=;
        b=z3/GLyp5AsZilUHn4pQVSUfSb4UqgljNUgN4VdS1gwpTsRyH1AwvH5OOk4CwoxoJ98
         ykNsB7pgqfo8Wgj2IzVuprbpIMkYBup7OWvtH4HSS6RnIu6YicNutMa+DosIDWTJBmgN
         EFht87vAhpAsAEhgTmb2CAE6cJcxrXokQIaoXXjeXMlc2ZH2Rx3MCVGA+QjH8W5RPcPL
         21/rlStnbqLE20pbQWToCXtP+z9QIB5R+6HsMzrmJ0puzmhGzTqzgpG2tj/XliGrcVY+
         o7TDFchKqkNmt/KrbQwcclPLE8lMX8y4mqf5Hq3tpyla5pYPF8Ryz7iUhXhQ9dFkWIZX
         d/rg==
X-Gm-Message-State: AO0yUKVtIAqpIqvTUnzKIG/olZXk+pWK2Ex/F+P55CMeXjPcc71h3aun
	U3ld71uAy/22bc/WHQxfAVgcheANwYwy7gPA2p4=
X-Google-Smtp-Source: AK7set8zhF9bWIGkqJ3S8Hx00tgf8zlus69VjzACpTYjMVOhT7tYEjXKtcuqsLjvL9twsc/57oJOag==
X-Received: by 2002:a62:790f:0:b0:593:befd:848c with SMTP id u15-20020a62790f000000b00593befd848cmr4107738pfc.16.1676990514968;
        Tue, 21 Feb 2023 06:41:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/23] oeqa qemurunner: read more data at a time from serial
Date: Tue, 21 Feb 2023 04:41:03 -1000
Message-Id: <3699e5bf2f9259266c49aaf69127183988b9d052.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177520

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Use a short sleep to bundle serial console reads so that
we are not reading one character at a time which reduces busy
looping.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit cafe65d8cf7544edbd387f7f5f6d77c64c6b18fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9a99859388..fedabb189a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -195,7 +195,7 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
-        # Create a second socket connection for debugging use, 
+        # Create a second socket connection for debugging use,
         # note this will NOT cause qemu to block waiting for the connection
         qmp_file2 = "." + next(tempfile._get_candidate_names())
         qmp_param += ' -qmp unix:./%s,server,nowait' % (qmp_file2)
@@ -459,6 +459,8 @@ class QemuRunner:
                     socklist.remove(self.server_socket)
                     self.logger.debug("Connection from %s:%s" % addr)
                 else:
+                    # try to avoid reading only a single character at a time
+                    time.sleep(0.1)
                     data = data + sock.recv(1024)
                     if data:
                         bootlog += data
-- 
2.34.1


