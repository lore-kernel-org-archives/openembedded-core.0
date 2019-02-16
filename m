Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 04BB06B180
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:41 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t18so14094530wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZYtWb/UKQ/JtCHk8Z0NZrLs/ESW58DFptHaLR3qs1oE=;
	b=T/A6IEvDoi2+h7xlemJoVCNc4C2ZTyXyqpUayAgydbD6FdvSzD7/EthNfOtmZpswzm
	CwcsOLigLDLLiOTFjwGnVK0C+1RjJhZkJ9rdyhKFMxJSLUKJTMtKn938AR57h2+fNi/c
	EXo7zvqdreF+OL5Gt5VJYk2iQfZenf0QnNLX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZYtWb/UKQ/JtCHk8Z0NZrLs/ESW58DFptHaLR3qs1oE=;
	b=ZDTj1KfJpqK5YesbmcKnweuXmsMWlLPqlIBaC9RDbNrRs9L2Q3Hw3a1sFx5aFC+cZd
	S9uROXYfCOpmcMewtT7wth+r+DwgDEFY4HP3qHrRQyZE8+CJ4NcjyWwKkqql+KrdyOhY
	zIgtU1bvLkv9HIMT9rqBnVilHHwB/5r2QOhYUYuR2IjdXIZeXOLFLRXimY5COiQomHho
	jtV2cx0eHX2tG91HOhFonJkMXMmDEnRDyAgFBQW/Cx4W23ykKinLqjMBbs7nqfQ05c8f
	kAeTfOEWWqwwh/0V0OcvfFUDDjyvQZOC0Vz17zS9Sr1Of2tKjzXcDWjCR7kUNU5CAzwa
	cuNg==
X-Gm-Message-State: AHQUAub5aRz3y3iCTM9ySpeDaFgW+BT8BB+HPpdKiBDdn9KxL4OzcVEL
	ao97iHT/hfBSrsJQJedUvPA/jzfr3zw=
X-Google-Smtp-Source: AHgI3IaeVl7dv5xsvx6TS66fTXk/4p6znGqVYnUNlI78vjYKB0Uf89ikMx68YOYHEnhc09LN3F3M5Q==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr11007059wrv.270.1550353602414;
	Sat, 16 Feb 2019 13:46:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:33 +0000
Message-Id: <20190216214638.11456-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/7] lib/oe/utils: Fix hang in multiprocess_launch()
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:42 -0000
Content-Transfer-Encoding: 8bit

If large results values are returned by the subprocesses, we can hit a deadlock
where the subprocess is trying to write data back to the parent, the pipe is full
and the parent is waiting for the child to exit.

Avoid this by calling the update() method which would trigger reading a result
from the child, avoiding the deadlock. The issue is described in
https://bugs.python.org/issue8426

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0c1d48a209e..3a496090f3a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -307,6 +307,10 @@ def multiprocess_launch(target, items, d, extraargs=None):
             p.start()
             launched.append(p)
         for q in launched:
+            # Have to manually call update() to avoid deadlocks. The pipe can be full and
+            # transfer stalled until we try and read the results object but the subprocess won't exit
+            # as it still has data to write (https://bugs.python.org/issue8426)
+            q.update()
             # The finished processes are joined when calling is_alive()
             if not q.is_alive():
                 if q.exception:
-- 
2.20.1


