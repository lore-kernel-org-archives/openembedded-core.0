Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id CC8D060665
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 18:50:09 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t2so9920512wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oePJJBz5T7NDNmlaOoFyNL3LDb0nwsUMPNIAt3mouKo=;
	b=kBR1TW1nU6spB0Mxjxy39tplc+Y/xRWNWKh73o1b9gJGvVzTz3eW9PPNm4njxLbgj8
	FQmte6Jthe4TjPUH64NcfEl/0bxudL2B4FS+nPsazZaEfo3bT0u+tqGI4bR81U9TD42H
	NxoMU437qeNztKVt+YFGYAYLQ6247t7UqY2uk93v4vrMH3DyzLnwCzVuwTsh4UtkXfq3
	RHA29J9TpgJyXl7CO+JqvJHGfjk6f9LniVttmgG3T0FGG/eitSyba9GkWNydtpPPIr0E
	mDmsqjbe0H3DQY2N/eBFekGo+HjNzzIsSjYwjip6uI107ipnwBpPXJkAgm5K+o308Gyx
	pn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oePJJBz5T7NDNmlaOoFyNL3LDb0nwsUMPNIAt3mouKo=;
	b=KWfD0xO3J/22YKo4dtenf5gThEyZ8aqDg6Jc6ijWQKSHWhpIBsqBo63gneT1z4ecMR
	VDfbLdzdU51rPiIMRobQakm2jYa9NI1XgEf3QrSBQq4ugdpYoz0UyL7SpHttUUQqOxrN
	E4e6VqQNpHEwNwv5UNYXuW+yfJ8SK4gP+zBD1EDCqSkyhLI/BKtP4PFfEFFufmEsYnHi
	juSDf8vF7fi7RMtlQ9bz0fUIc8ON6+u9F8K/YijFr1Uc6rtbJCfnZTou6UQqhy8irPrL
	F/wzbnlVFU72TNNpUczc9GISD+MxgAKaMwd6mF69R8L1vwDcAY43hFO51qiAIqrKWUli
	3WjA==
X-Gm-Message-State: APjAAAWOHeHzWnSKyLlZVhSlKBe02Vl3Q4J3Tg8WudL/QOurE+pCbBQf
	2VUE7dN2zoir9kDWMa7UKSHTZf8M
X-Google-Smtp-Source: APXvYqwEXOe0Nu6Zv985xsR2knPVxrErOJpgOX1nkJ8Cvh1964M+lt8wPbuEZdoxYq+g74UDjPLQUw==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr7917624wrv.414.1580496610097; 
	Fri, 31 Jan 2020 10:50:10 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	t5sm12776642wrr.35.2020.01.31.10.50.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 10:50:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 19:49:35 +0100
Message-Id: <20200131184935.2484-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: drop pod2man from hosttools
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
X-List-Received-Date: Fri, 31 Jan 2020 18:50:10 -0000
Content-Transfer-Encoding: 8bit

pod2man writes the current date into manpages, and while later
versions of it respect SOURCE_DATE_EPOCH and use that instead,
earlier versions do not. This was found to cause reproducibility
issues.

This patch replaces host version of pod2man with one from
perl-native.

[YOCTO #13755]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/bitbake.conf                               | 2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b6aa9f33e92..f7544b35c6e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -488,7 +488,7 @@ HOSTTOOLS += " \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname iconv id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd \
+    mktemp mv nm objcopy objdump od patch perl pr printf pwd \
     python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
index 6495726500f..8e7ef00b087 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
@@ -18,6 +18,8 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 RDEPENDS_${PN} += "bash"
 
+inherit perlnative
+
 # For native builds we use the host Python
 PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
 PYTHONRDEPS_class-native = ""
-- 
2.25.0


