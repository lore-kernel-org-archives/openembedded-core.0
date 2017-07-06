Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB24776D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:46 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j186so474524pge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZKfzVds5iSQOoYAVBcWFX0w3X6CqxkgFpniCD/a5kJA=;
	b=k++8TzYjVFsuNcHSiZm4jX0MANvJ2u0ng2jUHS1f2BLzA07w+U4oGnQhh44ZkV3CuC
	wlG6GgU05F2tLvF7KvE3q6SONF4cSYy0GwlRojZ0SMaLv55ZbCwqOENtvug9t3+DLWUP
	D4JR6MNpyZ+1tnFueLbX9eZcCX7W2MEkZlrgxjJLzluSO/7iMw8OLNq3aTvl+pnCYP/7
	kUTWnknfjSz2VWgHSrXT18CM4ieNwJ0PH7Sqk8P/GhumB2ofdGf9ZQf8PTcZzBjDMWDo
	5aQlOfE2+Y6Q4tdfM5uPIcJcSkM+b42TpH6+SPdSFSpz3IKsdAfzQkhcvLNWwgcivs9e
	CAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZKfzVds5iSQOoYAVBcWFX0w3X6CqxkgFpniCD/a5kJA=;
	b=P+NvURTDo+3+4gvblCoexafhh/ANsMRSIghKG8nsMzav8cR8ThHjl0PHq0kuPUy+P1
	zzbX9hMZJHdD4mZI7pqOHauRpMVccKoMdH4KRREL+u3WcgE8vq+22NN3BreZZ3fWJ1gG
	rFgI46QxHk3f99JsxHzvlofDT8ftW9n4QcppdZJsnN/wobuNj5oUzd4awJpJdaTvqjEu
	7xweTSRla+/07UGYJNXgNJ2CMC5v93LfHJ96Zpq+FVkbBF8fYaJtCMEko9WRydSzbdCp
	iwbACDdb7ZATn4sAE1JLhle0tFCEQ/3dBKxsNI5FPFxS9YlZv71AYypBf7nbblKnS7WG
	LmPw==
X-Gm-Message-State: AIVw112bvQH3+JSkgVMB9ivmVjejXvhLhjUFjO/25kZBwcwGcdNDgWRE
	fjMBCCdcuq1UdMH/
X-Received: by 10.84.233.131 with SMTP id l3mr29093796plk.298.1499351628019;
	Thu, 06 Jul 2017 07:33:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:10 -0700
Message-Id: <d9650572dc46b76450c6e811ed0df22a5b305f0c.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 09/22] security_flags.inc: Do not build gcc for powerpc with PIE defaults
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:46 -0000

Since we have disabled FPIE from SECURITY_CFLAGS already, we have
to ensure the same with gcc, otherwise gcc (on-device) will be built
defaulting to PIE, and such binaries will fail to execute

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index dd713b9818..ab2062b78f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -29,6 +29,7 @@ SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
+GCCPIE_powerpc = ""
 
 # arm specific security flag issues
 SECURITY_CFLAGS_pn-glibc = ""
-- 
2.13.2


