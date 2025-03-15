Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56382C35FF8
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 10:24:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.7151.1742034284566215806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 03:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxSn+CCm;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2503609f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 03:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742034283; x=1742639083; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fu63JtcHPwpM6cFiXKz7Y+T14Et5hHvApyC++dTHvo=;
        b=GxSn+CCmBiTxendinEdvGZRa+K2TewCf0VKW0o7jRX1yoGSpyAsodHvT4teJ1RhQur
         uc/Bx3rC35sK/gGJcnZYpDsHfK2hSG6on8Ku8ICeQvjSDw44Pr8xKuXg3K+Q3AsgbUZK
         vigQGkWCLFSftZJPCH9jp8nmlca5xoKxyOUbrwnijG3tWs+7wVU8zXOghVCyvBv0NH6z
         u1lLXye1Pv5YRZql5tFVY6ZAqtxDP9LZjhSaezUTKbaarpkKzy6g+OL1mJXYbIDR8oap
         ZvS9ExE9n3cZFgIyExZhEkONvz68rwjvIHQx5wWvDQQyGOOk9gs13GjERyaw3CIyyYuk
         2kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742034283; x=1742639083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fu63JtcHPwpM6cFiXKz7Y+T14Et5hHvApyC++dTHvo=;
        b=ougqkYicfqm9lUKs46184NEIvlbaxeBfsjpEKJt6Q2qfS5Hn72bS7Cv27s+Mpo4JGo
         44x+cUy2CbCOL/s/5kVU/WCBDbABVW880YbjN4ZW3Jfr8OeB9IgmWGDghs7LONw6T3Lt
         3fFBM0O5ECBrDD0q4aKVLSbuWGHn+Igm7G77+ZER8jJ7Tkf6lC2PcAADBcl5z7m3KBg/
         UKMP/fV1F1tri2pZ56N3okS1EbNqVU9/I2Kml0yCn6199KVwShkUcZ1w/w2WJVxWV5ZP
         QkVuP7fPhWtvcqSEvVBQgYd1URdzxUigrLeqO0+OtY9RGa3vBaRrI1zrhx+hMU0s611R
         pZpQ==
X-Gm-Message-State: AOJu0YzO7AFD+SgipdjHK6ihtQQwbIscJJAXzQST4lHB+3Ldic/FRMxi
	sBLqt0nHauZeabGsKNA13yq8MkHCkgYyfUHlYc3QcIJEGqHiff2yHBDxd90E
X-Gm-Gg: ASbGnctadJXAzX9dIW5PQduS9XCblIn71kvGjQCSqWeHyYLu9jakxV2vw1bwt0pbTWi
	PuimTJQ0mB1cPazLXzal9aO8+ufwWiuersSHk89iWLF5vFnnvVNoH2jeFt8aY8olfDYE0HTi7AD
	fTP/wMvKMcd+Bxga165geXdO9MH49uhfw52qcxpPm7qUyfbGytcbmpC1T7CzuJtc0+iUXuVd9Xz
	gfiGMTXx/doiKjfvu1oXqlCPvSI7IL6A0fww5WBqbBDnAcwJDGqtxnHMMBdfJMAhJ567TMb9NKl
	qLe7gkfuQHJJdiVT9/WjJmEocgldQLeubql4RuLlnTxxNKJaWVTx/z35FBr/DP8sWXYCmLmKvgB
	ZaWr3bGusni4=
X-Google-Smtp-Source: AGHT+IFDGF7hw4DBCt3ujKm5aZMIIjBS+uUhvg7O/c8NXcU99n8poZFiyJ5V9CAYHhtMPrI0ormp5g==
X-Received: by 2002:a5d:6c62:0:b0:391:952:c74a with SMTP id ffacd0b85a97d-395b758f7d1mr10930824f8f.8.1742034282868;
        Sat, 15 Mar 2025 03:24:42 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm45186145e9.9.2025.03.15.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:24:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Mar 2025 10:24:40 +0000
Subject: [PATCH OE-Core v4 3/5] selftest: gdbserver: Adjust regex for
 change to output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250315-kmod-v4-3-946682cc4090@gmail.com>
References: <20250315-kmod-v4-0-946682cc4090@gmail.com>
In-Reply-To: <20250315-kmod-v4-0-946682cc4090@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212872

The updated kmod build (using meson) causes the output which results from `info
line kmod_help` to change. Relax the regex so that both old and new reponses
will pass.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 9da97ae78037bfd13434e93cf235c62fbbcb66fe..b6b7c5c47337453a49d4aa90166e148eab9038b6 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -54,7 +54,7 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
                             self.logger.warning("starting gdb %s" % cmd)
                             r = runCmd(cmd, native_sysroot=native_sysroot, target_sys=target_sys)
                             self.assertEqual(0, r.status)
-                            line_re = r"Line \d+ of \"/usr/src/debug/kmod/.*/tools/kmod.c\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>"
+                            line_re = r"Line \d+ of \".*\" starts at address 0x[0-9A-Fa-f]+ <kmod_help>"
                             self.assertRegex(r.output, line_re)
                             break
                         else:

-- 
2.25.1


