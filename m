Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38784C98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:55 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2926.1790154710578381259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eemARZAF;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso2016745e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154709; x=1790759509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dJKZOZueEmOWrYweoIyN90xkli5NqDmr/Kjq7NcYSik=;
        b=eemARZAF4R18teSQa4rjpcTAun+QAuIPl4n+0a0Iy0vyEGzEKqSCE6pMk+NA4RZ1Ww
         +YYKami4o4RZ/XYNZcOOHV8XbJQ1LxeEGWqPTJIzqbd0EQzXm3POAyLHLgKqAEf+XA6O
         kS5aqgScz223EESkq0ovlGJuPYDoC5slRFo1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154709; x=1790759509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dJKZOZueEmOWrYweoIyN90xkli5NqDmr/Kjq7NcYSik=;
        b=MsPDFzxdcUlL/V4Q0fEATyNknFo2jjNrget7NnRUiGt5BhqnK9KsgFXzkdnIhb0QIQ
         UObpqDEgnEaIUs1L+uzbVjHVwxduMlaRBSAbj6KIUii3o1z+ezk93iN/alhvpMirbSOL
         Hzv0e+m1Hi6VTtvhHbeYgb7rBJjXY+pyroBOGis8E2TVXMdQVIpQW6KcPp1eppIegydH
         ir+CP9eYqDTCByIYlN73eQ04CL3T4P9pl8G1xo6215mbdrGFCklLYyzno/xT856p1TkQ
         OTMR2p2SlyBTcxnE9K5VhFeXStBQOY2FrAGL8NOHzzwnOTab+AtKAwkTjIj9B1Vj1j0l
         owVw==
X-Gm-Message-State: AFuF++n47o3lqbVhuoTBGKCjdLk7xbkiZz4dlZuPCKB8lDNvYuaekner
	n/m3s/WKjSOG1sGe30F2+mmS8kah9xZQcObExQoC5wGRz86Kn9+cJqLiHu+DwEjXMClqUMztC09
	PCVE+S/E=
X-Gm-Gg: AYBFou3xM0oogn+E0h23us6z3GTuqRU7/tVwEplXCWE90SF/lwa7qGopyqxFg7IJslm
	wn67p/QBPd9nNbVfeg6pUq2LMmzfo3wFGMFIwM+kOqX74Ga1FQco5mH9WopUgTNBmMRMgVjde+8
	UOUSx+pqauEWDxeQ0uPQw8Od5XKcEpeVRdxsBpFDMG386Skn7b4ern9t9ea00bBkNEomtKWuBfS
	JMW49J8V9eg9JNiJ9PVca9yRVda4s242o3LG9eGYXxwuPF9VgmEyiSbgwKOmDOHUk2f6LfUdVAK
	95ouBFxu/8KtEspftakkgRWP4yDp3Em27NpfYiW1XLwT3l3JlRnzLDdMeYMMP3bxKLdPs9Q//cT
	GjdUPlTf2PkY4WLnQgGIdgeQP8M+Skg+u2qAiNkXxTnmwzGdql9c1oAHw8hlY53Jg3ylGRC0YQ3
	ZegcTmqYjHRB3b2/qpcFKATEqQP/q7FbLiApAZK6KsNuPNtEIa+DDE4TOHh5YfEgFyMwXu9OOpN
	jD2AU7W1tcDlTINouO34ky+zYpitB9CWRZVhkdZTXlkTYW0tUN9nUunJEqYrRUCiYHEYjkY
X-Received: by 2002:a05:600d:4447:10b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fde371b57mr20047985e9.6.1790154708849;
        Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/48] python3-certifi: fix homepage
Date: Wed, 23 Sep 2026 11:10:30 +0200
Message-ID: <758899639692fb76e28f3914f75249957c0b3600.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246490

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://certifi.io/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ee556d1e1cc16327e0a11207e90ac61d9f1577f3)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2024.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index b3d6cf080cc..617b597a40e 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
+HOMEPAGE = "http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"

