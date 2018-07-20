Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A32836007A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 16:26:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t25-v6so1103909wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qUSqZ4n+ODg63DQxTYm/Gg07QAqYrqTO4fx8xQycSNw=;
	b=RA2sHgEyoGhqX2xgOHqDbKTDIp8Luhj50EulRloOpdoSt7rLzjSwMUdRu1n++V1s0Y
	WknZWW8WMGBTnAJlvcfgXCaCVyS3O1vRkiirAuPNS/Um69/IriQXYUN7TT0uPS1UZJ2M
	3uX1gz8IBlC8i00tZh9RNap8anYPBbDpH8dfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qUSqZ4n+ODg63DQxTYm/Gg07QAqYrqTO4fx8xQycSNw=;
	b=XDBXgzL/XSdtBBftEz9YXaszPZpaxHH4hJhHoEkUr8yzKZ9YIg9Y+DNQ302smeo2KR
	ERgj4S/2/kNad/b2bWDf2i5it2TLuv6sKFZyc0DCzppaUKfMCuac9UHfmHD+qD1iHB1X
	VgNqze1Z75dga7B5o8A8Y4c9BQF9cxwE7by8fdgjWXPYYM5jdQvdsF+CAN4QfUVflMPB
	RMyteR+eIMJtYqkDrzmthkdMU10suigh/DGpIzjJA8D4DqpfjB4NPkG1aG7DyrKadsPV
	VV08pjpQzi2a2+M4uaSjhJakrK4FTA1U1TSzhzSbnRC1ZOpgmajCWno5tpTY6MPFA6df
	7akA==
X-Gm-Message-State: AOUpUlGSRMa4gXubupYPMMjk70lbeOZ1bM7H8ZVb7Be1msN8AUoJWP4N
	pVNl/ijmr54ytlcbemRxMxQiLEinVhJdPg==
X-Google-Smtp-Source: AAOMgpd4nUKN+aXBhSPuYvWwQSu5LAxozyaTWTKNQZOqeFy/Ywck1j+XFXDX4adbVpfbO4YyePY4Bw==
X-Received: by 2002:a1c:d0ce:: with SMTP id
	h197-v6mr1875489wmg.97.1532104009083; 
	Fri, 20 Jul 2018 09:26:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f8-v6sm4257630wrj.9.2018.07.20.09.26.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:26:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 17:26:45 +0100
Message-Id: <20180720162645.5220-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720162645.5220-1-richard.purdie@linuxfoundation.org>
References: <20180720162645.5220-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] lib/oe/utils: Drop now unused multiprocess_exec
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
X-List-Received-Date: Fri, 20 Jul 2018 16:26:48 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 753b5775550..814ac0fd51c 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -248,40 +248,6 @@ def execute_pre_post_process(d, cmds):
             bb.note("Executing %s ..." % cmd)
             bb.build.exec_func(cmd, d)
 
-def multiprocess_exec(commands, function):
-    import signal
-    import multiprocessing
-
-    if not commands:
-        return []
-
-    def init_worker():
-        signal.signal(signal.SIGINT, signal.SIG_IGN)
-
-    fails = []
-
-    def failures(res):
-        fails.append(res)
-
-    nproc = min(multiprocessing.cpu_count(), len(commands))
-    pool = bb.utils.multiprocessingpool(nproc, init_worker)
-
-    try:
-        mapresult = pool.map_async(function, commands, error_callback=failures)
-
-        pool.close()
-        pool.join()
-        results = mapresult.get()
-    except KeyboardInterrupt:
-        pool.terminate()
-        pool.join()
-        raise
-
-    if fails:
-        raise fails[0]
-
-    return results
-
 # For each item in items, call the function 'target' with item as the first 
 # argument, extraargs as the other arguments and handle any exceptions in the
 # parent thread
-- 
2.17.1


