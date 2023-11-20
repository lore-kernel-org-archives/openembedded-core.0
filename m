Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9CDC5AD4C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:40:03 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.639.1700498399037799219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hIM5u9R+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so3615904a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498398; x=1701103198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUf425jtR2AXjFbFh2+4IAgJY7SRsxlaBEhYOqUk/G0=;
        b=hIM5u9R+F+o2/RZq5bndmn8VyIsT0EX0CzSC5GGrcpMKgAV5uw9h6n/ObFr/GQZcM7
         JrjHcuI59An8Isn/2T55y5Xp+WAU1RtdNzXQn0rGQXk3FgyKseLS3GxanhV3IzxZ1Qk9
         fPGLh4t/NPrf9WSVSBu1pTp8nwNLnVAorgKFm+1jmgWfieHCUC6RRFPSIc6uwqoQtgbC
         7h3NbtUEYCuchKI1JoD0BWaACijuz/sWiMa9rhgfNKmNGXEES62vZRngs3pONfHMQlbo
         ATof7JbY5Q6FFKJwZ8bzXcgavZAFULpfoJ4h4gKkYdwxHOspQQvX2qeXfq3DEBNAA9LL
         aCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498398; x=1701103198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUf425jtR2AXjFbFh2+4IAgJY7SRsxlaBEhYOqUk/G0=;
        b=t0J+NjgUebvh2cYgpEaajhKMzx9IFrpcyUfXMIPZy+SN363xlJYq3jv9I2MmFcM9BH
         +oaEDmms2cdTpYQk8lxKX/ol0J3nFG5zhJ4m9M0IUSZcuE4uMNmB3VZaHbYmWK/TeLMD
         XRM7k32Crjng5p3Pt3tzLa1KRSHVzMW2Cr9MC6zGV4rUmcXsWDf+5X5MP2BOdo0oKn7O
         cj6OdGDOpoLSN09xC7hAp0dEBKnnPqJ/m6JrJOF3VxgAttsHbiOOHBBPkgqZR9UCUt9q
         81i92TewwlOi4qFLHAt8t8wXrvr9E5atszu4upE5XJYKZCTIzFiQKPB4slojOuU4r6GY
         Tzsw==
X-Gm-Message-State: AOJu0YztU/g7y7OYo8RCOBI2zi+Q0bI77F6nc71OkQT3WtZxO+7CtQDL
	4uHBqpvL4NvGa+A+g0H2Xv2Io4DiiVesUEwVSQddEQ==
X-Google-Smtp-Source: AGHT+IFYX5IekCaAbAKRNNCkyeyE0hkT4Fb3Ic0BrlNv5VhJiyqJUY6m463QCBStyd12/LMCQUR3RA==
X-Received: by 2002:a05:6a20:1453:b0:187:cd37:c463 with SMTP id a19-20020a056a20145300b00187cd37c463mr10659459pzi.7.1700498398192;
        Mon, 20 Nov 2023 08:39:58 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 32/33] patchtest-send-results: fix sender parsing
Date: Mon, 20 Nov 2023 06:38:46 -1000
Message-Id: <b89a8408d5cf3101e4e9144ffd38bd8ae4730340.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190921

From: Trevor Gamblin <tgamblin@baylibre.com>

Not all mbox 'from' fields will contain angle brackets, so the
re.findall invocation used for getting a reply_address may fail. Use a
simpler reference to the field to get the sender's email address.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86e9afe09a346586114133f5a7470304d2ed733f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/patchtest-send-results | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 1df81f943a..71b73f0940 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -59,7 +59,7 @@ subject_line = f"Patchtest results for {mbox_subject}"
 
 # extract the submitter email address and use it as the reply address
 # for the results
-reply_address = re.findall("<(.*)>", mbox[0]['from'])[0]
+reply_address = mbox[0]['from']
 
 # extract the message ID and use that as the in-reply-to address
 in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
-- 
2.34.1


