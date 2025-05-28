Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2558CC5B549
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:11 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.945.1748446445612862240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SpNVQHRF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742af848148so2778157b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446445; x=1749051245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8G9D+nn+L87yB742U0/QxWb1Baung0Eh39N5WvxCG8=;
        b=SpNVQHRFMILZHf+nJFDBWok9ZjvLfStrH8J5l4VMBTl/hdAuZfAkEZfF22jLBTinM9
         5KnySGgfveHWoX+cbi/CNvp+DjzMazrSrtFUNg83AD96+BiN6W3r38jtWYtQYQjGnBiS
         3zbRmqJPnmiqOM70wyYFlx6enJNvmeEX+uEuODZdNPrGbNVhOX+QBeb/C1m7//RVRlW1
         lcS9TLppVdG5xk0pAdWREYgnHxGWf3MauT6afOrku2mpaAKgTWPR4QQ5nWBXsUrv4Q0W
         AIfb2dssGOwhvmw9KF0qJeYenVvtbwiOBx83lzt5DcvgcIxYehBiet/BmondKS3FBPUL
         UgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446445; x=1749051245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8G9D+nn+L87yB742U0/QxWb1Baung0Eh39N5WvxCG8=;
        b=OEft41NlpzmhS9S/obKndH0TXxiXz3OGUZmBvkcWUSQIu+/U0Q+19Mgy6NwWvgeFWr
         yIMKRo7rAux5U8km5f2WbG2lbWLo8BX7D4f8GYL/L5jqHLWyOBsjcFsm6Iqf+AeuvyXy
         GutjwlhvpJ5SXa030hFavZ3kqGetQVFS5lLSY3qPy/Rd+8LCNY1Dta2Mxs0TvMEDTFf9
         9L5O/LKv8eHc90OIJnZ8QxZKIeTOEE7E29b4mXtbRAx3tW1UustsR7zp8EnoFlHvZ4vc
         CtboP0Lbdz4l8LXnf27FW1DdVrreXIoZO+R0htvmU6ruiWwThSY/o8rP+InmRCYdUFcR
         bLKw==
X-Gm-Message-State: AOJu0YyOxEsWxLmi4UrAr+WwmHzXpMDHzkciYJ3LNMIWoxNWMNdP6in3
	nKHZdHJnlv3SkL+/WHWLsfPGs1MMtItaiHjnyZdx5QSmuWgyLNqMmJd+yRcZbLXRQm1wQrTbuh9
	GbbEP
X-Gm-Gg: ASbGncsijA+RwLFpQeBB8TiWFJBli1wdffa/qesZKcx4ArrYyicaS/BjmBRV4nCYeZL
	/rL9x9ovBYTg6Hj5bA9lye+0f0fhtnraMFyA5p8cQ36sFLLbRk/MfrmEsgfQzDNobzbNvbrjO0K
	2L788UJGXYsdMM8qUDntUXaZRnHmyeD3N4++oMYX4rUWJea9I9QFkCBgU5X9k0YssUmGWsKCwmf
	FqmfV4RNVEeaJU8zrzs4OAB6oezadX76KM9ypiYSsycR3QXyUNP0TmH2ZFdlFBi8ZonokD3HJdF
	NZeFycyU1dUBAeM9Sr+wT8YjE3Dmpj3EdtXM2NlDPC8=
X-Google-Smtp-Source: AGHT+IEXReyzMWBgQXH0luXWktFQsvJV9ZE/q+tV9WskXFfgjuGRL8rz9icqYuMe+vfuIJpMuHh8WA==
X-Received: by 2002:a05:6a00:1822:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-745fe05f18bmr30542940b3a.24.1748446444776;
        Wed, 28 May 2025 08:34:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.34.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:34:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 14/14] python3-pygobject: RDEPENDS on gobject-introspection
Date: Wed, 28 May 2025 08:33:23 -0700
Message-ID: <e3fa9ef3239e8bc113e211f5258f84d08284872a.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217378

From: Yi Zhao <yi.zhao@windriver.com>

Since 3.51.0, python3-pygobject depends on libgirepository 2.0 provided
by glib-2.0 instead of libgirepository 1.0 provided by
gobject-introspection[1]. It still needs the typelib files from
libgirepository-1.0 package. Add gobject-introspection as a runtime
dependency.

Fixes:
$ python3
Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gi
>>> from gi.repository import Gtk
Traceback (most recent call last):
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 139, in create_module
    introspection_module = get_introspection_module(namespace)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 243, in get_introspection_module
    module = IntrospectionModule(namespace, version)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 111, in __init__
    repository.require(namespace, version)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
gi.RepositoryError: Typelib file for namespace 'xlib', version '2.0' not found

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<python-input-1>", line 1, in <module>
    from gi.repository import Gtk
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 141, in create_module
    raise ImportError(e) from e
ImportError: Typelib file for namespace 'xlib', version '2.0' not found

[1] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/320

(From OE-Core rev: 6f9e02292c9305e795f2651c3bb6ef5b671e1c74)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.52.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
index 08f7dc67b0..cf1dd07639 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-io \
     python3-pkgutil \
+    gobject-introspection \
 "
 
 # python3-pycairo is checked on configuration -> DEPENDS
-- 
2.43.0


