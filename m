Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E6FCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:29:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25582.1780507773613236467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 10:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TQ85sSAv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3797950f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780507772; x=1781112572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kod02E48EkyNBjPqOZUgS2men302A0iKD/Zrg5OrmaA=;
        b=TQ85sSAv29lPP5HldLcvVl8biHT9Px+mxeqxA86Wa0NsuBWfNlqLC3h9Ey2GlGwD3y
         NiGFOUPPkkygbPm/ELKRyMebZg8iQqPp/1zq+p+Wl/p9NskSF35xB8LOcQC1RW5rEdTw
         P6zLs0fM0RPOpNKbh43hVUHOZc8wqzGpNjbVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507772; x=1781112572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kod02E48EkyNBjPqOZUgS2men302A0iKD/Zrg5OrmaA=;
        b=j4al4hoIG7ofOcYzXirb9khBHgU6ZspeD9wG2MPhiCGAtaKEkomaOiYd6dJouwlwno
         CojpsjsMqVLb0yWM4pGgSaxdS7lJ6zORh/ArQHk0Rc8fGHFDc3DxbjoqSYJuyMfXGo1o
         3Mww5HHuvo+vez6ZL/9mMpv/2JGUfa55Ay3BA7uuQzFKMxJSnqVGM+dwUUYjMg/2zDpr
         67pC7B7t+sQ0bfbkRubHZ0gTiG6AUOIgU+ubIvDKB3CUe3nQT7tZS2wojY7ZgsqKPa2d
         cAnMZyadZ3ARjnfpIHpCNbUY8dmKx1t+XqGziNxYNhf3p1YbWAFQ4H5lNl+ARqfrDJ3+
         nYlA==
X-Gm-Message-State: AOJu0YwTcrBr4kyu2X9aIPS6YlNYQBZ3T4jBN9Oc5/jopVNOIjyF7UwQ
	QnxUkAu6t8jbuRikdom2G/V/NBtn5jM4bGzL8V0vLPBvQwXmaNmmKMvR0xYXaRaL1VCT1oWce88
	ks1SV
X-Gm-Gg: Acq92OHbKsTe/dBzMdRdvSogjRyR4cn6zP9ZDpBwdZ8mgaL1E4LLcTAxG74XzVN7kIs
	Mo4jFFMFzvB5WG1XmtnRAjSqgJkPDl6TqI8qLsSMPLCq6o0YggsN7v5SoVFE1wxIAULbcUWUdXo
	GHBXpKvWSN34IlrdKKNEaENiNfblYInWFQSii+QFw7aSy5DuzwG7z2wS16A1KAFksi6NyNeqz3c
	/LlI66i6lijsrwi4XcHxT4MmN2cfUYqOXzzzlU3dWwpPtEU3JbC4qcEgK0eaD+AP4G5LnHTTyNn
	9eYIFo9ezhheDJWuwJ4TVP/ubscVpiRj2B5jHWPV8T5hNaUZlQBd/rYTP4QIyZoTDcRwWxT57hh
	5sBDJbLZiyDFTKBU7cCPgL3iKlZFnI3W0LVM/VRtNrNPAhcanEz2xSP39fXTiHcJkBtytewdhHF
	0rCBzSMEWei752EoxsmWLNxybMvyb+gxDJofxMyjtPLV+b/0V2+FGopRXmEmU1XQ==
X-Received: by 2002:a5d:620a:0:b0:45e:891c:648e with SMTP id ffacd0b85a97d-4602178b6dfmr5263661f8f.8.1780507771670;
        Wed, 03 Jun 2026 10:29:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:202c:df88:9261:8b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm8479796f8f.25.2026.06.03.10.29.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:29:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ppp: Remove PD license
Date: Wed,  3 Jun 2026 18:29:30 +0100
Message-ID: <20260603172930.1495685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 17:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238109

The code referred to as having a "public domain" license (chat) has a
MIT SPDX license indentifier and matching license text. We can therefore
drop the PD license field entry.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 607678db8bb..37e223b4abe 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap virtual/crypt"
-LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
+LICENSE = "BSD-2-Clause & GPL-2.0-or-later & LGPL-2.0-or-later & RSA-MD & MIT"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=25;md5=f0463bd67ae70535c709fca554089bd8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=1;md5=234d7d4edd08962c0144e4604050e0b6 \

