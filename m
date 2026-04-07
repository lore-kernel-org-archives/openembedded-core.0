Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FDFEDB7D1
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75679.1775546026288806877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bpnpx3gB;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso20796025e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546024; x=1776150824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=Bpnpx3gB5gUV8IR5GDVumvfL/C008a9Kd15kJyyrGOFaxSYPOrj5Di6W7g2j5ECddL
         XEmB5sPjhVSoTmqJXZOgfDzZUaGaJXLCsjiIjkiFIH4cV6Wpt1W/+jaozKE7WnzaOsV2
         eRv05Z4dNvULAjq5DuDT5XdsiZBeKMbRUVYww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546024; x=1776150824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=X2oX3J4wL6abe9eSza5QU0umBprCiP9RExIFODcVY0C7ila5hLRXMnwHGHUCjf9059
         HrC7FT1+2s+3Lq3Kx4/Y8Xz8RmMN8+PaNhEzPXU/k0jwlE+E2nYT+fLyCS6fJjQNOw0K
         vXPzs1OW/Z0AhDIobaoESKgEtzRENo8paG7HMNixN4j1lPwo4yLyl0QsKGEhGO97Oj20
         NDZcOHZ1+++3noC7SiHob8vYavZECu14p/MfPL2jcgPCa1mCtQuRfehfGD6ql9Fz4mMC
         E0BTluEjG7nFz2ThyqJIBt5INV4J9u9g6lt4BtxTxlmTF4ssEAOlUFK+QB83Sjm5NBQs
         XsVQ==
X-Gm-Message-State: AOJu0YwT7iVjdOb4rmAuRU6I+N0FBgRaTJfm012RUSWzldEn37Tw5am0
	XmmXJyjsl+OSX+YvMyGsH3s+czIK4OHRS4C1E8+q5mN6vDmIhLmUPcPezl9ZtkL0zkDFLbHoXPN
	wH4G+1ls=
X-Gm-Gg: AeBDievfGLugiKvAPXpTmc1OKisO3mk7ibSexi7BW5iLw/DNZ2xndXaKeTfbaYvNWOL
	kWkmIH0qgiMF53Gs0eUjsEdlvhw/yZG/CtZ4NiS+jG5Djxr5Bq9p5+kCANCiyLDMhxkpis0hb+t
	y0vGz7fW/hg7GEctiCdCRxEBlPv2kzRx2nQ5uDQOkdcWU0qWjVMYfpGE2M+WKJUEEdZRb8KFItp
	EiQ813FdvXziiMolG1W0CxAGvy4MguYxFQGERaGVGhAJ01MQibLFmqqTE6TcbgukV0SEFXtspWe
	UkUtjuld4TaSqS1TO4bgRqFkMsC70Jxmz5R/VNq8y8xO56oj5QfKFD04c6Y0cnGjDSq5s5EwF7y
	vfxlyotmUY93eSRYTcd1Wi85hMwHjCYiBWCBdd3whoEzy2aXNNEeWmaU77Oy/MIvBnMTNeumt0z
	5RFpg6dF+an7a4bL3/U4I5TznJbAnhJETGRvulJYYhqH8XWDMMKqRadv3OllkZzD5HSY+JQnKRv
	IcdfBNETWrF67UnLRiDatFDJGg=
X-Received: by 2002:a05:600c:6085:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488b2397962mr79075515e9.17.1775546024430;
        Tue, 07 Apr 2026 00:13:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 04/18] README.OE-Core: update contributor links and add kirkstone prefix
Date: Tue,  7 Apr 2026 09:13:12 +0200
Message-ID: <2e04debcb02caa9121a8f933c59fd69666a44fd8.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234708

From: Fabien Thomas <fabien.thomas@smile.fr>

The current README points to an old Wiki page. Update this to the
Yocto documentation.

Additionally, add a helper command for git-send-email that includes
the 'kirkstone' subject prefix to ensure patches are correctly
identified by the maintainers and CI.

Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03a..8a724dd6d0a 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='kirkstone][PATCH'
 
 Mailing list:
 

