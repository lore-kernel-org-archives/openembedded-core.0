Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC7CD3B7C3
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:02:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2697.1765011767960198756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 01:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dxEKXv+W;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251206090244ba6099aefc00020767-ddvjrw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251206090244ba6099aefc00020767
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Dec 2025 10:02:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vnttikHLHs3BiXPLvYq6NjlEE95firus3rxg7T1l7/Q=;
 b=dxEKXv+Wo9vsXxdJCz/ace+Ozygw0JizyNv0Z+sy3VWtWLTQGcfJ+pOU2GQl2tXsgYaQn+
 WBVuH65qMZHuqwB0pAjEdqNT429I8n+lJG0uDpjxnpHPpmE2bInJ8pMGY8VQLVZ6Oy9bNmZM
 JF0lVi0VM9ViLX6a6DERKFXEkBoz/heArEUZvFw3AExEACY8MHbLxE6uGJAGpKbtoqwLSicN
 +65ZKRVPLFoSu4XDsYlBE2cIzeEkLjgP53HU5rp7P1Irz3pJOC9uTK49GOUFEmekJF1pFQWN
 2cL3SnQI3odk+fz50Ter8C32Q2IMQYs2qQ0lkb2PDlYSyklxaE+XmMgg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] libpng: upgrade 1.6.50 -> 1.6.51
Date: Sat,  6 Dec 2025 10:02:41 +0100
Message-Id: <20251206090241.8992-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227359

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 and CVE-2025-65018

Relase notes [1]:
Version 1.6.51 [November 21, 2025]
  Fixed CVE-2025-64505 (moderate severity):
    Heap buffer overflow in `png_do_quantize` via malformed palette index.
    (Reported by Samsung; analyzed by Fabio Gritti.)
  Fixed CVE-2025-64506 (moderate severity):
    Heap buffer over-read in `png_write_image_8bit` with 8-bit input and
    `convert_to_8bit` enabled.
    (Reported by Samsung and <weijinjinnihao@users.noreply.github.com>;
    analyzed by Fabio Gritti.)
  Fixed CVE-2025-64720 (high severity):
    Buffer overflow in `png_image_read_composite` via incorrect palette
    premultiplication.
    (Reported by Samsung; analyzed by John Bowler.)
  Fixed CVE-2025-65018 (high severity):
    Heap buffer overflow in `png_combine_row` triggered via
    `png_image_finish_read`.
    (Reported by <yosiimich@users.noreply.github.com>.)
  Fixed a memory leak in `png_set_quantize`.
    (Reported by Samsung; analyzed by Fabio Gritti.)
  Removed the experimental and incomplete ERROR_NUMBERS code.
    (Contributed by Tobias Stoeckmann.)
  Improved the RISC-V vector extension support; required RVV 1.0 or newer.
    (Contributed by Filip Wasil.)
  Added GitHub Actions workflows for automated testing.
  Performed various refactorings and cleanups.

[1] https://github.com/pnggroup/libpng/blob/v1.6.51/CHANGES#L6281C1-L6305C47

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: reverted SRC_URI/MIRRORS update which was caused by some
temporary or local network issue.

 .../libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
index aa2dc99f10..e499f61ff4 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
+SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

