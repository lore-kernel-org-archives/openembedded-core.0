Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7EFC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:50:49 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.35013.1704217840012848624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EjyPLu34;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-555aa7fd668so3965790a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704217838; x=1704822638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70E94CabE0sBEyY1dXWlbnHTME7JQxBV5Ad/wf4MGcQ=;
        b=EjyPLu34228Sj9vL/OhsAteYn6wgUzqU7id6czfq4qR+SKn5AFT9AXx52hrtyUZ2MC
         GACM2EUNwAIWZVl/O5NLrgl/mUh63+aV5A8vq37R2rSF41bX615P4an9SYHz0vJlvVhk
         5rsG6wi7tjkHN08F+VvUDOWpQkBRj6wOfVQ0I36uDRGzPSlw7N+pu/dHgvlarw2gb6mj
         QRlneWcxEuCd9NoVesD9tqAafm8ijqdbVp3Uy2Av0WzEt4YbCqddZbwSsvecWeXyYxYK
         tw1Ac1HRqYUO1lgK3cTC67EMGKamMaswmsYW+EfC7pz+6slWXraUR4nCozNM5Y1Kq6GS
         AedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704217838; x=1704822638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70E94CabE0sBEyY1dXWlbnHTME7JQxBV5Ad/wf4MGcQ=;
        b=mSuh4bU3iaGpZVXRCQrMaR6H1IB+iYc6Fey9AggLkh6EJZg+2Kw4uluMFKreFzPZPr
         oM+yYG0J1TxoGrWz2GASui+sTtYR683B25zYKgqorTrHXbdOV/3TuGScBnwQqiinqmCe
         bhjEaSc9tLIeb9vazXA84VMcjYzjCcBZLR5f9fDg5pI0qkimBDBnZ6HCFObDLi/th0Ud
         yOyx2ewPPnYzbmYqlmslF+qXHV37C3hyA6ztkCHfATghJl/nSpsan7VhCZP0FfMBWBal
         1nrMJZ+nzdK+QlcpVByG1mMYCvaZpT0gbEyF/+JmR8xOoLqfkwdYIBFU9a7esTcFfqlF
         7pGw==
X-Gm-Message-State: AOJu0Yw5GHPL07u0Z7iy0qqRp1w4ZCRtiOyotxPq1JraG1+PQ8w1wSur
	SdWPTWVLbi7tlsYBCpy3WhN6BdkjidQ=
X-Google-Smtp-Source: AGHT+IE03T7m59S1u0Ktaq67bt6nu8QZ/MJ0DlL2b76dcTZbFyYdfqzxhKRLyX0YVM4uHkecqBmQSQ==
X-Received: by 2002:a50:8e56:0:b0:54c:4837:9a98 with SMTP id 22-20020a508e56000000b0054c48379a98mr10518510edx.63.1704217838480;
        Tue, 02 Jan 2024 09:50:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u8-20020aa7d548000000b00551cddfc5b8sm16164551edr.5.2024.01.02.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 09:50:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v5 2/2] cairo: fix builds on targets without qemu usermode
Date: Tue,  2 Jan 2024 18:50:26 +0100
Message-Id: <20240102175026.2903297-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240102175026.2903297-1-alex@linutronix.de>
References: <20240102175026.2903297-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 17:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193253

There is a hastily copy-pasted, untested fix for this, which
needs some adjustments:

- drop irrelevant comment

- section should be [properties], not [binaries]

- the setting should only be forced if qemu usermode
isn't available, otherwise it can be determined by
runinng the code as intended.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/cairo/cairo_1.18.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.18.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
index ffae13b48a6..fe72537b776 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -36,14 +36,15 @@ SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4c
 
 inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
 
-# Tell libsoup where the target ntlm_auth is installed
+# if qemu usermode isn't available, this value needs to be set statically
+# (otherwise it's determinted by running a small target executable with qemu)
 do_write_config:append:class-target() {
     cat >${WORKDIR}/cairo.cross <<EOF
-[binaries]
+[properties]
 ipc_rmid_deferred_release = 'true'
 EOF
 }
-EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/cairo.cross"
+EXTRA_OEMESON:append:class-target = "${@' --cross-file ${WORKDIR}/cairo.cross' if d.getVar('EXEWRAPPER_ENABLED') == 'False' else ''}"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.39.2


