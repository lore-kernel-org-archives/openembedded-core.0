Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC3A79540
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:25:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n2-v6so3851106wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BYVa4gbtgtksNGrABV+8LTvalDMi+TwnuQZAVLn3ruE=;
	b=Wlt65sDUVqsplG9Ru0m5l55jMgnAsUn8CavqA5BWpAESgw2w6zsriVtau96g+2rLbE
	h39F5LvdhCFvnKUrYOuOwdp3m62t/wYP75AR+GCB8jO+x5nJmi2kBAPfTPdmF5TtTOF5
	ixnVkKL+cfjVMeO2WySXWEUJcGEDbTB57u+h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BYVa4gbtgtksNGrABV+8LTvalDMi+TwnuQZAVLn3ruE=;
	b=eXJiROqkXfaD8CFA/YCDjiBCHNaaftELNY8T/8tfYC2agIY+tRLk8DVoTAE1Z7moCA
	WrIqwlQmj32/NwdNizT1SJXwypgftGWPf3SXzsx1lMtpkkruh2em0zDBb+j+lpeIwNXb
	tnXgZJl0rnzsv2gw98KtxaGqsBvbTpkI+OlUXZyL6uDPV/XDC+Wg/O7k0PVgJBERJdNy
	GLa40XHY9m3OOxDGNRtEuKR7pW6+Y0xYki1w89hNsONaxeWaCMnESRkyprHC2BDUsJEZ
	Q1eZR1tPRmPQF2rGFqLvSVk0/Lntyp/jYXiRFAfG7Z1DUxSQmgwQWu3fZpmS8V/5Gv1V
	JOZg==
X-Gm-Message-State: APzg51Bj0L4DtZ9xQ67Kw3ymCZg+YVn9x6HxZFvSmvu7lyZ7cik+Cjpz
	ekOmUxRub+/UGkv9wja7+ws4TXbjxv0=
X-Google-Smtp-Source: ANB0VdZwfnY/WqeIINlBN6js7RINvZa80kRVelQs82VtbOX4b9tBlhWj4v89GTgmrfPkUMmSBeS/dw==
X-Received: by 2002:adf:8b98:: with SMTP id
	o24-v6mr9267228wra.110.1535012703702; 
	Thu, 23 Aug 2018 01:25:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1316860wrd.74.2018.08.23.01.25.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:25:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:24:56 +0100
Message-Id: <20180823082457.32062-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
References: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] glibc-ld: Simplify/cleanup multilib handling to use library functions
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
X-List-Received-Date: Thu, 23 Aug 2018 08:25:03 -0000

We have library functions to handle multilib variables/datastores, lets
use them so we have good common functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-ld.inc | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index 9b1d94a11e6..bb167b32bc5 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -1,28 +1,15 @@
 inherit linuxloader
 
-def ld_append_if_tune_exists(d, infos):
-    loader = get_linuxloader(d)
-    if loader:
-        infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
-        infos['lddrewrite'].add(loader)
+GLIBC_GETLOADER = "${@get_linuxloader(d)}"
 
 def glibc_dl_info(d):
     infos = {'ldconfig':set(), 'lddrewrite':set()}
-    ld_append_if_tune_exists(d, infos)
 
-    #DEFAULTTUNE_MULTILIB_ORIGINAL
-    original_tune=d.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL")
-    if original_tune:
-        localdata = bb.data.createCopy(d)
-        localdata.setVar("DEFAULTTUNE", original_tune)
-        ld_append_if_tune_exists(localdata, infos)
+    loaders = all_multilib_tune_values(d, "GLIBC_GETLOADER").split()
+    for loader in loaders:
+        infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
+        infos['lddrewrite'].add(loader)
 
-    variants = d.getVar("MULTILIB_VARIANTS") or ""
-    for item in variants.split():
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-        localdata.setVar("OVERRIDES", overrides)
-        ld_append_if_tune_exists(localdata, infos)
     infos['ldconfig'] = ','.join(infos['ldconfig'])
     infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
     return infos
-- 
2.17.1


