Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4EA7F3A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 13:35:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id p13so5432168wru.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r4RbT2RXKlwuNEZooWzXz84HPC+ak418HkIbe/kPnM0=;
	b=Q1IqWHkolDMNogt2nT2KAS0ybzfIq/JHpvrxDs8ZZiAP3RKI+qMZnmawJTHPtS7gC0
	Wat4ITADigUtKAx5b9xzND0vhG7fSmh8/O32SMRe5zq2kWjkW3t0ssP6OZ3Hk6Q+/xqu
	LwMrnbBMHrC0IJdJuyCJ+VnlIZhNpxqktc6SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r4RbT2RXKlwuNEZooWzXz84HPC+ak418HkIbe/kPnM0=;
	b=mGUbQfkaT48dfJ+WOpjj73kC2xJsStUJKGbEG+337AO42QUE5/W7CuaFgwZizjeEB2
	pbplZNmaLzihrurSSGniLyyK4ksHiSkPzBEFLVmZ+BiU0J98MfP0bIzQxgIrES3JzDYK
	9il077sY29d+PjLBhJhN/S6zyDhJRbqpcjZPVtAK/zWgKaHQxoibF6a2WArdKMVzGLzC
	awz7srqLyeZZEKeLHLvuG64DZ6jWLTZPvidZz6PxaigGxaWy0SWmHHbu6wJJR+eIbUth
	4R6GC/SoJMQNLjq+/lOzXEIupiONriV+R8CNpvFkonzLKXcjlMB08MuQIOonxXVMUUyT
	iRdg==
X-Gm-Message-State: APjAAAX6pKghQQgOd4bQsfEYrwA2w57C9tHTjHX2hAg0pp4h07t0n61A
	w/ykisbKHLdJGoKkXzY3uZAdwpyq6Zw=
X-Google-Smtp-Source: APXvYqxics7WlQ7Pn6gtOxt3eGzqs5mOiPbR0RMR/INBd2DXvvddBJP0W/2LgBJA/2CCqW3AcYaxmA==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr142277496wrp.85.1564839319478; 
	Sat, 03 Aug 2019 06:35:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o20sm204800883wrh.8.2019.08.03.06.35.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 06:35:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2019 14:35:17 +0100
Message-Id: <20190803133517.7199-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstate: Reduce race windows
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
X-List-Received-Date: Sat, 03 Aug 2019 13:35:19 -0000
Content-Transfer-Encoding: 8bit

When we write to the sstate directory we try to do so atomically so
consumers either see one version or another but never an imcomplete file.
Unfortunately this is reliant on filesystem support and with some NFS
configurations a replaced file would be lost from memory even if users held
open descriptors.

It makes sense to try and avoid replacing existing files where we can.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index aa5841446c9..11222223a9b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -755,6 +755,11 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
+	# Exit earlu if it already exists
+	if [ -e ${SSTATE_PKG} ]; then
+		return
+	fi
+
         # Use pigz if available
         OPT="-czS"
         if [ -x "$(command -v pigz)" ]; then
@@ -774,7 +779,12 @@ sstate_create_package () {
 		tar $OPT --file=$TFILE --files-from=/dev/null
 	fi
 	chmod 0664 $TFILE
-	mv -f $TFILE ${SSTATE_PKG}
+	# Skip if it was already created by some other process
+	if [ ! -e ${SSTATE_PKG} ]; then
+		mv -f $TFILE ${SSTATE_PKG}
+	else
+		rm $TFILE
+	fi
 }
 
 python sstate_sign_package () {
-- 
2.20.1


