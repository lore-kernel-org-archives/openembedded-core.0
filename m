Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74464C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.9117.1645178792579970441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G0svo3IT;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d27so13637254wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IXHAB6I+pDSCVuPeXmX5oIksmkaM4iBhrMzsALZVnKs=;
        b=G0svo3ITyI+mBDc+eAHdAwiFtqKCO/CHp33o3WhYznrQ01ga32ST+7NfOcvueheBaN
         jK5oseJr830TDYelgEYx4DV7hSL14hi0ZnSenooTMsoV448/1O2l4dAqFu+73wVSgYiz
         UzgHu8gchCxnr0d2VA/Ol4eobBKB5eTpHExPVRtanqEP8Q6QMzSePzzTpZNuoebF8+9g
         /mvLYvHe2ZW7vXjTuIOzEhJ5kpsj+uPvmO1602wBrnEXMkiQYMRhluH68l9Dg3rRCO5a
         UsuT3rthyyTj0zd9Rzvp9pEuFm3TfgiFzghc5bGEWs+9wwlyPny0uCuFk8SJ3NO4TBp1
         kSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXHAB6I+pDSCVuPeXmX5oIksmkaM4iBhrMzsALZVnKs=;
        b=oUezwRZhRuRMagF6qxg0lz7buvNJ2D0IRBzUf7Hj0BqsC/ASG3xN8/QykpKnAIJrZx
         HfmUSYc5wyKPc6e7LF4lBjHGn+u7IGwFrqZqHDKF9Z8lEAd9GMdTf9NuNQrcDsOW9pwD
         +yekdgKto+jBu6CdmHg0hM+2/NDX3ohlDJxVHoZlI1yA1Mgnh2TT6Dtm8f6SFwbILDbJ
         8oOPNx/TCX5HRbPI04d80nhdmfvUV4dZG7CsRtyUAT0XllgVeV9VcgrTYIgGEE5qJFnU
         wdYd+D9GwsBN0+C31aZniH3WxjHnKb148h2m9O3GXWlA9a8iyBVnTnL2JZJ0cwT18lAX
         vM7A==
X-Gm-Message-State: AOAM531jZOtQZXasyWBVNFTe7QpJPzLcpgZtCtiq8Vou7iWNgPoqTkQr
	PtH8iYA1GeqS6zcVOH7C8OIwY3u3Chw=
X-Google-Smtp-Source: 
 ABdhPJzNHmvj9vRWVHb+EuIhtvI7dCaLR5m6iAT+CMlwb4jl/MxsvVO3a4/pk7pQNLJzCQC7Ah1C5A==
X-Received: by 2002:adf:c382:0:b0:1e3:1be3:cc38 with SMTP id
 p2-20020adfc382000000b001e31be3cc38mr5401459wrf.368.1645178791060;
        Fri, 18 Feb 2022 02:06:31 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:30 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 14/46][dunfell] grub: add structure initialization in zstd
Date: Fri, 18 Feb 2022 11:05:22 +0100
Message-Id: <20220218100554.1315511-15-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161902

This patch adds initialization of a structure in grub's zstd, which
might be left uninitialized by the compiler. It is a part of a security
series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...std-Initialize-seq_t-structure-fully.patch | 34 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch

diff --git a/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch b/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
new file mode 100644
index 0000000000..19d881c1ca
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
@@ -0,0 +1,34 @@
+From f55ffe6bd8b844a8cd9956702f42ac2eb96ad56f Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 10:29:59 +0000
+Subject: [PATCH] zstd: Initialize seq_t structure fully
+
+While many compilers will initialize this to zero, not all will, so it
+is better to be sure that fields not being explicitly set are at known
+values, and there is code that checks this fields value elsewhere in the
+code.
+
+Fixes: CID 292440
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2777cf4466719921dbe4b30af358a75e7d76f217]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/zstd/zstd_decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/lib/zstd/zstd_decompress.c b/grub-core/lib/zstd/zstd_decompress.c
+index 711b5b6..e4b5670 100644
+--- a/grub-core/lib/zstd/zstd_decompress.c
++++ b/grub-core/lib/zstd/zstd_decompress.c
+@@ -1325,7 +1325,7 @@ typedef enum { ZSTD_lo_isRegularOffset, ZSTD_lo_isLongOffset=1 } ZSTD_longOffset
+ FORCE_INLINE_TEMPLATE seq_t
+ ZSTD_decodeSequence(seqState_t* seqState, const ZSTD_longOffset_e longOffsets)
+ {
+-    seq_t seq;
++    seq_t seq = {0};
+     U32 const llBits = seqState->stateLL.table[seqState->stateLL.state].nbAdditionalBits;
+     U32 const mlBits = seqState->stateML.table[seqState->stateML.state].nbAdditionalBits;
+     U32 const ofBits = seqState->stateOffb.table[seqState->stateOffb.state].nbAdditionalBits;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1906a28f30..7cf4d64149 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,6 +60,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0011-gnulib-regexec-Fix-possible-null-dereference.patch \
            file://0012-gnulib-regcomp-Fix-uninitialized-re_token.patch \
            file://0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch \
+           file://0014-zstd-Initialize-seq_t-structure-fully.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


