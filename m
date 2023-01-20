Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D76C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:00 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82064.1674238296753883379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hyD9qglD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 7so4753852pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diy5Jin0q7Z7DdN6FbhBaFSuodcOkKd8UZPBoBSag9g=;
        b=hyD9qglDXl4+bUESvOksNurvFUa687G+qCk+XinI2c8f3ODfJimL5g0uipQfv78T6B
         EF6cxkDcQcVwIcZsd39PPXL25AftNMkBZ/XMg+CcPs5MEONwUnEGtYni5Kv+uW0g8iYV
         Gp0O/4ukHSPuhUmS4qm9Q5avR1idsJVbnVyZW+cam3bpg/Pjqzu4SUGOw9jQh9gS/6Ao
         p7RK6n+V2ZmHokUH4fsuiGqu44WP5ro6xZW6Wbh+9d7wLgPH2fWJArTnARw8DrG9sdKF
         83SVKdJYcTQ2ry/QTxMdrsW/jT54kOJJoc9wIQaPcjbWBaU1nMcoNzWurDWbHsOnuoKz
         f8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diy5Jin0q7Z7DdN6FbhBaFSuodcOkKd8UZPBoBSag9g=;
        b=HwXZY8rBp7MPrYHBumPOF3m7vBHeWKd1O+KnA94yt65tJK+l+oQb9XWvr67gudSEgH
         u6ZUxGbfw6EAAkkO5hEEsBrDKUyQSph5yJy52XdKhJuvRELZaoHoCTuscUHWBDrgXbWn
         GyEHWZS9vSDM2ez/zrXXiQUT4Tj3IVZj+mSkeRaJ1tnGvRY3Bfsrf9lVTcqE7/dNha4P
         y1oo3nQ2lBpGzzzOEOxj7CI0mlTfQlrTkHQlxzQo3ipDOtGka3ZBCNYo5wNsuST155fz
         tqeZp6N5Ug3/MIQnHcbB6VTMVs5laIlQBKH2itKadISTAr6aEMJdBIRGf36/gftA63cJ
         ei+Q==
X-Gm-Message-State: AFqh2kpjSvB3Nt8OPIybydJKUnVfWSG/B1PgZcBJqzsQTQPn9GK8/exT
	vhsHUX5haI+Nq7Xvl69PLh5k2Kb3hic9urVD37Y=
X-Google-Smtp-Source: AMrXdXtDnlUm/AvEz1e7szP9Ps+FSwPE1RRUaK8lnf8s+uHBO7SDkKl9MwbwjlOBHMy1oI+4PET7ng==
X-Received: by 2002:a62:388e:0:b0:58b:cacd:35f with SMTP id f136-20020a62388e000000b0058bcacd035fmr16081543pfa.32.1674238311719;
        Fri, 20 Jan 2023 10:11:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/41] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Fri, 20 Jan 2023 08:10:43 -1000
Message-Id: <bc1690632a1f85f364430c9fc7dc675cfe00d085.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176233

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 8ddebf8dd8..06cdc4f1ec 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -546,10 +546,11 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
 			DTB=$(echo "$DTB" | tr '/' '_')
 
-			# Skip DTB if we've picked it up previously
+			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
 			DTBS="$DTBS $DTB"
-- 
2.25.1


