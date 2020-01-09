Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1027FE67
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:53 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id l35so581601pje.3
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=dkhQH41qbR278q5W6uOrekgHlRj0PH758w8tgDO2b72whtJuLa+pzwQEcPAA8alUWq
	wh32irtGy3oT8uu7Xa50naBFVPImzBzjhxcNn5yfQ6YtoBAJiJE6uIkPzKl8zhu5T5Rq
	2oz0xU1hQvxkNUJ/OIJE0gVKFNGwJH01SIkisvn/MMlUSVPws4oFsEbJdqhirAiNXu7v
	mkvCApQsBnWeOmAApT5Yssr857f/YjRVYroDKzdteyu3+r4GybmtArbxuYGdcmQedcoQ
	hFDkjOr92pUOyv+2CXU+9eM+MAsiMu69/SjlMYLVJnnNmuQ/zgTq88IlRjmnHv+oABV3
	SS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=Y6HETU5f04K2LmMUMqO6xH5ytJYbJ3dv+Uh/QkKjaXZOFfHTSNU5o4pJaLf1r9q/+Q
	W9fBs3da9E1YePVxlQeke0G8RWX4oe1qPwPo8k8sDWXP2Ir6B+DWCwSHlVG/2+f2Xnx+
	5d6WistlpOtSWMHKNPrBiveMPQeLASSYsYuLGMiu/zpGYucMOf7CBkS5pouYnpiDayMX
	nxQYHfc0iF3+zKu5t1bf/XdZS7yGh39CBp4E9uEkionWBhp+gutqAUjTsh1DNEdhTLRo
	hvBr+5+0QxX35Mx9N1+Awzu5b/tdPur5QaTcPPChk/QQyUO1/JpS4tsUVPIF+5HxXOFD
	l6Rw==
X-Gm-Message-State: APjAAAXtqFTADumD6z3uMNAOp5/+EY7rCPto7gBTCl1qQnWZGn9m1/8r
	P3qPUE5RyUaV4NDN9hWFhNGdnsR+
X-Google-Smtp-Source: APXvYqxvmHvM3jnoEtT76B+U0tm1OCPXJ+dspC3xN+zaG3sm0xjaudROQTIDN2HsQH0CTDZ5BTpQ1Q==
X-Received: by 2002:a17:902:ac88:: with SMTP id
	h8mr9465348plr.131.1578545394890; 
	Wed, 08 Jan 2020 20:49:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.54
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:22 -0800
Message-Id: <bfed8be91525478ecdf6b64e6308958b3271c8cc.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 03/28] sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:54 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

STATE_PKG may have been changed by sstate_report_unihash so don't
cache the variable's value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be29a25400c4ea285ab3f588c5831f00ba5d4f63)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index eb1ecd6822..a46dd2e210 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -664,7 +664,8 @@ def sstate_package(ss, d):
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
 
-    bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
+    # SSTATE_PKG may have been changed by sstate_report_unihash
+    bb.siggen.dump_this_task(d.getVar('SSTATE_PKG') + ".siginfo", d)
 
     return
 
-- 
2.17.1


