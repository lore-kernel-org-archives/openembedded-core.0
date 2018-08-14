Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFB97900B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:47:27 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id y207-v6so33975276oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4ilP3zMpND93SLr43RJKQvyq9iU7XVEJJ+sLW+6gBb4=;
	b=ILlwOsjAu0V5I096dkCHHOHK7GFzC/KEd8ETBrfcr7VPaLdshU+mI25NeN/7VkLU9Y
	Gb1wHjrmFURERa/dUkMFtWgsHnag4IOZzfswvi4+sT1SyBJoPom5Y69u+8nCF8xHvJR2
	HBKdaXhCUe3dL5veEi27nkFMgB1xMeiqgxnh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4ilP3zMpND93SLr43RJKQvyq9iU7XVEJJ+sLW+6gBb4=;
	b=Yh0qGR9m68XjQmzjC+9GVD5vs6O1VJ5YcpntGxcJFLR4l4GOK4DbFlywd+O36IYTMm
	sFZiHwukvfeyQNnleM7dSPpTAD7opbSCriviDC0KhQFw1NeRpbFaxwMANP71blyWk9sa
	sShAPdkuWY+A8b51GkwYtO0bJuuY0dduBjvg/BC+4na2bgc+XQnAEXnB32xEEnIegnn2
	TlGxOHzItOoNV/NfnWdRPq2SDtgsOXiRCYDZ3lBvRIZ9UJqVzQp58f1qfSmjINMunDzF
	YqKK4mMGAwjAwVTTvd04QgFW7XmbLlNky8m9pizzjICqbsV8t0GgtiD2sonJ+hCijnDI
	KGbg==
X-Gm-Message-State: AOUpUlFWxK6smRIxX3DglQtMF9PbXV3IdXANmIjPWzgrWB1aDRGuFV58
	lm/UaGBrs/RqBFCUPKkB+X41saNa8Us=
X-Google-Smtp-Source: AA+uWPxpf2Oo5vt8tEd3HscEiuMisZf0vs3mRKi/A0U1xYwaIIE2hCjuAS37vMg+8vurMOGuM/Cx1Q==
X-Received: by 2002:aca:6044:: with SMTP id
	u65-v6mr24323126oib.323.1534258047723; 
	Tue, 14 Aug 2018 07:47:27 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-144-121.PCs.InterCable.net. [187.161.144.121])
	by smtp.googlemail.com with ESMTPSA id
	v5-v6sm10587341oix.36.2018.08.14.07.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 07:47:26 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:47:03 -0500
Message-Id: <1534258023-15484-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko][PATCH] multilib_header: recognize BPF as a target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 14:47:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with `clang -target bpf` using the
multilib_header, a recursion was unavoidable because
bits/wordsize.h would #include itself, still lacking
a definition for __MHWORDSIZE or __WORDSIZE.

(From OE-Core rev: 70b41b3c335a80b4ac243f468f22331d261299db)

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/multilib_header_wrapper.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index f516673..9660225 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -22,7 +22,9 @@
  */
 
 
-#if defined (__arm__)
+#if defined (__bpf__)
+#define __MHWORDSIZE			64
+#elif defined (__arm__)
 #define __MHWORDSIZE			32
 #elif defined (__aarch64__) && defined ( __LP64__)
 #define __MHWORDSIZE			64
-- 
2.7.4


