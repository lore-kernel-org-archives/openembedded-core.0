Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B644AC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 16:11:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.9443.1665504680532183184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AFMkAacL;
 spf=pass (domain: mvista.com, ip: 209.85.210.179,
 mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id 3so12401656pfw.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=va4iUVlm7lUKkB3QQqVCtHRWCFQo0W9Op6nQ85ahOrs=;
        b=AFMkAacLMb6pyfat8iRV1OPBeqq7Xdzv4HWgdijt1W6Yqky/w5YIGsd9cuZc87hK82
         HNnrbwJ1YXHJg80dk8MI+sQuYzi1ZAd6dx6J17Ttv/YfQ4aUw+seA593EpB5S1Ph2R7I
         0mJhVXzIJj9rBiFOz/bizp7AY0je5BhAs1MRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va4iUVlm7lUKkB3QQqVCtHRWCFQo0W9Op6nQ85ahOrs=;
        b=tbpgjd33Dmkqcb4njdktOYyongm7iExeLAd+5ObvcdFeijYeirdp1OCqH93eUaqeun
         1GSWV/zTMtYfSI6CnEyMmyEStBo3Twx1aPpB1gNg1C17EJUPDv1IcdGvY+l+L4LdX7TJ
         a5QPYKfS1kRN6hE+g+qqab9xkw92rAFKoj6gh/GffE5eIxkcG5NuU9P0cC7ABTG8KCev
         zs16CA09d1NKcbDz4y45BqBkhHMOouXnn0wFIFhu6dH3p95WZc6Lg6xE8RyWMpBE+jYv
         2TOs5vYeEEXyjzGFjo2TWv3J/mcJsjkdU/VbA2lKG7nRer1KbRqNJZXDHnzf5ZIUUww3
         +pMA==
X-Gm-Message-State: ACrzQf2muebApZf4QwwDoSJIMIwvNrTYh5U+oIUHbduFVQ49uK9uUsSq
	F9vgN76e6+HcseIcxvflWD1rEUfQfoCOBw==
X-Google-Smtp-Source: 
 AMsMyM5PCj6xxECo7Tc+cqwIxjlcp2pklKhJ3t8vJuHMIRNk2l9WN69JD2fRWnc+GnlbrGOIdE8bbw==
X-Received: by 2002:a05:6a00:1254:b0:563:f3df:2bf3 with SMTP id
 u20-20020a056a00125400b00563f3df2bf3mr3191671pfi.82.1665504679793;
        Tue, 11 Oct 2022 09:11:19 -0700 (PDT)
Received: from MVIN00002.mvista.com ([2401:4900:c84:e9a4:b834:4dfd:7c2e:b695])
        by smtp.gmail.com with ESMTPSA id
 y198-20020a62cecf000000b005627868e27esm9126296pfg.127.2022.10.11.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:11:19 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] bind: fix CVE-2022-38178
Date: Tue, 11 Oct 2022 21:40:59 +0530
Message-Id: <20221011161059.41454-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 16:11:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171632

Source: https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
MR: 122537
Type: Security Fix
Disposition: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
ChangeID: f93f9a7755124934083d77cf9334fffb32a0c220
Description:
    CVE-2022-38178 bind: Free ctx on invalid siglen

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../bind/bind/0001-CVE-2022-38178.patch       | 28 +++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.22.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
new file mode 100644
index 0000000000..bf48dd69a1
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
@@ -0,0 +1,28 @@
+From cedf585da4809d1bde70cfe800d0f15e3cdccb58 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Sun, 9 Oct 2022 19:54:32 +0530
+Subject: [PATCH] CVE-2022-38178
+
+Upstream-Status: https://gitlab.isc.org/isc-projects/bind9/-/commit/7c0028cfad2ae5fdf82c4d02d3b8b3a1e96dc6ec
+CVE: CVE-2022-38178
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/dns/openssleddsa_link.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/openssleddsa_link.c b/lib/dns/openssleddsa_link.c
+index 76c7737..295f08e 100644
+--- a/lib/dns/openssleddsa_link.c
++++ b/lib/dns/openssleddsa_link.c
+@@ -325,7 +325,7 @@ openssleddsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
+ 		siglen = DNS_SIG_ED448SIZE;
+ 
+ 	if (sig->length != siglen)
+-		return (DST_R_VERIFYFAILURE);
++               DST_RET(DST_R_VERIFYFAILURE);
+ 
+ 	isc_buffer_usedregion(buf, &tbsreg);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index 3b4a299b36..b075d01e2b 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://0001-CVE-2022-38178.patch \
            "
 
 SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
-- 
2.25.1


