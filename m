Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBDCC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.151023.1703864748981171536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gbe+T6u7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28caeaad2d8so422250a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864748; x=1704469548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhr5KPPB+etvlqj+SgL6ehzUJ+uhE52hSKvRkS+6U1M=;
        b=gbe+T6u7iuX24DW3iv6pW/qx8rDKo12rKqBkiIURSk1qnfhgQVIJBNaYmgUkaexqd8
         J5wxEmSaw+ziuJY/pkNl6eCA3bI4o7zNAVKWZcgNEcGVVg9Z3YmuKSrIKvRHmJPBLSLf
         2ZQAu1/f2pdke7qBDddJISpHn65JPUqbzOIBOw9hPF/ORjBfjxOJ66F4N0fuf4EtFp38
         mhkktEwrrd3RP9qdB1RvEc7Etqd2ZCx4DvJv0fNmfXcdMGlq2WDWmzzqyFXf6p+NyL6b
         0D4R9UQbqxGm9ncc+96fUwk/XPOHLSYL1qALkdjssyYseOEnVh8hMXgeBlRNrmEqy2GE
         YO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864748; x=1704469548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhr5KPPB+etvlqj+SgL6ehzUJ+uhE52hSKvRkS+6U1M=;
        b=e1GNbN2vFwlXdS8sQEO4jwG+RyHfD2rMgZ5vSB8GQqAnqLgH7x4zR+D5tADmM3ZpoA
         dgz2vvFajEeWfi3ZG5SQQpu+j4yqh8eQQK2bk+0HFwnLJvH/VQQWZU8NPwA5HtFvB3o9
         cQlNsFxJGcKiVPoWBqfkjx0IPPo63OnpccwBulJGBAC+9SMsZRgeR4sPR1rjKx5Gk6pO
         UnTysjZdm1ZdJ9ewZxzQ+FIbWg5eq0fvKsYPB6IW8PYjqca3uqTcczW9FEBKEwjoauZ3
         0WjPkYS3aDeLA3caL1McbAu+8W144EALDgdZmmbYIlFTrl441jq10cFaN5mQ5xeX1Pxw
         Ox+g==
X-Gm-Message-State: AOJu0YwQ6XwFn+PtGOnN9D3s4xksRRL7pd5JJpkeMqxZcKbCWDeP70YY
	DJBdhmTWMeBZAp19yXTjts1KBusM6IQLKCxUAGvRTFZ8faimJg==
X-Google-Smtp-Source: AGHT+IGPpWb/SGg9RZvPGAWzZUHwMe57gGtiG7cXiH2A+EY5OLMbbcBDcpDYE98FBhjoD1Y+/79Zvw==
X-Received: by 2002:a17:902:bb17:b0:1d3:f5a6:7d4f with SMTP id im23-20020a170902bb1700b001d3f5a67d4fmr5032903plb.110.1703864748183;
        Fri, 29 Dec 2023 07:45:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 24/41] sed -i destroys symlinks
Date: Fri, 29 Dec 2023 05:44:38 -1000
Message-Id: <7b4343a30a02d8f8664ac4c4bc09e5acfb4fa60e.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193041

From: Joakim Tjernlund <joakim.tjernlund@infinera.com>

If /etc/passwd is a symlink, sed -i on same file will replace the
symlink with a new file. Prevent that by adding --follow-symlinks
option to sed

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6ec004b2e7b4342465af8e5e6cc66041834821a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 ++--
 meta/classes/useradd_base.bbclass               | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 06388b72fb..29ee74932a 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -241,10 +241,10 @@ read_only_rootfs_hook () {
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+		sed --follow-symlinks -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
         fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+		sed --follow-symlinks -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
 }
 
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 863cb7b76c..f1a7a9695d 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -160,7 +160,7 @@ perform_passwd_expire () {
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" != "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -follow-symlinks -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
 		local passwd_lastchanged="`grep "^$username:" $rootdir/etc/shadow | cut -d: -f3`"
 		if test "x$passwd_lastchanged" != "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
-- 
2.34.1


