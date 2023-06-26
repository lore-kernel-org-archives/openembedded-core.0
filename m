Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B7DEB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:33:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7926.1687786402833535954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JKn8Sglv;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98df3dea907so277953466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687786401; x=1690378401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FidzQexKtkouU1qkbBHNf0sLtxCwSpPvwbfWM54cmB0=;
        b=JKn8SglvNwaOSltuP4tDRIO6sNmLjWGKyeluZkaqomEGu0SAzUEknvtgu46D1S2Bw0
         Jbzpo9HCbiFf8nfsq+tce2LEfkMldxradpTSgeFhXepIlHLS7iSKquDtM0Wf37R/emTZ
         3Jf/AkmJ1nmrWg4a/+cGkhXe1IlKkg9x2oFLyVU+KtzFQMtoDgWzAaExNnuumwjIOe7f
         hIriy7chZ14khRuGf4QouLBqiGkzxTRAgCOboFH/wcSSnY/3a933Ws5lt/+SpvPDU81O
         JgU5skOEbkRQGfriIj/fer3wJ9EAlyVt9dj61OX0Ks8d3Dv9JCljDJKpphHnqmyJz4gV
         FiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786401; x=1690378401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FidzQexKtkouU1qkbBHNf0sLtxCwSpPvwbfWM54cmB0=;
        b=eZNMQUkwzuCW4uW5By3dBIkhAv7JLoW0UDtQhrin3uQFgR9ZjlawUMQC3NynrDBZVn
         Dvv/jMT14F15TjbFpV0SxbzF16HFCv4ngCe6H7ru4sVeWa3lzFvcG6hdI7Pu0ylgCNp4
         zwntN0QzmYt8LXJeBVXMGr4H+o5oeK1yJcstBJlmTZ1qPKwN1kU0lwHGephwodYOI8pM
         a6VUE9Z/33F06LkyP0xeJpdznH/6i5yA7musMgFAigA+Fz/vXlACaBcYdTvIDDmAtKIh
         c5U3CoLGw6fgnZYP7P4bQIphmo84trDxAneJ9yIMQjX0SkflkIljVTHk6ou0amVPcKOF
         vNyQ==
X-Gm-Message-State: AC+VfDz8PgJsx2kNREsgWG6POX2os5YoEPZJDJjvh2HTwrMeBiTD/Jyv
	MXgoNlcQhUH3l92vCj4BAN9OB1s9l2S55g==
X-Google-Smtp-Source: ACHHUZ7OLJkla49oCl5uN2Uwtex8yujUm2wqIuq3/wttBMhdyw5AEjaPvwF0kS9md6UgFIpl6Ll4bg==
X-Received: by 2002:a17:907:9453:b0:987:47b3:6e34 with SMTP id dl19-20020a170907945300b0098747b36e34mr21341537ejc.67.1687786400655;
        Mon, 26 Jun 2023 06:33:20 -0700 (PDT)
Received: from t14s-af.praguecc.cz ([193.85.242.128])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709060f4d00b0097073f1ed84sm3301988ejj.4.2023.06.26.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:33:20 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] runqemu-ifdown: catch up with ifup
Date: Mon, 26 Jun 2023 15:29:26 +0200
Message-ID: <20230626133213.47920-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626133213.47920-1-adrian.freihofer@siemens.com>
References: <20230626133213.47920-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183416

- Drop the native-sysroot-basedir parameter
  still allow it to keep backward compatibility
  write a warning to stderr
- Add a space after ! in the if as suggested by shellcheck
- Support the new OE_TAP_NAME variable as well

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-ifdown | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 78be28812d4..822a2a39b9f 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -16,7 +16,7 @@
 #
 
 usage() {
-	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <tap-dev>"
 }
 
 if [ $EUID -ne 0 ]; then
@@ -24,15 +24,19 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 2 ]; then
+if [ $# -gt 2 ] || [ $# -lt 1 ]; then
 	usage
 	exit 1
 fi
 
+# backward compatibility
+if [ $# -eq 2 ] ; then
+	echo "Warning: native-sysroot-basedir parameter is ignored. It is no longer needed." >&2
+fi
+
 TAP=$1
-STAGING_BINDIR_NATIVE=$2
 
-if !ip tuntap del $TAP mode tap 2>/dev/null; then
+if ! ip tuntap del $TAP mode tap 2>/dev/null; then
 	echo "Error: Unable to run up tuntap del"
 	exit 1
 fi
@@ -56,8 +60,13 @@ if [ ! -x "$IPTABLES" ]; then
 	echo "$IPTABLES cannot be executed"
 	exit 1
 fi
-n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
+
+if [ -z "$OE_TAP_NAME" ]; then
+	OE_TAP_NAME=tap
+fi
+
+n=$[ (`echo $TAP | sed "s/$OE_TAP_NAME//"` * 2) + 1 ]
+dest=$[ (`echo $TAP | sed "s/$OE_TAP_NAME//"` * 2) + 2 ]
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
 $IPTABLES -D POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
 true
-- 
2.41.0


