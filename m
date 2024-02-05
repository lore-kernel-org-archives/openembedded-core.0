Return-Path: <matthias.schmitz@port4949.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953CBC48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 19:02:59 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
 by mx.groups.io with SMTP id smtpd.web11.2486.1707159776794079737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 11:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0002 header.b=Fe7BZXcM;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0003 header.b=zcXNtm/T;
 spf=none, err=permanent DNS error (domain: port4949.net, ip: 81.169.146.216, mailfrom: matthias.schmitz@port4949.net)
ARC-Seal: i=1; a=rsa-sha256; t=1707159774; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Q2IZ6bG8N8VltrDe30QZgzQBHOkumlRZGi7Vf2bCO3t3LMm+J4oEPoHQqRwczJq4Bb
    Hpq1fasDLg0lI9iVja1rZAfiqzb5c2OputGYtZ88MpwgePWRrwHwwQH6bx1/KcqLyuYu
    MUne6lR/25WQ1PWNrV49n2j2hEHrT7+Q6WlxjiUk8mSybpzyXpu5aYdSZQknTmZl2q8k
    loTGVuLiUBCHgRvJwF5fLJrjHl7P7oIPhKDbJzgtw3dkosS+oYrW+mgppjuyfvSTlhGV
    0txiNMOLu5rObPyvYMy1BSV9HrYQ5n1gXSBtGExQvdL2n1dp2x5W1gbpeUhoJZ0Kctr7
    gY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707159774;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRY+rG7YXBvg2juL6grVHLUhdLJegin7TsH3ceN3pDc=;
    b=RJ6q7Een/Jg08VBimJFJWxIOU1amfSiE4yEEH/JSNGDYvNbyNZaLAfQUJLn1zgrBY2
    9LeanrV6nWgE9lJIAhEsFne8OrvzSyeUQlx7bjoAKjwBmAk3oXdpVm8EUauC0vzh5sAj
    NBqYZr8krpX1Op6Ni7LAJVtohzb5cmC1DwUbbaS7AkiHx84kUuTmSllkqt/XSmR0tnAY
    x48LyBhtbpmBUWObYu0eTS5cnhJP8cPTZ7cvdIgmCaYHgsABDMg8VfgcsgNkolIFOpbV
    0o0MFmdg2+5IBAuCcTxwIiUgiKu+Mbctm2TFyRDIZbMnYT6RpYo7pDY75Jfz2GIXI7Rn
    ufag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707159774;
    s=strato-dkim-0002; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRY+rG7YXBvg2juL6grVHLUhdLJegin7TsH3ceN3pDc=;
    b=Fe7BZXcMobv+hHl2XFFNv+N3hOMNGa9Rdi9uHV3cs603ShbCJ/vHpPEu0o+wjnogtU
    uyBDUA8Rw0JFH0Mssiw2ue3kIY0MqBAIP7l6v6q5kJ24Sxd0el2rD953grP/alZTdxjm
    JOs4yhU1Nc/Sxf4Az8REL1+U6TBsUawlvS94KShP3fuQj8XTyWaC4QtEyNgBVWuxmakK
    /tuDHoozs0hebFZ2TEcs8dB+8HnDNGSSTHzfuBZJZVnTK6qUnS+S5A5kSQi2YifFZTHM
    HOfPPaUi9Kj8NGBmADQPwp8/HbXBc9RQBVzIJGEcVPbeot8EpjN/MQ/TSlEhxX2WOLlX
    7qgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707159774;
    s=strato-dkim-0003; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=sRY+rG7YXBvg2juL6grVHLUhdLJegin7TsH3ceN3pDc=;
    b=zcXNtm/TRMOZHJcX1yDlFvCY5aDFva6FajJV/VDAO7gpPna7sfKHBZMLflvr7TI58F
    WCOsytmqexvlM0Ss2tCA==
X-RZG-AUTH: ":IW0QYUiheuw51NL377CQpY9rhOdPqiHaDnWOhAa9lXFFHfc5g8v4k6+ossVR6Na/qQF1CJ0k4ygOONAp1NKH445E"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.11.2 AUTH)
    with ESMTPSA id mb5cb3015J2rPyV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 5 Feb 2024 20:02:53 +0100 (CET)
From: Matthias Schmitz <matthias.schmitz@port4949.net>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schmitz <matthias.schmitz@port4949.net>
Subject: [dunfell][PATCH] rsync: Fix rsync hanging when used with --relative
Date: Mon,  5 Feb 2024 20:02:23 +0100
Message-Id: <20240205190223.4703-1-matthias.schmitz@port4949.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 19:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194964

Fixes [YOCTO #15383]

This bug was introduced into upstream when fixing CVE-2022-29154. It was
later discovered and fixed upstream but this fix didn't make it into
poky yet.
The added patch is taken from upstreams git repository:
https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf

Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
---
 ...lative-when-copying-an-absolute-path.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
new file mode 100644
index 0000000000..b9bce6957f
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
@@ -0,0 +1,31 @@
+From fabef23bea6e9963c06e218586fda1a823e3c6bf Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Mon, 8 Aug 2022 21:30:21 -0700
+Subject: [PATCH] Fix --relative when copying an absolute path.
+
+CVE: CVE-2022-29154
+Upstream-Status: Backport from [https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf]
+Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
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


