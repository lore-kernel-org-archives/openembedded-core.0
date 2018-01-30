Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A17578886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a88so7605481pfe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tblmqdq1tet5DZtplj1tfL5gp1bbouI6ARjiBfy+Ny4=;
	b=B7CgsWz+QsfX1FbGjueG0I2rsSVMr4OcP3LigzyIyli4biu8E4c7jnCo7FYGUzAAZl
	uQJLt9bkCFonFfqQmuMCxOt1lOOWDs6iBJZBxUWwR2pzjA2aG6sRwFhr4hD8+4A1/cAK
	5LxpoNj5Zl1alURRieS+JZEjB8/ju/RpnId5oUq0r7T+5/9WXTIe/UPjR01dsO5UwG8l
	jnaHYII5r1cWB6b3n4w756DFPVfEPloo6J5HCdoBHpDpQ5bYlm2oPo3be+6DWzbuvyi9
	JKvtjTU7RZEi6vvHAUETasMczY+an++bw6XeZ5awmKwXxrCnHMcI2agSkF3GDpQfPXcA
	Hvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tblmqdq1tet5DZtplj1tfL5gp1bbouI6ARjiBfy+Ny4=;
	b=G65KSgY9Azp7faghpxXbPpqSyB+lQWMTf1ic1JRc+EPrSjSbYyJ1MBBECSG/sAgG5j
	n7tDelaH4GRE4RYtlA3BtneUO+eV1MEKKoViyk1h72ZGLgofkzsqYQICuiq16OxOJab6
	TQKlKWZNso81DfmZ4PRrU+SwEoHbmW240VImX5BDFbRon67De9FneTFQjRNzoD/uCFF+
	knuOCxf0i+ckepq9b6eZgJBCwifmgIhKef1DUO8462lo8d9cS+R47xtMkDuBV4vdQEdn
	Pp008VDWzHcZld542+XbR8RdgneAqE5sdSdV1ThUJqKK08g+v/Y+KA1TdjZOAI2nC3Zl
	JYRA==
X-Gm-Message-State: AKwxytf6AONvXcMjxu7XaWE0dfvkcyDxS95cp0NHj2xuPZuMkW2+uM2p
	iYd2YMU+Vbv1WXyCIVm1hxx7lg==
X-Google-Smtp-Source: AH8x227sOpjYm5f8w78zNxMVzsFVv8FL8eXblx+nq8FdWFBs7ENkOteFKDcUIXRtpmxrz+g1wl+vUw==
X-Received: by 2002:a17:902:901:: with SMTP id
	1-v6mr4431763plm.349.1517286728351; 
	Mon, 29 Jan 2018 20:32:08 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:51 -0800
Message-Id: <2c07b4f4d01eee5b0bb5356ccc7638f29bbeee43.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] perl: Undefine d_libm_lib_version.
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel Díaz <daniel.diaz@linaro.org>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl/config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index 4657673005..ac0484ca64 100644
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
2.16.1


