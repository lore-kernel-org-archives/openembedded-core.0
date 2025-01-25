Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4952C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 11:33:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8067.1737804810603131616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 03:33:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TgzbAc5v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso20607865e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 03:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737804809; x=1738409609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLBuzlgQD2Dt5maJ2xBrOt56rMiHb9BuMn+8561yNZ4=;
        b=TgzbAc5vghNq6aLiwiTd8CEjH7QZtwxnmUJrrY+oB8hrI/tRwCyMenFe9aJiVM0OpO
         0I8kf+r3L9FGpTiQl88HKIGihpaCMQM76pTJg0FQr3U2TpoMxXeb3qvZVGF22Rb+KtEI
         HxZjK6Ux9JfRIxMXI5Wpp5v7y1wqMVIM2Fr1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737804809; x=1738409609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLBuzlgQD2Dt5maJ2xBrOt56rMiHb9BuMn+8561yNZ4=;
        b=r2ZtOAekhbLZkLWJZOD5/LyzGULt3IF5U37YTj5uO5OuR+fo2rzB4Y1oScvOHsKpxb
         nvDhZXbtwHg191nQSxRjvRKiXZJ7GEEH7ips+9ooR/FredWcoiLnOpLcsGWY3Ypli7hu
         vW1vn1ygpQUw/nNZhNIxunJun8CUw7vLpk5yYYGN9ySGh929OEz1cE6Pex7ZfzeTr6Z8
         hjGFhODo9T38mbBQ8kZpUBb4VuTckbfugEefTneTWs2cYar+xamliu65+kWt5iKGzkQ+
         kbSiVnOj50TU5QnunDQ32cuSmwfwEYrWilWz/NLVuhwcRLrvY9pgXeP45viJYoiOW9TW
         sKjg==
X-Gm-Message-State: AOJu0YwlXjp+h4kjVq+bOtxo0ugnZqNBJjLOtI+ovvRxCs+xdwunc8cW
	sYLsWhthrpuSxLXVbW0nYsItVZpP5fmkEJvQJSBWTMPea9K4ZZqWREhkg++/rdtA6TjHQsJDRN+
	dqGs=
X-Gm-Gg: ASbGncvbniQ/Acn8hKxLRun99GKjcOjDfWn2beTpCCLvW5SUzrwIacrHMMX7jDJzw7J
	58YQwmXlH4LtmrKOaJVGwKpSck3eehrZOEp82HrjX/7pkUHP6CQ6JaLil5Oy7/t0B7EbLF3lFui
	xpu7uuGl0BXXpGGOQIy9KVRqMcDvkIU/WmSLhGpi53IbtLnI2PbFuUyEntfwxbaQyV/1VTNG8/+
	dnr4uWITVHr2yHKFQuvUza2s2dXX8x+nHIAsgrV73oEaZENhYq0VP7zqW0j4yvk2bDqqtMnvqzc
	/kNOZBKPI0anoYGn4ysPYsu4D5MQ+0/5jwEmK3zpvK8=
X-Google-Smtp-Source: AGHT+IEMtHlJzBcXhKU+qy62IosFxmmF9hp8M2HX8unfWRE8KS/+suZMZ6llkRm/Ntsh3ydLwap2Kw==
X-Received: by 2002:a05:600c:6c9a:b0:438:a240:c54 with SMTP id 5b1f17b1804b1-438a2400d95mr236691045e9.9.1737804808433;
        Sat, 25 Jan 2025 03:33:28 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac79:b32:597e:d068])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm57329175e9.3.2025.01.25.03.33.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 03:33:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sshcontrol: Handle empty reads
Date: Sat, 25 Jan 2025 11:33:26 +0000
Message-ID: <20250125113326.2475346-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 11:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210260

Looking at some of the autobuilder failures, it seems that somehow empty
reads might be possible despite not being EOF. Tweak the code to be a little
more robust in handling this.

In theory this shouldn't be possible but python does handle signals a bit
differently (e.g. transparrently retrying syscalls for EINTR) so adding this
check and a bit of code safety at least rules out this problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/sshcontrol.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 36c2ecb3dba..6c5648779a5 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -57,8 +57,10 @@ class SSHProcess(object):
                     if select.select([self.process.stdout], [], [], 5)[0] != []:
                         data = os.read(self.process.stdout.fileno(), 1024)
                         if not data:
-                            self.process.stdout.close()
-                            eof = True
+                            self.process.poll()
+                            if self.process.returncode is None:
+                                self.process.stdout.close()
+                                eof = True
                         else:
                             data = data.decode("utf-8")
                             output += data

