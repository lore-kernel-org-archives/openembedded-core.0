Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BC3C4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.7179.1667530889504812205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eyKh6OX9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so3574150pji.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpwKWtfu1/bjsjMgyL0AsJAwhMYyzczHVmuYMLQadmM=;
        b=eyKh6OX9148Owuwe47dd5aRWMrxKifu/jjicohdTV/VPJfQTqu/rNzk+ur7/tF6urA
         x8beSSCVVIfva8aiub74odlgNIShjFzIyBmUoJDzmewiysdJOVZ4uIF3vaiyYaEZvCbq
         vLMssaF6dvNOY0vLcwtoNgCjCZL48tkiiRl+lj6OFmcQx/sidnzkIh6QudYD0vx5JWBj
         CzORCiWpChkty7Mv09ORrxq79yk9WYa7FiXtgT8hIHO077u/qwBF1WRDq5TkFVFWCOis
         UqA0NU34LAT27PXbqkpyLh4jy4lMDaXZlFITO7wBAuB27klfbWa3s46Mdfro5vFyQ34J
         nG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpwKWtfu1/bjsjMgyL0AsJAwhMYyzczHVmuYMLQadmM=;
        b=W+BEb3TOYBntkIcAyKtKiyglVmcOe6q+bnyKLZjAzMnVqNMdTG6O8Rbm0JnZMxpkdg
         Urt9gmr+P4NsjvdTqVskVrqC9Ke91xMRpElJHX1jKWaELga6cS/wu6PtSPj2etNxGBav
         +CNwwlVOnELhQIaB2W9gs7h1ofEt6h7U87QNKCSAj2JtVrw1Dg4ssg+658uVheL6ZG0h
         KMB8X2lPyJ/lpyqrqX578rH48DuIedg+19PDpFnCF9nGDf8aFu8NUaDi/V+tIple+ooP
         hBtf9mD4p//EeejFt9PXFS2iygIumJCUDJSXoliUYXIJGIyllVAZoKPNLyaEh0aMfIsd
         NLtg==
X-Gm-Message-State: ACrzQf0b8a1JGGGVYUAaljwBVz9cFbVn3/KHYqRsu8dlUuZuW1KfH36D
	sIZrmCjsyny/PymKkBfndChR2ENkFjCLVExT
X-Google-Smtp-Source: AMsMyM48eWywPsOQVzVbTf9J/LRfoy+z53qgXlUTNrzONv4Tj1VKixCCQtiGYtT3kEKQeKYZjMFlWQ==
X-Received: by 2002:a17:902:aa46:b0:186:e220:11d4 with SMTP id c6-20020a170902aa4600b00186e22011d4mr33416003plr.163.1667530888543;
        Thu, 03 Nov 2022 20:01:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/31] lighttpd: fix CVE-2022-41556
Date: Thu,  3 Nov 2022 17:00:40 -1000
Message-Id: <bf0b120d082dd058e3e56f1704a65129c0fdcafa.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172666

From: Ross Burton <ross.burton@arm.com>

Backport the fix from upstream to fix this CVE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59f69125fb00dc8fd335f32fe6898e7a480141e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.66.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch b/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
new file mode 100644
index 0000000000..284a5a3ea9
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
@@ -0,0 +1,31 @@
+CVE: CVE-2022-41556
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b18de6f9264f914f7bf493abd3b6059343548e50 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Sun, 11 Sep 2022 22:31:34 -0400
+Subject: [PATCH] [core] handle RDHUP when collecting chunked body
+
+handle RDHUP as soon as RDHUP detected when collecting HTTP/1.1 chunked
+request body (and when not streaming request body to backend)
+
+x-ref:
+  https://github.com/lighttpd/lighttpd1.4/pull/115
+---
+ src/gw_backend.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gw_backend.c b/src/gw_backend.c
+index df9d8217..5db56287 100644
+--- a/src/gw_backend.c
++++ b/src/gw_backend.c
+@@ -2228,7 +2228,7 @@ handler_t gw_handle_subrequest(request_st * const r, void *p_d) {
+                  *  and module is flagged to stream request body to backend) */
+                 return (r->conf.stream_request_body & FDEVENT_STREAM_REQUEST)
+                   ? http_response_reqbody_read_error(r, 411)
+-                  : HANDLER_WAIT_FOR_EVENT;
++                  : (rc == HANDLER_GO_ON) ? HANDLER_WAIT_FOR_EVENT : rc;
+             }
+ 
+             if (hctx->wb_reqlen < -1 && r->reqbody_length >= 0) {
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
index 801162867c..78978105b2 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
@@ -14,6 +14,7 @@ RRECOMMENDS:${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+           file://CVE-2022-41556.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
-- 
2.25.1


