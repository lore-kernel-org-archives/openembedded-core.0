Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E59CA100E
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:47:01 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.89576.1756849614820414753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=asjkGDx4;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24af8cd99ddso22227515ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849614; x=1757454414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoj6U+sTiblyOfYr7K25NfjLmJB8z7M9emxM/JysaZs=;
        b=asjkGDx4hxFTXGGSGgMw0R6Fz/nGEIEBYmy5dISQowtJpXoLNGX2hj2e4r1nJjK8AD
         fzPcYaYCM9utZnMWCWtzLGEStj30/w/RY4w9T7ptGQdc0DbXGSB5zg50g/943tOdWpfK
         XuE+fFyIGJ/eG4aJ52qIExN8nNqOhqP/kBUyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849614; x=1757454414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoj6U+sTiblyOfYr7K25NfjLmJB8z7M9emxM/JysaZs=;
        b=GGoyIPuf5phMnSEV7QHPuKzjNeIFUQRF5MQ7kocnz5hl73x0s36UTmtXrIORatq9d5
         6fxhhGseiaCb6IjEoFQfAGCWYkN3leWvkMbyuSIPsljdqsnVCAHX2eVW8VIvieZAOAfZ
         btgN9gNBNF+q3mICcEUedCIpWowMU0SS43wiL+FOT232TaAaQn0N9mQTyCT24xvVi/Sx
         RamKVDuQKbbp7oBB1VR0CnpXEgUQLL9ge5AZ6JtcFhpY35ul9P5UTnsrhh6LUBJ1o2YZ
         //RSsAjU3oaBZvohZ6Lzo+SmeY2MESEUUqo7wODf17Ph2hAv4ug3I5UWIIZYilHVfQe1
         /v+Q==
X-Gm-Message-State: AOJu0YwptHITmW3FTnZqIOoHhJ7cpizm7Fk4tuH1fRN7Z3XKD0rfmTAK
	VVeeNvm97mSC1GZrQ/yvdN6j6NzVHAkxLTCoqnUd4zdBAsyDsl971Uq2PF6pVD65CWKqlvqqbeb
	F1MQ/Jn0=
X-Gm-Gg: ASbGnctbuRLwXRURqwAXbOK1aTb6uiYr/4OzB7TfmurYsH8TioJrc3nK2ymxTBQEbiq
	kgDtYl3eq1EwxYWBZU+CeEd7ZvYPK50hxIq0Ew6c+0VBwt4j753rtDktKE1yD07PNmWK6W8ICsv
	8LmZH4ipd9g0p9yKyjvYIFm+PmwuNZDCmTyD3ZsIx5mJzFBmlRp689pJWLh51/V8orU5uHeVy/a
	emLpBorlh/8wKyVck3YSDiFgJZs351KUWaDAbEkOU2a7oVLhvl+h85Qu4jSl363PwU2bFsdZqZl
	CREouMJj8XHyAZX2PIqwI4pNOjW3WLZBc71epHfqiSXqu6ZzVhj7EpFX66C5fkkznSRlm/h+UOx
	h8IXcq7ZXufKKugHOCtU31gC1ngm/CeoLDCT9rYiJJvtUz2due+WGLcPoL2e6+WHjMTN4QLK1
X-Google-Smtp-Source: AGHT+IE9K/4phwe/rSekM35BxS1BUMHoT1Jy2hBQSlXiH9kxC3iYvj0T8yqZZQiXD+XR968aOd8I7A==
X-Received: by 2002:a17:903:19ec:b0:24c:7f2f:d9e6 with SMTP id d9443c01a7336-24c7f2fddc0mr15163245ad.10.1756849613665;
        Tue, 02 Sep 2025 14:46:53 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm141028805ad.56.2025.09.02.14.46.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:53 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] python3-rpds-py: upgrade 0.27.0 -> 0.27.1
Date: Tue,  2 Sep 2025 14:46:29 -0700
Message-ID: <db9d8d63435c34d93ee8fd7831449bc8b7a948b4.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222752

From: Tim Orling <tim.orling@konsulko.com>

v0.27.1:
* Include attestations in published artifacts by @EpicWink in #160

Comparing Changes:
https://github.com/crate-py/rpds/compare/v0.27.0...v0.27.1

References:
https://github.com/crate-py/rpds/pull/160

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-rpds-py_0.27.0.bb => python3-rpds-py_0.27.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.27.0.bb => python3-rpds-py_0.27.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
index ca2122f8df5..dfaffb65468 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "8b23cf252f180cda89220b378d917180f29d313cd6a07b2431c0d3b776aae86f"
+SRC_URI[sha256sum] = "26a1c73171d10b7acccbded82bf6a586ab8203601e565badc74bbbf8bc5a10f8"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


