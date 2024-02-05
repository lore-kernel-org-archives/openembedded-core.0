Return-Path: <matthias.schmitz@port4949.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC1EC48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:49:37 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
 by mx.groups.io with SMTP id smtpd.web11.64234.1707144568217029834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 06:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0002 header.b=fqh0lZdR;
 dkim=pass header.i=@port4949.net header.s=strato-dkim-0003 header.b=uJ+nc+Az;
 spf=none, err=permanent DNS error (domain: port4949.net, ip: 81.169.146.217, mailfrom: matthias.schmitz@port4949.net)
ARC-Seal: i=1; a=rsa-sha256; t=1707144565; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UQ2hM3KkKRBYdxmMGtikq1ZVE4f77IMFw3U7Km87yD2sagHuuJiBFx0sB0IC1fx3jP
    4dwmwftYAKKbNS/2f7ZqSkmtVvcvR5IWZHcRxUnU6ZOMcBVWgiBfC/B+Wu32pyEV94eY
    4JO2BfJ1gmKidkI3vyKjTleMHuCqJeVC1DJYUpuygpHxOEt4hKvMdedwLtA3pEQAztm7
    j9arCNEyXuxHgc+80ktZ5BeOvVtLd8yuduDzQQxaDOfc8wvQrLzADzw7L6rLeDv6/GFF
    Aa6940Id2zSKlO29rGpOvsttMdGqt4IezUgpFBxK+W3IHesIGOIXrb/xGcUmsann1Ork
    AJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707144565;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=N5C87/G1aZ+YreCEawrVSbxlSR+d919UYWyTJkK0wB/FP0QCefYYyMIWvwH7bIhOBZ
    oTQSAbO6hDaNJaHt48zZ7KYMZow9Xga/NSJalallA7MPPECjHP5R+8gTogwwTqz4qc5B
    Og0nrMmj4KU97v9qEuV7ft2bpbIt7GKRo0TaZMT7cMDI7enRPwWWf4qtrYflMCVMm939
    +L7JkJR8P0m2unB8poHL4AmBHEmNWFgqe9x55DjKDByDuUV3TMzfWw2YUlPT0rrTzVc5
    7y8jOeV1CpOQZTp5x3OCnK7lztOTKRqulqQqgVmWhCfhM23vIyi+J072xrx0/ALrOfoo
    wVxA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707144565;
    s=strato-dkim-0002; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=fqh0lZdRMcAAmcCUUq/NCap+sKqgSa3VrYJuOMHKpIBERif+iI+u1T3O3wJYwsU4O2
    oeCDlAIqHWwX8k9O3IcUQBk/zB4AyxsjxnVuV8iCV06BRrmacQLGFvX9+FkOiozZHs3N
    dVTuQIzLWw4I0hFKbf/3jHvs1+p8Wf3OzaG277XjuOEax2vLjut77cYwPi1djZq0lt1w
    isneJbluiGNaKnrCPGXyXR+69CFtQe3tLTOD4DjAL4h1lZvSissbDdHlJNPwAUJC1pxn
    VBXqrFczEk/y01QOY9Wu7LjNxwTm8C+iRORduYR9atK22fYXRq5Ybmt5kragtwKclimQ
    NDgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707144565;
    s=strato-dkim-0003; d=port4949.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TYU5KwE/ib2cxLMB3LAFk+3oOX115q8aBNcgxVBXVbo=;
    b=uJ+nc+AzqZZT09jt+9hlmkD57QToy8cZiB4LWgb8uo8no3zhKRg78RfmJAkmuO9nwP
    kM0Sd8EDGCGGLuIFD7Ag==
X-RZG-AUTH: ":IW0QYUiheuw51NL377CQpY9rhOdPqiHaDnWOhAa9lXFFHfc5g8v4k6+ossVR6Na/qQF1AZE//CBZ7BVbweYzWYcZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.11.2 AUTH)
    with ESMTPSA id mb5cb3015EnPNZR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 5 Feb 2024 15:49:25 +0100 (CET)
From: Matthias Schmitz <matthias.schmitz@port4949.net>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schmitz <matthias.schmitz@port4949.net>
Subject: [dunfell][PATCH] rsync: Fix rsync hanging when used with --relative
Date: Mon,  5 Feb 2024 15:49:05 +0100
Message-Id: <20240205144905.49995-1-matthias.schmitz@port4949.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 14:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194943

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


