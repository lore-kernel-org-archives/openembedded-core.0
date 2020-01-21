Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id AD8337FB78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 14:24:26 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id j26so2936820ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=pKXtr6OFiJWytPYrPJbK7hefm+oi3pNgtOcUHyzFNg0=;
	b=v0w2iLeySKkw2F6aJ12TGlA+o+N3ELuqu8I/bUYHm28bksMFk4Fpz58tt3rXwcOp9/
	v2tiUGerr68sdK2dFeiPYHRfRMzG89GxerY2RKa44D9mEaevIJveOEEr5KrzBC/F+LMK
	03YmAHNOVw84zzkLxCUrJWhJrd9hnceAKsmcvuod5Lt8ZME5IPcaOxGR1lkbBbUqIvXg
	Wgs1hI48BnsheupDHXgtsn2QAITKU+WmN9hQ/7suPMPFNpx+VjTHT4EYXpiFIFG+Owkc
	WhyKpWvS8AiGygphur6gLlFjKpeCV33ONu5dKuJzOEwQtaTKANfR9b3LisdSWNcEQYSR
	qMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pKXtr6OFiJWytPYrPJbK7hefm+oi3pNgtOcUHyzFNg0=;
	b=VgBwHQRvlorEfyNtYSBB9Tt8DyRf69nKsHmvqOQitAb6KvDcPY6cSsSe9x/3KYQ9FX
	mNBFhg0akNUD1Ym8i7EIMecSRogzob528yAVKYteTURxmcGRkW0HtyGtYVeBWXMyAKuc
	JFwFfWcxVa+vItPYmnaVos0vOEFb3g61QlA1tlfJCs0Lzgr2q8mfKqDz9e4T2C2VJUVA
	IQkoaBOG/+/9s082FrAawIiB+CcuyZ+MOHDFgpTMUw8VCMMQUMc7CkADPNzwCsCzRZ/h
	ie0L6b+bLS1amchrvR5MZ9P+y6H80A7fRrFnqSK5Yd+0msqp8pVsbwZ48Q+7RhPK98n3
	rAag==
X-Gm-Message-State: APjAAAWwphQInlIIZCt6Hs7rEzwDa1CjYd6aEr2dfy5hz6CK0mnTABT7
	r8f71xqSizeQnGcGLGuxH6ReEsjjw+c=
X-Google-Smtp-Source: APXvYqx9UrWzzXFfwfX3CmI0+xq2jJPT6UH/uULrx0Q0UcwwO21+NC8p9ZBGi5vMkPdTsVzoLx9QKw==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr16379220lji.110.1579616666839; 
	Tue, 21 Jan 2020 06:24:26 -0800 (PST)
Received: from maximlap.d-systems.local ([185.75.190.112])
	by smtp.gmail.com with ESMTPSA id
	f12sm18467907ljo.100.2020.01.21.06.24.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 06:24:26 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 17:24:24 +0300
Message-Id: <20200121142424.6671-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] wic: bootimg-efi: implement --include-path
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
X-List-Received-Date: Tue, 21 Jan 2020 14:24:27 -0000

--include-path can be used for placing files on ESP,
like dtbs.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: place files to dir before doing image.

 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..3c8b1906ed 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -263,6 +263,10 @@ class BootimgEFIPlugin(SourcePlugin):
             cp_cmd = "cp %s %s/" % (startup, hdddir)
             exec_cmd(cp_cmd, True)
 
+        for path in part.include_path or []:
+            cp_cmd = "cp -r %s %s/" % (path, hdddir)
+            exec_cmd(cp_cmd, True)
+
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
-- 
2.17.1


