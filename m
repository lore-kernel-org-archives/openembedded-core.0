Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D580C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.4649.1741809162650425362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2j+wr4QQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223959039f4so4484545ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809162; x=1742413962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6cAAwejhi+f69uYwan0enJPfxDv2kjPwJw+c1V0Jio=;
        b=2j+wr4QQ8ZjH9gpGtBvBYY4ePbu5lk8pDaqScTojtRdnA134uHFo8lQ2tzKnXkcIxG
         KyhWOB14YI+2kWc9uuUZ0Ufijix2H82HwiNq6aiw4dD3Cz0bJKS4yJ857jk8mfv4PUoU
         JEt2YMiQ1l7KSe9zWvVzHp//vak5vqUddkDQKVDV6N0nEpZuDiIzafsVYFHRZPbSIZ/C
         mvpqoLGQJBegflKGgNWD4A+/MM+YaRgqKad73MO6OQxeNkwGeDe+MUscxQS5qAI+iYDq
         cUkoIAVHccG+bz1qBDXXlu33OQjVQxcnthG5uk2TkOM+bbB6VK+nkUS8/EUD5ojYKzXw
         5Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809162; x=1742413962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6cAAwejhi+f69uYwan0enJPfxDv2kjPwJw+c1V0Jio=;
        b=PTX6+d/HahGTXBVphOj2QaaavtqMq9R6XrVkh5BLBz/riVdS2h/1zd1p9VIPoItXYH
         6AO7Cx92mWkr3hm376/CRSaFCKsTqwjHlGICA1b9kWsjRKz3GmIh3ccHbVIPJKewfvCj
         o2h/HYQVEvscM+mw5zqJf7RaAggsvHneN4cN/0bbIKOhK1j6HouJz4UWHMh9gLfQE7G3
         QbKoG3bk6Ng3aSD/tFr4+uB9cBFLtYqm87ATDoabT+jztiaVqlVzZeLbvov3loTsi9I9
         vJxq9S+XTEtFAbbXxGrL4TP8xlLvP7WHYul5PPB/OaMNGNjYscbOTcfGayddOfkH29Pq
         bo3Q==
X-Gm-Message-State: AOJu0Yyqy2u6++Y4dI14Ij49ZOcAPP8aKBn6CJCHM86PlPhTu5SdoAUs
	iBrSilUdt1J3ONE/2pW8Rii2wqq3txRAEcS9zZHFJ7YkKzqBZV5vxcbPp03pgli9w0ZSavigNdy
	J
X-Gm-Gg: ASbGncv7Sq2s8Gpnwq939QjBFyWkOX0exKhuDoAXGRnImJb0vm7VvQXs+lLk/qWRKk7
	Jk8VqItyyAcxbmm+7elEwYST7T7HnVylVNuMve8TJOT8+5JHuXmjSqCf2iD2n2uDKF3NqmA0ZTw
	k0LjPwP2YZy/7l89Lf7G/mNOolTmHVWxLViAeAOU8edduSWmiyHPYqM6xTi/6I2PDMRdl/ZEeig
	q+uJHi7S4gh3wJuwDZMnRC7EPcOJ03oB0CCKMHUp04c1cr1FrBCzgvitcPs0DcSSitRlxcy3yqb
	/be2HE2llBp/9O1r5szHocTsUgVTKMGYe9Q=
X-Google-Smtp-Source: AGHT+IFAikYHfrl1t4I6Y/Doihne4mxN4Pw4TSaa0MLtuOCnnif9auBb9QUN7WfIp9p86UVMUuGdmQ==
X-Received: by 2002:a05:6a21:4cc7:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-1f5884aad41mr17131244637.41.1741809161886;
        Wed, 12 Mar 2025 12:52:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 01/25] puzzles: ignore three new CVEs for a different puzzles
Date: Wed, 12 Mar 2025 12:52:09 -0700
Message-ID: <ad5e8f160cc98c9ef6590656442b61dda8f0a386.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212668

From: Ross Burton <ross.burton@arm.com>

As we just match on product by default, ignore three CVEs which are
for the "Puzzles" WordPress theme by ThemeREX (CPE themerex:puzzles).

(From OE-Core rev: 87326573c82ac1e8dc335319442236ef2341501e)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index b47d3d3f30..be61abad50 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -47,3 +47,6 @@ STOP
     done
 }
 
+CVE_STATUS[CVE-2024-13769] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2024-13770] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
+CVE_STATUS[CVE-2025-0837] = "cpe-incorrect: issue in ThemeREX's Wordpress theme Puzzles"
-- 
2.43.0


