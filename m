Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C10DC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:33:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18743.1784626380420750065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J2T3/bDA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495437bb891so38850225e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626378; x=1785231178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYJ9PWHw7amnZQhZg0udVUVylnauhvsJEokDHFcPyJs=;
        b=J2T3/bDAF3fGRMYpJSGxDbmhGrm5I6qyZ2Tbh6bVEgsm0ixQPukROg2NUQNL+5W13S
         ZenziCkROXLdpWLMSDtACygsNBGDBk6QRruuUdt4n8znXeCK5tQ7IhSHy8C6K821XJtc
         qCQ4+feHKUd3yV7HEUBufAWuPtQtMtXu1wV/P3onTh9oyfT9cSTszWLdn9hz4A7KbKgD
         ghCIdsu0aZ+++BHXtP3v+E3pSnG0bd8WVIlsXrLc4hxZZ7t9icVFPa1KzPfjScz8pyTO
         79gm6s/rimUeEbgmejJMEz2w0B1L8M2o0uZkEE+SBzgooQHF4ZY2yHOcwDjIXmm2DtC5
         wB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626378; x=1785231178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYJ9PWHw7amnZQhZg0udVUVylnauhvsJEokDHFcPyJs=;
        b=PoMYLpVvVFUn6CVKZVS5SMnj92ns2EY2FO0l2WJTuGeSGv8oteP+JtJiworfPIfY+k
         r4BG/eH4vg+doEW43vwxyC+PvqADY1d/YeNWvfR+nV4TolN3am4r9BHkAhhWEykvsAZG
         cdfNcGhlprmIMIiZWDF2wabX+ul5/SxKo5D/6vEetfczbXwrN396oZaAs8fLNuODjcya
         7Be9Ydnqnm07j9uM7UQMhrZxjR4bL/nNpDTUqUX8TmhZC0vNU4lVi9zwoVjhONYJsWch
         Wym44rb8hwh/csJl0+kL1zF2TM98Bys91gG4p1ZaBpwDPStrieYWJwBScBlZJTfameXC
         qyBg==
X-Gm-Message-State: AOJu0Yy9VmU5oGIVidqgd5bdMi629FhFXi4JR0ZQbBDQkPUaftVj5hjh
	DRS2vUgZO7rHjhVXmOWEMipMtZueAvNTacMg5k4o8/Zq+XVQib8EhTXRZs9dGnqO
X-Gm-Gg: AfdE7cn/y/ZCgY7I4lN9LtNzIuIxfrkp/fqv+oyvdU07oA9fizxlSULzSrPLQXArOgH
	Ch0p6DASwHB6RvJb6DFJL9KKgz/96qShyaO/V+QJtTXRmZV/t04TnvVKGBZlw+My4eYExX1yloH
	u/DUfq11Jk94ow4QmnjA4F87EdPTFHFLN59BJ1I04v23h6u6D33ngkvkwhMMLAGf69QwJERkbbh
	Ez1O3cR6hi+yqCVNZX+JbOWJnQvOFZnMy3yChcqOjfjsRoUBcZRxyNv9jM6FCY76hbqiX9ZuAfm
	syNGV0WZHMzEsOrRQoNlnkzq1MKTZqSuBAgIqRTS6Ff2nuPyQt/0uAYdc+SaBr/ORQGXJJyl5hL
	5Ddm6QsxFTmif/gPd5yJh2VaP150Q2hOCT0KvOVhYXXvlM/EoNmorhKoMWtqAH1IJ6ErNPoDw7d
	DGpPcZ3QDjJMnpJxCXkAeyshuOVuGpd070hbK5h7S99G1pAAXgf7owJckWFFc4
X-Received: by 2002:a05:600c:3b88:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4954a3391femr197690975e9.12.1784626378217;
        Tue, 21 Jul 2026 02:32:58 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed2314sm1507466f8f.23.2026.07.21.02.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:32:57 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/2] glib-networking: update LICENSE for openssl PACKAGECONFIG
Date: Tue, 21 Jul 2026 11:32:50 +0200
Message-ID: <20260721093251.2697077-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241514

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
glib-networking: LICENSE is using an old syntax and should be upgraded to: "LGPL-2.1-or-later AND LicenseRef-Glib-Networking-OpenSSL-Exception"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.80.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index 3d47e354e2..d81d7d75e9 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
 LICENSE = "LGPL-2.1-or-later"
-LICENSE:append = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' & Glib-Networking-OpenSSL-Exception', '', d)}"
+LICENSE:append = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', ' AND LicenseRef-Glib-Networking-OpenSSL-Exception', '', d)}"
 NO_GENERIC_LICENSE[Glib-Networking-OpenSSL-Exception] = "LICENSE_EXCEPTION"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \

