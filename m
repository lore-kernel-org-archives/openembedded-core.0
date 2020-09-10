Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20663.1599740592738545808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O6Fna9oX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id c19so1778759wmd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vzKXFygvbX27ZhgTstdA1wYSsIYY0ZwQVwQ5eGYccNk=;
        b=O6Fna9oX0F8L1WEhOQm2Mkd2u1lHe54KuEjktOhlIOstB14/Md3yI4DBU0l049a2jy
         QTzIDIdub3BvTGNBYHCeWUvR65qSJiJb4znKXLG/daG5EBvRhfrNOlj1ACOxHs9bEppK
         HfLmovN6Iir5x93k7Qepm1ar2URcnFuhqVWDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vzKXFygvbX27ZhgTstdA1wYSsIYY0ZwQVwQ5eGYccNk=;
        b=PcuzGyT3yIB6i1+DoPktqpi9JaCiP3eM36GwDS+TrR8RdlzX3Vv+n9AMtFCfLnZ8ZC
         hc7zCgc8QrVB4ggvE/6rA0Ln3X9Q2M1YtSUCG+/bF6ySCjRy6afZrQZCn4n0ZqzlZYS0
         whdRGQSlwZBiV9CKXIegYSCBM8yLDrFu2g1okPTkUkM/B1rmijE0fvz2h0vEghq6awRu
         a7QmpILi1lRdA7YrO3vSxYJwCwLnVFGD6srYp6H3XubnC4achbqPTrAIZwd5pbZECOtt
         FnovfUwl7fHX6pQOHnkE/PZ0YtdH5sduL7RjizyuDzq5ypaidF6jaHoVtCGBwvFWYS/q
         +mtA==
X-Gm-Message-State: AOAM531oSH//+0fdgG8N90IaSR05B8IxwoNbPKSjFNvEW2NXyw2caCy3
	+51RMzlDo0HYob5yyN0Gr7jQB/BpWsrnYA==
X-Google-Smtp-Source: ABdhPJwuiQ7EjH26pbergyoJbHNYV78/Wx5JDbOE8shSlD/e/UpWYO/T0HhHGDcS6X3hQyQwjG7WQg==
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr7906253wmj.64.1599740591019;
        Thu, 10 Sep 2020 05:23:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 05/22] files/toolchain-shar-extract.sh: Rework PATH cleaning
Date: Thu, 10 Sep 2020 13:22:49 +0100
Message-Id: <20200910122306.2040194-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to create a clean PATH breaks cases where we install a buildtools tarball
on hosts to provide newer versions of gcc. Rework the fix for #8698 to clean up
directories in PATH which don't exist isntead. Do it with python as the shell
version was too fraught with corner cases.

(From OE-Core rev: 7674b63819aa7ca95ca5ca5477a5cce32e9691eb)

(From OE-Core rev: 9825236deacf6eb311121d233435a46288c02cdb)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 156085b5003..d9112eab72b 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,13 +1,8 @@
 #!/bin/sh
 
-[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
-	LC_ALL=en_US.UTF-8 \
-	TERM=$TERM \
-	ICECC_PATH="$ICECC_PATH" \
-	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
-	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
-[ -f /etc/environment ] && . /etc/environment
-export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
+export LC_ALL=en_US.UTF-8
+# Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
+PATH=`python3 -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
 tweakpath () {
     case ":${PATH}:" in
-- 
2.25.1

