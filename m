Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695D2CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:29:18 +0000 (UTC)
Received: from mail-pj2-f15.google.com (mail-pj2-f15.google.com [74.125.227.143])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11159.1790767756252982998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RFSN3no/;
 spf=pass (domain: gmail.com, ip: 74.125.227.143, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f15.google.com with SMTP id d9443c01a7336-2d747f01363so31011065ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767755; x=1791372555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J68mB8t1wGYUn1fT1w0l1Axzg9eiYa2iL0gQx30o3LE=;
        b=RFSN3no/Yfbae3kTUDNqa9fJy3gdddMFAdkTuXCfkhU+ORegf3DV9vtgqZesUNlknB
         C3OjvMP78SxKtraR7Qiw30sffzbwrSVFs0sIosD9sKbmJr+ak+/HdMZsTzf4dYBhPbXq
         r+5G9HvufKEB7YegKh6LXJOiUz5tpQRhIm3/3YnxrFge2nGx9XgtyzOzOAP5XMELFgp2
         kucjgxmwHb375tLL3vwl1mu5SBUrb672ldk+X+GqqyMSu3DWC4ai5nyFbkc2WCItkPYc
         gcX97VxMSZN4nlSZicDNmeJxXCOI2Z32TusyUzp6ZOnkshAholmKH5pC1ahzglt8Q5n1
         UuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767755; x=1791372555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J68mB8t1wGYUn1fT1w0l1Axzg9eiYa2iL0gQx30o3LE=;
        b=17G6S2efeqzhSJw4leA6ZtilQqNldVzcXrZupEgeZoFP657dYrC15JQUOR+h3pEe76
         D7uDfbg2FgJdD0j1uglvEdHlgW3aI+Ak5gxj7YQV2h90p0JlOLomohf6+yepdQts6oTn
         UoJep08mK6g6R+/4lxsRyXeoVVFrSfK9OsR09DMeiUESD7G96Jmpjrk5EzAOvHfp8qxo
         LfnKvIHAiiD4fmaqauxAZ4M9BFn2tWfp7Qb54JQMxFWTBwxKFfG2t4va1LkCaxdLXQ4n
         5B1swQNp8NXgbJMjoT02p96ayVwRWDToGFgOBgsVAQ5V78VXQUfnpeHKHHvUT0o75KHw
         lmmw==
X-Gm-Message-State: AFq9FYK3cQlF1u4ly5d5nYnhvHGpPZPzSQpTkphD2H0EEFRSCu8mTGNj
	oECq5WGioFriqsnLdBygNFiFxsBvjlJovsC9oUd3fWsorDxJP4AyY5aN/1mSVQ==
X-Gm-Gg: AYBFou3sVIqSLoqx2gfTD1/3V3bS2WMmfPDkxI+04hLrrpTW6MIxmrBOPwF+ZUN85G9
	ubN7IILRFT2iCO2VJQZMNzLF5Dr5qaDKM6k+HjsXFBbqCZRSNxXn9nEwbt17X0GekbTdicHFfgv
	SlzQWNmP2uv5cjmZt0ni5nwovf0qAnMsvfspoaPEHmGxqiBiEarE+7dMYc0aurcEiV0EU6KvuXu
	5zfWGpVaFhB+JO8Q+gTmZllN2JpL0F8BfUurUbJoRv8Jx8BCNADjc3R+H2x43WA3lUicg2nsPW2
	lLPDIIdsG7byzVFd+d76vYVxvuAC4uRuYTyPsnqJ8p/I13X8qWpAM6vYi37+/pDk4+U1C1ghGvp
	F6Rf+JQJmZuwefQrltok2itwmm370iT3Xa4KGpnlLzI7GgwB0Uo8nnfISrnexNdjhWO5/iqSJCq
	sGnwNvPvCB2pbrKO/cwO15oTRike2GrG/WGNcz65Fa5vXvmUYIEnjlXYJwu9qUfwQHsWjsakm6C
	Ps/ffxE2MsaPHSMWqeXzLI=
X-Received: by 2002:a17:90b:37cb:b0:3a4:c18c:b893 with SMTP id 98e67ed59e1d1-3a4d1964c71mr833146a91.61.1790767755350;
        Wed, 30 Sep 2026 04:29:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da14e8c5sm739797a12.12.2026.09.30.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/3] gnupg: upgrade 2.5.23 -> 2.5.24
Date: Thu,  1 Oct 2026 00:29:05 +1300
Message-ID: <20260930112906.4053964-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930112906.4053964-1-ankur.tyagi85@gmail.com>
References: <20260930112906.4053964-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 11:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246957

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

 * New and extended features:
   - gpg: New option --allow-9980 to enable the processing of RFC-9980
     specified data structures.  The use of this option is only
     recommended if external policy requirements demand the use of
     these governmental approved specification.  PGP folks requiring
     some PQC resistance should keep on using the standard LibrePGP
     Kyber algorithm introduced 2 years ago.
   - gpg: In 9980 mode support PQC encryption using ML-KEM (aka Kyber)
     with X448, X25519, Brainpool, or NIST curves as specified by
     RFC-9980 et al.
   - gpg: In 9980 mode support ED25519 and X25519 as specified by
     RFC-9580 under the names "ietf27" and "ietf27".
   - gpg: Add experimental support for a --compliance=fips mode to use
     GCM for bulk encryption.
   - scd: Add Nitrokey 3 to pcsc-shared interference detection.

 * Bug fixes:
   - gpgsm: Fix an exploitable printf bug when using the debug option
     "--debug x509".
   - dirmngr: Make the LDAP upload flags also work for KS_SEARCH.
   - dirmngr: Fix OOB read in DNS CERT record parser.
   - scd: Fix OOB access in DO parsing of faulty cards.

 * Other changes:
   - dirmngr: Add a mitigation for badly configured web key
     directories.
   - New option --debug-no-libgcrypt for gpg, gpgsm, and agent.  This
     debug option is useful to avoid cluttering other debug output
     with libgcrypt generated debug details.
   - gpg: New --list-options "debug-show-sexp" to print a secret key
     as an s-expression.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/gnupg/{gnupg_2.5.23.bb => gnupg_2.5.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.23.bb => gnupg_2.5.24.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.23.bb b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.23.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.24.bb
index 139e1c9ef2..3e562250d7 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.23.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.24.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "97ebba329ed0aa1ed24395b6a485a3626680f4c19232c62a0c0f0433c726e2bd"
+SRC_URI[sha256sum] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \

