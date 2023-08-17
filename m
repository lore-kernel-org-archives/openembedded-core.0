Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E5C05052
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:26 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.178875.1692240624761936230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Gvgg8EJ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686bc261111so5201348b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240624; x=1692845424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwwFMPeS8VZ06Jrs//ZUTZdOPTKRZh93wUTnuISWKuY=;
        b=Gvgg8EJ6+VoGT3fWUE3NclaxTzLk1xOenpnSdxQh7pCvQmz91TVbICLFaeLG97Amv4
         r4Gntj4good9ZhlcQobyTHUWnbgtyKGDA/VnhA95tyGxDRXpoH6PGagIX5mtGXCHZpIh
         DlBI7BGQKYEMsk7fx6pfCzRydNO9WnluiuL1alfgUZ9UvEFoViiJtD2PB/oJ4JZ9DFyJ
         +9J0n+ZF0Bi2z83FtyPG/SAuGJUMZRqW9oGwIpcUdPAuw4VUwLeoUGx5p/VE8fhUGsEJ
         5LqPZDqGtgHKLm6cAlm3wuERgtUOKpKdXi5SVYQ3cl8LzZmSFEt0iKaxy05tXfLnla3o
         sS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240624; x=1692845424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwwFMPeS8VZ06Jrs//ZUTZdOPTKRZh93wUTnuISWKuY=;
        b=YsIM9DrLiKviSAe1twb3gRcofzSO9ANjsI5a/5iDKkR9QdvswZsgnYqMGSlgDPlOiz
         e6tLjK72BdfFa5Y3XG2aqCVqeBlbSRlYhlDDCDTNjXPVrfExvuJJDcJnYAslxvY+iTh3
         HMEioWkH67UvhtfDTI2IjFIiAYi4J9rLiqP3LzuEapRCWqpK3zkd+ApMjwT7F/GiOfP4
         mPsehfnXqp4c439crnDT/Vl+t6P7isg9S9P2PFwt0+SoVdu0bIoM7vBNf1u9c4GPzgF7
         Miyg6sm1OCNNX7b3AnOzRKOSD8ZNNryeBNyWTcz2+8FuKNQzRONzPPZGXi1tFai+kAA5
         qFIQ==
X-Gm-Message-State: AOJu0Ywbv6C2B9MB3UczlG1qvFfHmLbuYFc6q3RUmj6AJG+OKALOH+BR
	rn5mnutVyw/poez6lBilbLtDkog7PoFqLInttPI=
X-Google-Smtp-Source: AGHT+IGkktIzJWD9IWZf6FwbwNI3nSFeK1B+41QWmFvgLiYh45MmijfDSneJSRVuZt1E7QROqtNeJw==
X-Received: by 2002:a05:6a20:144d:b0:126:f64b:6689 with SMTP id a13-20020a056a20144d00b00126f64b6689mr4670889pzi.12.1692240623877;
        Wed, 16 Aug 2023 19:50:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/16] rpm2cpio.sh: update to the last 4.x version
Date: Wed, 16 Aug 2023 16:49:47 -1000
Message-Id: <9c0d66e693aa7ab8b3f2a3c68764e4ab6159c085.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186280

From: Alberto Planas <aplanas@suse.com>

openSUSE RPMs are compressing the RPM payload using zstd, that
correspond to the magic ID 0x28, 0xb5, 0x2f.

This patch update the script to the last version from the rpm project,
and add support to this compression format, and extract the cpio payload
using the "unzstd" binary.

Signed-off-by: Alberto Planas <aplanas@suse.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3aba44a75dd565b192f7328f2a0150a313de3cc1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/rpm2cpio.sh | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 2034373fe4..8199b43784 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -7,7 +7,7 @@ fatal() {
 }
 
 pkg="$1"
-[ -n "$pkg" -a -e "$pkg" ] ||
+[ -n "$pkg" ] && [ -e "$pkg" ] ||
 	fatal "No package supplied"
 
 _dd() {
@@ -16,14 +16,23 @@ _dd() {
 }
 
 calcsize() {
+
+	case "$(_dd $1 bs=4 count=1 | tr -d '\0')" in
+		"$(printf '\216\255\350')"*) ;; # '\x8e\xad\xe8'
+		*) fatal "File doesn't look like rpm: $pkg" ;;
+	esac
+
 	offset=$(($1 + 8))
 
 	local i b b0 b1 b2 b3 b4 b5 b6 b7
 
 	i=0
 	while [ $i -lt 8 ]; do
- 		b=$(_dd $(($offset + $i)) bs=1 count=1; echo X)
- 		b=${b%X}
+		# add . to not loose \n
+		# strip \0 as it gets dropped with warning otherwise
+		b="$(_dd $(($offset + $i)) bs=1 count=1 | tr -d '\0' ; echo .)"
+		b=${b%.}    # strip . again
+
 		[ -z "$b" ] &&
 			b="0" ||
 			b="$(exec printf '%u\n' "'$b")"
@@ -35,7 +44,7 @@ calcsize() {
 	offset=$(($offset + $rsize))
 }
 
-case "$(_dd 0 bs=8 count=1)" in
+case "$(_dd 0 bs=4 count=1 | tr -d '\0')" in
 	"$(printf '\355\253\356\333')"*) ;; # '\xed\xab\xee\xdb'
 	*) fatal "File doesn't look like rpm: $pkg" ;;
 esac
@@ -46,10 +55,11 @@ sigsize=$rsize
 calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
 hdrsize=$rsize
 
-case "$(_dd $offset bs=3 count=1)" in
-	"$(printf '\102\132')"*) _dd $offset | bzip2 -d ;; # '\x42\x5a'
-	"$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
-	"$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
-	"$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
-	*) fatal "Unrecognized rpm file: $pkg" ;;
+case "$(_dd $offset bs=2 count=1 | tr -d '\0')" in
+	"$(printf '\102\132')") _dd $offset | bunzip2 ;; # '\x42\x5a'
+	"$(printf '\037\213')") _dd $offset | gunzip  ;; # '\x1f\x8b'
+	"$(printf '\375\067')") _dd $offset | xzcat   ;; # '\xfd\x37'
+	"$(printf '\135')") _dd $offset | unlzma      ;; # '\x5d\x00'
+	"$(printf '\050\265')") _dd $offset | unzstd  ;; # '\x28\xb5'
+	*) fatal "Unrecognized payload compression format in rpm file: $pkg" ;;
 esac
-- 
2.34.1


