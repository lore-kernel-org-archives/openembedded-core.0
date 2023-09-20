Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D6ACE79AE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:42:40 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.30530.1695188560183481012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5PoBuCQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-690b8859c46so1994993b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695188559; x=1695793359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmoOOIhy6KY1tk4RjgIWRZhqIVSM90RrcR4EACpNeto=;
        b=e5PoBuCQHOLcppIITL06ER7uKK7PixN3++BXa8CxUdhbLfpxD8mzXQj/LYzgEX4FwN
         1HTwJ5FkluPaWsTobGZOKvI95+/C7YmGvqW1KrT6lXJmGsS1QXUeBvdVbZ7CR+43COuu
         9+FsN517Brsc6zWu7CwB9H28vqsHHCHwa/vip4ZncCmETIdWIYaFycvhqgdM9W4qisSW
         TTtZpaL/AKR7w9Ok0AOcR7ZpZxM2WKMTicla+m2i2TaMtNvylrspOSG0LB+dUQub8hFO
         AjPGlkuKu36iXdMplwm6hNFr/ZywLhVOLfdrkSgmxQ+Rr7UuDODrcZB1iajOOg1tabgD
         faPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695188559; x=1695793359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmoOOIhy6KY1tk4RjgIWRZhqIVSM90RrcR4EACpNeto=;
        b=YDVaIjQEjn3Lpc2bKDZhK8HyGImv53rzGvrRxhCYOvYt+UtC2VwU3WiI7oLBZA9G+q
         r+JwdThKAAQCa25ES5NtsTH78ATICgBTUXq55wy6HveHzxmwg2fGMGJVKivhh1I8HG8y
         8gteQKwEOfkivpBo1D8NxzJ8LewIYe681TsC3rcOt++r3NaRkuIrS9UVefhPSmBC4wwb
         +CCubCk2/eSlIbEyYxUIuaLnPMJuMo3W3+2aCN4lkYA/EU4lldJ3Jv95Z93vW6iHd+Un
         1WbFz8UNA1lB3GCQZuxqb3k4mX+0TjcUHKfG+V+26opalOz7AoOEG/EOAUDPzw+RDTbO
         2Y9A==
X-Gm-Message-State: AOJu0Yy3Ze1hteA25yThBMnLiLlosVBHueMx5ENqIjfEfQ5W602fiVme
	UF2tSe+hGY7xY0YeUdYSpw0plfGg6dk=
X-Google-Smtp-Source: AGHT+IENsP948oo9rc3klxV6rNC/bEAD8R+akzwpIe8nYnyYUHzGT7wvuoh5sdg46X+IS+3UsmAkhw==
X-Received: by 2002:a05:6a21:3286:b0:133:e3e3:dc07 with SMTP id yt6-20020a056a21328600b00133e3e3dc07mr1860609pzb.49.1695188559245;
        Tue, 19 Sep 2023 22:42:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id bh3-20020a170902a98300b001c55d591f07sm5134485plb.260.2023.09.19.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:42:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] findutils: Disable error_at_line detection for musl
Date: Tue, 19 Sep 2023 22:42:33 -0700
Message-ID: <20230920054234.2514751-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920054234.2514751-1-raj.khem@gmail.com>
References: <20230920054234.2514751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187891

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/findutils/findutils_4.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb b/meta/recipes-extended/findutils/findutils_4.9.0.bb
index 074817df27c..deb13eecb1c 100644
--- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.9.0.bb
@@ -13,6 +13,7 @@ PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
 
 EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 # need od from coreutils for -t option
 RDEPENDS:${PN}-ptest += "bash sed grep coreutils"
-- 
2.42.0


