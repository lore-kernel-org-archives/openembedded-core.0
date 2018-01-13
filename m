Return-Path: <dariusz.pelowski@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3C81F6E660
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 10:58:30 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id g72so3013708lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 02:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Un4otInoiElsAPxbaXfw1Av9o0VZPegakeOEz01zQ+c=;
	b=K85/pEGfZEqs710IijD4/TDanIlnPzgFmEjfDFvJyLwjVuWe5gOzKz10S1zwPZ6RhP
	qvAZrqfSu0f3VafwzwGCqFbCfBLdgLrf7Cv5kHHvbFLq18TyBrP0nIxSo5NpTi/dExFC
	9GWc4PSqvVXmvMJS31O+uHl5vFoxWdBYHKUitItiRMPO0sCaV4BoMO6mcKmnJxamWMJY
	4HDddUi9BH35YHBm/KXCD+695uwshlYpMx/4vLz3eq77CRMj9VbQ8gkM82m/ceL0onln
	1+1vSMt3kF9DtjBYnhenQyCdlSmOz2cpMEwvqSl06f4/MrmXedbDdijPJGlrZQcAhaEY
	Vuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Un4otInoiElsAPxbaXfw1Av9o0VZPegakeOEz01zQ+c=;
	b=bxyvHoVAxmhMOGmA43619apxbsmMnoOTLB+UsxAIY2O+lyhTd82dp2DSMBci39k4XJ
	4vNo57ADM1FgohxtxO3RhbYZp3rW7ViS5flW/xh0QFQwjS2aRTOfVjDNipw8HGBnW+LL
	kLnbKozfU/rrDwShWU+ubc5+OsdBNcjABp0sD5LIxH1Tubyo5OwKw9csseXzopRfkATs
	pS8+E4zfV2pkq6OeTUY2mFx/xgfmvZ0xTUlJXSAJ9dNDU3Fkut+2ZOqreMSmtV2nzx4E
	DZWttuOpp5PMN9LxXmGGvNU072E3aXeE5+uuf8HKKVcf+LpXH3yknZthe1d5g/fYfRUq
	dCBQ==
X-Gm-Message-State: AKGB3mLbaSxi9MtzJqI9UXPP0kiceXocv2ssh3AFMuPqhQfnsydifVWs
	U6eVbkb+4QrHgkx3PEriz1B6Uvkv
X-Google-Smtp-Source: ACJfBov6BM+37Egy6ggHfjiPYXj1Yqb2hRDbIBKs5JbIL+V5B4PxfTHma+NiqouSrm0p1LiEJUDsrQ==
X-Received: by 10.46.41.68 with SMTP id u65mr19001135lje.115.1515841111152;
	Sat, 13 Jan 2018 02:58:31 -0800 (PST)
Received: from duzy.lan (user-188-33-218-82.play-internet.pl. [188.33.218.82])
	by smtp.gmail.com with ESMTPSA id
	b65sm4585937ljb.74.2018.01.13.02.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Jan 2018 02:58:30 -0800 (PST)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 11:58:10 +0100
Message-Id: <20180113105810.4136-1-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] base.bbclass: add automatic dependency on xz-native for .deb SRC_URI
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
X-List-Received-Date: Sat, 13 Jan 2018 10:58:31 -0000

FetchMethod.unpack requires xz for unpacking of embedded
data.tar.xz

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 6fe611489f..912e81e002 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -628,6 +628,10 @@ python () {
         elif path.endswith('.rpm'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
+        # *.deb should DEPEND on xz-native for unpacking
+        elif path.endswith('.deb'):
+            d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
+
     if needsrcrev:
         d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
 
-- 
2.15.1


