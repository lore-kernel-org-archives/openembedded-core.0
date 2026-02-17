Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD16E7BDA6
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:59:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11255.1771333141187763695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZbTEUAhb;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso2735928b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 04:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771333140; x=1771937940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U9b6YcarKGdRWv/PQ29gOJZCqIat6ruLNoEpIL3EnM=;
        b=ZbTEUAhbnGax4wOi0P1KDsPsnCtJFjTo/oJNDHRgSIVRV7L4NQv33IGUSctGj2X6Hc
         WrvjuTzqfunpPtN+Knh3YJXWm8iIp1KWy5uei/BRsYTl0naURRhy8sJaoRcbCIzNr2tx
         5LsE77SMyTDg3lUMpZXAXiL2v0DK8zAhFiTYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333140; x=1771937940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6U9b6YcarKGdRWv/PQ29gOJZCqIat6ruLNoEpIL3EnM=;
        b=sg3leqE4XyNPLNuT9BsaMkpp4i/5Kxvtip9jis9SM8cKaZpkEDi73NyMqh1J9TB0a3
         caLVTtcnfnvDQq+Jbo1JeFJ0k5h8nDyHjFyHy/TgOT66CGb64y6FxvOns1pw7ZR9EdlK
         zY19tZCwJyk8AZjp7xbtYjucCsJJ4ZDT3EQ8v/0XXz7JZW3ZmP87KNnAQd9ZjN1bBDnC
         1coWhfoYzjr3Kte+DV6WmGKbRGmRgEhW8YWZFgN+aR2r3jON1a8sV8FNYC+0N3n7BPnX
         nU3o8LiiCWWc8h/oSM9Sl3qwE7icL6ETTbbcZrd+gChBz8bzcW+LLP1IVuisnga5U5lN
         t+9w==
X-Gm-Message-State: AOJu0Yz3zoG8CnfVsVCYBcbEJFL/jZPXOyZnFxitG13LIR+3Y74XbQWF
	ylc/sfPnB2tw5NH9gQVsz61xxZt1DniDpADgvGLiz5tGQilWTuTeD+og4oQxf24oGdGqIX/+GZI
	MgOtiueM=
X-Gm-Gg: AZuq6aK7CaKDsw+DByO3Qu8sNhsbvR0jCcjkrIwFHwfCMeg2VVN+k54EdSHlXzdx1Pd
	1zmaFAV+ytdmIvfjT0uMvDGPm0eiRHQtshVuBwQZi3+sJ5ni8HRyEHouklfU1CHA7zPhsAcQlcr
	UPQ5B7CVmD6Vx4kjYBsK8Cw7WZguXgHH6PBfCjsk9rAJIZ+byp0a5NrCU/Q1qwcndzuXPRwA7gU
	wV/ElyNw+922AdqgOiGCofcQVuySzG1XTGIMma2mokAKITPVC1rIW1keib1SbKMP+HvpCBzkeIV
	2oWU0+KaIxF1oRbxi2LXqlC/B7BjKhB0etSDSS/puDfTmI2xdjaHKalqFhMNlwDdC4iV5pU4NOj
	g+G1mYhko3orXe7Ko97AaTjoiQlbpKC/0MdbQQBFQoJRV2mL3UTALkd2IXrQZloc8AT/M1ITkt1
	nKJDAST1T1GsCP95jQb6x7Sg4T610p2lZ+jFU=
X-Received: by 2002:a05:6a00:4fc8:b0:823:1276:9a86 with SMTP id d2e1a72fcca58-824c95a1fe2mr13394152b3a.39.1771333140242;
        Tue, 17 Feb 2026 04:59:00 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:795d:cdd7:ddcd:102d:80c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824cc22f4d9sm12641588b3a.39.2026.02.17.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:59 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][whinlatter][patch 3/4] gnutls: use libtool to install test binaries
Date: Tue, 17 Feb 2026 18:28:29 +0530
Message-ID: <20260217125830.2907750-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217125830.2907750-1-vanusuri@mvista.com>
References: <20260217125830.2907750-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231249

From: Ross Burton <ross.burton@arm.com>

If libtool builds a binary it's best to use libtool to install it, as
otherwise you might install a wrapper script or need to make assumptions
about where libtool has put the real binary (as this isn't always .libs)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 675e8c730132ae02092400a0f4f170782afdbb60)

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.11.bb b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
index 6c979430cd..5b44c66dfc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -71,7 +71,7 @@ do_compile_ptest() {
 do_install:append:class-target() {
         if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
           install -d ${D}${bindir}/bin
-          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
+          ${B}/libtool --mode=install install -m 0755 ${B}/lib/fipshmac ${D}/${bindir}/
         fi
 }
 
-- 
2.43.0


