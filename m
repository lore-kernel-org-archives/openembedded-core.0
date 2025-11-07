Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3577CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 08:13:38 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6811.1762503216178720845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 00:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9r4ioeR;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340564186e0so439157a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 00:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503215; x=1763108015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8JrJL87H2rccpeMB4y8kFeImHvqiwzZ8+JITS9jrg8=;
        b=O9r4ioeRepGSiiesZVQMDsDFMKZ5D5KDfF9lFN4hoU0Fz2M/Jl834mCr6MOBZ48L6E
         UHfmijY7V/cV/K6KZnam4BW/P6jU0wHyZdwEEJ6UprtTsbLt+Jjh9K418o9NkzJ4dHro
         32n46yFVBnH6K9qNU4bOO21iKPROIKGbaoMSFYMxTwSHJIL3MGvY6H6EnI3ZRdKUXYdo
         dbjtHvQhbcmVe8BXupnCfkbKZBGm7B8qRM73gmml6L/5n5Bz+n3WJAMU3SEfHpQZ20AA
         vqdWTJHUIo+2sZ2u1YIglywa02wlDMvrIfUBlNRFeCtHEf5p018BdhoBLD++5K6adG9Y
         CuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503215; x=1763108015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8JrJL87H2rccpeMB4y8kFeImHvqiwzZ8+JITS9jrg8=;
        b=l8bFYinl+zqY+9vEE/0+FsrrbhDHhtDRxv6NQa/qxDOSuLbjhLpIsVOLcis54g167o
         +03ufgcc5rUOoLKcIrzjxwbcZ+lFybrXcT8E5sRBv8m6MLQtJY63KFK+SRNU/uuYMbkS
         pSOXDET3HH5wJg+j1MXH5p9OddjwpbFZNPs2r2wwCeOvSgNRvK+5qonuan2SGLKAHnF2
         GFGEBL8WmAvtSLvZeNJ5QujkKNn3Hl0Lll1Ric3I4x4e8PzCDRRLUqW4RIVItw7SG+kB
         5sCW6kz6FDxYdF0XYXhxA9LYwIba+LdayGdeBE1AgHHT+d01DYRFqozqSRv12P5rN+t6
         5jaA==
X-Gm-Message-State: AOJu0Yy0qHuWytFM9lT5AaMSA1TM84Nj+6ayLwQiQl5Rk3Zxu+idZ+k6
	P/y83cEQoAcybRs13aRigBUHNcuW9vPw0DuENJUFpXSnLiAoaMUDpDT+lcQpiw==
X-Gm-Gg: ASbGncs+scmBCJP3F/68t/oh4dR6h0jIiDF3Ze5tKJp9e3uYZUlXH7QQ2E/snPkPE3F
	a7onpblxmzuso3lsd/5LPcZBwsXYdO4O1f9IXg8CP5rBByfT+AT5MljT7dzRAv77oLSBaDLdCjn
	G6rYI9cn7yqNnAoA20PLN+d340ujZuWe+dmnuoEc20yAL59fTaRD/yTHaCaZPksy5JArGBwGm5/
	lIMS7TGglHqdVnlH8jTIOQpsfYG1hTUdV71GHtfcGNl0jwec2rl1jjl/w6vIlRZL7G9IrBSS02y
	9SH3euKdR4Frune+dL81fQil6EI/8rNgax89WUxsXmWAurNCf5HjAXoKvIFjXdqCfHxwIe8GwcG
	ccnU+TbhTW1EnnOHffL21++mGmGzmdPfAxRIceZHjOd64o39g9jlmdvm4qkRmaEHnIDVf8QIgbv
	wWRT4t2Fu5wTMY9rUOQwJsDhRR
X-Google-Smtp-Source: AGHT+IHcBbQoXu/34yXNI9HoLbXOWR0hyO/xctWuqRwvH5QNSypidSD2jHT1yHSnHtBV8ectKH6e9Q==
X-Received: by 2002:a17:90b:2f4c:b0:340:bb56:79de with SMTP id 98e67ed59e1d1-3434c5706a3mr2746059a91.30.1762503215273;
        Fri, 07 Nov 2025 00:13:35 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c801d1sm1043010a12.7.2025.11.07.00.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:13:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/3] elfutils: upgrade 0.193 -> 0.194
Date: Fri,  7 Nov 2025 21:13:23 +1300
Message-ID: <20251107081323.4111387-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107081323.4111387-1-ankur.tyagi85@gmail.com>
References: <20251107081323.4111387-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 08:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226020

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* debuginfod-find: Fixed caching bug preventing user-cancelled downloads
                   from being re-downloaded at a later time.
* elfclassify: New options --has-debug-sections and --any-ar-member.
* elflint: Presence of vendor- and application-specific ELF note types no
           longer triggers compliance errors.
* libdwfl_stacktrace: New function dwflst_sample_getframes.  The
                      libdwfl_stacktrace library interface is experimental
                      and may be subject to API/ABI changes.
* libelf: Manual pages have been added for many libelf library functions.
          Additional manual pages are planned for future releases.
* readelf: Up to 13% faster when using the -N option.

https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=922a15cce7163b2bee605a26132d833dc0c29074;hb=eb7f17d5016a75c6fdb6431aff1c1804d8c290e4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../elfutils/{elfutils_0.193.bb => elfutils_0.194.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.193.bb => elfutils_0.194.bb} (99%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
similarity index 99%
rename from meta/recipes-devtools/elfutils/elfutils_0.193.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.194.bb
index 85aef7881b..f7963afcbe 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "7857f44b624f4d8d421df851aaae7b1402cfe6bcdd2d8049f15fc07d3dde7635"
+SRC_URI[sha256sum] = "09e2ff033d39baa8b388a2d7fbc5390bfde99ae3b7c67c7daaf7433fbcf0f01e"
 
 inherit autotools gettext ptest pkgconfig
 

