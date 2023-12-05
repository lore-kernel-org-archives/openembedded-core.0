Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A032DC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:29:10 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.100714.1701786544146590075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/BQDwxN;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: jhatnedap@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54c846da5e9so2828315a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701786542; x=1702391342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X41lwEq/6kvpJ43B530gzZLUch6eeA2glD7DPPnGEv0=;
        b=T/BQDwxNOjoRRvem6bRBJFVdBxjUDkf3uOCj4KdiE61oybzjYEF4KDHNZjd4htLFSD
         95UMwGfHSo+seL2DgMhaCOrXIJd46e3GL0jv9gkmwwrZ0iGMi/AUDUHJKyUzdDUeLiks
         2BKzEUEhPz9Nj9sNgYlMUII+DiynAB6cAwFjnV2qJRqoszGeL0WVu+NcthXIuzSAai70
         hPOFczr+v8008G6nWRS/MP5Pb2dRUnwj/a8atz/0nKuMvx/ZIzsVi1YHLjjlxBC1eDqs
         MNZOjwHzPnSTvGqbmhJLsQxgikGsWSwxBxBE/iizNCvQeRLpUgfdQtVnvghI1iO0PsPO
         lMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786542; x=1702391342;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X41lwEq/6kvpJ43B530gzZLUch6eeA2glD7DPPnGEv0=;
        b=PI9rZPmOGdvyf5VF2k070D9kdcNYiqU28Z6nnTFNYd4/jpM7/HqD2EPuI3IaXJYgJw
         OQAVsuh5S2h0NI3ga62ttFg+zWrtKPpVSyZqTMBsjH17LlNn/Q8Sd33j7a/5ovXaP0SI
         ATLBt8nx7wswkYp2vS8RAy4BTolzf3QnjOeRbePHRhHyaf4rEmxOHejYAlkWHgZTpNNH
         Jb2OcAcX60zux9hEuwKxfV5Ceze/GByE2dpTo9EXZ9M74cKqEF8kifrxnFMQjOew+ZhI
         namqWLMcA4o+h4q9T/rs8MZhw2JraRtNbbSXfP+Jr9yDVQptcskianaUaWGltk/CWEoq
         6tfA==
X-Gm-Message-State: AOJu0YwnT4InUKYdpGFCLm5ZNfn2uBmgRJ44VTC/Y7VmckNdkSQ1wqH7
	j2Hh9HxlkLtEcdbpSYNgWFjVlzhbJwE=
X-Google-Smtp-Source: AGHT+IFmf/ZD/pBeR64wfR/bsMZ7DlurNJuqnB60BKxwbL+U/Dc/fvxOctjtSPFriyInGnYQgQJ4RA==
X-Received: by 2002:a50:d01a:0:b0:54b:922:1f4f with SMTP id j26-20020a50d01a000000b0054b09221f4fmr3911682edf.28.1701786542565;
        Tue, 05 Dec 2023 06:29:02 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id v12-20020aa7cd4c000000b0054c52a78f56sm1174043edw.56.2023.12.05.06.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:29:02 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [kirkstone][PATCH v2 5/5] native: Clear TUNE_FEATURES/ABIEXTENSION
Date: Tue,  5 Dec 2023 15:27:20 +0100
Message-ID: <20231205142810.826-6-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231205142810.826-1-jermain.horsman@nedap.com>
References: <20231205142810.826-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191827

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some recipes reference these. Rather than continually trying to chase down the references
and taskhash issues, clear the variables for an easier life and simpler code. These
wouldn't convey anything useful in a native build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8edeead263708889d31a7ff578ef8274cb678b4)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/classes/native.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 4de96cd59b..56726301bd 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -23,6 +23,8 @@ TARGET_CFLAGS = "${BUILD_CFLAGS}"
 TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
 TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
 TARGET_FPU = ""
+TUNE_FEATURES = ""
+ABIEXTENSION = ""
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_OS = "${BUILD_OS}"
-- 
2.42.0.windows.2


