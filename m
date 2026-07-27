Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48059C54F4E
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43812.1785192995285556987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4Igo/FLv;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso19000685e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192993; x=1785797793; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isOKa4yi69cnqbhWlZPc4oOJ4eGKb/0pQg74X6p8MwQ=;
        b=4Igo/FLvd424S8X4Sl4112v+4fXe2E2ZdKzJt49gkh5o0cLR9TAmbzoYS3yXytaBMr
         QR8/Ija5VoISWV2tK2oaqBz7H0e01w9Z2T0XBYv6CnzalM4PmjU/z6Y3Z++RaVW2rsIw
         PCBykQfeYgVerwzv33ZtioLzb7Q+QmU96Mrdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192993; x=1785797793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isOKa4yi69cnqbhWlZPc4oOJ4eGKb/0pQg74X6p8MwQ=;
        b=RfLajVES3FghpOyiicmU5ychz/D+/OCGWj5INNubdvAh0inv+IFXOb8fx4fPNCIbAZ
         u79DIESWOO5WXj9r5jjxRwnLBU0x8MWqV8vEpzJWslgN8wcY4eRhQSnZSi5hv05enlDl
         00VgogWR/XGuG4+w95BbO5tzvtq1RdR/4vqDz4Lss09uAxEhaOnMIVzKkNoBr4/FM8rY
         I5KB2n0S/py6c0GC2ZnYOKSim5l+5+NQtoJOXIKBEWBZjru8OBWvDo9kGpUgo6d0++e5
         k7i1yJxE61lvnHdxdGODog9cvCCIocQEVRbhopF4068RO/yAVEx0leBTDyTc+MLGnQ5T
         Vojw==
X-Gm-Message-State: AOJu0YyiVO9e58aXXF/dROdN/vd08GX4mnodWIOcuTWJdKkMTBZO9j0v
	MNTtbn3dfwl3jBYo/49KvBv9DdRdC+DUZvMFTd3JIfw7OYUVJsAgY/Z3GG0a3QIA/XFFUc4fiEJ
	qmKMAuE4=
X-Gm-Gg: AR+sD11NKRElTBBGIl/GZS6Sdm/jr0lOn1gct39MgH1K9QLX2ux25u8+XLdfthkDPRw
	g4Cug+jxL6J1GFtYiNNCuSV+V1fHsKdV2lbODawxkKuylJvWHLIO7Ih5R2HSmVtGLY2odWS3Cwv
	TtP7CoTJ8YinKYNVfap8wDGM4ktRlPTf9/kPhuYmzZmAOJpWa7y5X13I6+IKMPzkADlUYSUvWOe
	Clfz3ZrsDD7/VlIsk2AiU6exlycM9WoTCL5xAhGmH/Z8/0jYrk6w6KDRkz0yfMGvXXKmkO0pbxc
	vBD82s0cMhPJ8ydfSW8y6k6v6BzjcVkw9XrwpDqXuLouymWb6uwN5u19yI10jegov4GFOgtp1jv
	tU3VkDbV1O/tHCLm05s8jeUW9tbWQA9wjG7b7fFvbT8X37i1YRIcx4UZmk4gTXKHOsgPwKTcY7I
	c6P5M9O1bOVKxGWJ4FEqjm1qrhjLXV9S591YtWCLldMeKkz3appQozJZClK1wBNDMLAPWzS2J2k
	Su8bg==
X-Received: by 2002:a05:600c:1c04:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-496c4fd61c8mr9632335e9.37.1785192993432;
        Mon, 27 Jul 2026 15:56:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/36] curl: add annotation for CVE-2026-10536
Date: Tue, 28 Jul 2026 00:55:36 +0200
Message-ID: <ad3366de54b1371ebfc2a703bcfaeb5a5081d711.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242139

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

This CVE is detailed here: https://curl.se/docs/CVE-2026-10536.html

and the fix essentially consolidates the fact that HTTP2 stream
dependency is deprecated.

While oe-core provides a PACKAGECONFIG to enable HTTP2, it is not
actually used so the affected part of the code is not compiled. For
instance, in the do_configure logs:

"""
(...)
HTTP2: no (--with-nghttp2, --with-hyper)
(...)
"""

Ignore this CVE unless 'nghttp2' is enabled.

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index bdd6e730199..097b3056d8e 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -33,6 +33,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

