Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF125C55177
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:56:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22975.1785675375000245797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fr7pcLpj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2832827f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785675373; x=1786280173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dSer5C1fQ1O5yzN+V/zxycSQULOL1NFZJKa3SCCJNTs=;
        b=fr7pcLpjFWwnuDK5jhK/Wur9hQ13hxflUDTvF8ngSmiQF4k+U/KHHDKrE9SRVGHK8D
         xd8AXErFGGncKqLA/b0Ky7jWywkzQ7RENHKSxpPWzdnOPd63Tqb/0BBHdlMMFNGzTxN5
         LnTPF7lC8KUMUdVm0v2UpoMoCxpmgJ1ucrvh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675373; x=1786280173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dSer5C1fQ1O5yzN+V/zxycSQULOL1NFZJKa3SCCJNTs=;
        b=cbhVmtz/c0+Y2McepwP88KtMNhcjeVDuQaL2JSMX0DpVI+qe432SnUi3T/VkvHkr5/
         WpeKqGf0O6st3okn0bohZBlYn6wXzuy5mqpztLmdgtqJ64wXOJeP2FqnThm3qkcM4MIr
         UeQguzC48Skm4FOFYsdtSp9YMAbETGE1ZUnuGAdrsgrYvsxbpi5gzG4SPrqrJRa2y0mY
         OxRvTyKkStrTB4o6Nx3qgtOQ03C5Q5VqHxQ4wurNSgEUmMFg8XrTXqNJTQVhWacDJr+x
         DTnBGkPf3CrC6nN8FG3CHoKYQAzV+PoWBTuETD3dadh8YzyGXJr0Z8QVgyOmpfNrw0SC
         xk7g==
X-Gm-Message-State: AOJu0Yy3MnA3rYkFwVsxUm5p2c8mnpz9/NQvvBY9RwJKa9AvMdR+LH3I
	h2IAv41aqwmLiLgHMJMG6OXe3sP62ggiaUpROYg++TAzGVaCAkiLZT9+CNkG1xHuI3XMdRDM3sE
	ht/Vb00I=
X-Gm-Gg: AR+sD12+Z0Trz01LHFK0xN9CgGTyISUE1+xFIhLY8QUOOzd8RkrVZ/GV8yAuC4A7zOg
	0lJi/P1zumshduk+vYA9i+/rwxQZ8wrskVOucZDAJL0g9lN7s5xlUIrgrIHKuRt4xxDjn9N6DEK
	C8xvzXXAJ8Pdsd05lQHpNuCGUxmampWNgBbD2KpCZqu4Zmbg6Jo0R/scYF8H305o9Q4Vg9kLauH
	mjJl3g4n9EFy6MwGZIOAufUU/CamvRbyc6WgmdOtQCGOn5281SF+0ENJcVQEpt5dhseuv0bL1lp
	VZCcZ68aJGBQAiioo8MtIlSm93Z/Ft7DxaJvKR1qD9+gNkds/DHDbQ+5jDYc9Jb7yRsTnnJnVPW
	ML86EmtQnJ9oZLeshT741E37Db+DtpihnPYWlLuw4ch4BMEgd/NZxncOyIRT8uB1XUZx3aBH7BQ
	G3QiDpsrJuKNq1sJkfpo/aeGBMVIiH622PlZRi9/nqXDHi61QOuHG/QsDr/60lQl+oW6ZJNnwxQ
	MHfslcW00KOGZVjxw==
X-Received: by 2002:a05:6000:43c6:20b0:47f:7f95:8a1e with SMTP id ffacd0b85a97d-47fd72a8e7emr12124996f8f.5.1785675372958;
        Sun, 02 Aug 2026 05:56:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm21911934f8f.29.2026.08.02.05.56.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:56:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libmicrohttpd: upgrade 1.0.8 -> 1.0.9
Date: Sun,  2 Aug 2026 13:56:04 +0100
Message-ID: <20260802125609.4049666-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
References: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 12:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242556

Source: ChangeLog

Thu Jul 30 05:32:00 PM CEST 2026
    Enfocing a minimal size on the PSK.
    Fix support for red zones in memorypool.
    Fix rare over-writing of HTTP version string with network data
    after parsing header.
    Fix rare crash from adding connection manually followed by
    immediate daemon shutdown.
    Releasing GNU libmicrohttpd 1.0.9. -CG

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmicrohttpd_1.0.8.bb => libmicrohttpd_1.0.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.8.bb => libmicrohttpd_1.0.9.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
index 998f282a35a..4ce99da52ab 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703"
+SRC_URI[sha256sum] = "6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012"
 
 inherit autotools lib_package pkgconfig gettext
 

