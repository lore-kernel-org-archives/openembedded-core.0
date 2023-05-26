Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29005C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 13:07:54 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by mx.groups.io with SMTP id smtpd.web10.7456.1685106468044951854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 06:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@suse.com header.s=susede1 header.b=lebouY9a;
 spf=pass (domain: suse.com, ip: 195.135.220.29, mailfrom: aplanas@suse.com)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1471B1F74A;
	Fri, 26 May 2023 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685106466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KbKMxOyfk2SWwt61c6ZCGw1x7w3c/6x4vsNBaYKkBNk=;
	b=lebouY9aBzXA6b/j+gg90TKKj3d4+zaOvwPjUvObS1L3JuqbBO2lKKpIUNdloez53beWwE
	2N6qkIeugC1mYnYLdQjj0xdnocKiqJREnhjl8iI7Dl8OCeqaIo/7ZQcr1plvHREbUAiSpc
	pkwrcJrWU/SecdKrTfn0Nqxp3lXpECc=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C0C0213684;
	Fri, 26 May 2023 13:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id BP6CKyGvcGQgYgAAGKfGzw
	(envelope-from <aplanas@suse.com>); Fri, 26 May 2023 13:07:45 +0000
From: Alberto Planas <aplanas@suse.com>
To: openembedded-core@lists.openembedded.org
Cc: Alberto Planas <aplanas@suse.com>
Subject: [PATCH 1/1] rpm2cpio.sh: update to the last 4.x version
Date: Fri, 26 May 2023 15:07:42 +0200
Message-Id: <20230526130742.28754-1-aplanas@suse.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 13:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181767

openSUSE RPMs are compressing the RPM payload using zstd, that
correspond to the magic ID 0x28, 0xb5, 0x2f.

This patch update the script to the last version from the rpm project,
and add support to this compression format, and extract the cpio payload
using the "unzstd" binary.

Signed-off-by: Alberto Planas <aplanas@suse.com>
---
 scripts/rpm2cpio.sh | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)
 mode change 100755 =3D> 100644 scripts/rpm2cpio.sh

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
old mode 100755
new mode 100644
index 2034373fe4..8199b43784
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -7,7 +7,7 @@ fatal() {
 }
=20
 pkg=3D"$1"
-[ -n "$pkg" -a -e "$pkg" ] ||
+[ -n "$pkg" ] && [ -e "$pkg" ] ||
 	fatal "No package supplied"
=20
 _dd() {
@@ -16,14 +16,23 @@ _dd() {
 }
=20
 calcsize() {
+
+	case "$(_dd $1 bs=3D4 count=3D1 | tr -d '\0')" in
+		"$(printf '\216\255\350')"*) ;; # '\x8e\xad\xe8'
+		*) fatal "File doesn't look like rpm: $pkg" ;;
+	esac
+
 	offset=3D$(($1 + 8))
=20
 	local i b b0 b1 b2 b3 b4 b5 b6 b7
=20
 	i=3D0
 	while [ $i -lt 8 ]; do
- 		b=3D$(_dd $(($offset + $i)) bs=3D1 count=3D1; echo X)
- 		b=3D${b%X}
+		# add . to not loose \n
+		# strip \0 as it gets dropped with warning otherwise
+		b=3D"$(_dd $(($offset + $i)) bs=3D1 count=3D1 | tr -d '\0' ; echo .)"
+		b=3D${b%.}    # strip . again
+
 		[ -z "$b" ] &&
 			b=3D"0" ||
 			b=3D"$(exec printf '%u\n' "'$b")"
@@ -35,7 +44,7 @@ calcsize() {
 	offset=3D$(($offset + $rsize))
 }
=20
-case "$(_dd 0 bs=3D8 count=3D1)" in
+case "$(_dd 0 bs=3D4 count=3D1 | tr -d '\0')" in
 	"$(printf '\355\253\356\333')"*) ;; # '\xed\xab\xee\xdb'
 	*) fatal "File doesn't look like rpm: $pkg" ;;
 esac
@@ -46,10 +55,11 @@ sigsize=3D$rsize
 calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
 hdrsize=3D$rsize
=20
-case "$(_dd $offset bs=3D3 count=3D1)" in
-	"$(printf '\102\132')"*) _dd $offset | bzip2 -d ;; # '\x42\x5a'
-	"$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
-	"$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
-	"$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
-	*) fatal "Unrecognized rpm file: $pkg" ;;
+case "$(_dd $offset bs=3D2 count=3D1 | tr -d '\0')" in
+	"$(printf '\102\132')") _dd $offset | bunzip2 ;; # '\x42\x5a'
+	"$(printf '\037\213')") _dd $offset | gunzip  ;; # '\x1f\x8b'
+	"$(printf '\375\067')") _dd $offset | xzcat   ;; # '\xfd\x37'
+	"$(printf '\135')") _dd $offset | unlzma      ;; # '\x5d\x00'
+	"$(printf '\050\265')") _dd $offset | unzstd  ;; # '\x28\xb5'
+	*) fatal "Unrecognized payload compression format in rpm file: $pkg" ;;
 esac
--=20
2.40.1


