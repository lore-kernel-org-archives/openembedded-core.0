Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BD1C61DB4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18277.1787652434442168851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ibqIVgeS;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3345533f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652433; x=1788257233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+PrP8jTk3f1mED/Ny4BGyz1YyVe+ZMKzGr8rh9JXJY=;
        b=ibqIVgeSCU3Bu870aJEBTVymD2xGnswz3IRkNMFLD39SOcOwyS6FOfC0PdhUSIjnpO
         Yoc4WsNgMWqRp+0GMQp+lEh90l6XXQu1bD1FX/aDi4EW498ZKGajuM4GdZZSqR/PNBxu
         NKwHh/KLdHvjy/bm5Z2ubTR9OtG+PmmvDNSLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652433; x=1788257233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E+PrP8jTk3f1mED/Ny4BGyz1YyVe+ZMKzGr8rh9JXJY=;
        b=kIFreQ2vGbVqMtEdbS7pm2Wf9QFs+ItwT5EOLEmJT7AC6VtCWTTnpH+waMyDO8ulx2
         WsuAiQPveydJWUeFhBKgttGUmchkYZLy0fSbWYbCBE8Z8cOAX9t9hdZ2DRkCU9aB6TgS
         mBhrhO6mloeJzoofGCXc10GgdoK0Jjx6cRqEgzw+OtU3EJlyF/cWcyzz5rTZ53+YzUGB
         JB1rsHKTrD96K7lryUQRT6n6mIrtISltBMGYZq/mYTrSlBD0nBzZvdLfY+zbjHzhf3eI
         t/uGiVpHDINyDRYqxaopy9GYgdPgTN/sof264fidMezDURbRAy+/iouYs3guud8WFdmL
         Rn8A==
X-Gm-Message-State: AFuF++nosxcO3lspUBpQangxWkgaXWRbTgcLZfIOjZIfB3qXnrk2fmPr
	QA0cxCdGUy56LxaLiJCJAB00xJ0BPYVd4trSp0eaTxWuwK0JeoggwWm2vT0vqecyxW6GRkWd2kA
	mUEix9aI=
X-Gm-Gg: AR+sD139M8m78jcYd5YWc9Zm+QwyGD+WbtjRvFYmYeidH+qEuooDt3oSLGzG0ySJKCL
	Ew+mTE0lG1I1nKAdK1VOF7A3k+GBb23LrcENlFraf9o5EFvtvJihXFOQKUk66yrQ76+JdMrK7+A
	70cjFAOUAtLrfMRf+6NfIpxsJBBAkzqV23OE4iJKpJRbjoOxszD1goEexKRL4B8kEzQin77MX/N
	EFNkSxhkMUdtETnokmNGataeEvjEzHLXLBv03mwjE/YmEvB1BAsOtDaBQBTR9Fl5QAcJ8NDqaxx
	u6QCjNk7i7oZoxsr8dtJr3HFdrgGoeO7L1UvquFXxkDlnrEWvjcMruh4fDC5gB4t064QPAKIJBZ
	9DcOjbKRhrvdUqe2jxbX9+0vLs35gKWoVioM4FY/TaSRUnGWxi304gHXkCYkcz454BS/p458PQ6
	FkkySg964zODR8/iYLDfunNxaB+0wr7i70V7QJLHzp9oet5zqvJYT+4nrdOsi8cPK6LblMe0OR9
	/Zq9KtkPBfn2dwtSVugdk6+OZGswCrdOE9/SgWaeQzpnt9KwT0dliHimWsyYr2fsKic7fg=
X-Received: by 2002:a05:6000:25c5:b0:481:512b:f0e7 with SMTP id ffacd0b85a97d-482c81c1a8emr29018555f8f.17.1787652432621;
        Tue, 25 Aug 2026 03:07:12 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] nghttp2: set status for CVE-2026-58055
Date: Tue, 25 Aug 2026 12:06:39 +0200
Message-ID: <aef685e73f971bd631f67cf88200c7ebf449d21c.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244214

From: Deepak Rathore <deeratho@cisco.com>

CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
Upgrade requests with a Content-Length header and body.

The default recipe does not build nghttpx. Add a conditional
CVE_STATUS entry so the CVE remains unpatched if app support is
enabled, while default builds are marked not-applicable-config.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58055

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-support/nghttp2/nghttp2_1.61.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
index ebba15db282..9ed27b72770 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
@@ -16,6 +16,8 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF"
 
+CVE_STATUS[CVE-2026-58055] = "${@bb.utils.contains('EXTRA_OECMAKE', '-DENABLE_APP=OFF', 'not-applicable-config: nghttpx proxy is not built in the default nghttp2 configuration', 'unpatched', d)}"
+
 PACKAGES =+ "lib${BPN} ${PN}-proxy "
 
 RDEPENDS:${PN} = "${PN}-proxy (>= ${PV})"

