Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4109EC47090
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 03:29:46 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.96575.1670038177700646557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 19:29:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdGA5X1K;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id a14so2563225pfa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 19:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o80fAekTuFn3zbqaOPonmHDc6R+i1IP8/dmfhyY9uqU=;
        b=UdGA5X1KRYU71MIJE6mKsRgAKff3x8ujFTLjthucAM5EtDXwLwTECnEONp6fBt7Pn+
         ofhWC2Jzth6O1zEIjwH0QelBufjEbQvdDwWy2Dph/TetlCPbxG+weNCm4HKG2pS+g/Kd
         dlViIzgVvp2tjz0aCQk64z7MR5vK/aQNHlPLFsuFi5fWZ6T8r6W7+OokVlRYMs54szaX
         gbBH1YH2kYAm3qrPffn3fur57ckzc498tWt5twImNLXpJndAc0dkwdJQjdaV+jRn4v7Y
         SB3V8gvj+M6ez+bitbez17JGYHgTc4wTearwdt4FbPLoklOoBwRBiQsWGsUxiWKBm5Jk
         KsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o80fAekTuFn3zbqaOPonmHDc6R+i1IP8/dmfhyY9uqU=;
        b=JmavFZxe4ttKztwjuAzV38om9LQo8LnIrqoQwVZXRDWtFDSN4eadgzE6EniLZ7sk1X
         P8pRuAqLaz/8svrW3cgo6C6y/JMvaMv4n12CUOqI/hiKv22t/WSH529iprC6LzRM9RH7
         OHOx+caEFMbCSeiPVGo85qVd2UuXlqFhZsv2sRearGcbIAlHUgBMrmtfqZU4KiJeMYfl
         hbE3dJyDd8Zoj9HVeAuH8Fhcb4s8rasUSbUu4gtg9aZxYmjq0CuFd3iR2PcqVRBgbDGT
         +MfUaTB31fDZdJ3/MdycwrGhIZZHZKiK1oAq4X+F7QGsyjHlEue7lKBmcLvtcv7JUKSE
         CLXA==
X-Gm-Message-State: ANoB5pnkZRdLF/f6xjr4vHahQ4XnhZYrkZKMYyHHFIBMm7aMMeK93sAK
	pfdhZQCe3K8RZeLQUtWpCpIr0olpe/w=
X-Google-Smtp-Source: AA0mqf4Fn/Gppb6/p982fKu9qH0w5aTo7Yv4oQe000f/uk4A/XLqRpIpY85OUkXGfK/slBim9LvPqw==
X-Received: by 2002:a63:ff5f:0:b0:46f:b6df:3107 with SMTP id s31-20020a63ff5f000000b0046fb6df3107mr48020411pgk.454.1670038176653;
        Fri, 02 Dec 2022 19:29:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902db0b00b00172951ddb12sm6366234plx.42.2022.12.02.19.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:29:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] iso-codes: Extend to build native packages
Date: Fri,  2 Dec 2022 19:29:32 -0800
Message-Id: <20221203032933.878802-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203032933.878802-1-raj.khem@gmail.com>
References: <20221203032933.878802-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Dec 2022 03:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174248

Needed by gtk4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
index ea7c43cdae..1c884a1174 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
@@ -20,3 +20,5 @@ S = "${WORKDIR}/git"
 inherit allarch autotools
 
 FILES:${PN} += "${datadir}/xml/"
+
+BBCLASSEXTEND += "native"
-- 
2.38.1


