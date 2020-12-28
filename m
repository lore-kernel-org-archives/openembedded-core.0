Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.2418.1609185893222837382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wp1WUMtw;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id j16so10776741edr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2BXel8RrXsM/ujA9Whx0VWJ+TkKgetLMt55z46dRE4=;
        b=Wp1WUMtwz/wp74ygC+dIPh7ZpyxG26aPBl1KYBW4emZq5FavElp/FvmPvxlxp1YkSI
         N2Ttem3xjs9cWr65gaAiCi9X5evUSnA5f/yzpnfrH8rGi69T22oYUkYtnLF2C5xpwMSk
         0EJrhqdVnuAQjSiCt/7fFmtCv2tepguO4Nf2GYKy3YZwPv6L9tN6XeVf6h9j7mRP5Ps8
         08/U0kSj8FG+cL5fn5I7f5+LcPy8ycEolUtxjXLdksQ7IiXEdjhdzhKvzYvjyalhbUoy
         NJ3VK8iiuPBgw8vC4LotMvJjjnBqbPu15lH4Ti4K4Z9Ef/bemYLiQ3GCmsNonQmeU8Tf
         479A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2BXel8RrXsM/ujA9Whx0VWJ+TkKgetLMt55z46dRE4=;
        b=GyS1g2GW6bXtWEiiR7h0w46cwu3r46i9BqBy3TkSo6nuTFygWpgnlz5aaKbCVU6y0a
         DLub2vTPKBqyjqwzZwkxR9Li48N1rmkSR0y1F6W5xMDNn8EdmvSLWHCn5oZRblhzOYBR
         /WIIDko2WR6bqcw6JpNenyp4P63F/7rsbGcdDAIyqWejkcVIJZcF11gZ1KkaJGuKnuWf
         9md72WbGCcmsxLFZdtvW1i8w/iKzA2BkvLKS0/sxtAxgAHi+9DBut1Kk9CpvBVTA7L3W
         Q+owx7mOIjhOTjJijkby303NiFQDdYZcRp5qH9vmIUEt9TbSOq6N4UjHkxd1EBPP7r3a
         GPNA==
X-Gm-Message-State: AOAM5321pg+1tq96rYrVbLrjyGUzfrwZC9gha44QStIEo0qCSDFirVxE
	BJmQTIl4Bsila01lYCz82w7KB+KnbeQ=
X-Google-Smtp-Source: ABdhPJyzxVjLxv0YWqOMOK8p6YGo6wdhzIjxpArsYLnWXurBvzeHKphIfswY48mYSWfAozNBjfoQqQ==
X-Received: by 2002:a50:ce13:: with SMTP id y19mr43749854edi.241.1609185891905;
        Mon, 28 Dec 2020 12:04:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:51 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/22] autotools.bbclass: make it possible to inhibit m4 deletion
Date: Mon, 28 Dec 2020 21:04:26 +0100
Message-Id: <20201228200436.78130-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is need in particular for the new version of bash,
which showcases the might of autotools by shipping local
instances of aclocal.m4 and gettext m4 files in the source tree
which are customized and impossible to regenerate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/autotools.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2ceb790b5c..b321825eed 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -224,9 +224,11 @@ autotools_do_configure() {
 			intltoolize --copy --force --automake
 		fi
 
-		for i in $PRUNE_M4; do
-			find ${S} -ignore_readdir_race -name $i -delete
-		done
+		if [ "${INHIBIT_PRUNE_M4}" = "" ]; then
+			for i in $PRUNE_M4; do
+				find ${S} -ignore_readdir_race -name $i -delete
+			done
+		fi
 
 		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
-- 
2.29.2

