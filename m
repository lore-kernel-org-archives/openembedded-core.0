Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD61ECD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:59:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127802.1781524766764729184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZiiHNMl8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a76757e5so23276605e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781524765; x=1782129565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoO7ojiXLeSe8bE3gFHu64whsqcgMjzfkb4zt0dpz30=;
        b=ZiiHNMl8ePTGBXVDLH1QxJJ3cQgVY/FAwnZNne6v+ote7HlYsy1FBGI40mdwNpgAjd
         6eQsaIWB64tXDzBfI+WnISu4og/TQ4IYWXJ9+vn8T/HU4d2RXTuMb/9It0Tr0+XssE3f
         omHgKmgmkqnuixq/P1u27/Kxl2PciCOnpBUHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524765; x=1782129565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aoO7ojiXLeSe8bE3gFHu64whsqcgMjzfkb4zt0dpz30=;
        b=bAXeg1ZXct305zB5ldAehWjpq9aS6FKV55hAAKa4YCYUEXvgCWjkLiVEzqpTIvuRSW
         HcUfSD+yZtp197XTmhBAkKscGTUrGnN4BGgdI8vUNigyiLxuUkUeKBoWnPyWJflLBJvs
         cmq9Y72i4BDMmSS/LKVHQRSQlDQQ6LffUGJkR5wPfWbM47oBNzicNVocWLvTvbp+IBZj
         GL7baWjaou6uezoYHGNhu26MarDo/1U8klS3DmQnBQ8A7uSDRMp+pjhScVjltnRRgYJn
         YwQ8vgxLmMHYMZQR47Lq1uvL9sKBW9+zvuStM8jq7NQNHjwc3r6sH6lN1ufUEPHES5GH
         Kivg==
X-Gm-Message-State: AOJu0YzAzvfIlX/7gPCP7fEd3t1WcLWjDNtAYom54WElVISZYN8Rq43y
	njsLA1SGNp240lHyQCTUQZeCM4CWKsnpakAVYtR3fKF76uDETKUf5g2guKilWfCthY9DXBRSWI1
	LciKS
X-Gm-Gg: Acq92OEwoA14TnUw8tbNdcaoO175lXjje9zZnT5OSsR/oBB1COzuPNh8ixehh41EZah
	+sYeRuxfu4G1XK5SngWD2wWP3TtjuclhCR2cYGYtqce6UbtZZ9I0J+uDJ+3oycF9bnaXEgLiAkr
	YaUOQLl+kZJ6b2TfHmrM3OyiNQ+iNL5Xmi4EN8wIQd5aXbzbuu8JbhmKtwUrijZEfIQPq/P4xaq
	9r540IbcgVWRt78wLSe1EHcrCLvY/v0VmExaveAFijdwav6Ysy9z2ZwcoUzlc1OJfrky6UgS0O7
	+GCtPBjzz2pl2wpdhd2EnCWTjbTBvf5EAkC8zrzpUZG/pWZiDydSWC27LQLCoDSW6yqX4m8zZaL
	xBiRi1YgZELDBUYzdHsuGF2lB54DA9vb/eErf5Mm73KZ5nNhuPi7O/wO6y8tiYAKoLMzLkLYSr8
	J0B7L6ZDUZOnAVj94BYsjheLRXtm52PRTS+kwGc83pvRuX5DMyGveB
X-Received: by 2002:a05:600c:c0c3:10b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-4921fcb3ffemr103604335e9.0.1781524764881;
        Mon, 15 Jun 2026 04:59:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2da:88d9:f720:efe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm273306935e9.3.2026.06.15.04.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:59:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] lighttpd: upgrade 1.4.82 -> 1.4.83
Date: Mon, 15 Jun 2026 12:59:20 +0100
Message-ID: <20260615115921.706829-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
References: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238840

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lighttpd/{lighttpd_1.4.82.bb => lighttpd_1.4.83.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.82.bb => lighttpd_1.4.83.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
index 8221d30283b..a1a7bee227a 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
+SRC_URI[sha256sum] = "b3f878156480079f8a93903bd24d456074a0fbedb9b4d99fcd65df33b1f566f0"
 
 DEPENDS = "virtual/crypt"
 

