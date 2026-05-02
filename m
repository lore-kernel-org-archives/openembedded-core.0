Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9887CCD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9511.1777739463654420525
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+hfwpyU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-445795cf6f1so1649538f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739461; x=1778344261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtI5yJow/JzvsSSm6Np3IgLiAAWH+NSspPY72O8NuqQ=;
        b=X+hfwpyUEZXIP9vrkLTKfSDDBtnn2LHMFFArfOTD2rBHLULcZiRky235k9A9vsTIll
         xHu8d7fcOKLUZwUIoZ6SsFPH2gF4kulTL+o+isk/1eUTQAqvKprsrUlBy0gt0Ma7Lyqq
         9sBFseY3yLVJ5u98ikyJRyxYXtFoimPLNO2io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739461; x=1778344261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DtI5yJow/JzvsSSm6Np3IgLiAAWH+NSspPY72O8NuqQ=;
        b=kS+G5xqKX13cFpIovRgM0KxlhIaXcJ4bPeMI/T05DE4Zsp37Zw0QUe0psUx7nbCFaZ
         TyRS58feLtulCTS6McYYYfFyVFbHFm0d4c6L1BWGEAmMid7aDl2wVVPdllwtQDvpb4iS
         3CgQOPQKpo5xIYX4Y8EVvY1RLn02hGuF9QqX92UZsruMzRKZi5q5g3FsmlOFBL0XlKBh
         WqXpCsNuECw068QB5iDy72FmJpIrRT/58JB3nL6B9MJI4oK7C1+6LaWqeR4T5MBlhfRD
         NfudqrHEHiE9mZP/9Eq+b/PkUobLLCI33tRyvc33C9wy3mJ4xPwYyO1Bw7U9Yn02kb8a
         dBnQ==
X-Gm-Message-State: AOJu0Yzw4uiSSrHlapB6hnrvG12136XDIVtFe6lGU2dBX8ee8QiFuozS
	x+YPjLCS2bvgVLVa0O1MO0BeOH3MmT1aNssRZ88FqZgAAWqlIPEekkL5HT9WFyq8q/VHuwavDtj
	D9Px5eW971SK+SKko0f4h/MOLjxPVzeaGBL7qpwE+GD3dfY2GMVEhP9rt3OfpWmsHIaNcDWRdmI
	5vRV4KFA6+Q0RP5xI=
X-Gm-Gg: AeBDieuaGbmDJbRClwJf2JErLWQBSnY4tgR3ymsEiqU3XVD9CAvrGhQTOlcwjAcBRrY
	u+cZSFpwwDjfexpgew5CbUfjNDQGyf43Ka9OmPW8mMa9LtrXJpARhSD02riUNTFOMX3XH+l3F5t
	61mmxZU5MuYCWFdkZQIPoPG/tnR4lQW1GQnwKGhNJsX1YITdrL0rohvH+Tc+v0md4NoXhRaE+Lm
	Rz9nnf2IPD4YlbHRf1j3oqd7MQB5EAemOKR+DdnKzRmSOwDEZjuHOgkrCCRcseH/QigJiCIIUqX
	YRttFjhatl+LOWNkWDBKfUxWQBEiCdt2PtqsVkKcetxF+zxz7JYBBpJG9Ik0iGGkd5ICWImXKWP
	p/aAj6/LjKqajFi1aeL7VfKbBm2mbitvU1pTQ1dE9jIL1ecjS6lFmQii38dUAmUEiPBmmG4AgZL
	qofXcUd3yG2jafTmI6LdFJkJKcxxYtKb4UsNEmjrmuCCsraigWEyUFR+kBHp2cafwcbPwpPBQ8R
	Q==
X-Received: by 2002:a05:6000:1786:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-44bb34e6f1amr5967177f8f.12.1777739461515;
        Sat, 02 May 2026 09:31:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 44/62] python3-pygobject: upgrade 3.56.1 -> 3.56.2
Date: Sat,  2 May 2026 17:29:04 +0100
Message-ID: <20260502162929.1377831-44-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236353

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.1.bb => python3-pygobject_3.56.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
index c17df1a9d1e..24a58adee6c 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "2ec1cc8c55c7ffeebb97e58a9bba7aa1e74611f1173628084685446804a8881a"
+SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

