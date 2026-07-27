Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6302C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:51:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28590.1785149485923242660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6YZNmR2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so17658265e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785149484; x=1785754284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUX1lr9i/0MfDpZZa1Ab7REXl1Zphq5gogBppJctJ5M=;
        b=f6YZNmR2uCYa9r5Rl8egOIj3ZCVjrk4Cotu56vn3jrhpqhWg7+NwgbJ5M3JDPranFE
         yTVlfiv4FBzH2aWKOotTjAwQbG/l0RKGXR/CXQ4ePhP42rVyBOnrB5bc0G/P5D6ZPQS9
         msOJy0GOtQPQyU/aTeHUyenPX0uUkikrKJ/Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149484; x=1785754284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eUX1lr9i/0MfDpZZa1Ab7REXl1Zphq5gogBppJctJ5M=;
        b=b3vjurEifoTtXV4dLUqJs6u5e3+KjZ84VEch2PpidA8atDd8hSQBTLBdU7XFZYLQlc
         bRRKNWIAk8b0rRX30+hEXDUVMUIDjUmKG2oWvbWG9X+NUELduPG4hG0CZnM8Vc/UJhp+
         89l75xaEvg2qs/ghEX5NhsLkOVTTXOQNnN9gBlWt5i7rckSY6VauA2YOkGQgjOlvjT0q
         xloGfir6b3eUomTb7Qy3bMAuCFnkERUw2SGN1M12fcYNwNQWQW/2Bc5XvUX0CVljqy32
         q4M1suyfZZr/+kPwlvoyTxJWpJThdDBS30yJ4RO7FYlQ8GZ5o23IES4y3SUwX7fOlX8b
         6KGw==
X-Gm-Message-State: AOJu0Yx8FW672yqyJG2MqUB6dhBHiY5X2Iuio0k/HlgPonC2y6bPQ2lT
	bOfyMHjgpUriOc9cik/COmFQ6/Sv4wcwBw5U4VhMbyhTbv6p7k9EBQ6SyfO5U1RqSwBsX7+FxM4
	LtRJpRwE=
X-Gm-Gg: AR+sD11B8x0NPlCSr/R43pdRThtjeY6xF/lSCVQ6PuJ7MxWQyOj48YFaeexYNOfoXpA
	GVnQxWR6b87uwrJ1zYmnrPKmqdBV1pKinTQUj9WkkHxCWpqy9bPsKkPYYiw5yO8/d4v/m8c5KA9
	y7JxRKRFArecHlUKteuosN6jD/OOZYYdaOxgRNsVsMxNS7K5BDqb3AQEGgtxtK4ahvmiboJSj+C
	SokgGz2vnyc7x0Wqds8NFaiWhuJ8Gf7PSYNVmOK3zzo1ClPK2BczxHjPXHN46RhAJYYPES6Snpl
	1xvWEnxFpDEo5PWkUy+s6147Mr3GFa2cC/11BJuZYQygU7PY8LoXrMJGEYyK+qpVO/YhTFyj8aE
	l5VzvJo5EZwcML47L/UYyAJNacrsagRmOnJICm2wpQCN6etIXrfHgUSWDZR5Xz97mfgN1K/W3cw
	MNledU90i3AP5dWb77w3r97DtV+ZA+eccCjJwHM3RS
X-Received: by 2002:a05:600c:8b52:b0:495:3f0f:d515 with SMTP id 5b1f17b1804b1-496b57281camr105939405e9.36.1785149483904;
        Mon, 27 Jul 2026 03:51:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858e28sm239462025e9.2.2026.07.27.03.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:51:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Update mtime/atime for sig/siginfo files in sstate_checkhashes()
Date: Mon, 27 Jul 2026 11:51:22 +0100
Message-ID: <20260727105122.4106673-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242084

If we touch sstatefile, we should also touch any .sig/.siginfo file if we can.
We try and keep them both updated with accesses so one isn't removed without
the other and they stay consistent.

[YOCTO #15289]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 34a59fda002..9037d209270 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -978,6 +978,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         if os.path.exists(sstatefile):
             oe.utils.touch(sstatefile)
+            for ext in ['.sig', '.siginfo']:
+                if os.path.exists(sstatefile + ext):
+                    oe.utils.touch(sstatefile + ext)
             found.add(tid)
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:

