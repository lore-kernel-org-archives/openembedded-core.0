Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.16318.1609619127460202126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jan 2021 12:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rNqZAQI/;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id z21so16231224pgj.4
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Jan 2021 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TT1m+AXnZwiMz5kqoHgSlTI0lKlEB2VzNBVvQ28CcII=;
        b=rNqZAQI/EIJ3mBBiP4EcqxpsYdX102/BykPO8bdS78pRT7qD0pPWpHFkuSp7DQ3KTQ
         gHGHhffubGWlapXLj6I5cS6yy8i/RBF+YcptX96e98ICjKYyV24xY17EebypaIpxssuo
         V2QZ5y9nT3uUTsCn/O++qdLmoPHvHO7eSwwesj9pDbih0WWgqggLtbk2AuCguGBwI7At
         tJf5mCHOnGThacVuE2FlK7geP9OnCdvqLovGfiE85+VwWiUOYy2bOiybA1qfinr1dy5U
         kNgH+ZFJeJsN7aSUZ2HddTDbFBfFPn28fomMZU49KAaC6ZnCxuqqbFag5JJS21B1OSLr
         R/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TT1m+AXnZwiMz5kqoHgSlTI0lKlEB2VzNBVvQ28CcII=;
        b=tHm8LnrYr3popt1OL24c8WUXfEi/jEeKARUZbm9wt/6Nh8qSFqYFVO5mRi/FfOfmLV
         v+TyE3s4j8/iR43pj4B2eaWjvK8Oi3ZoZq4IdHthUBFNIDIqdxSwtaWwAMsfnZgmZMU7
         Ve/7jySQc7RTc6jfVIom4bG8XzFiqv1AaeEgfAxrfQsvvZA1GyVoCMb1lVC6Mrq3NDb9
         CH7to3Hs0/qvq7kAqeZBj5MCVoARsjrmCiZsY4tAAghDEfgCyKgcw+3+W/Dp4al55Doj
         nwRkifurd1ozBiDTqlvON1Yq+dKI/mTPvBgerhVUfLu/SSOndZn5L24PsHvqWOJnHoD0
         WlJA==
X-Gm-Message-State: AOAM5301IJgv665GBfFKd/fmVjx2xq3aw8GYHEancFHEyJn7TOVn5pX6
	tPJ7aYsDyPWC6aJBkWAQRbnLGao/rguoUA==
X-Google-Smtp-Source: ABdhPJz5aXrtbkxq74kSDsO9WGjnWuXb0PcD0OeQaU5YVg5d8PvT7uftPBnNGlJwhuEi4r8+gbXoiA==
X-Received: by 2002:a05:6a00:16c5:b029:19b:696:28a0 with SMTP id l5-20020a056a0016c5b029019b069628a0mr61018387pfc.9.1609619126843;
        Sat, 02 Jan 2021 12:25:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id k3sm31750773pgm.94.2021.01.02.12.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:25:26 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] dropbear: Disable lastlog and wtmp on musl
Date: Sat,  2 Jan 2021 12:25:21 -0800
Message-Id: <20210102202521.3791499-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102202521.3791499-1-raj.khem@gmail.com>
References: <20210102202521.3791499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not provided by musl library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 080ee26b2e..a30f98faa4 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -58,6 +58,9 @@ EXTRA_OECONF += "\
 # This is causing [textrel] QA warning
 EXTRA_OECONF += "--disable-harden"
 
+# musl does not implement wtmp/logwtmp APIs
+EXTRA_OECONF_append_libc-musl = " --disable-wtmp --disable-lastlog"
+
 do_install() {
 	install -d ${D}${sysconfdir} \
 		${D}${sysconfdir}/init.d \
-- 
2.30.0

