Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9071AD711AE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2030.1766089386463396434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQuDjcG+;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee1879e6d9so11019991cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089385; x=1766694185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnedDWskMC/RNQ5Nq2nSTEDQ96Lkgr62Nne8Vu5REZU=;
        b=HQuDjcG+JBUL1zdFt5s/fRs2XLswxyIdt+n+LyoLRDQU9cjNdzemoBP9e9gS5Innbb
         6JalkBMzU8Tcn92jKj3A2JvIWXzSThVyJYiFGHm+jMYCM8HXZrjxSpBgnOAmdZ/AuIAh
         BjAUK5iKJgX7ErQsyZShyDaaaHWfvD3yD3lbLHk8IgoqiDL6lg+T4ZHqG/nGdvYqElaL
         7HhxFL6WjdLo7sA9TxVtIZjsBkr+UZZ3tLzLaTwXTgCpdbD2HR9Il1ZkhyqLLKSIcPxm
         8/cX2BBJlKFMf4Fl1TCS7R7LeQY25iBTO8N3P9C8oHpsL2fc7eym1ILFL7iLx934hvsy
         5Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089385; x=1766694185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TnedDWskMC/RNQ5Nq2nSTEDQ96Lkgr62Nne8Vu5REZU=;
        b=HqsYe2lDYsmwnqJqNcx2YlpvtNI/s2smNuklN6vDSAxQsBlBF6kjxkR9aybl2fd7eR
         IVpkUioPQfyYVPP+qYDQGTmOZ5ZmRndEKaKJgVFa0ARyTwphOsFPGRukNl722zRWFkr2
         hxp1P9xueu6TpQTAy97y8siiwr/YgaCyFpcymHoDOcpNXhim+Q3rTgyQvB1vyDWT1DvC
         fjcFut5hhIkorzse/pA++yFAwvIECfIOzoPETQ+k/bnS4A+/ianf5uqQ0CcTX9mliCDu
         Biqwimpfq6B723cPvCDNB9hc3WCE+YeM91VQSQt6INkwMLXymVGcwpM7aKz/jkMhGiYd
         XhGA==
X-Gm-Message-State: AOJu0YyH6pnQVhfAJCFXNalNoeJYjf1ipJwyQVBt6ctziHn9jNOq30K2
	xTjGGLnsHMUuoadSP2BD2GZ5mUfs6f28nF/Kkn/5viB6iKiJRuKwbfNWSyZoiPUTDJU=
X-Gm-Gg: AY/fxX75xKGOvuAAiMttisxLKzsdNZz/ZOsAb7bpLZflrRRUPVlbJL3JaJvTSLX08jg
	7+wqkyMvtxvy+L5me/n640heLtEbwIKS0kz3rJhcQpi43dR57rAqI/D915gBtB2TJADBxBnwAvH
	5b9A00Ns86dhrhffAqtSbmlglgaH40a/WG/r5hsV/xWEKdbBR+mw7f1CJ12+JNqVMZuOOSPJmKg
	0aB1IbO5hkwxJJ1R04j0fZv3gqLxdNFXsBPs82x5LLOu+iXHU2OFbj26YeEZu2EhSqORYjXaoN6
	2qUbc46Mhykz5Ctb6WADBJSuEbcj1P1kAPRuEvPzTLHRv28nPoOgFBJyq+6heGLp14YvxoFoknX
	0Qk4IYAPu1fGUcQ0lGjCLQ5ZjOy6NAPFpNw1rFbBmhS5snSshwLFe46C/uuZgV8+CRMUdJROFrb
	WSYcoJXlNkCssn11sZNtp8V8RHc7ryy5kvgJKiaRi3RMCj5PLumurS+MpF6ZpkFDJv4mBXPfkO4
	9acy9WVOQL/37s=
X-Google-Smtp-Source: AGHT+IFkw3TeDcm3nGxmXUw3aoLEFRO2RlLe6xK1w80ySmofIhg/dC/udGWTfXA3QhijgWrrEDFv9A==
X-Received: by 2002:a05:622a:550f:b0:4f1:ac12:b01b with SMTP id d75a77b69052e-4f4abd6e320mr8554771cf.38.1766089385391;
        Thu, 18 Dec 2025 12:23:05 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [12/15][openembedded-core] linux-libc-headers: update to 6.18
Date: Thu, 18 Dec 2025 15:22:37 -0500
Message-Id: <20251218202248.70476-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228154

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping libc-headers to match the LTS reference kernel 6.18

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../{linux-libc-headers_6.17.bb => linux-libc-headers_6.18.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.17.bb => linux-libc-headers_6.18.bb} (80%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb
index b4bf1126ab..6a1ec33dc5 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb
@@ -8,5 +8,6 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7"
+SRC_URI[sha256sum] = "9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b"
+
 
-- 
2.39.2


