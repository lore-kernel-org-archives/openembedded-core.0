Return-Path: <matthias.schmitz@port4949.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5769CC48297
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 13:55:57 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
 by mx.groups.io with SMTP id smtpd.web11.62907.1707141352936584967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 05:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0002 header.b=IMNQ81/i;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0003 header.b=NYkgHcef;
 spf=none, err=permanent DNS error (domain: port4949.net, ip: 85.215.255.21, mailfrom: matthias.schmitz@port4949.net)
ARC-Seal: i=1; a=rsa-sha256; t=1707141350; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pcU4LjGZEmxWig6XoYMsGmrq/v0ZFBj3XVD1zhTwT5b6fAHqdqbRhEgx/rRJu6ZQRh
    yMWp6fQ8+7mHddUufJXB3pq7zeB/Qk1ANuL4pv2MgAxlBANFsVPsPbHU5Zcw4ZTH200N
    4l7exgVXXopNOLjPZaSfUZ5oLEqVs2htlKerdPOZ/wPpMBCyCKNURuZ83MYECHfCrfOH
    hop7gOHXK/aToQUequGUnizk+12M25GP498RPm00H3EOYXlxFFxmlggSeDhv+iONJ456
    hjJqliSpz8f6JltjdjVMAsnfSYKn74gKAWPs2WbmWiQevettdCTuTafSIRgvHEC48x60
    uBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707141350;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=LtiM2mKnz+TQEUv/Q4hvR0enw13YaBQZM7h3CDNBDm31OEtFe8XZBOMEybjc2BGR4P
    mg8AnbTDSRMLaYpitWln3KlQVfjKKxT7ZiVJM6fqJzS8vaGgmkJ9no6Wnepn8WhE8JhG
    ULStZsCRih2cbnPxKjGwioLr1yk9OydHBV5kfFhIplhDeDavdk18ywv9O8sW3RS4wu8e
    veh8I9zFj/a2O7UWt7VstTVen8mAO/fZZao/9tPXyD+goNTsM/BAFbN3gbOVyGdtRTRE
    QXbXu09838y8UA97PK+01JYNRukooUTRuPGAAw+vkxmsiUFM8rMvcI0MNAbsQ5M7eX4t
    9zHQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707141350;
    s=strato-dkim-0002; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=IMNQ81/i21Vf3oX16daz8TYK6DEYa+mG91DtnaZxZAay/OVZCLKCl8Z6/R/tZrgfEI
    JEXqR5k0Vn+liNyk0441oKhvu33F4TBju3tiJmJubUF/cQcNmGNrpRNr3VX5/bZO1hD5
    dwvklJxntIOtmuB08Yu3hwUkrvWU5iN8mmaC0JS6uzjixeZAkcELRchWwV8S739smR1A
    26Pgzu0z1s+Ridup8YrbDc1LZgFb58NXKqq7VxLj8NecZAoWZEnqlGCN2Zb6fUM3BRsE
    YZ/Z2jM8DG40pfGLwG7k/lWT72QR2d12y045SeEP6QUINhXiYW2P4bYLl6R0xyA9VLqt
    95GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707141350;
    s=strato-dkim-0003; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=NYkgHcefLz2xAreV3OtpmSMPJX40nl4fGWCQsX7rxLU6hDz7DXPxe1uxUnclVu8cFp
    KBm+vx1ySwFMGR/r2ZBw==
X-RZG-AUTH: ":IW0QYUiheuw51NL377CQpY9rhOdPqiHaDnWOhAa9lXFFHfc5g8v4k6+ossVR6Na/qQF1AZE//CBZ7BVbweYzWYcZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.11.2 AUTH)
    with ESMTPSA id mb5cb3015DtnMzt
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 5 Feb 2024 14:55:49 +0100 (CET)
From: Matthias Schmitz <matthias.schmitz@port4949.net>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schmitz <matthias.schmitz@port4949.net>
Subject: [PATCH] rsync: Fix rsync hanging when used with --relative
Date: Mon,  5 Feb 2024 14:55:28 +0100
Message-Id: <20240205135528.45112-1-matthias.schmitz@port4949.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 13:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194935

Fixes [YOCTO #15383]

This bug was introduced into upstream when fixing CVE-2022-29154. It was
later discovered and fixed upstream but this fix didn't make it into
poky yet.
The added patch is taken from upstreams git repository:
https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf

Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
---
 ...lative-when-copying-an-absolute-path.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
new file mode 100644
index 0000000000..ccfaf8463a
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
@@ -0,0 +1,28 @@
+From fabef23bea6e9963c06e218586fda1a823e3c6bf Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Mon, 8 Aug 2022 21:30:21 -0700
+Subject: [PATCH] Fix --relative when copying an absolute path.
+
+---
+ exclude.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/exclude.c b/exclude.c
+index 2394023f..ba5ca5a3 100644
+--- a/exclude.c
++++ b/exclude.c
+@@ -434,8 +434,10 @@ void add_implied_include(const char *arg)
+ 				*p++ = *cp++;
+ 				break;
+ 			  case '/':
+-				if (p[-1] == '/') /* This is safe because of the initial slash. */
++				if (p[-1] == '/') { /* This is safe because of the initial slash. */
++					cp++;
+ 					break;
++				}
+ 				if (relative_paths) {
+ 					filter_rule const *ent;
+ 					int found = 0;
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index a5c20dee34..c744503227 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2016-9842.patch \
            file://CVE-2016-9843.patch \
            file://CVE-2022-29154.patch \
+           file://0001-Fix-relative-when-copying-an-absolute-path.patch \
 "
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
-- 
2.39.2


