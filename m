Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11E3E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:08:26 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.31002.1735913298511808111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Beejf+N7;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so97771436d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913297; x=1736518097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DT0DpzXmQ5kdFj6q0ydQK+nHLsI3Hn2lvjJ69sR/WY=;
        b=Beejf+N7KLTvT7A33DuBzMTyv6de+P+DeB5R36zecKAbou+NYUFZs6QQ/E0Ipf1dCt
         uQ2T4wbvgvGqv5p6m1enJ4SbZqlSSBmQuA1NYHuH2hF36CsrfFBvQ2IUp5j04UKml2V1
         UXoc0S0xs+4LbSYYWXVn73PTv0XvFszYn8whjZj50FQtLHT0YIsjLIZhoJA6q/CVxBJz
         g1rfIu8w+Q/PCnSaZLI6ef5HqPYejxdqz/OWSuLx9yHPgeVyWEzsGAIzMk8SlIhrmZmk
         4yFN0bUuXgo0Qsr6Zb6H2WR/vgtmaRdKJNqV0kIowrIxhRUnggBTAqfOhmm8vZ6uR7wk
         /GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913297; x=1736518097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DT0DpzXmQ5kdFj6q0ydQK+nHLsI3Hn2lvjJ69sR/WY=;
        b=cP2amlAOyZ7DUARDJ7yb/OfU2NQtYYUnsJ6pQRHe3MHLJf5yEaYOF+tNVrXI7xpdYp
         JSX6lzUHSn/YrEZwxwlCS7AsZc/VjZqeAsqLbJPk2+/Rx/isB0wbaR10omsR/hE/Vs8z
         rfPx5cTjgIFGvuVA9McLdPDsgjau0icp9o8yJf7hiVtb99lSW8jDUtJ09WCL3xUJQ/YK
         +5G/Pz5aGoW1vn6fAHP9NcRlUxn9vnJVCGvNPkaMeBbYP9kuROMVayUoRj9FeIP3wI8y
         d0LmaHNKKo3yoaOKpf2xHMYo5oXYY0N2YMkAhiBJj4EE53Nf83fa0c2gUoQh9/SEa8Lm
         c6wg==
X-Gm-Message-State: AOJu0Yyg+vlS8ENEmxzZySKnx0mTNDJic3EuFryYaecrj5fzMYfKji1s
	/lixHpAL9LRW3iBhkEIWN6NibDVVJWQ2Sn2ycd6qwb2a/rvmLHZ0ud518bwHheY=
X-Gm-Gg: ASbGnctbe8kEw0oJUd6UGqEAQq+FqTjOi4tmJlvDUUNALCEfB4MIVSmmA+IPM0aTouH
	lmxSBegpCmEZwDIm4WbrmvzOT8KH/rlfY3Yka7L+nca5zw3iWN5wO5Ah2bxpOpn1X58/N8r5X/F
	aSuePlpvZsI/cil22CuwmZoaHleMgjULOEwNZQw/ZB6yJ5offZBrcabgDsB8to/uBtXRnhfZcrC
	H2FvH3Sb+2yqybESFqBZm5HMiwG1IVbybynwIQiUxLHN9SHmOp9TgsayqBE82BpFxrU8KbJvqTo
	jf4Wx+RNpw+ybp0YM+DWnqxrJv208HkgxS1j8bUvWlyoksqw63avJV+TPg==
X-Google-Smtp-Source: AGHT+IE8Q4yaTTDCjxXoxXZ4XieaUBtxZ2R2iOdTXunHFD2TGQe4/EkebQZEX2i6VV+GhObUsokTQQ==
X-Received: by 2002:a05:6214:dac:b0:6d8:9124:8799 with SMTP id 6a1803df08f44-6dd2331f006mr957285286d6.5.1735913297422;
        Fri, 03 Jan 2025 06:08:17 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddbe688b33sm18748286d6.84.2025.01.03.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:08:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] kern-tools: fix python 3.12 warning
Date: Fri,  3 Jan 2025 09:08:09 -0500
Message-Id: <3b78f616293c938b32e8ef301ea819a68445b53d.1735913191.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1735913191.git.bruce.ashfield@gmail.com>
References: <cover.1735913191.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209351

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit:

  Author: hongxu <hongxu.jia@eng.windriver.com>
  Date:   Tue Dec 17 01:47:19 2024 -0800

      symbol_why: fix SyntaxWarning for RegEx calls on Python 3.12

      Python 3.12 emmits a SyntaxWarning when using unescaped
      character inside a RegEx string.
      '''
      recipe-sysroot-native/usr/bin/symbol_why.py:161: SyntaxWarning: invalid escape sequence '\.'
        if re.match( ".*\.config", opt ):
      recipe-sysroot-native/usr/bin/symbol_why.py:216: SyntaxWarning: invalid escape sequence '\w'
        x = re.match( "^# .*Linux/\w*\s*([0-9]*\.[0-9]*\.[0-9]*).*Kernel Configuration", line )
      recipe-sysroot-native/usr/bin/symbol_why.py:495: SyntaxWarning: invalid escape sequence '\s'
        if re.search( "^#\s*CONFIG_", option ):
      '''

      According to [1], use raw strings for regular expression

      [1] https://docs.python.org/dev/whatsnew/3.12.html#other-language-changes

      Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 01c5030759..9f30be01ff 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "df5de61e6e52a24b7851b68cb8dd1e226ac1fb69"
+SRCREV = "bfca22a52ec54c77ed0d34a56338bc1fe0a3b0db"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


