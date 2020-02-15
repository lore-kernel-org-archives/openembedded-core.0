Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61A91613CC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:25:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so14729380wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4zbn7BQNLhh0BMja9AJxC0FOrwpFZcNQbNckKR5cPaE=;
	b=HSBAzJeSsyRJrGR8VwAc/ZGvvF48DVUsbKx13YxCEHNU19tgTNbDfXSNNV5BIIO2PD
	I6t7oWSTx8U/JKacxH5BqxaX5Ga1v0hc+ExeR6KpKK9Bz/IOw3/62BV87deCVqJRxVNm
	1Cc2KzfsoGXqXrvicMrPBa6nmE3VvbGi1fJmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4zbn7BQNLhh0BMja9AJxC0FOrwpFZcNQbNckKR5cPaE=;
	b=dCkX5dE/2/XiPuO+Izpmv+9totVlK6Q3nSxnkrUNVCXPT6Lrzs5egY1wTAgvhXT2cQ
	BtSN5wlHCJiH6JTXivPlQYXUpdNtud6Ot/TMkWvTJKeP9qs3Au7j7zLXECpMNu0HW6dt
	DNQm7ovytB0oFWaLXwjrHKQUVIozM+FtnfI4gMHBzqC6+zYDU/ks/4+i4mAThnavOLYE
	a8IIompVgSLRZSPYlwroDukBhMccAbxrzS2OrHrWuwnLg64etxXuiRjv3lJiEdbLl2cz
	ghgZT+JNNn0bmBu8iV0STiIIMvW8p8scf6UvVAeSfzxdQzlVvW8buyEOA8YFpCX15xt4
	kukg==
X-Gm-Message-State: APjAAAWBmnd6/Nq0U3XtqCz4NijVRlsr3ArX2tmlTAec3jztu1lKR9Id
	y6lN4fzi8b9Kq/dBvKkiiK3SwvLrLiw=
X-Google-Smtp-Source: APXvYqwnjqiX8jE8HIdbfIfipPbM3fmQGqpF3ZsbmVOjneb1w86km5ts1Xo9ocd6YeP3xtEf0R6t8A==
X-Received: by 2002:adf:f052:: with SMTP id t18mr10520040wro.192.1581787552668;
	Sat, 15 Feb 2020 09:25:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y6sm12107563wrl.17.2020.02.15.09.25.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:25:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 17:25:48 +0000
Message-Id: <20200215172548.7931-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] resulttool/resultutils: Fix unicode error handling
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
X-List-Received-Date: Sat, 15 Feb 2020 17:25:52 -0000
Content-Transfer-Encoding: 8bit

This error handling didn't work as expected since upon failure it would
inject bytestreams back into the code leading to tracebacks.

Instead, ignore the decode errors. Fixes:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/resulttool", line 78, in <module>
    sys.exit(main())
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/resulttool", line 72, in main
    ret = args.func(args, logger)
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/lib/resulttool/store.py", line 70, in store
    resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/lib/resulttool/resultutils.py", line 178, in save_resultsdata
    f.write(sectionlog)
TypeError: write() argument must be str, not bytes

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index f0ae8ec1c5c..5fec01f6f34 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -127,10 +127,7 @@ def decode_log(logdata):
             data = logdata.get("compressed")
             data = base64.b64decode(data.encode("utf-8"))
             data = zlib.decompress(data)
-            try:
-                return data.decode("utf-8")
-            except UnicodeDecodeError:
-                return data
+            return data.decode("utf-8", errors='ignore')
     return None
 
 def ptestresult_get_log(results, section):
-- 
2.20.1


