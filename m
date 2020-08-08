Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.6607.1596898313558073276
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 07:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jiYJM2Bt;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j21so2495569pgi.9
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1JYw58wIJVu3BafCvKkg3ojiOGwwDS934/HdXJOXaIU=;
        b=jiYJM2BtfPjfcUmYylMwp+CrIuhenEs7XwbTX3CTOxrG9s3pvyM6n+vzcN0AMb7atO
         kiB/01Wf1SckShx8qYcNMjMxWHaG8QkdrZhXIM3ll8QxyLBQuCln5eSq9rI7PwjiKuYM
         DvI1GbuavWE9/whmlSaJJ3o133JF0p/8cXLks3vNdiMQfXAzIcUdX3DDmLAogNxWZcgG
         bNMEZWpKWW7QPFCSZvENEKHf6QmniHhSIR+LCKwYTx8ICgk7WGDeQFtghGEnkP4+scty
         hPpbN+vUECLFvi/O2woe19TKbsk2DW6GzzrWXOaOJ1PtZcPfrpae0pN8MZZzCCbZ2f4V
         5jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1JYw58wIJVu3BafCvKkg3ojiOGwwDS934/HdXJOXaIU=;
        b=GnfGevmV+CeaEs4gURc0ks6EbDZi9u1GJ1d2GjizlChoiLxhnK62OEyUoVS+EXZZXK
         XRXalLSIoQjLFEnHhm/DAEzaqbNZJ1cxS7eT1JwVg49d6khLKDAErjWgfZ+xo+DX936F
         IHLJOXD8Ep9FSrdN0PK2OhRbck/CIrA0KBkjXjVjcNJJ3LkkvYLbx8K+sutgP7XwPQIM
         9QbtyjMr8rjIi0Y4IfSamMOtFYD2ekxy0t15alNrRTQCRClGyFOEo/+BrKfhE/VCMJEi
         RuDTahK3REfVQdCad/zjf2mmOvctv654l40qxav2dEqtQszGQVkhkCX7Jyvh1NMNs5U3
         EifA==
X-Gm-Message-State: AOAM531RqrKiS6TWtNY2Xm+paKz4BvwIM9nX2goXEBN0R/fh7nGvLOrX
	IY+nFSDLvMEKHXnAXV1+mCsBwAHi
X-Google-Smtp-Source: ABdhPJxj6UOjRMRQiuPlSezwwgph/RJ7sIV21AeyH5iiSGgymEu8VQlolFcLyPxyVGOgNrKDETeSeg==
X-Received: by 2002:aa7:9ecd:: with SMTP id r13mr17031053pfq.317.1596898312811;
        Sat, 08 Aug 2020 07:51:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ddd8:1d38:7eb0:693c])
        by smtp.gmail.com with ESMTPSA id u65sm14582643pjb.22.2020.08.08.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 07:51:52 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [zeus][PATCH 1/2] pypi.bbclass: mind package suffix on version check
Date: Sat,  8 Aug 2020 07:51:49 -0700
Message-Id: <20200808145150.12949-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Konrad Weihmann <kweihmann@outlook.com>

Some pypi packages do have suffixes like dev, or a0 or b1.
When doing a version check on these, the version will get falsely
identified as major release versions.
Add a terminating slash to rule out those false positives

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 0603f6d9f2abfa67b99b1bc39228f6aa16a0370d)
[Yocto bug #13990]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index e5d7ab3ce1..ffa8aa3ff4 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1

