Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.32546.1620657062641242910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tXXTmgQQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id u16so15962550oiu.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E9/z4Js9U91eRqEw+zTNcgyQoGaV8PKc6yka7pS1OEI=;
        b=tXXTmgQQtiQWEW/XIW6K6pSUzMDe13aG5+CqVhHimMslPED8ELEWxo8n6lI6RGW3/K
         XtgYoZoDgQ95NnAUJkCPq0/L79ZozEnc0cTdWjo4IsGwUZAJOIQLyXDqZRQF2SwR5Tk0
         xCiFVmKKP4akNLEJqHKRuR4LY+NtmEZAwWKb3cE+0+uG74LG2mR7JCddEy0erybZiFER
         07iV9uB1j27xSyUlEuJMoiSqf13aanbO71wR2npcKC4XF//d4r80WoVMWl78+IxpsOX9
         O5NVdJsuNLSayyahnwrW0NiyX3+TtZw1Ac133n4VDH4WaTV2uSvXOsnZkRUj42P/mCHr
         hXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9/z4Js9U91eRqEw+zTNcgyQoGaV8PKc6yka7pS1OEI=;
        b=HZpQFSGyGh4Ty1P5RNSvpcfX5ngs4nlNGXQ+9ZZxAH+HdVdC4nszVoK4LtawFo8xlK
         SiLoHi3EobnG9lTKGBd1c0XMxj6qyufe8Iivnbp7/mTWS2ZOaRZUqzYOBcCjN/yiIMre
         HO8MQUwDCA7u+1U20Qdbeu/U1AbYGYcfqk5ECQiTZG4xxchRcDDhh1w+KEdrJR4GD3yH
         uVhXQR0m+Ku5mlWwaB1tgPVvqqhbQCM52jOVO2ge0Bt8MZZ3nTncYzWcJ9YrqNelqMGX
         EpTwELVG9BHdQvbHg6m8IJqrABYejtVwWrHQa9YS8ltLeI+XTls6/3Y1lZOy/5YK5Hcw
         Lrwg==
X-Gm-Message-State: AOAM532tjZXRHqw6JncCIR3rpMBLRK+S+OJC3Jl8jgHgkoM+3cs0SLrO
	Qojx9fjKmbpA2to3u+eY5sJGKDsp/yOuMz/1NHc=
X-Google-Smtp-Source: ABdhPJyu1bE0s4dCRNOFcoupjTk6iehyJvjI3L9ihD2oz00c4LfTXF/3Cle1glD1YpLpvjjGJ26TgQ==
X-Received: by 2002:aca:d8d5:: with SMTP id p204mr8803788oig.151.1620657061536;
        Mon, 10 May 2021 07:31:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/25] diffoscope: add native libraries to LD_LIBRARY_PATH
Date: Mon, 10 May 2021 04:28:57 -1000
Message-Id: <0f4531275c1e332de81b31b89e52f588fc34b14a.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Reversal of global setting in previous commit necessitates
a local fix, otherwise, this happens:

  File "/home/pokybuild/yocto-worker/reproducible-debian/build/build-st-52142/tmp/work/x86_64-linux/diffoscope-native/172-r0/recipe-sysroot-native/usr/lib/python3.9/ctypes/__init__.py", line 392, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: nativepython3: undefined symbol: archive_errno

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87884d9938829d5ae5d250f483c749e00cd83322)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/diffoscope/diffoscope_172.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/diffoscope/diffoscope_172.bb b/meta/recipes-support/diffoscope/diffoscope_172.bb
index eb85d6c854..b26713c47f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_172.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_172.bb
@@ -18,6 +18,7 @@ do_install_append_class-native() {
 	create_wrapper ${D}${bindir}/diffoscope \
 		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
 		RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+		LD_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
 		RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
 }
 
-- 
2.25.1

