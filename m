Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.5970.1609856652299191151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wk2mJvas;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 15so21367484pgx.7
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=H5ngzKOu1M1SNW4mxZ1QC8F5Eggf2KBT/hKQrXnounA=;
        b=wk2mJvasMxEDFKAt5HTxKn4awtYjsKdGMlI8phAwltLSvVp1+j+qpVzTkMa7D8Lig7
         iSD2h+gds/y8aqhhFRYs5uSzUFV1d5lApHHkYq0926649qYxA3yjagXAC1h8ceCMy1Ym
         k7T05US7bYpu8JcF4YmevuBhTr2R2zDnNzh9eeqH9lvV+lCc7ZD6s3MONKN6ZDMq7n36
         CzckmPBg+uOvjhelNO84rTS2YBIeWgRU6wrf9Q3p5zBCc0AnMC4GeoNKeZK9FbACc2Qf
         Hw2xi8VuoWRSN1v5WGdCDYBg7dWN3Tgf6W/ycoGeneerSSa+y49dlSt76V3jX/Jp4+9H
         5oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=H5ngzKOu1M1SNW4mxZ1QC8F5Eggf2KBT/hKQrXnounA=;
        b=SUueN1InQnrDKRg7x2b45zuXOulU0iUBz39nCZPBTqKXt+4ATRBrEIaxAlVP1j6gcq
         h0JWssFpwPVxfLDiw0pWf7tGNxNqDdEkmYFgDjTtUP3tYzauYqYWeGqbgv2IU+pvyqTj
         Cj0AxkQYzxQQZK1cUk8h+lijzw0ZTU02r8MbhRgzQiaWSaenTrzaDASzQG2zXiyvEEyj
         wROaIC6Vmx0incN5Y5sxXglxYgbqfVb9IjzCMy3xVnXmxtyHPoxeI52PfPt5MisDn6T2
         k3317f9Kh1E6eKR+KEBtVHoVPUtqP90n40hYLfUFkjP9UH0Uxq6lxGVaraakRv/8iu9o
         PoDQ==
X-Gm-Message-State: AOAM531DT+Z3u4pZqcLrx3tNYJfOPuZCpYvKHvQ3kfuHmLuRyBKnjED1
	WJ6sPICAiMk5xG0wlEdJQTqVYm+cK23JWWAS+3g=
X-Google-Smtp-Source: ABdhPJwvioCPBQRJh6mtE0e/OSicMiUnUg/AaX2otfZsSsYP22L37RFz7/BFk+QPGmDu3s/GJjU3HQ==
X-Received: by 2002:a62:4e95:0:b029:1a3:a372:8b3c with SMTP id c143-20020a624e950000b02901a3a3728b3cmr70227334pfb.28.1609856651277;
        Tue, 05 Jan 2021 06:24:11 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:10 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/30] modutils-initscripts: Use depmod -a when modules.dep is empty
Date: Tue,  5 Jan 2021 04:23:26 -1000
Message-Id: <37c9cb2ed8920bd51f176d78cb505642afa9b472.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Diego Sueiro <diego.sueiro@arm.com>

To correctly create the modules.dep when it is empty, we need to call depmod
with '-a' instead of '-Ae' since the quick option uses the mtime to decide
whether or not it needs to update. This way we can guarantee that it will be
recreated completely and not only when adding new modules.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9292e9050fd95be4b556909e2775a45bce1ca79a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/modutils-initscripts/files/modutils.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
index a78adf5729..df37bfe7a1 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -18,7 +18,7 @@ LOAD_MODULE=modprobe
 
 if [ ! -f /lib/modules/`uname -r`/modules.dep ]; then
 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
-	depmod -Ae
+	depmod -a
 fi
 
 loaded_modules=" "
-- 
2.17.1

