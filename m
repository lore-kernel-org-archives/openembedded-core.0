Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF89C001DE
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.138754.1692116688236515173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Gn5/qTpe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdbf10333bso33247725ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116687; x=1692721487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=waiiArZn+FC6VHEyDAmcutZrhdKWg6Ld8IV1h9vCaxc=;
        b=Gn5/qTpeZtK/r2RXYVEoOe68xzyEwySLL6xECdKvCxe0JAgodaaSjntNjXjz6te2ED
         fyLiM/XktkhCFb1i/o5x7WIPxhAOB9yoVKvUdGZ/5xmt2LUlgGMxMhd7Xq+MADNCrAdy
         Ax/gd2pZAKZEQHUnb2Qm5uT9cRb1njN37T6Sg7qjN8eqhmLP6t86hcFzHBFe/IbLAnPl
         e6ZqXI0E60A65Sp9ZTo5AJU9NQGLW1BPq0AuMK7QcbXo9gTCD/H/QAmym8RfNnUHt1/R
         KPCf/w+S1wrjhxBU4DBukc6ScR5dsNjhzljPNWwg0AvhhMVHpxeUyd/ejAqDXxZuXLRD
         mT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116687; x=1692721487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waiiArZn+FC6VHEyDAmcutZrhdKWg6Ld8IV1h9vCaxc=;
        b=axqJVRqmZ6rRU8Rgj3JgNNkkKWH++PaFJxblqSNY4oWqe3ptc++y7epXgDRbfCf6BS
         cMsx0Ou4Emv21bUBjQyJgE/HbG5INHZx5uP/OBmYEBetZeh6Yz/e0GHDekXezeNm9x2K
         jYNVMmw4lmVXYBg33sqt1ybpxHKa53NH4G/3o8eBCRbjmC/uwPOOCfsqtq/kMi3mQvmx
         8puww9TRAW69rFFNHLOtgri/bI98yox9WF0XIQfLFAbOg3Bw3pi7D/soy4cCymp1KvT8
         1Pfpn+2UqMy9Afec57HNKqKEiqSeSwW8CDEhCYWWcgrEthlA5xdS495hPZq8/wc5203b
         I/Gw==
X-Gm-Message-State: AOJu0Yy1+UcOpY1HkH3lLho6KkDaGxXcN4AxevXBgwksutC0KtjflEN+
	oASG1S5XAfluo5/ryOGJSuoWbKhUxcw8mqvZRNg=
X-Google-Smtp-Source: AGHT+IEUn5W7uki68V1CxBC//TR5fGYAxhq2I2SOR2v/RKg8CVaJQ4i1wJbmuTGLZLFxNkl19B+U4w==
X-Received: by 2002:a17:902:d2cf:b0:1b8:4e00:96b with SMTP id n15-20020a170902d2cf00b001b84e00096bmr17166949plc.9.1692116687341;
        Tue, 15 Aug 2023 09:24:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/18] openssh: upgrade to 9.3p2
Date: Tue, 15 Aug 2023 06:24:16 -1000
Message-Id: <907ad7d45509020ec4ceaf60d0bc654dd2fba3c2.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186086

From: Ross Burton <ross.burton@arm.com>

9795c401 (tag: V_9_3_P2) OpenSSH 9.3p2
bde3635f update version in README
f673f2f3 update RPM spec versions
d7790cdc disallow remote addition of FIDO/PKCS11 keys
b23fe83f terminate pkcs11 process for bad libraries

This includes the fix for CVE-2023-38408.

Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit 7ae89bdeaa97c8d6a0b63e92da31290548f03168)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.3p1.bb => openssh_9.3p2.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.3p2.bb
index 42ce814523..558e027f5d 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.3p2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
            "
-SRC_URI[sha256sum] = "e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8"
+SRC_URI[sha256sum] = "200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.34.1


