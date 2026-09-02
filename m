Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AB5C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11088.1788350277970698466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UN2T7pVx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so7726325e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788350276; x=1788955076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QC6EiYDkRUbJf8V3XWv3WwzcZJMKCHpwTScSVx80kuQ=;
        b=UN2T7pVxe+2h54x8tgVSLakWUMWJsJcII1O8EmkiX6zLZrr4cjObNna6v8c4lZMR6J
         wx1FPnaPB3Emsha9FA8LIbN+vK2dVidaA9Msd5oFOloDvj/P/To1KFeifaxiAp2wbpKI
         yU9/D9JXlIrNtQtRyoYXUTcZ59Qgd7g+CYMZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350276; x=1788955076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QC6EiYDkRUbJf8V3XWv3WwzcZJMKCHpwTScSVx80kuQ=;
        b=ocmwFFUraPckQFiC8K4jIOZad4Y7B+0OmkLnGURdbWNMyU/rPAVdM2v8nE4LFmCAT2
         qrYanl5CoefOfrs77liJNTvRoT8xZdWParktT5Cew7baNRjMxdHJ/0oB0sZcdv675HqH
         m5+6hFocjuo+YKpF96oAQQNfetUF957J9SDqpV3xJnp5M3yALk1/QdbljcTg15qdVs7j
         AlZW1UIHy4vbpzTBKUQVcUfQ0j/fAiJUA955rnty7y4camyFvD7YkA6WSbq0ZVDpOJE0
         mC3U3gu7apVgrgP8DWetwn/W+eu9kXQ4SGQ+y0El+Zl7hg5Xji65XZD8j6v18IFVc4+U
         ceeQ==
X-Gm-Message-State: AFuF++mLrpjSMQNDJMGLzkg5yNAilVHYrAgiHH5QSKmXVh3983fFQ5fb
	Y0HvPDRcyLkF2KUmP13PVbcR1TWtQwIYGlST0kHaENT/9029T+UrCgA9hgAjlP9BdCGVDyD0RJN
	Bq08DwEE=
X-Gm-Gg: AR+sD12rDGOvSTgX+MYfCRk/ZEtnRJOT+yi5d2d8hqlUD/ZHP5pQIE00qwieHsbHgcU
	JOdCjUnmOxEhfiJtbBImaVXXXJrcoALb03SeeXKEH1DOn5AkKjPWpurchTmDV15iCjOvolEIiyV
	KMMcVsUWaGNnGHqQu/GVTNRHgOCEUc5lSCJBB9dNdOZxcnRX2XpPIqJyK6XLjm7au+7YHkly+ZE
	XHGoxbnEgS9LGupExhZ4XXtCV8UccuvSCk2lDiEMgfXh2P2V/zmL7x9KUfMLver/bav7bSjl3yt
	2/sTq958nfT5RWcreXjzLSfRWxXBwN1V2DU0KiItUS6FZgg3FN/qIRcnc70xf8POLNnd7AvGoj0
	HxKCkKJOmRivSHeXw7XoCXr0L8H89D5g+GoisZq+XeH8fpD7QAn5CBd67n+EJLO7tp7vXorrmtY
	6xg3FZBOb3tQXR8sbVIaHuS0387GUDm02HkWa2YohOLLtpZW+ebh2JdUuznByit7tsaVFXwAnXc
	md9aOGyVxptFBlYv0kcn/jUk8bt
X-Received: by 2002:a05:600c:3b07:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49ce7bb7a75mr12779815e9.2.1788350275996;
        Wed, 02 Sep 2026 04:57:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm66574265e9.13.2026.09.02.04.57.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-pygobject: upgrade 3.56.3 -> 3.58.0
Date: Wed,  2 Sep 2026 12:57:50 +0100
Message-ID: <20260902115751.2762897-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
References: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244935

3.58.0 - 2026-08-27
* Stable release

3.57.1 - 2026-08-14
-------------------

* Add extra checks around construction of object destroy notifier :mr:`560`
* `GLib.Pid` should be a number with a special `close` method :mr:`556`
* Use `PathLike` objects for `Gtk.Template` :mr:`555`
* Fast marshalling of `bytearray` to `GBytes` :mr:`558`
* Prevent crashes where `GValue` is `NULL` :mr:`559`

3.57.0 - 2026-07-20
-------------------

* doc: Update tutorial and examples :mr:`536` :mr:`537` :mr:`538`
* Fix potential buffer overflow errors where the C API exposes `GArray`'s :mr:`540` :mr:`550`
* gio: Support creating `GFile` child with slash operator, similar to `pathlib.Path` :mr:`539`
* Refactor memory management for marshaller cache :mr:`490` :mr:`517`
* Add missing msg argument to asyncio cancel() :mr:`541`
* Fix deprecation warning for register_object :mr:`542`
* Find libraries automatically on Windows :mr:`415`
* Fix crash when `user_data` is defined before callback :mr:`554`
* Avoid extraneous deprecation warnings :mr:`545`
* Support generic annotations on `Async` :mr:`547`
* fix: Simplify string prefix handling :mr:`548`
* doc: Use gobject-linter for linting GObject code :mr:`543` :mr:`551` :mr:`552`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pygobject_3.56.3.bb => python3-pygobject_3.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.3.bb => python3-pygobject_3.58.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
index e246a2d451b..7f5bec8f70e 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6"
+SRC_URI[archive.sha256sum] = "45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

