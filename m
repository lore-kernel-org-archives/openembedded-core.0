Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7342BCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 10:50:44 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.35038.1759076090107947033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 09:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdtYea7a;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-4248b34fc8eso38746315ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759076089; x=1759680889; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca7ZGX99uEyDZBCPvBuKGefBpXtg7504N5jCvm2B2hE=;
        b=jdtYea7aDTCXoD+OGK0hAU3J3571vKzbkNW/Df31Go8JZOiSNs0wfqvEo+6VLtFJiu
         X4nBjZ+V9mjLTW3zWkAQn/BsYdsQxxsOeyK3OAVrpiaZbmg/bEQ2w1SoTnoSE4NMU7u1
         onEcVUOW20FQT01ojenFBnEvs1Gun5I+dLcsJSLqrO/gsmlupGTK2DNY8mE4A440DAGU
         sSI66VbQsY8FsJKBinGzAxzxZ8ygdOfhqo7+PbOWoQqxDQjopG6l49a+NFKJau86vSBr
         kqfR3QHrqNYduo8EediWpwwmPukkSeOQkAw7Yy03/9Q6J8jdefGTPGk4oNCpMRKv4nR8
         La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759076089; x=1759680889;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ca7ZGX99uEyDZBCPvBuKGefBpXtg7504N5jCvm2B2hE=;
        b=fX4G4v2nsXbDv+LdeB705qnxwGBAVkIoGbeQvRMCTBffGEjszudSTCWSbJkGQQyUPE
         Fz2AMlvxUklOriuMR9Xe5Tr1MpBLE1/Fl1C9jczjI52/L/HdZrX3XVAKjOuMuBXEVHpw
         xLeEADd5xPdO2DaXe/d4/p/6PoBM5mgBwEI4ssIfPwayV5yzbTsmgtXNCvXu566aMJ/y
         g3QNPcbD9zXdEB+8TnF1guQQrU93YKGkj+frhU/MNW/LNPP6j67888VQdayD+ZHy8S83
         bl1N2nix2Ht7SZt4081cAlYILA3KkND3BEDkk1PIkjBl5OiG/J0C3beOLAErMCz0XSGb
         hlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0qJJCE6uBeQnw39eC59LHWmF5VyxDrq56nU92Mt77y/JO/U68hWSgUsILsCFid/CTSJKXLwn3G5HC7TO178evg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyA3IhWNkoil8SX7dOeAbYaXXdJL0jRN5XyIr5bxkrzWHHG7ykZ
	uVCt94vlmnQqkwb5OF/hwHCl/od3Atyi+Ch/BkmLZHCdZ0wwVHaXlkHp
X-Gm-Gg: ASbGncuwCQPWywwrW/xTyTj3d8doZRBS5OXBaUP1h6ZooGdEQzVDrtoBfiKEgR9vQ/v
	WxW+kTRz+/bc47b/m9fBjxTy4kBqtm00PqJyRHPBIdAcqooBwh0BdjNzXuL55AxyIc2GwlqGiMl
	/XdpC1+Fs9JpG6AbqNL8UNKm79h5Ga67J2WEoH42YDEqnbegrj2onQMIZPmvKLOKYdXJuf9aRSU
	BHo2/642zRGxUyVZo7vODXVem/gXVj/BX50X71gATDVpeXpZj7h69lVZb/UZ/k09msleYVk7uWP
	+TmP0QcJeYYHXIRjnHrB0MsF7Vl8KyrI7gVZG3sjbNYxXq/OyLBZq24nBkUq/JIbNwoNHGwdQ6T
	hAdOTnU5gjmUEqFfQd+mCMfshnbUcMUmhmdoTkrutp+Et1neiZ17/dhAWRNaKxJxIaBQJ5rP3XQ
	==
X-Google-Smtp-Source: AGHT+IFrftDTu/+3PrreVmtsA/+lJnX5V7R7on656ZBJqteuWJmKbd8tiUxNN8k7w8WIu0s4g9atvQ==
X-Received: by 2002:a92:cece:0:b0:424:8114:3840 with SMTP id e9e14a558f8ab-42595644d65mr167179585ab.23.1759076089229;
        Sun, 28 Sep 2025 09:14:49 -0700 (PDT)
Received: from [172.26.252.3] (174-16-207-42.hlrn.qwest.net. [174.16.207.42])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-428a3b61d48sm22345885ab.13.2025.09.28.09.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 09:14:49 -0700 (PDT)
Message-ID: <fefec75a-d849-430a-a503-1369dee54671@gmail.com>
Date: Sun, 28 Sep 2025 10:14:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Cc: denys@konsulko.com, richard.purdie@linuxfoundation.org
From: "Clayton Casciato" <majortomtosourcecontrol@gmail.com>
Subject: [scarthgap][PATCH] vim: fix xxd-native RPROVIDES
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224136

BBCLASSEXTEND doesn't handle overrides with suffixed ${PN} for
native class, e.g.:

RPROVIDES:${PN}-xxd = "xxd"

becomes:

RPROVIDES:vim-native-xxd = "xxd-native"

instead of:

RPROVIDES:vim-xxd-native = "xxd-native"

This results in "Nothing RPROVIDES xxd-native" error when
something RDEPENDS on xxd-native because there's no such
package as vim-native-xxd.

Use ${BPN} and explicitly handle RPROVIDES.

Since native class does not produce packages, other variables
using :${PN}-xxd override don't matter. And nativesdk class
is not affected, as it uses a prefix, not suffix.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Sponsor: 21SoftWare LLC

Patch from:
https://lists.openembedded.org/g/openembedded-core/topic/109930389

Walnascar:
e2fd81e221c2 ("native: Improve ${PN}-XXX package name handling")

 meta/recipes-support/vim/vim_9.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9..8968b8cb07 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -11,7 +11,9 @@ BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "${PN}-xxd"
 FILES:${PN}-xxd = "${bindir}/xxd"
-RPROVIDES:${PN}-xxd = "xxd"
+RPROVIDES:${BPN}-xxd = "xxd"
+RPROVIDES:${BPN}-xxd-native = "xxd-native"
+RPROVIDES:nativesdk-${BPN}-xxd = "nativesdk-xxd"
 
 ALTERNATIVE:${PN}-xxd = "xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"

