Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.10570.1628177896892396438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PqLOWiPa;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id w6so7865677oiv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LjQozHvcDaIzP3f+6u7aSft4kdt81QAxW21XpFZAOvI=;
        b=PqLOWiPaXVp/zsDv8MCaaDUdSjG/yAQ1UYYQBdrQy3/eB+w+3W359Xs0zvM7iix8YY
         orYqqc/AeCEhQtmjfU2uHzI6S6avDhdInCeleWQdaPnyU/20G8UmSWK5cdQwilyku9/7
         33HvZYZqWDrk2E9U9sxYoAAvtvVGiYuOY/CdqHNihhcyyQ/FE3U9vYHPzaGdAPCnNG6H
         SQD3B2km9mfOe4D9a4yQ3G1KQAjx5vMhEeoQG1tgM5uBIP9agCw3cpAtoPEXZWn5Iqum
         u3v+MZXVAhv1yoaY0+ElV+H2M8zfst9VZI678AnLi1dUyzo3xjeqGa+AxkOKZbuawm7l
         D8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjQozHvcDaIzP3f+6u7aSft4kdt81QAxW21XpFZAOvI=;
        b=o0BXfzyCDGVea72ddBw1zkt7H6sR0EFzZxowWHNCBnjohmcNP72LrmgxMzYsa961d7
         S0yE/onr1b8oqFGDpiTv9ffLc3Acuer6u+I7VtSpToLiuDcJzpdFmUhCH+B8lkAxzidE
         E0NbpXSOT4X0VkA4wykwPE1hh7Y5wmRWG+DoGOaD0iYCTgfCWx43AoGRfmaSzqgAR/la
         c/pw1W1ALrzDpJ+sT8lMpKvuOW2ND5TMBOJSiZN7+K+MjHqCGxrOauBhmj+E/NxvarW0
         HA0XCJ0QvrguRMaYQB4OhOa9WlQ9R2nTt8YO0QJ82/m/XapAFM7juHUYftXmMwMOKEq1
         W+gQ==
X-Gm-Message-State: AOAM531QMlSvzSdFggTFr2xTA689ULTAJLxb9XwI6rUVp8KAsvBLtLX/
	Z1dhaRvAmRSLwyTeKc5rPUDKS/eMmUOPUcQv
X-Google-Smtp-Source: ABdhPJw7uwkHPC2O5D+l6jNWd8SytWeMueq4iHwKJwOmyys6mOx2/s0qCb9f79Oo5tpRXGo+nMpyPQ==
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4092414oiu.19.1628177895857;
        Thu, 05 Aug 2021 08:38:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:38:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/33] sstate: Fix rebuilds when changing layer config
Date: Thu,  5 Aug 2021 05:34:10 -1000
Message-Id: <bae9c6482271d53dc28d3c801fba467e268003bd.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When adding a layer which changed SSTATE_EXCLUDEDEPS_SYSROOT, the state
hashes were changing when they should not. This was caused by wider use
of setscene_depvalid which means the dependency on the variable was seen
when it was previously not.

Exclude the variable since this should be be included in the hashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09725a29365c69ccbd603fe3a1de72189f26d5ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0a25e3ed9d..c148fc9edd 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1014,6 +1014,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
 
     return found
+setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT"
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
-- 
2.25.1

