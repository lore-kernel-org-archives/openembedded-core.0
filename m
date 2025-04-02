Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB294C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2252.1743577883591891406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkpEBUef;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c2688619bso745975f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577881; x=1744182681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6pXIcs3l09TCofz3oARoR3y0LOs+5n3J72A9m7e8uo=;
        b=NkpEBUefrbfp8J7cOK1cKLzuvRSMvpHMjSnLYUhZUKhlI4eO4ROYwoEkgF6I9YDjuK
         XICCD31cVECKm2+I81eNWSbrkEfmdEAOEvtlHP8N/2Q+BPFtlEARqDJi7npaYknN84XB
         PiZ41kiL1qJTBF3W03NFeZiZYm7jYay5LV/n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577881; x=1744182681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6pXIcs3l09TCofz3oARoR3y0LOs+5n3J72A9m7e8uo=;
        b=oN73/iHrCR9W5U3kbPswJIoyFr6hvoCCAG1QcfOXcz7ddAzT9XnVsr2WhVeVEN/HJT
         6DRO4W8n3PQrlHhZwITo9iKVzdmSGkSqmfnyuGEjKOmY1nR4dtqk4Or6SSyE3cyvhPBV
         /vcdStNgHTy4HmUNZQ5lhcAkzIfL3hVjKjnSEl91oEtkSTpy75ke7xya9t9po2WqFk/x
         WNsjQXJInAo97Uh+cSPngUM1PKypPTKAzJqTg/Nj4tf5fwgodKpb4Hnqxhi1iOctSVPG
         u8jWWyM16L2XJJVQgMgQ6nl7XPiUfQE3Bsu+W73EDNOUnvHklixeGCBtjVZbNyN5h0c+
         yZ+Q==
X-Gm-Message-State: AOJu0Yy9Dw4lClYv/a0jNyA9SzuIDQzES7G7cnzoWq7k6oCQciFE/x6K
	L4kakMoNyeURIBZxAgMTLnXMGOy7uPyE7P44YXFX2iqZ1p+82G0nP67KgIBQJnmWoIkaHbo/mX3
	y
X-Gm-Gg: ASbGnct/yy18oiqIReOECzWhVswxSZ6YaspAZQCnIHQ9OFYfACF5ttbOc//eYmt9Sws
	nIposDkWsg/1g0GtxncCy22S9J4Clvwx3yC9IuXxU52zte68U7yk9zStA/Fy3Z/L4fE+28Fp+jy
	SelqCJG6XStVEQ1c9AZPFb6YTgpEeZuQzifpaxb5DMxQE1HJrgzuJOawcCjUNmpDQgxHO+VXN8B
	r6EhJue8SpjGPFvfKbsQo/SbNnZuiN/E4AqEiVxhgWxQKSdl+frBD5yQvO1n2PN5vrpXuo6qTMf
	f5hS/r3NNews3iX7NtDo+OdvR5oR6pwlgqtZ1kpSA665z2qOFoY1m2sxmocDOpldue8NAcZEOw=
	=
X-Google-Smtp-Source: AGHT+IEkV96hT3ETJBB6FzXD/XKpISUOzDIzcJ6gG7QCyTTF5A4Qm4DT2+HIC2N6iU+RvqnBxsNhTw==
X-Received: by 2002:a05:6000:23c2:b0:39c:2661:4ce0 with SMTP id ffacd0b85a97d-39c26614d5emr2753500f8f.13.1743577881636;
        Wed, 02 Apr 2025 00:11:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/48] ofono: upgrade 2.15 -> 2.16
Date: Wed,  2 Apr 2025 08:09:54 +0100
Message-ID: <20250402071017.2157620-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214198

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/ofono/{ofono_2.15.bb => ofono_2.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.15.bb => ofono_2.16.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-connectivity/ofono/ofono_2.16.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.15.bb
rename to meta/recipes-connectivity/ofono/ofono_2.16.bb
index bb4133eeda4..ea3120974c1 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.16.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "1af93ab72a70502452fe3d0297a6eaea13750cacae1fff3b643dd2245a6408ca"
+SRC_URI[sha256sum] = "6fa2e168e74e1d1879008806537eff2f0b3c86eb5412fbc093f4236e2a15c9ef"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 

