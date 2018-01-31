Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A5D87787EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 19:10:39 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 36so16234682wrh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GLsjCfrdwdkU3zPq8iWtaaKozYOXn/M+sb1QHT4j3yg=;
	b=mDwIWshh+63p7kYTLEEn9+Jl+BRqrr4iWqC0yTvCArNuAAcVQXnrVgYMfNqyYjXErZ
	0XMUXy7aBHFcCvfNKxwvcgfGnQ83IhDlgtQlXF51lKjA9R642p26iALLCqNrGB3EK2aE
	Bl1BtvvoLhRnsTG3dN0dmdme9QpNsaAQ/+pAm0x4ebmKMDCc1yxGEIN5Aaw0BAFdC0ah
	N/mq7Uf1L5nQrcIsJfIRDTxWxXg3n9g5bsEwkcF9nIBxr1o9xA6v7sasYOK535v4ZuNh
	aXywtrA3tM++iRsAHJwSbtQpsqWfB9qdZlVHu1X7JbDmJuJLaqZYEZROHvt2If3sbQdw
	0KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GLsjCfrdwdkU3zPq8iWtaaKozYOXn/M+sb1QHT4j3yg=;
	b=XKUPSpmgllRA5Jwu7hXqAz0uQVTZy1hBLBk8mW8lhU9Gpm3ORHqytMeWFMT3JfLHcC
	ITdQRlH/uvPCIPq1g5B06GoU6uJeV/qwjBWcujuskGmJi4mIwQKgVBT8amihyCuqWcRt
	ugBGRa/FDefuYfAtEIKxLNz7c+pR4AmotV0skeM2/FLtntLMyDGRUadDP3ZuLxL69DSE
	dhoOl7YdB3hhRVqVuEc45I7Vvd5mJBOe3fywHWUXswtoSdikzVw99u4UJ5K6RdlpFQT2
	W4y3Rb7VEaCXoAX5c352/7qqnJwAtds/od1C0X/QOwuw1F1mKQZgq6KjdukoRjBVW+kc
	EBFQ==
X-Gm-Message-State: AKwxytfxuB+KUMn5mxKAocPE2u7A/JqQCT5+F6R/Tfs+kzY/sKF1QB8a
	5d0TgpSEzFugNf+Gy+MUrcrBfA==
X-Google-Smtp-Source: AH8x226T0tbno1SAyI5pkhjfyQTX8o/e1XbSrqAXjEpdYixhMLGooFFiQ6RDi/t5QttYD5Cdv9caAw==
X-Received: by 10.223.171.24 with SMTP id q24mr13161452wrc.206.1517425840149; 
	Wed, 31 Jan 2018 11:10:40 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l9sm9147989wrl.1.2018.01.31.11.10.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jan 2018 11:10:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 19:10:38 +0000
Message-Id: <20180131191038.99-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Cc: Daniel Lublin <daniel@lublin.se>, Pavel Modilaynen <pavelmn@axis.com>
Subject: [morty][PATCH] buildstats.bbclass: Avoid index exception in /proc/PID/io parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 19:10:40 -0000

From: Pavel Modilaynen <pavelmn@axis.com>

There is some probability (depends on system load) to get empty
or line containing "0" as the last line while reading /proc/PID/io.
Avoid build failure by checking if line contains separator
":" before split.

Backport from pyro commit b26feaf51af55f17fad79dbd53dd3ec0a37c38ff

Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
Signed-off-by: Daniel Lublin <daniel@lublin.se>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildstats.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 599a219984..415d2ee820 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -31,6 +31,11 @@ def get_process_cputime(pid):
                 i = f.readline().strip()
                 if not i:
                     break
+                if not ":" in i:
+                    # one more extra line is appended (empty or containing "0")
+                    # most probably due to race condition in kernel while
+                    # updating IO stats
+                    break
                 i = i.split(": ")
                 iostats[i[0]] = i[1]
     resources = resource.getrusage(resource.RUSAGE_SELF)
-- 
2.15.1


