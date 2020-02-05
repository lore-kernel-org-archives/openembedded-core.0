Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0B22F607AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s10so2223377wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Wp3DiDy8j8BRumE/nKvlDArLjJc9lIo46U27+YXF7tE=;
	b=bLufmEghntHcVmIpzkpwmK/vtP7v1eGP52qK0Pmrv6DGI1AYQgU1wdkMMbqZ5MbvH6
	trBmiN6dgE+2tGt/o/k2j3YzQZwX2sXtkfrkJvYJUqF4Pg+mQHlYKDyb1HwehDWjI74t
	dGI3K+1B/6aXobqldgvw6HgNnXwFiReabmeGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Wp3DiDy8j8BRumE/nKvlDArLjJc9lIo46U27+YXF7tE=;
	b=nKl+NL+N/GfH0On682Nx90gXGVZrJmsFmuIxs7wLv26P5Jr/HF+v8kddEh5oJOyG1j
	OQou6pVnMiWavuOWEd3Ap1nXYYximaroYhdffwaNto+BRNwW3f+v7olrpeG+5axBD9Rr
	EtwznmtEk7YzQYhUzoZ6tjdnot6CSmEz7mXgWnaUWIvmyVSrYV2vPRjQsn9f4Ztxt8FV
	2E4V5b0tcoxgQz0fZoGkF0iU23rLlGEb/jg8ph8eVHkoWm6YT2rVlRm7QN8tl2QgWoT/
	chBIOIyWtPWdRrTuGiEKZrdxaa0kiCdlPucLWPTRmabKeNrGfAakQppaQ70ie3DaiXiX
	NBEg==
X-Gm-Message-State: APjAAAVlJy2/WztWwpEkzicKPPviRsfBQEwGQo+ockJFamDvOEddpGF4
	XStPSyf+m/UAe7+QES9uwcwXofagosc=
X-Google-Smtp-Source: APXvYqwK88szRHciBaGvLGdtsXobXqQVPdaG09TiXr5ndE0Sp3Tei7X6lq+eLBONt0oGEPMk1/XQ2w==
X-Received: by 2002:a05:600c:145:: with SMTP id
	w5mr5212380wmm.157.1580904718406; 
	Wed, 05 Feb 2020 04:11:58 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:51 +0000
Message-Id: <20200205121151.27880-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/6] xserver-xorg: Fix reproducibility issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 12:11:58 -0000
Content-Transfer-Encoding: 8bit

The host kernel version was being encoded into the Xorg binary. Set
an appropriate configure option to avoid this and be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index a0ae65c785d..14ba6bfee6c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -117,6 +117,7 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
+                 --with-os-name=Linux \
 "
 
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
-- 
2.20.1


