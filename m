Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3066C7115C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:50:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.26720.1750067411240122494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOllGaJC;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531e146a24so26335295e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750067410; x=1750672210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6RpBSoutBAhK9jR/8VN/yOfqyKSkkzcnVfn8zXPwY4=;
        b=NOllGaJCPqpnhqG2DFaD33BduTs58l5hh6eXhUtrJJZC5tW/esqVOitjcR2DdcsyaP
         PJq9zUs4Wg839TrJFw2LwWDN246bkuMuaM1f5g71znoTxDKXyibwEroMIosK4KudtnUL
         6ZF8kOPFaCm7OoXYqU8CDhKuEmoyFrBBPWsk4afdnR80L5TkCAgowUMuGPivAGvK/BIv
         qrdhEqXT9jxYtJyUjOeQ+je2cNouOkn8YynheV6uYG/6+obkmuXiZRGCRfdQKOkbtzdv
         rAt4UAaC24juw4a6w9temhUhMhxzqxaKJJC4lkUKUU530TPEdhefLmvVWOtOsQ8ixs8T
         uonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067410; x=1750672210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6RpBSoutBAhK9jR/8VN/yOfqyKSkkzcnVfn8zXPwY4=;
        b=wRQ9QCij44E9C8MPEF3EaCWJtSpeUtycVEuzZTsZKja5LHEMfkt29IGQtcED7eZ7gm
         w5X2XAUfsfUHBFKJ1nISFGdSajssBafQju7BZ9NSEa6QnKrHaxSUkJ1hFJf0BWqo5JUI
         M8DVwSZcwcGhGiivuj8+5sNIY3epIANGQRahSOeKRDX1+J6RgebTwoi3FrcAyHcHSkQ1
         SGWHoRqOB+l/90jBibxSNUHDSwNiQfbLMVz8Cl85vR5myuNkiVAKWNdDqNFRUSwvN+ib
         rLJ0X/tKYh1apLLd8455cDj+Rxj/cT3Jeg7nmKMwfWkAl1urUFbHfXY7JTuENUFnlucr
         DmoQ==
X-Gm-Message-State: AOJu0YxEeK8IkpDMBKwW2ioJbKAQ8pQxkuELIzE1QzZo4Q3phZZcWYDA
	WPioEpl0r4/UwmnewULWdlYYUwpvxJSspZxADt6GMn47Y/V3bARksBW2Pj5zfg==
X-Gm-Gg: ASbGnctOOb/otppx54DRk6tycQCY7+xDuvhhTM93D0g2Oy5wsjl+Qw26sy8K5H5pPQi
	IxWH5zZot/aiVYXR6gdsz0XGWMjCbNAy+Ii3aYgFyL+y50suMkI0jj3U2Xrteq/x4tMlm8US3DY
	bbNwyKn4xnEjbi0jO1ZLbYQUnOcsiMmi5GtwHnKcyskeFERY0U6PjaK5K2RJPe3EChNt0L94t2h
	2x5jbYMlps1BAXGdstNQVw12I0+lUfsgAPfmYjZFPMqLAaubo0r7XOdmyLOtrwU5kwFha5QaS/x
	scEXjqfKr6SGU8lZrU1fi+pOkkI1WuSYVDQYbL0tvZ+mM9yeOb6Z+eDp6HDfCrT6yMp2as/Ec1m
	ZOrxCwh/2o8n2kctN/U1doRo=
X-Google-Smtp-Source: AGHT+IHXvEuyRwQUM24V6UJJ63nrUCNQyD2x42mS6fE4Yxdog6fI+xt8ven6MVwBDBXKtvlJUvgoTw==
X-Received: by 2002:a05:600c:8b62:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-4533cab85fbmr65573145e9.25.1750067409509;
        Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm72811805e9.23.2025.06.16.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/10] insane/do_qa_unpack: add checks that ensure S is set correctly
Date: Mon, 16 Jun 2025 11:49:58 +0200
Message-Id: <20250616095000.2918921-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616095000.2918921-1-alex.kanavin@gmail.com>
References: <20250616095000.2918921-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218806

From: Alexander Kanavin <alex@linutronix.de>

The checks are fatal, as this avoids rather more cryptic errors further
down the build. Example:

ERROR: gnu-config-native-20240823+git-r0 do_unpack: Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.
ERROR: perlcross-native-1.6.2-r0 do_unpack: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/perl-cross-${PV}"

Dropping the S = ${WORKDIR}/git assignment (addressing the first error) can be done
with a single sed command when there is a lot of recipes:

sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb -o -name *.inc -o -name *.bbclass`

Replacing WORKDIR with UNPACKDIR can be done similarly, but should be done after
the removals:

sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name *.bb -o -name *.inc -o -name *.bbclass`

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index eb8591f6242..0a0a38a3b43 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1431,6 +1431,14 @@ Rerun configure task after fixing this."""
 python do_qa_unpack() {
     src_uri = d.getVar('SRC_URI')
     s_dir = d.getVar('S')
+    s_dir_orig = d.getVar('S', False)
+
+    if s_dir_orig == '${WORKDIR}/git' or s_dir_orig == '${UNPACKDIR}/git':
+        bb.fatal('Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.')
+
+    if '${WORKDIR}' in s_dir_orig:
+        bb.fatal('S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = {}"'.format(s_dir_orig))
+
     if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
 }
-- 
2.39.5


