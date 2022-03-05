Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664E4C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 00:11:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1176.1646439076605434604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YvL9TAaB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k24so5367997wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iKNKiWZhLpozUjlkwcf2N4vNExEsQwu3ZkmgtjFDo3M=;
        b=YvL9TAaBpKmXD093oGKubHxzw+mdmGqhhLAhVlBgGoE3VyVN3W2wttJc93N6aDEwbW
         du3hIPT1P1jHdO7oPR44uUUoepeTibstqQmO08wFNbvbsLsQEliCqYaxocRr/CkXmaVA
         1cg2Y3j2tkigwms9NQMZmdnP6stuSWzTiJUU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iKNKiWZhLpozUjlkwcf2N4vNExEsQwu3ZkmgtjFDo3M=;
        b=PcmPBy/LU9TagxeE6ZdLoVyMUtg1Ecb5spUGiu3Wqx+0KmPWdL+I9DEaFwynPuBul/
         7dhSu6OWqO/cE1igG/vOmGO4vr+1DkGLuggaoc+chrPg8Ssfxy7Rzj8dpwmBJw7Cz7oy
         AfsjuM1UY2NLC+UkWb+6zmA3pP/dhXdvnxJtKUMOMsnUAXHhmRGhkjLBdNRD1ew5u7wy
         UfZRHyMujb5Wv5w9NyvejyqR2rhRaWs4yqiMX70bIN0CW2miR2EzsuOL8obEMt4EWDvl
         kp1yB9nx+cPw+GQOt2RxAgrv6INDgZ+oPJJM3oJKIzLbeGNJIcsYIk+/Y+pXrxJlhJLm
         JrwA==
X-Gm-Message-State: AOAM532qCBHQLV1WckUOaulNv0uF+h/4xqyCIjTCnlmaJ+gnod2R2E9Y
	cVF3awc+6WElAqJPqCp45E0JbVqewVe8ypYq
X-Google-Smtp-Source: 
 ABdhPJwa1wKFrbToTfGQ65UfKOmlA6/ADNcJUXTs9IDMiDuev6XRW6SpoTTe5SnXPPh5G/Gha+qPtw==
X-Received: by 2002:a5d:6a4a:0:b0:1f1:2457:a7eb with SMTP id
 t10-20020a5d6a4a000000b001f12457a7ebmr747603wrw.523.1646439074908;
        Fri, 04 Mar 2022 16:11:14 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:58d2:445e:5b81:1f43])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm6787952wms.15.2022.03.04.16.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 16:11:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] layer.conf: Filter docs dependencies for efficiency
Date: Sat,  5 Mar 2022 00:11:13 +0000
Message-Id: <20220305001113.394353-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 00:11:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162763

Where a recipe has depends on native docs tools, in most cases
we don't need recipes that depend on that recipe to also install
these things into the sysroot. We can rely on recipes wanting these
tools to have direct dependencies instead.

This massively reduced dependency creep in simple recipes (e.g. an
allarch one) and reduced the size of builds with the api-documentation
feature substancially.

gperf-native is also included since that would normally have a direct
dependency in a recipe which needs it too.

For gtk-doc-native, we do need the xmlto-native dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index bdeb8a47589..77a765d7cb5 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -100,6 +100,10 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->patch-native \
     .*->pkgconfig-native \
     .*->quilt-native \
+    ^(?!gtk-doc-native).*->xmlto-native \
+    .*->gperf-native \
+    .*->gtk-doc-native \
+    .*->texinfo-native \
 "
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.32.0


