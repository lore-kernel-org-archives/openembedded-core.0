Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A18C52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.96186.1723636948578630516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rmKkNu+S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a1843b4cdbso4503646a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636948; x=1724241748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmUCahev+kHuk+PRAU26SPrsgeWhgXjic2PqOE4wx68=;
        b=rmKkNu+Sy8FApUiB5h6c2n7kJkErOr0q5VE40/MmDNqYfV1UC2P5L4muA5S3H9cRID
         gabRJ0MVozGzkQsdVf2sPlMBbAhJ+nDOHODZS/KY447bJ58w8668pXBCzKHxGBMscLfB
         Td/hxzf4d24s6/MUIB3gYL1D9S7qm8moBiv7eCyyaDEPA7HlE5384k/ITWUC+X05F3cV
         nTNVN2+KSmNr2HXPdf6lPosRezQlqzckbYM79OHhis9wuc/b1YNFMIDuDdnqcbWynlnr
         xrUoW+SJqr1TO1GF3hUa3Qvmx4XHjJ17liH157rHORtm7QaqgnVAgZM0CMfySr6FAl+4
         0ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636948; x=1724241748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmUCahev+kHuk+PRAU26SPrsgeWhgXjic2PqOE4wx68=;
        b=WmPKlDVXWNZcr4tCJLWWpNeSR4n9ug/exBH0WWXdqHQrYJ+vO0rVo13SbghAshbn5o
         LI6UcnxCZbcanuIrgwVXda/laDaFi8/s3RQ6C407upuP1c9e17/9wr6TGcGm8QEcnBD2
         un+rk/Io8GuPBlFgtjgTiRhlc+Rzx7Zti1aK5hDPNEfcjjRcoJPY0C1UrC4c0dFxtj5J
         owP5+1UapaOkDkeUqHLSmwiS0H9N9uQEDEV6eiPB1Q9QPGxtv+JhyWvxr09k+v3F1DtK
         1ce27uetpVtSn0Uxuuj2BZyv21Pb/OBLFqyBknsH8uQXRuoUzQxpk6SPeLCoCiGQZE/y
         dzMw==
X-Gm-Message-State: AOJu0YxmJTxS9GzDm719lGJtm3PrBBLEOpeQmggX7DrQ+lFHIpPytzG6
	/7P/LEVEqYwC6IMRO62sE2B97HkYrmWXuKSbytIFxjKH657R05/DqJy4VPThheFvSDUGxCb8okQ
	jQyw=
X-Google-Smtp-Source: AGHT+IHZCnSAeZmXFug3KKtLZH0MfJuWaLCNKks+x1iWxqZtNCVnYfsiE+VipJnWUmF/234JHljP0g==
X-Received: by 2002:a17:90b:1996:b0:2c2:deda:8561 with SMTP id 98e67ed59e1d1-2d3aabec65emr2705405a91.41.1723636947657;
        Wed, 14 Aug 2024 05:02:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/9] systemd: Mitigate /var/log type mismatch issue
Date: Wed, 14 Aug 2024 05:02:06 -0700
Message-Id: <32f9e9236be217531fdf1b87187fa05de703ca9b.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203317

From: Niko Mauno <niko.mauno@vaisala.com>

When VOLATILE_LOG_DIR evaluates as True, the base-files recipe provides
/var/log -> /var/volatile/log symlink which is in conflict with systemd
upstream tmpfiles.d/var.conf.in which defines it as a directory.

This generates following error in journal:

  Jul 03 14:28:00 qemux86-64 systemd-tmpfiles[165]: "/var/log" already exists and is not a directory.

Mitigate the issue by defining /var/log as symlink corresponding to
the one created by base-files, when appropriate.

(From OE-Core rev: 711ee36e88c8968e3c45ea787b3adcf64352adf9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index f58a1bc2b6..0ccca8a567 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -307,9 +307,10 @@ do_install() {
 	fi
 
 	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then
-		# /var/log is typically a symbolic link to inside /var/volatile,
-		# which is expected to be empty.
+		# base-files recipe provides /var/log which is a symlink to /var/volatile/log
 		rm -rf ${D}${localstatedir}/log
+		printf 'L\t\t%s/log\t\t-\t-\t-\t-\t%s/volatile/log\n' "${localstatedir}" \
+			"${localstatedir}" >>${D}${nonarch_libdir}/tmpfiles.d/00-create-volatile.conf
 	elif [ -e ${D}${localstatedir}/log/journal ]; then
 		chown root:systemd-journal ${D}${localstatedir}/log/journal
 
-- 
2.34.1


