Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.11808.1613755215609799235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFDL2Arb;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: zbodek@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id v6so23759643ljh.9
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YuH8M8yRGvbfIy94w/P6snHz62xRIpjQPJeXqji0fcY=;
        b=uFDL2ArbKwjllP65Xy9W7MBhrXg7wYxw8qdmJIcSQ1EJAhwfh01OhR/hW0/1CQijhK
         xYPX11U5ZjksG5UJPZlLMTSVjXqDIcxzkHVrJ6OqWYC4qE7RUNVDX5wULoCO6N73mXW+
         aSl7KmnkGSV2lqOfhIrJeIq4fUWsqfVdWYfvtd3oKfV1dNrvTHUU8ZytYSvSUC/JyIyi
         7siZ+rDu+xfy+8gZXeokO45/n9e/UbDGpI0VMTFCjTFc+aFJSj921+CLAGaigMbZAL9o
         hBDYAItC+nYRFeBPbGmMwwFg8mA9mHnN3FEmLHmqw+OuWoSKZYVilIv9ouvhtdhTctST
         /lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YuH8M8yRGvbfIy94w/P6snHz62xRIpjQPJeXqji0fcY=;
        b=JhN9hU72hTcRsyj4u6nHF3ri5UBzfTXYx1oBvIBKY9CYAUfNlndJSyhI/OpDCixpJc
         LOifBemUqdl9t5KubKofygkQ165HXycjSa4pC8xLYVASx7H33T/434Ml4HA3WUX884AZ
         9Q+a3fo3MG27UcarAxRCL/sZWdEqTuN/pWhzu1XlEinmUGaY1oEk5sUhwhM2LEte4bTK
         as6sI+85OwPz/FB6/EHyyzyP7lp5rmoQ9P5ICYVrjlP69fDo3okC77qs5rj1VgMsQTs8
         wIJyLU/TRaTHcXWOFJx9On35eZlfuGQCzf6OxPXMantZJVesbEoe2sSIVqRUHt3zYINY
         Ao7g==
X-Gm-Message-State: AOAM532X8Ut6DLu9dnF+3QiVAKnENBF0VNeVfhGeG3kRT18yoBRPazOQ
	3b661YUw1ozINPYeJouBaoQFFV4l2KHfwg==
X-Google-Smtp-Source: ABdhPJxTlnbkYVxsQ5VHs/PP7jzGr/gx4uHSBgXbs+8+PzM8nUyJ2eo2EDx/dZzgp1WPh6LBRTTMmg==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr6379334lfg.559.1613755213250;
        Fri, 19 Feb 2021 09:20:13 -0800 (PST)
Return-Path: <zbodek@gmail.com>
Received: from localhost.localdomain ([2a02:a311:8043:f180:65af:147a:b388:6975])
        by smtp.gmail.com with ESMTPSA id q5sm981042lfd.202.2021.02.19.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:20:09 -0800 (PST)
From: "Zbigniew Bodek" <zbodek@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	steve@sakoman.com,
	andrei.gherzan@huawei.com,
	wojciech.zmuda@huawei.com,
	Zbigniew Bodek <zbigniew.bodek@huawei.com>
Subject: [dunfell][PATCH] wpebackend-fdo: Fix missing .so symlink when using dev package
Date: Sat, 20 Feb 2021 02:19:54 +0900
Message-Id: <20210219171954.7005-1-zbodek@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Zbigniew Bodek <zbigniew.bodek@huawei.com>

Problem spotted on dunfell-23.0.4

Normally, unversioned .so is removed from -dev (default) package
however it is still being referred by other agents, such as webkitgtk.
That can be observed while executing i.e. Epiphany Browser.

For instance:
platformInitializeWebProcess()
calls
wpe_loader_init("libWPEBackend-fdo-1.0.so")

as a result one can see:
--------------------
wpe_loader_init could not load the library 'libWPEBackend-fdo-1.0.so':
libWPEBackend-fdo-1.0.so: cannot open shared object file:
No such file or directory
--------------------

"master" branch contains a bumped-up version of webkitgtk
to which this issue does not apply (the code has changed).

Forcefully keep this .so symlink to resolve the problem in dunfell.

Signed-off-by: Zbigniew Bodek <zbigniew.bodek@huawei.com>
---
 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
index cd2f7fabda..165fc74dde 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
@@ -15,3 +15,6 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
 
+FILES_${PN} += "${libdir}/libWPEBackend-fdo-1.0.so"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} += "dev-so"
-- 
2.17.1

