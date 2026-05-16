Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7436DCD4F21
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 06:56:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1778914605467492699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 23:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QUhabN/D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48909558b3aso5551435e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 23:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778914604; x=1779519404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdyyYOhcfTomzVmTzXcuyfr/6iBOOtgplJLxU9icOmc=;
        b=QUhabN/DvVez+xgT7Jaxub2UoDjEt/DXbvo/FetDGw84DWtOZ4Lm8KpbIFFnvQeLhp
         ua2wL8Z0qkj+aCLbNbs/zYfbA5YfylgUyZ89IOmQHontOCqEm2R70CQvxIJ/EObg2a3B
         Py51WVnKfA0YTyzfkR+8e1q5GCStWbZvQOStY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778914604; x=1779519404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdyyYOhcfTomzVmTzXcuyfr/6iBOOtgplJLxU9icOmc=;
        b=fkTc+sqiL1RepqzUqFsOESIQwFMon7C0Xt4Z1T4PmTY7w9zauYzmAlPRWzFZmQM60c
         OOxo8RQnCc5WLAOQeJ9bpR2JWS2p1BWY8LZ3wOSscli5QGp2Oa57nNQ5bSsvCZKQMoV6
         iujcf6g55xBQN0jtXNeYyF0Z8MinFIMYe2vlrClWCxnxi+9iBKqxKcy3bFn7OEIuSmxd
         51CG7M7LfrkPgsvnWqRUH8mL7rImvOWXSHwvm1LwTYKb7KJ4A0LhM0IKQ2dKOZBjlGZx
         c+ZACH0yU9acToYadLWccCUOIfJpn4DqAceKmKgNwOQZTe/DS/HzlgB4XF1WorTahnqk
         JtqA==
X-Gm-Message-State: AOJu0YzDUtlUfI7XwglOonzGChFxQmxSJTkcU106LMUORMBJUeKqU+FN
	J2ssgK5Ycxb0lMLrx5aL3bjxJHFj0BML9L/BOVGY/L9clhGi1idhMPd3t/gieRuIKrlJRjGzSTn
	oY7wt
X-Gm-Gg: Acq92OHUkGiWSpnyxSob8XS5OMXxlsC3Tk9j4UQle9V/No/axvYTEPP1dxZl7deGRYL
	JlPBL//r1wftULo4GZMRFolAw39k6EZJG/LqSiLbu6KegdKQD7gYuP0X2VzW5zyqy+lIT5HSiW8
	cB0gOFPgU5BAqNsc3Esz6aUDxZL/U6SMS5xiDSIGif24NS0JDbbCTfkreGEh0AR2QXMWG3BcTkl
	EBf1o0eBqekwDINyiWwUZNg4zzBNwYlI9I0OYCct1EYilFb1vnS/wyp5JzKcAXu/O/Le366p2br
	I2r4H1pxnD1yEfrKxvL7QWEEpMAdY9ytIXzHkpuPxt58a5tRcHVMnW/HsGNXU55/m7D5Fb+7Ohu
	uiSaEPgb6LnfXa8+rgaj5L2yrh4Yh/BaefCMMiLDlyZgBiZxfwFqsIGnjNX1mmRbeYKpwfFXloH
	dKSD+axLnwA4UVlZjKiGDBhHTuQmpFraqzGhxjzzKWwMfNPDyvRuY=
X-Received: by 2002:a05:600d:8451:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-48fe60de750mr86727295e9.6.1778914603600;
        Fri, 15 May 2026 23:56:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:352c:7135:a073:c09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf0eae0sm32350715e9.10.2026.05.15.23.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:56:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts: Fix typo in pull-spdx-licenses script name
Date: Sat, 16 May 2026 07:56:37 +0100
Message-ID: <20260516065639.4192204-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516065639.4192204-1-richard.purdie@linuxfoundation.org>
References: <20260516065639.4192204-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 May 2026 06:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237184

Fix the typo in the script name since I can't unsee it now!

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/{pull-sdpx-licenses.py => pull-spdx-licenses.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/{pull-sdpx-licenses.py => pull-spdx-licenses.py} (100%)

diff --git a/scripts/pull-sdpx-licenses.py b/scripts/pull-spdx-licenses.py
similarity index 100%
rename from scripts/pull-sdpx-licenses.py
rename to scripts/pull-spdx-licenses.py

