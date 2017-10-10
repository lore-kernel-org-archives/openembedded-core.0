Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF0871957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:15:16 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id g125so29752729oib.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tLo1X7hzJqjQ3JUhxaflxIN0dbFd39ipxVZCvTpo2zo=;
	b=L27qiV0QH3GhWhxm/gcAcqslh9oMZ6WJW0uWS74pFqPJlBRT/u1ns77DC9UIw3ildm
	hV5N0rSUXw4JN3WnX1Me5IQ4+ZI2dTCucxjn85Jf1nTcBKQCVIBgZRWZbOzzhHnpXM+E
	r7eiuJVmcjXeDyxAqexYroKlZkKPZRm3LaSc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tLo1X7hzJqjQ3JUhxaflxIN0dbFd39ipxVZCvTpo2zo=;
	b=RMYTaS8J88AEt1KJoD4A7gNH65iw5QqP69U6wHFg5J5rExveWHZUsnjuYjTqWNofUR
	6qln7vNaU77Y+0jfAl5a5oKipVl8QSRzgFX+JSNI5ive4r44o8KWezcD2AIf/ec6gglk
	PPWKbRoDuFxmLHw798OOmdeaMhJvuIwRDtY25ixrFNghIDuLJhIZNGiZhwZ3OdnUJbHL
	tjQfwzdRyQESQ5fyff8H69Td6jySq9lzRuw0qTAVqyLycI0UqKpc7hN3CriEtdJSZQhb
	s9aF0XRpCjNd8O0I28yOzUv+VE5cnaUksMvyTLgpwlhEFn44QcQZ4fimL2blAzZE3fMf
	k4JA==
X-Gm-Message-State: AMCzsaVOhss+B2UqzmhrraVSiuVZwPORsOVFbHs6iNk6T2vsKoGnvoBg
	kSOTsZwttmGYtcdVlLj/KDLOBhi9YEg=
X-Google-Smtp-Source: AOwi7QARIk6VRJiuZkzuzsQah4ug6QNSkrnF3jLPr5lq5F+1orqv/EYFaIv/onV4FF9CVi1dq7RmoQ==
X-Received: by 10.157.45.107 with SMTP id v98mr2330271ota.133.1507666517587;
	Tue, 10 Oct 2017 13:15:17 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink64-82.telefonia.InterCable.net. [201.172.64.82])
	by smtp.googlemail.com with ESMTPSA id
	l207sm4961969oih.24.2017.10.10.13.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 13:15:16 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Oct 2017 15:14:54 -0500
Message-Id: <1507666494-9780-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] perl: Undefine d_libm_lib_version.
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
X-List-Received-Date: Tue, 10 Oct 2017 20:15:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A recent commit in GLIBC [1] got rid of _LIB_VERSION, which
makes Perl's build fail:
| pp.c:47:5: error: unknown type name '_LIB_VERSION_TYPE'; did you mean '__VERSION__'?
|      _LIB_VERSION_TYPE _LIB_VERSION = _IEEE_;
|      ^~~~~~~~~~~~~~~~~
|      __VERSION__
| pp.c:47:38: error: '_IEEE_' undeclared here (not in a function); did you mean '_SIZET_'?
|      _LIB_VERSION_TYPE _LIB_VERSION = _IEEE_;
|                                       ^~~~~~
|                                       _SIZET_
| make[1]: *** [pp.o] Error 1

The current config.sh enables d_libm_lib_version for
everyone, with special cases left to undefine it as fixup
(such as MUSL [2]).

Since this may only affect some BSDs and Cygwin [3], it
follows that the opposite (defining it) should be a fixup
for those special cases.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=813378e9fe17e029caf627cab76fe23eb46815fa
[2] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/perl/perl_5.24.1.bb?id=8ca61a5464743ff85b6d26886112750d6ddd13e0#n127
[3] https://perl5.git.perl.org/perl.git/blob/443bd156a6baaf7a8fe6b6b05fcf6c4178140ed2:/pp.c#l42

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-devtools/perl/perl/config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index 4657673..ac0484c 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -361,7 +361,7 @@ d_ldbl_dig='define'
 d_ldexpl='define'
 d_lgamma='define'
 d_lgamma_r='define'
-d_libm_lib_version='define'
+d_libm_lib_version='undef'
 d_libname_unique='undef'
 d_link='define'
 d_llrint='define'
-- 
2.7.4


