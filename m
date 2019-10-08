Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 00FBF7F220
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 11:51:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p14so18112696wro.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ieNOKjfyOTVf8kEm9v8+dV8u3KNXyf0JnDNyDqXQrwo=;
	b=QX8k+/91kBK0VPY5Mq+QRiZZ8yJCFOnzdkju9vcqjfz3TGD/1AbJFSxrEgTPxlGwTJ
	Kc5APDYC7SP42i3jrAucYz0U1BInNzfo7JzI5dZkD8Yekum3kQXhundRgg4Z7Bmxqzf/
	2wdYs7n6sjHBb+DEFBEcORkryvuIsbKy/a+U3BBnJGQlU4fjVNeQnZq4e0sVFT7WAE7r
	BFBCknS1I3EpmGMGYHeBcpfBspF5lrzVx16AlgImmEIMj+pTPT+eJoewAAY6rC7A9h1y
	4ZsQY+5JhppbONAFwZLM26RjFMOOkWGLi/rA8DU4Fb/srEJV5lAE78KWMemNcQgGPsHN
	WyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ieNOKjfyOTVf8kEm9v8+dV8u3KNXyf0JnDNyDqXQrwo=;
	b=d2CP1ZS1HELiMuZdK7rjfmn6RwVOz9OHpBPQ9x2a4LZ0qGRhmMGWcyqCU48y4DVCcd
	zaPn1kaOMZ9jWbS4Coa6TE1ydpWwytQQbZUZ1lh1n4Gk8+H8ZJr0cM7K+NW7ySbWnjpC
	+1f89mL1dEFKdzJBBus/gbkLRKvmm8RivzWCDzkpIfXPKrsCya4Ze42kkwCBNgLEGB0J
	z9jSNNe0lmBzocwB4bhIWzKw7b/aorN+JLgWXkYC2C3XzC4KW46+PzrNr0cFn4GZoJ8T
	aPP07vGvmrG/iqp6fUVCp8Am/JYTFMERDQojLpVeRuZhJmACVN51N6AiUmHMwxonBO0X
	VTwg==
X-Gm-Message-State: APjAAAUKGT5+AUM2xm9ibpRfiF67LZl6mi3QDVbN/yUsjJaMuxhTD83F
	Fo4RFYiaI9nN0QCTNCLHor+N0bZHuIU=
X-Google-Smtp-Source: APXvYqz+Cb16xd6BUbfM49dFsfCbJLogNzQU6r76c8vHL2B+AitqiDFwU5q5lDKcVJbM1Px23gQ4vA==
X-Received: by 2002:a5d:45c7:: with SMTP id b7mr18086937wrs.356.1570535519332; 
	Tue, 08 Oct 2019 04:51:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r20sm34655979wrg.61.2019.10.08.04.51.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 04:51:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 12:51:56 +0100
Message-Id: <20191008115156.16982-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] toolchain-scripts: export READELF
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
X-List-Received-Date: Tue, 08 Oct 2019 11:51:59 -0000
Content-Transfer-Encoding: 8bit

The readelf binary is prefixed, so export READELF in the SDKs so that the
correct readelf binary can be used.

This fixes problems with the symbol extractor in Meson with multilib SDKs where
readelf can't be found correctly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1a2ec4f3b29..db1d3215ef7 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -90,6 +90,7 @@ toolchain_shared_env_script () {
 	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
 	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
 	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
+	echo 'export READELF=${TARGET_PREFIX}readelf' >> $script
 	echo 'export AR=${TARGET_PREFIX}ar' >> $script
 	echo 'export NM=${TARGET_PREFIX}nm' >> $script
 	echo 'export M4=m4' >> $script
-- 
2.20.1


