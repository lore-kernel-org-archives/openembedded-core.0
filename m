Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DC8C98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:50:57 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39768.1790527847291193384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ARL0ku5T;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so765038f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527845; x=1791132645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C3sNpfC4hPCwptFFhgojliFIKO+/1j9Eo90nL48O2L8=;
        b=ARL0ku5TTY5GSlVKPYrAZY2l6u38G/qaXo3rZaUp+3jQumdfJSuQeAhCFB/U5F7igm
         UnpsKFS/EfRUXQ6U4ksVHkpK08ZsbQrYffCCmNduTLtT6EbS3oiZ/iJydkYqxCYO4Gc7
         NY33B3oMqM8QORuiqzhqAzLEaMoxDQDHffOUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527845; x=1791132645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C3sNpfC4hPCwptFFhgojliFIKO+/1j9Eo90nL48O2L8=;
        b=YNK2MsxI/bWOZQRv7rGpwigCaRqH0y+maqyNy06d5jf6bLQyAo7j4yLVOggwXcj3iU
         UKPc8+c8ScYZjpnWdNpEUZgQy6qbpZg653HLfu4YL5ucJaNCWQjEf8sVo0taJc3dqTVY
         tz5F3FRjvWTun3xl7K1SiAIzqX6ACHktr8Mi/Jh7WBKr8dZp2Y8tSOOQEU1c+nc1XBvC
         065wTddUKfUQJgAlMnACs08MfhSh4JKOEH7LvIBs3XWahijRaWi0T2Kuk8HgmuSDYdPR
         kwKXX0sLIA6W+zze4eMfymNz461m2wVq1t/S+Eqn0NOZjxOvE7PA3eT5QMsprdiYaVGs
         7D7A==
X-Gm-Message-State: AFq9FYLpmbVgD9+gaMgRum800EIvDo1di2+tZkQaYNZfSjxu5uoPBMFo
	wTbuMPOoGD5Vr3TkKXN3Kh+5iVO5U4zaG01u8Pr8JCQzjO+dJME7WBlWu3rgKGzmazXHCx/lLiW
	cpRmqm4E=
X-Gm-Gg: AYBFou2D1n4vilslY233Wu5MhATOhyDlBlJiX+8eOW4z+uds403Omt1s9M6mGfWb47N
	qVhIrSkP36Bp+5ZYgrmI8UkdaPElwqMtc8TaW9Dk5MxgpMTM/sQxqiZ0Fz+0Ln7q63ehdz/VhTy
	e+9IKsXXRjgXhiqua8xpeZLDLCSAvUrpjD5LR/Ar1AAMtCy3xxu7t+YsXxV0XXkRhG4n2sJNPc9
	lP5367XhOlvqI88VYzcwAj7PJ9BH25mMj3nPo7h3ryNGdmYBEndcduRWJipYqVzBQF4XSIwMBXZ
	qXcLN6XYYuNB8E5+Ai63Y/avof/wjnltESrhs0wN5dHOZBMEKOI+JSoCQ/u6WmetqtaLp0OPUmy
	V+BwN3oFvBjh/T+hw9N0yATh0z0cJvmboVGn2hq+mw19x/C5pBhZWtyDUQghUOyxVgZcSEiQeNd
	kNAHETZXaoUBsHJc/OxcK4qspXqbt2EvAL3Hrb2bpjoPiGj8vsUAXkS0s/V6lg1tqAHwHFmDJpI
	2WwACpTaPLuS+bBMJChqDbqmCS9kujDYW79Yw==
X-Received: by 2002:a05:6000:4b15:b0:488:80bb:d14c with SMTP id ffacd0b85a97d-48880bbd368mr13127918f8f.5.1790527845535;
        Sun, 27 Sep 2026 09:50:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm20798235f8f.34.2026.09.27.09.50.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:50:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-meson-python: upgrade 0.21.1 -> 0.22.0
Date: Sun, 27 Sep 2026 17:50:40 +0100
Message-ID: <20260927165040.2525950-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927165040.2525950-1-richard.purdie@linuxfoundation.org>
References: <20260927165040.2525950-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246700

- Add support for adding RPATH entries specified with ``install_rpath``
  argument to Meson functions that accept it.
- Add support for removing build RPATH entries added by Meson to allow
  executing parts of the project from the build directory.
- Fix corner cases in handling RPATH entries and relocation of shared
  libraries distributed as part of Python packages.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...n3-meson-python_0.21.1.bb => python3-meson-python_0.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.21.1.bb => python3-meson-python_0.22.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.22.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.22.0.bb
index 2c86f7fed41..f85f6c55cbd 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.22.0.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "78b3345dcbc0fed7b939e7e37a9faab35bddaae07bf62e7542c8ad479c395af5"
+SRC_URI[sha256sum] = "9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 

