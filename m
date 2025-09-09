Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9944CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 12:28:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.11696.1757420926315575959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 05:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ByJgE4zG;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-623720201fdso6368303a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757420925; x=1758025725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJI/IZDxgFd+YQptAJMgNq/86nkQWG4Ajm6MAi7yoyM=;
        b=ByJgE4zGtjkJWYRK2TdV5Rp1ZrUtgTaxBsxFlRcTkiz/xEnapTb6rYL8FLK1yfgBC8
         PuSKTsXRvPFk6HVOptY8KizQFqyHsKhTfGBhWPwXNhzi70YLyxDqb3Z3cU8vSABa7/z2
         6LAGNmr6hGyjfLJQhTPpL4COxGd78Y6Q81KyhpqGEbPJAqNxmbyyk96gLXmvG293MxIw
         BKIedrqejxPXM9JdY1FKCR7lcB0udVoDvxiAUQpeBwWLTfH2iun6X54WfsWCnKTh3oNO
         6djnaomfqgLNEaPgzFLZU1U840IurSyiw10TqVOlYrA2XHDNwQpDnBn1Tp51b+fybtJ+
         TJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420925; x=1758025725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJI/IZDxgFd+YQptAJMgNq/86nkQWG4Ajm6MAi7yoyM=;
        b=RXj2rEH2cqUt7OHYlZojAH4HpwTraw4ZMFSlp+25ZlrbV2LvFBdv6PkFaBkOg6kUQ7
         TpzoEsasWFCFcxOvsGHpDnu01c2DQQLBz5S55MCnd/EPGXsCb+2pvTWIOdzP2CTMnecm
         7H4049HZqVl+T9he5zlSlmESJu6+GAkJNndLJnHdLLx7Qhw7UIVadCdCiWjJ89k70sgF
         aKpSqWYhD7M1Vl66Hh16UkL8lFdY2SO5pyCfLdsGs4qTyVXfNzqFDPozM5OQ1ctk2Sm/
         pBWQBgF86CABj4bNrc19uLM7IROA66jl4fS0XQga6/FEVBQW7RSePGNYkR7s7dJrSiSH
         26qw==
X-Gm-Message-State: AOJu0Yxj8gRoBsh/yQRohzDn2A2ZIAtZr9EMLge5OMmpWFHMxb7DWkII
	FfGR84ex8/fNV9+aYmPsWVid3X+nAHTPv1fvq47kdZULoJPXaqh31wxiNfVygw==
X-Gm-Gg: ASbGncsFoCqOuPgU2jdo7LvVGMbInXOTaaoB8tDXCTB3IMHbRDKr1yI9FnzhFR2gsvW
	8+x9gXfEbkBk9DsYfXBODVDW/tUSOTFrL432wPad3rouuChaRHzG+vKL9cfl4JZVS6JmQbe6RYA
	NvZcNEGL+WCAyf8CjPX3mUsh4Cy1pmLBygvZ9YjGQjcp5yo6pkKMpNlejjrPFEndbo0lpwH55B1
	0kDrjahETObTe3rvxtp0YLeuLUL45AYliZfPtSPGix3aJuyJGlq0Rs+520pXVZ3etCX6l+nHiqS
	HuT9t6nqos0jMhvATtoUqK4p/8iEmn34jNypADa+nPPt09hp5hAtDGHgbnEdCxKwIScDeXJUito
	lwXKWlpm7UL5KMgYeDEdm5peB5SoE1zI=
X-Google-Smtp-Source: AGHT+IH4ew18auZtJXAx1LHq7b8zJju6CRR2utPiq91Fv1eZz0TpR2p0A31xBR+poLZJr7kU8yI2yw==
X-Received: by 2002:a05:6402:27ce:b0:62c:408:d09f with SMTP id 4fb4d7f45d1cf-62c0408d425mr1840577a12.19.1757420924459;
        Tue, 09 Sep 2025 05:28:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe9a0212sm1132062a12.7.2025.09.09.05.28.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:28:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffoscope: upgrade 301 -> 306
Date: Tue,  9 Sep 2025 14:28:43 +0200
Message-ID: <20250909122843.250397-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223107

Changelog:
302:
* Mask stderr from the extract-vmlinux script.
* Make it much more explicit that we return 'success' from the
  extract-vmlinux script instead of just falling through to the bottom of the
  script.
* Use Difference.from_operation in an attempt to pipeline the output of
  extract-vmlinux, potentially avoiding it all residing in memory. This is an
  attempt to prevent out of memory issues on try.diffoscope.org.
* Use --print-armap long option with nm in the "ar" comparator for wider
  compatibility.

303:
* Don't check for PyPDF version 3 specifically, check for >= 3. Thanks,
  Vagrant, for the patch.
* Ensure that Java class files are named .class on the filesystem before
  passing them to javap(1).
* Update copyright years.

304:
* Do not run jsondiff on files over 100KiB as the algorithm runs in O(n^2)
  time.
* Fix test after the upload of systemd-ukify 258~rc3 (vs. 258~rc2).
* Move from a mono-utils dependency to versioned "mono-devel | mono-utils"
  dependency, taking care to maintain the riscv64 architecture
  restriction.
* Use sed -ne over awk -F= to to avoid mangling dependency lines containing
  equals signs (=), for example version restrictions.
* Use sed backreferences when generating debian/tests/control to avoid DRY
  violations.
* Update copyright years.
* Avoid a crash in the HTML presenter when page limit is None.

305:
Upload to unstable/sid after the release of trixie.

306:
* Fix compatibility with RPM 6.
* Use regular 'open' calls instead of the deprecated 'codecs.open'.
* Accept additional 'v' when calling 'fdtump --version'.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../diffoscope/{diffoscope_301.bb => diffoscope_306.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_301.bb => diffoscope_306.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_301.bb b/meta/recipes-support/diffoscope/diffoscope_306.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_301.bb
rename to meta/recipes-support/diffoscope/diffoscope_306.bb
index c93ff4f588..624e1ee3f1 100644
--- a/meta/recipes-support/diffoscope/diffoscope_301.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_306.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2b46b60afe3fbb9ba79946e5196157b272ddad27692ccf5e4839def1ef3019c6"
+SRC_URI[sha256sum] = "2c489aba7334ab0d4a9946ac51fe1b17085621a5476b89950e9c4f1e612cbab3"
 
 RDEPENDS:${PN} += "\
         binutils \

