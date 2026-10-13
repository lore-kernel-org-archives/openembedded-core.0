Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CD0CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 13:23:53 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7108.1791897832518577921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 06:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=inJEPonK;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so323768f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897831; x=1792502631; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UwGMX9QBy8p3ZRulZIOj+BE+8yE1kZWLHtmaSm00xCw=;
        b=inJEPonKT2tio/kOrvcQoAvaosu+VgtV/kuHf5djuDD74HeljwtGX8KWBhSPSEthqu
         JsVTpzWGhpCHGSANpMfV7G+MFoga0MwhuMndxesaAiyMfeK9RdMsaWBEXzHgtFwNpDLD
         XKHgLVDqHaAjIctkY/X/OnBz5W3fCN+VIsM5kvdXzh4FIC2KSDdNHOWY+2rihxhcFwmI
         /kO/2RVx7AQtViliNnka6RfmhCD0/dB37egFQlKhv5EY9OlDKJ73JudSwIgrD8cJncTr
         YYvJmHf+QnFWGN1NounIycKmgNVZbWrViWZSDClnJqebWa48xOjXWQ/ebm/0cTJWY1iS
         ZuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897831; x=1792502631;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UwGMX9QBy8p3ZRulZIOj+BE+8yE1kZWLHtmaSm00xCw=;
        b=stnePe50P66r+qC1k3fVspyPk3FGrYln0+A1J7Xj7DZvR0u4OXTGahZNuIUFNAG6Jx
         75pLu84Ati+I1jWf8sSw6iQwyF1++UgwRE6G6GqfyPd91Y3u6DgjSFNKZb5twWBuMxds
         NGHh7WgwmKCUpNwKMV4DQPLv5stmOqE6ROVqCfNTsQGk3snmUm4ceUOVO61KGASDQb97
         uZwe+F7YU41fodcLVI/zWhrHg+8LaQiYUtv0zd+UoArv1W4uqkAUmpUGLKTvzWu3koHG
         eEVFcqWmzVWzdVHFPq73Fo48poB6kXK1DZDC9Vo5VNmbIWPssiYksineN/ZNxq2UIeXO
         quMA==
X-Gm-Message-State: AFq9FYIlT5/QvwxXe9S7UQRvaeLXOfw0bOGICP3u3t4Tl4LjqGoyRqgG
	zHABXC0NcKEu8E5e/mTJt13YOG93orA9jYK2jLYKPX1gVwT8k84kUWNhtGnXzmMj
X-Gm-Gg: AYBFou3/HNiwM1hBH1q3EBnntWMbuXpIPpgLT/lCZsqlNOzhAFqnK2AB52I+NyC4Slm
	igLdG8EY/AEDfm8Rv0nI1WpXXQEsfi7Yq2q2NFKS31IC1OmWqCog8lQOPv8i3tFxAXyzK0dKysG
	/RWz7eJR5IR844pfqKtlh12Ixu/h5fbi/B3j33AwNiYYTpbDjN2wK+0O03tsl2Qn8VsBguOPwNW
	sk6u2j8jLYpFF6f6RdJNcDW6SfWL6Avwoeqk/LlAFSVDgCY6bpbYEWZJB8qKkpD2ihRXFAHVNc5
	rbgK2be5nxMhB3NPRTMc6+qoUJxHcnMDV4NLq24u99pJFcPmIzscEq0iNnOf7b5AnVNBnKkepkI
	ExH1GLuAliTYIo6EZzyEWRvGWnlSz3DsDuLXYEzrF1jRhgfbDN3G9bNtSmKRhJpBjrg/rbEaR2K
	aHArJTziHa1MpuwYkzchf19y/GBGNYvS5MscMxf/kLoJPK9u++zltxSPKuVypLtRS16/GjCtRAX
	AwHbMlZz7fiIPHpVqEX2X8PLR3rXJIJrJciH/y36P7AgI9dZGO3GJWkzoSPqRkz2coqktuX49I9
	iekF3RwBxC3OUQ==
X-Received: by 2002:a05:6000:41c9:b0:48c:6756:d9b1 with SMTP id ffacd0b85a97d-48dba7a8ceamr25127538f8f.2.1791897830286;
        Tue, 13 Oct 2026 06:23:50 -0700 (PDT)
Received: from chipmunk-161.. (fau42-h04-89-84-225-38.dsl.sta.abo.bbox.fr. [89.84.225.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm5312942f8f.16.2026.10.13.06.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:23:49 -0700 (PDT)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Yoann Congal <yoann.congal@smile.fr>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Subject: [scarthgap][PATCH v2] connman: fix syslog identity with glibc
Date: Tue, 13 Oct 2026 15:23:07 +0200
Message-ID: <20261013132308.3742518-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 13:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247726

The patch 0001-src-log.c-Include-libgen.h-for-basename-API.patch changes
how the syslog's ident string is handled to fix a build issue with musl.

It passes a locally allocated string to openlog(), which introduces a
regression with glibc, as glibc does not make an internal copy of the
ident string[1], unlike musl[2].

As documented in the syslog(3) man page[3], the ident string passed to
openlog() may be stored as-is. Modifying the string or allowing it to
cease to exist can therefore lead to unexpected behavior or undefined
results.

This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch from
SRC_URI for glibc by moving it to the libc-musl override, ensuring that
it is applied only when building with musl.

Note: The patch was submitted upstream to connman but was never
merged[4]. It was also removed from oe-core when connman was upgraded to
version 1.43[5].

Fixes:

	Sep  7 06:10:36 qemux86-64 daemon.info ^A[776]: Connection Manager version 1.42

This fixes commit d0139bcbe0 (connman: Fix build with musl).

[1]: https://sourceware.org/git/?p=glibc.git;a=blob;f=misc/syslog.c;h=b7414e7b43a510342273bece335b4258e8754905;hb=47dd7e0dacf50c740b04c78d3f85fbf983d53aba#l338
[2]: https://git.musl-libc.org/cgit/musl/tree/src/misc/syslog.c?h=v1.2.4#n64
[3]: https://linux.die.net/man/3/syslog
[4]: https://lore.kernel.org/connman/0caf957f-e046-4453-a8ae-fd6c994ac95d@gmail.com/
[5]: https://github.com/openembedded/openembedded-core/commit/467d28f5d243d821722cf8dcdbb9675a2820cd4f

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
---
Changes since v1:
 - Move file 0001-src-log.c-Include-libgen.h-for-basename-API.patch to
   libc-musl override (instead of moving incorrect file
   0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch)
 - Entire message reword
 - Update references using oe-core instead of poky

 meta/recipes-connectivity/connman/connman_1.42.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 9b3abbe258..4fb7bf6a35 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -6,12 +6,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://no-version-scripts.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
-           file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            file://CVE-2025-32743.patch \
            file://CVE-2025-32366.patch \
            "
 
-SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI:append:libc-musl = " file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
+                             file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                           "
 
 SRC_URI[sha256sum] = "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c20283ac0ca81423c2aa"
 
-- 
2.43.0


