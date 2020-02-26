Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id BC777610DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 04:57:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v4so1290444wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 20:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+iWQiYHnA72+NJPfJK/RfK2ryBOD5UzIZPdlgl/Cnnc=;
	b=QEeHVRxk+PIF/AKDYom48nfOSdV7DS1xOgxQnKY/zPGi5wWU0DGzaT+KHYEAsNRyP1
	oWJADtpYFsBHjkWLtBzChWQBWWS/jw0LR/E7CWS7Z5hRILApAGGyTtdk0bZyQFoU7oiy
	WMceMQlNZ+SNhfXzMDDbYPVe+Y3MaxeRe26Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+iWQiYHnA72+NJPfJK/RfK2ryBOD5UzIZPdlgl/Cnnc=;
	b=ISgKXhNYfqNKXrNLKsfk6oF5luBC7H5aFrTThWTkGt1IL0djJam0vTMPGfXbKOnnW1
	BVAUsydMiH5xxiNWazqY9ZHXDPqPzM1isJQf6N9NAE0Zf7H3ysWm3uz/yLu6purW0zho
	uf/JMhz8Gawm5G7qvG6q8/cPa66xOvcdgR57wKhAggDGiafcLtXaxqzh1fYRSg7gb+Dw
	ZOMkJ94jwHI8jA7CR1r7yJ8HsYihDJZkVCX/p7xsH15IqfFKyehpZvtEtWOOImThCWa5
	j5Bs7AQhDWIXi5xHsYuO1ElPtPD4q920bqiLBufFvkQYIbbxFMqrgbmUoGRs3Ns5cRwS
	NhnQ==
X-Gm-Message-State: APjAAAUoYktcAvFcNfdzk7dSgCKW83Wigt2w2N5ZpUDWJM98/a2nWLwp
	AUGRnjSJpCXhmjRjzyc5gSdQMcopJBU=
X-Google-Smtp-Source: APXvYqxhZdCW4yFPpZMVX054amEQVehcnd3Iw1BCCNsZNLxVEI0y3y88qgGOlqS7Fweu0vGQF6eSng==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr3019876wrp.1.1582693032152;
	Tue, 25 Feb 2020 20:57:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q125sm1301365wme.19.2020.02.25.20.57.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 20:57:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 04:57:10 +0000
Message-Id: <20200226045710.393167-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] abi_version/sstatesig: Introduce HASHEQUIV_HASH_VERSION
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
X-List-Received-Date: Wed, 26 Feb 2020 04:57:12 -0000
Content-Transfer-Encoding: 8bit

We've found we need a way to cause a change in signatures and move
to a new hash 'namespace' with hashequiv. This introduces a variable
which allows us to do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/abi_version.conf | 8 ++++++++
 meta/lib/oe/sstatesig.py   | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 49648801089..2bdc55695bd 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -5,3 +5,11 @@
 # with general agreement from the core team.
 #
 OELAYOUT_ABI = "12"
+
+#
+# HASHEQUIV_HASH_VERSION is injected into the output hash calculation used by
+# hashequiv. Changing this means previous hashes will no longer match, allowing
+# a reset of the equivalence, for example when reproducibility issues break the
+# existing match data. Distros can also append to this value for the same effect.
+#
+HASHEQUIV_HASH_VERSION  = "1"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4325b66a9ee..d24e3738aeb 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -477,11 +477,14 @@ def OEOuthashBasic(path, sigfile, task, d):
     h = hashlib.sha256()
     prev_dir = os.getcwd()
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+    extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
         os.chdir(path)
 
         update_hash("OEOuthashBasic\n")
+        if extra_content:
+            update_hash(extra_content + "\n")
 
         # It is only currently useful to get equivalent hashes for things that
         # can be restored from sstate. Since the sstate object is named using
-- 
2.25.0


