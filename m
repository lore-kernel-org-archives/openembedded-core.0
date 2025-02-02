Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B54C02193
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 20:04:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.71733.1738526638628684104
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 12:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EwWjTcB4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1986333f8f.0
        for <Openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738526637; x=1739131437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iXAawK8xXd3lwhCmz8Ortq+y5vw1ttwGvIJyy1F1Wo=;
        b=EwWjTcB4rK8qSr2Zu3ic0s2joa/ZboWkdIouEMMqrKlm5EYT4Nvw2SfOunEeka9yWL
         PdkhBKvwYPUKacacr4Zao3giXGnkowg8CoyR0kVXE3a8UFYYW2VqoFuaA+zCga/dslpm
         zUK5tkJYu3eWt4hxFXkPn/38NzsaeFi+M0VOZJ1a4JAYYnEmQunKGciVKf8ztpvdklcF
         v9ILAt+dpd/Hyn6092dsI3XNqNI3gb1Zu4RG5+bk2eXBCkQPHuKflhtN4JBwiIcURyK0
         x963vdPOfwUQQt2YzZcN71EcwTPgCmb66wWEO5jXHK+3bs1eaArWpFIW6rwIw2CHBwC/
         5yQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738526637; x=1739131437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iXAawK8xXd3lwhCmz8Ortq+y5vw1ttwGvIJyy1F1Wo=;
        b=dmoRGJPOQBMWZSk9VTx2I1NQnzpxNoOLtQolBz/43UtY7fGws5dAZPUVi6m36Ca7/v
         Ut8RNpXucD+ReW3XCGkPZNAR/kkt3bayzJFCGuunHN18dlQOmn8zTKZVw/I0+p3fg1Ig
         qQtgz9G5mSa0avH9uoxO0W8gs543FQqZQaMEjfGiUHEOi/YNhLinjKezea0A9WZBcO+A
         v2KVkfnyJUcvKiqqNAYYAUec8lNwEKH/tfgX/WMjnkWH8zjBxIhAal41ITUhJD8F0imh
         TvHSt0LtYEixdB/kUs0O1srpXmV8uaiRnHutpu7v1X90Yb1UG4bTXeTrT0w8BJ79u05y
         lbzw==
X-Gm-Message-State: AOJu0YzBWMPoNYgHRsXQzljVm8JtR6ZjtIENasyNccXvRPpmnw3cCefF
	klV5Ifk8OaqTIdsPAtCuLXrLL+NRNp6AFXBwcEosjIHRx6HdvJnoNf6zko6KNYQ=
X-Gm-Gg: ASbGncu8wSXbNdqEnO4MEYV37Jk8o2WrDyLvk30Ms537n8b+jQQ7olyeypGYRie8KZr
	RZwNKjBqfIhswz8yQvN9F54BKSG1oHHvcYSbd3LJHRVvy3YHyvDo+MJ/AQX+wLqCWmdiGS4J214
	wBUfIj37Ws4r8NSzczG+9xU544fR7LXODTJ7ZdlPbL9q/9TC2fFI7SQDuiqD++4CZD2dQXHOZYm
	a71dJo8b7zxiGbcuH0uqCisF0s2M3efXoD9Jbu3EdBQKUa5prjJBdfPSnaC/aqD9Sd7WiWtKdaP
	32tSmL5nsg9deR/ij6oBu3NwsWOoARPxUk68AupIcv9nOzmfMQ==
X-Google-Smtp-Source: AGHT+IEG6EaGfSaw6hPWvkW00CqU9IMusCjs5uwVUO1hYfdsN425nKBxNXXmN8RZdgUBIIoSnmOxag==
X-Received: by 2002:a5d:5f53:0:b0:385:f062:c2df with SMTP id ffacd0b85a97d-38c519460f9mr13210383f8f.11.1738526636339;
        Sun, 02 Feb 2025 12:03:56 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5d4csm129032675e9.19.2025.02.02.12.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:03:54 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 1/3] bitbake.conf: Add conditional host tool getent
Date: Sun,  2 Feb 2025 21:03:17 +0100
Message-ID: <20250202200319.82231-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 20:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210623

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

In case of systemd init mananger, it's required for the native build.
Even though we don't build systemd natively, we might build some of its
binaries, which need to run on the host system.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b607088c6..6b1bfaf64e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -532,6 +532,9 @@ HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLAS
 # Used by archiver.bbclass when compression is xz
 HOSTTOOLS += "${@'xz' if (('archiver.bbclass' in (d.getVar('BBINCLUDED') or '')) and (d.getVarFlag('ARCHIVER_MODE', 'compression') == 'xz')) else ''}"
 
+# Native build of systemd tools requires getent utility
+HOSTTOOLS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'getent', '', d)}"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 

