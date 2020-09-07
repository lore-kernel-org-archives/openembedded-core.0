Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.6537.1599512007615616254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DDNLTDH/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id z4so16969587wrr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8dl0kPo01sG0VuKgIJqJ6ABViZ9H0/J2ZMiOr1RclCk=;
        b=DDNLTDH/5KEk7R/lAND+a9pH5oGoGnChHXYWXubM4ls6AYNo8+1lhbMgA2pqSpslHq
         cH4uy7ByDzKgKxagxnNHusd23ZxpyyTmLm4w63sXpOQ0X9vGYzGe17+mY99qnYUulljo
         Qd/koqRafXLaU3BIu4xOsz/D4v79WLFW/ZkQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8dl0kPo01sG0VuKgIJqJ6ABViZ9H0/J2ZMiOr1RclCk=;
        b=owxrbVqT6MMk3pJyzCD72wWsh8H2SXPdZosbsv7X/usksNiGG6TPN0o8J1EsRkC1/Q
         +9w6PeDqymNwFjqnRnDV5iNQtnscMHbb0b+2wEmIWFN7VHD3DGvNx8QHIIEDsodL6JU5
         TSEQd7AYHt48bnhvFwh6JAlBlySkuhE/Too7kCBn8DwlLbFNIrX/qfidUr1gbIniXJ4g
         6x6y+xpDJ906rKb5MBfEU4l/0uXRQpgXVz6uEq/hVu4LBjvl9FrO3hiqv7aYNOz3Vvs5
         lHOtQifKHFU8qq8yAp6eNchlRKq1RZgYjDZ7rRovDqDSS9PfUFZL3jnv9lhKMkhAfoxP
         WKJA==
X-Gm-Message-State: AOAM530+48P/+NERSSvnuXYGKz+NZpze50use6GOFe8qcjkHHyK2sqE6
	Yo+Zb2N/wmX4kYPVoyuYcq7De/sQtbJTaA==
X-Google-Smtp-Source: ABdhPJzXBCo/iw5vplNISTm0pFkQY9AImJt9GC7WljH1fBczsBUTrW8QhGWNWGwc7CYbKd8pTSvTOw==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr25081425wrx.251.1599512005838;
        Mon, 07 Sep 2020 13:53:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 05/19] files/toolchain-shar-extract.sh: Rework PATH cleaning
Date: Mon,  7 Sep 2020 21:53:07 +0100
Message-Id: <20200907205321.1941682-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to create a clean PATH breaks cases where we install a buildtools tarball
on hosts to provide newer versions of gcc. Rework the fix for #8698 to clean up
directories in PATH which don't exist isntead. Do it with python as the shell
version was too fraught with corner cases.

(From OE-Core rev: 7674b63819aa7ca95ca5ca5477a5cce32e9691eb)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4c4b4deb4cf..2e0fe94963f 100644
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

