Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58878C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 15:38:16 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.46799.1702913889307325476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 07:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGtyWx/h;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-591487a1941so2441933eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702913887; x=1703518687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSrEyzygCXBoXd8QPB2K3ZJ15IbsrFy4E6YgLhbo5SE=;
        b=eGtyWx/hdW0F6iOoxEgz/6EzU1ji9sG6zTB/El6y/Gp8hXbSBHFAukO4HIVgO8fDm5
         DhfPHXafMEjQA7XGs2eOBNe5pn3Te2p4koYjxP8KQNTaf/2tYiruYSd1JbM78SdyG5d/
         ulDRxLpl7TPqwkWJSM0MFHPz2X+/19LwyKMe77zYi8EAm6SL3/v77Cs3w3IX2XQ6tfri
         KdxklmswGBK1w5zq61GkI62h8A4fr1FpFaNCZIph8edr8D/Hzi2EuVoRsoJrhj/W1lgi
         /ESTsQjRecKWDHiJOLuc0Lz5FHLemvPg+YW2UbKIVkbOHzLv1aRpZIwLy4Rrb7NujHfu
         cpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913887; x=1703518687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSrEyzygCXBoXd8QPB2K3ZJ15IbsrFy4E6YgLhbo5SE=;
        b=lOltOX894W24Gw0tH7GD1U3R5HjtyL62/X0gon5fESnpyrGMJl77JCq6P0urWkEqLb
         S9hO31/Zyr5MLFHv7M+nt4WGdxlHQY7Dv8MQqfNF2V6gtihaXf+ypC5rHK1kVWaOpmWf
         WCBXrV1vbe+fVNHKWC6Wca1An9CupOjgobrj56XvAFVmNb5zAyXgcbmkh8/3M3XRrrXp
         Hdypk5V1MHhF7k4OSq9vb5soee1uPC1wULVJYdbEM8hEdaMZ7Y/zEevvjF6FovZueiaZ
         NkHAZWQE1VyEzvcoa8GC9Ie1012TDhkQkpiCpyK2dsKbntfTxu54n3B1pYN/dhl+gJ0n
         bZAw==
X-Gm-Message-State: AOJu0Yzs6xzdTtabVxXjsp1npZUoQusZ+p1fhJoLJrP0ZKKcfXcC6SEq
	/eHxVhcT1UJorz4lCiVUTFny8fFxmUo=
X-Google-Smtp-Source: AGHT+IFFNW9ZC8lDKm7i4qqVMqHZSCNxRUCCe9i3V26IH6y4InGPbRPvIQuZwV3BsbHpsIPwvT67cg==
X-Received: by 2002:a4a:92dd:0:b0:590:8ae0:6623 with SMTP id j29-20020a4a92dd000000b005908ae06623mr11327575ooh.19.1702913887357;
        Mon, 18 Dec 2023 07:38:07 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id o14-20020a4aabce000000b00591c8fa01ccsm854205oon.25.2023.12.18.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:38:06 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] bitbake.conf: Add runtimedir
Date: Mon, 18 Dec 2023 08:38:02 -0700
Message-Id: <20231218153802.3897468-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215203404.2913433-1-JPEWhacker@gmail.com>
References: <20231215203404.2913433-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 15:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192658

Adds the path to the runtime state directory (/run). In particular,
systemd units need to have the correct path to the runtime directory
because RequiresMountsFor doesn't follow symbolic links. This means that
if a unit calls out a directory in /var/run (a symbolic link to /run),
it may actually start before /run is mounted. The fix is to have the
unit specify a directory in /run instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af96..83b12cbc158 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -31,6 +31,7 @@ export sysconfdir = "${base_prefix}/etc"
 export servicedir = "${base_prefix}/srv"
 export sharedstatedir = "${base_prefix}/com"
 export localstatedir = "${base_prefix}/var"
+runtimedir = "${base_prefix}/run"
 export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
-- 
2.34.1


