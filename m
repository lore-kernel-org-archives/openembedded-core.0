Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE88C021A2
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9241.1739023509754645912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=htcXzjnE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f48ebaadfso43920635ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023509; x=1739628309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV9sVvlP//TJ2tNpteE60GQv2FaCt2cOfFhFPidujvg=;
        b=htcXzjnEO29+s1+f6nRYAcNTo7xOF1/Nqmcaw1UbGehaDwBpNTmk8NUNGJtlZs4QKb
         Nigh53uzRRyMq3mKRlZm0kRPdip3CvBWG9xxQ0Ksj0rYPXqoVSALd7v9d18DjFGvkbDo
         99TM4ZJ+1Opti8Ybw0dtDbpXnSW6zSEJB/3Vo32CgKuw+PQgzuC/cpFO7YvlFRCJ0Mfz
         XvLr7WY//T+O5ufsvEKz3Dk3McBm7ganztxmIfl0hqSgOpEpVbA4IWSnVQ2YrkVlxwCx
         oeM2OasfkEx76HPXXE2xp6u4Ja66qnOCOWGUN03Xz1pZl1vh7iagojqf71YJI2WEFL3m
         f29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023509; x=1739628309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cV9sVvlP//TJ2tNpteE60GQv2FaCt2cOfFhFPidujvg=;
        b=vK3fLM5tUPW2H2qWiuIGFIkEsN3UJxTORp0PblZ8X4Dgu4uj3KCH17E1AUoJUVvtIp
         rt7+p8jRgpV63IBNJpN11mF0CbdaJd6XXyrG3wYV1Y0flZj65Qm66hba2rz8mQLReR/M
         j+YnXNURZUtcsZwsJJV9BaouVENKRdCygN8HU5oONqIzQM3T+Aw5/DIkUHtY0tENuCOQ
         lNF0rLEpN3MOJRrowQE/y976GZsu81xfTRscyMzHtS4Fkv0PsrFqbvk4EO7Qtvs5tDcz
         NflutaxqLENRcmxUjVY6kbTe9/TQWGo/401RAeBLeNt2qDeWz26tbPllJqmAnycGoh3h
         SMkg==
X-Gm-Message-State: AOJu0Yz5JU8AOdgmvAXMegP8NUlq8GpvVo3TEf/Jsf5rW/il83JGNEEs
	xZ+zSC9XLeWy9p8K/qhwjXBtz8FQFIQ9J3vovaeLswTnS4eltxDpRBPjCIRaxi/O89GdnCCNUe9
	c
X-Gm-Gg: ASbGncuwyHq8SDTAS8nB3DpO/uiJibIbTaYzUTOkJb0ROnXn9rFGe7+wdx47uFUGmhd
	D5+UR5G/BKhTdGs51CXB4KiIEMmTjnZzo713uv1I2qDHjBaWpgUPMlxwpT9EfqvXLxzBTo/9OS2
	PbW+6l3t15rIGEPFL0eE0T5l4uhg1RmspbVT7rzkc4qR9HiUy42SZQSkdAwdJLSdFO1YmxJPt2/
	p2jNq4FE2HlGG2EaJGH6IlxHZlT4yASsUJ1wD2lKXQMcEogruCEtQFXw4AupxOydoDIpd8DnXD4
	JE/c
X-Google-Smtp-Source: AGHT+IEOUmv/2UcjonjyK/0ANVHdMoUVUZj9G+xcwx5/wnejPPRIOsZBzQ3Ouiip3EjpnULL/LtzCw==
X-Received: by 2002:a17:903:28e:b0:21f:6435:8e19 with SMTP id d9443c01a7336-21f64359145mr63262725ad.50.1739023508920;
        Sat, 08 Feb 2025 06:05:08 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/13] gnupg: upgrade 2.4.4 -> 2.4.5
Date: Sat,  8 Feb 2025 06:04:50 -0800
Message-ID: <a596d0e3802486dce9eeee2a9cbfdc6372a182d5.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211023

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* gpg,gpgv: New option --assert-pubkey-algo.
* gpg: Emit status lines for errors in the compression layer.
* gpg: Fix invocation with --trusted-keys and --no-options.
* gpgsm: Allow for a longer salt in PKCS#12 files.
* gpgtar: Make --status-fd=2 work on Windows.
* scd: Support for the ACR-122U NFC reader.
* scd: Suport D-TRUST ECC cards.
* scd: Allow auto detaching of kernel drivers; can be disabled with
  the new compatibility-flag ccid-no-auto-detach.
* scd: Allow setting a PIN length of 6 also with a reset code for
  openpgp cards.
* agent: Allow GET_PASSPHRASE in restricted mode.
* dirmngr: Trust system's root CAs for checking CRL issuers.
* dirmngr: Fix regression in 2.4.4 in fetching keys via hkps.
* gpg-wks-client: Make option --mirror work properly w/o specifying
  domains.
* g13,gpg-wks-client: Allow command style options as in "g13 mount
  foo".
* Allow tilde expansion for the foo-program options.
* Make the getswdb.sh tool usable outside the GnuPG tree.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.5.bb
index ec75960235..97b5d8856c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
+SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.43.0


