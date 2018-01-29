Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B6E7E786C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id n17so3365427pgf.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tblmqdq1tet5DZtplj1tfL5gp1bbouI6ARjiBfy+Ny4=;
	b=U3qJ84Nnrr3wGBhMrNfZaPn0BZUdIOILzI6wVIuGD9qXXdGKMVatZHN0RZ7O9tpv0R
	f2wbg71rGzDUXshOtZvBN3Ei011uViRzXvG7mOE1pPajEERxNEBsblaomRnk2Bgzl5g/
	ARtLaz8roXmzz0kSNqEdC+Z6IIN+EmJPOoagYKv0bW3NSkRCzm7x4cHxu89UQ3WmJqYg
	DHenRb36lP9GVs9x4aoEbtT156CbFhDCEUmQ4OsejChlp6JAL2FrUfQMOsANVQmYgXNA
	7A9ZwuSre7sqaaVp3wXMpop8+zC/29OwlUHPYJkWeCFU7/apO/DudcsgOFd2+JDnWLz7
	3wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tblmqdq1tet5DZtplj1tfL5gp1bbouI6ARjiBfy+Ny4=;
	b=YTRcOZXpcgvpzeo7244FDHeMGLkO92dfq97I2EtShZN3FUtAbOrHm4agOWdICokR6B
	HS78d99HpEFoEp5Ssx4DmpVyJUifw8EIgi8fSg1gNRS477MICh6bQqHCAevGrM9Au4Ez
	EINHTdLHi1zZuRopGmADI2MF2AiBzXcWwdgbpM+hrGXY8Rryh7rQE/DksgSnjxnPGDiV
	UbhuIu3bvsbK2cRpdBP3rLpI+3QaOTlvXIWfnUBepB1ws30y2RW3TyrqbYM04vFveD8G
	jUYS/xDEz7rFDJbPTFdjq7ivRcccjGCJsbCDvLkQgpajamQnLxSkUrdkWQiwmycuQo5b
	efLw==
X-Gm-Message-State: AKwxytde52Ib5j3h0CPmsTKwfIzWSBn1YkdNYixT9MirQAmQTYS4NfRc
	7xED9UOuNCaCQ1gPNppatnB/mg==
X-Google-Smtp-Source: AH8x2257kCXp6eV+j51fB43A3CB+pGijWmwKthoA5EF5qAUWEqDVH+rVP7LVPyO/llUEGVNVOfWKGQ==
X-Received: by 10.99.183.15 with SMTP id t15mr20863354pgf.111.1517196450690;
	Sun, 28 Jan 2018 19:27:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:14 -0800
Message-Id: <7f0ee0942c3d47c4e57e0d6e8f9f0bc6ccd9acdb.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:29 -0000
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


