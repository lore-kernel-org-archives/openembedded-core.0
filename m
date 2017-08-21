Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8DF78274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:54:42 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p14so14240147wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PAgWS7V/rzVavUHt/E3NQ5a37BiomXax2UnVT5p13z4=;
	b=Pcp0tSPuBjtDBjP3Jg2bhzujo0MzfSoHTYjjPYt7NNTKWqQwcqKkk4UKxF1eBFDd5l
	IzMDuM7sWC0x0+n0LMlSodMfoQXADemHqsURhrgmuv5UjhQFv+PhYl+cxm1MePOYBRZP
	kbwN4871XTZwpzq1q9NY2OK2pRFiaYo89J5Z5h/CTby02+GXZBVGe99Sthg+GM0so45C
	i4dC0CI1y3H7UXmztMlmKIcQPqSeWnGFDkkt4Xbn40aKQZaxXYwRf89lVSuqWhWtzJVj
	WeB4G0OwOHE0zfIpPRhrPde1/2C4RdQXqmI/vwtPn/xBX+GGkVgEiy0iIqdH+KbPLIAO
	gRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PAgWS7V/rzVavUHt/E3NQ5a37BiomXax2UnVT5p13z4=;
	b=DrSXdHgITgDYpM9xkWb0Ijx5Cwyj5U8ZjJsSfO89Zz/yeV+H92dRYuI06iXumo6MRp
	XOaBdjq55lq1mqwjfljRmS1C13kLXf6+5KOE7M9R3Abo9IOWT18RnSBQJoCn0YSHoKk5
	C4UXiloH6Gb9S8FIWpTexJhFxDmJTlYRwDL7cH1A9MDBFI78CUCHttgzgJkPEXv59e3l
	3gkZ4+W1ynbpfg3WJMX5O6gkikwTfMnU0Nc9NA2rULRF9YKkH3Zt0th5ctYqUhYYywF4
	YQ+cUA65pIOKVC0AMm0fYvSkHiZwgXpH0Qr3U818nWscPO948Ipmbqn9u2g7HFlxZC7M
	1eFw==
X-Gm-Message-State: AHYfb5ibMVfOc0Ca6ztdPnQTDCLLhpkNJgkVu1ECPrIW64jyixC2vT05
	a6hAasl5K2FJ9/dI
X-Received: by 10.223.170.73 with SMTP id q9mr13232974wrd.61.1503348883723;
	Mon, 21 Aug 2017 13:54:43 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j137sm1363444wmd.0.2017.08.21.13.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 13:54:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 22:56:24 +0200
Message-Id: <20170821205624.19892-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821065633.27570-1-Martin.Jansa@gmail.com>
References: <20170821065633.27570-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2] insane.bbclass: write QA issues to log file only when they are in ERROR_QA or WARN_QA
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
X-List-Received-Date: Mon, 21 Aug 2017 20:54:43 -0000

* QA check which aren't included in WARN_QA and ERROR_QA are shown
  during the build only as NOTE message (not shown at all with default
  knotty setting), so it might be surprising to see them later in qa.log
  file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b7177c9b32..44e4a01c92 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -184,12 +184,13 @@ def package_qa_write_error(type, error, d):
             f.write("%s: %s [%s]\n" % (p, error, type))
 
 def package_qa_handle_error(error_class, error_msg, d):
-    package_qa_write_error(error_class, error_msg, d)
     if error_class in (d.getVar("ERROR_QA") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
         bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
         d.setVar("QA_SANE", False)
         return False
     elif error_class in (d.getVar("WARN_QA") or "").split():
+        package_qa_write_error(error_class, error_msg, d)
         bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
     else:
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
-- 
2.14.1


