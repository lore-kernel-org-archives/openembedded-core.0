Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1176BC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2283.1743577939498134152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XT2FKrdK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45930805e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577937; x=1744182737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5uCD4kiyPMb9MGFu/DW2+IPKFTVlLRJvFsQTFlmjxs=;
        b=XT2FKrdKHOFJYxFQP2oSIVAFMVYEfJttbJ0iR8fHfKyOkG4CieSsBbhjqZdBxJ4u7C
         D1etDe7WQtm5tGo0wxNw+LBov/iz1EvFuzzU1LBAHlpHrdN1Mud9ksGBNzJ4SLHq4js5
         MHwnAJaDaeNBPkJBw1df3UXicAXbK7txE4gHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577937; x=1744182737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uCD4kiyPMb9MGFu/DW2+IPKFTVlLRJvFsQTFlmjxs=;
        b=LH1l+9RgDQsBQIYVNi+Lt7ChPEnTvibovqZ7K4laf742uFMkDQBUkJAep45hdlHT2n
         tB181YFRKyIlcRuU4j2dLZcT5io+pC7bXLPHPlsrETjttqFwpQjfXpPJ02RTlxy7jsZR
         y9Rwqgk7ZwDzBAr/KnXdxG5aKBRYFt6hB3tSD2o2IvTbj81qw0gSihv0sQgmQOSSCfXS
         tkCaQAYqo89EwEou6YIbhChMR4ewL79TTRqkTwFu4rrFdQb/jLV59APiBufkSIbtX1YS
         vlnJNZs/cSvem3yToTTQxoUOC/KrQeTQMLjQovF0w4WLdVdrUQmwqqv9IVyqOql0zxMv
         hNHw==
X-Gm-Message-State: AOJu0Yz93uRFkzTeJ7wZ9CgXcIMq1DavwHz7BHs5D7XkG6SSHOz9cLTu
	HqdbOocecnCUKxQk/lyXKDXUujRZFmTmsHxfnyyTsRUEX+tNzadtDuntln4AOgkdilnMF6aBHKM
	E
X-Gm-Gg: ASbGncsP+13VbBD69NZCLE9PUADcStpw/Rsstrexup7lpALTAexHWP0hFH+eRHN2MkH
	SVxYx33XECt9/HdjwPoIOyqmQsFWE/ASbAmoHtt/5w+3Y+Leq1Ai5o24Mqz5TK728lXNPl6E4VW
	AWtWo7HFobiUJsNFNPf29NxLM2EaYR7HKQwLORz2aM+gtRtpkxMRNqANJaJArmLjdpcDMtpI7TW
	QbbEoIRpZKMA4JxtTXllpBQ9bUBwbOngYGDRBn+QfJ0VtpYQ4+OrJ0AoBx71cs59GdlqVlzncNq
	vF3ssvbPbWVqB4wZP/hVgtak0DsGf8q2zKBeZ1HShojX5tT6WYj4/AhN7tVt7UoY3s2x0z8+YR4
	YbTrjn+rE
X-Google-Smtp-Source: AGHT+IF3BHK/tb7tvxJBkQcXdguTVUT1GhaCkeHcQt8SwglgG/fJ52qf3bWJ7dzo9x0ZIrJfKxBzbg==
X-Received: by 2002:a05:600c:4f0d:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-43db62b5b62mr137973705e9.27.1743577937411;
        Wed, 02 Apr 2025 00:12:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 46/48] stress-ng: upgrade 0.18.11 -> 0.18.12
Date: Wed,  2 Apr 2025 08:10:15 +0100
Message-ID: <20250402071017.2157620-46-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214219

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.18.11.bb => stress-ng_0.18.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.11.bb => stress-ng_0.18.12.bb} (91%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
similarity index 91%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
index 2b1e306b17f..0cb0c64a314 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=v${PV} \
            "
-SRCREV = "44162bc4e00d06d366436857093a276ea692711e"
+SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"

