Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69ACCA6007
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48869.1791301598074299245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GoDOhlak;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a02718da81so8251905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301596; x=1791906396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=clpYj/jaWNzEmHK8/+Bs4vHh22D/v13iQ6A6LXPsOpY=;
        b=GoDOhlakXqpoQ8HUeKlbGDvw17x+ZSgT3uRFKV1MOiF92gAO/UBIpI7ALawawG8F26
         M8naFpyzpigZKCOmcuGCxkQ1hCE5yb1aT+KRwofBMTkOc2tjVUdH9EU/TjsZ3Adve/6A
         WKvU9evnbohxll7zAIs5NuNdA6/+RbmM9pF6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301596; x=1791906396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=clpYj/jaWNzEmHK8/+Bs4vHh22D/v13iQ6A6LXPsOpY=;
        b=w+x4r3NJmOEwMPSKOidE+vOuyuNi7DLqWosXnw546UGGZX0hZZMoaElhcNcllzsz54
         dwzgEvPzh6B11B2wiuasBbVP5a3jh6jxg5soJ4Goa2X5sW4AdvUdlPy1LQdGyWbfA2wf
         8XX0FVQYFl5AYc85EqWgcY7uko1ZZwlNpLhf4N6TofmZWDg0xsRSQGPK7OityLNaEfkY
         g0tr6YRjYvU6715z5FixRZt45w+DxlmVzdvgfLIIrwu2wkUnqtiL/REW5GxSdTfsotuD
         F4eLfzvBrJL3qMD7Gs7nTcM4O5JVTSnuTwJ8UfKsb/nSghiFvVmdKqqab/SCcNtanRto
         jl/A==
X-Gm-Message-State: AFuF++kUNxoFBGF8dHqZaEwbHpYzQRf70CuzlBonadAjEyyv0sQtYssg
	nq23wnVX+pCKr4wVBpKeOs6NjrIsyUUJnW8XEJgciGF7e735IfRgQOiRHI0gYIAM/oiultM87d1
	y8qBFhRo=
X-Gm-Gg: AYBFou2o/Gux3bfzCspJG0Zo31/8htyrLs+ndyFMF1qDp8YWgUTsYitdTfvI/esHXQd
	xxs2PJv6LgjoJWFjwoeC1uQVShVXDqpaY+iu53RJt9zOZqPNVuBPA4/03L601wGdopZ9gDuXLJr
	KNFzCR5l26eF3cd1NHqlbIWKBs8KqpP4RwO4lvtXBY3G5bDrgxuxNpivQSDvJzB+MQq+AdSkt3y
	4GOIFKoJg/2h1/EQSpDT6sH2qg/5r+19WyAK3rXyLSCmYPJ/QxjHvK2RVrXBJxETC5ubW3Awei5
	A1kXwTUuN4I7dSMKkQ8AoI6q9voZGoc8IrVeGy7Me364z3RScK6/ZbXTu1WQHnXSa5SDXDsD5aU
	YWApDn0EYCynLVBQWDjkfAVTBWMruc7Q0544wC6rPsBO8fGd3owOycilo7zQ/SJfBSXRwu6k182
	kU+grXMb04phvjBT/DH1rcyNIr/W33KOxgkZPxT3Wz0SCt5WuyPBnxYmfEoPb+InIINTEQZDYxp
	+fTNS4H08DmcOfeCUie+dHjIchMceH9+DUWKAjXKBGA3A7MYLaNjV6RlOUyAntxFgiGZix2kW6D
	4PGDnw==
X-Received: by 2002:a05:600c:468d:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a17b52d29fmr32183315e9.11.1791301596190;
        Tue, 06 Oct 2026 08:46:36 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 15/19] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Tue,  6 Oct 2026 17:46:01 +0200
Message-ID: <1116647ebbdd72efaf76c4dcbdcc5a5f5f4fd75b.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247304

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 92cd5fbad2f..44872c3637f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"

