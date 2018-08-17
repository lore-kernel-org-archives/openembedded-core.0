Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3F97792CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 06:04:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b11-v6so3063977pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 23:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=urrflGDJ1dlKeOBWnzRIp+QJreVQDBAM8+vcVmA71+ZWzAHvjWBbX9fPWjS6fOcPkq
	sYvhLFZhvY8WxHTqP2s4z3j4o+LF+LqZKWuifq3M1uDKEJjCUTk/cdqfl7pnr/SPd/rs
	Vf8Ob8/JQgmjzNToTrgUCp1/0KqYkn3zyXVce2SFrmUkUqjVOINzpkdU5ZpEPc2lKcQx
	+GMGibW+FCyPiRU1kSkXBgaj3v1pnFiqISD5tfzYq6b0FL9a6xrfqlwL1gJHoS483HzI
	EIuJMM7xJP5fsDIRgmsFrZs7ZagXo1uhkddGxCz9CxjqkyiawbiGjyxnDVmBoErKUk4v
	+Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aRwH16y3FbAMWaCGvwYkkhLhkfCbhgR8G/jyQGSXQkg=;
	b=fMO8oKJXPGj4VbfQXXQPJ3m960HE+tsft1eszzORJFuPhJDFW2QEar9IfWkvuLIIAh
	KTHmLh0Z+rxTXBtcoWHwl2zuK+i30Qh0fZauR/ju+PeIcmSfs6ffgBeLM36+ROfOpexn
	zfDsmsiyetjzOotcshuCzkhmBm5vNhTSG724dKk+LPyqEDJ3uLSGISg27clF1x69/uzK
	Rl0ZD3HiqLkh1JprX2UVZr8RN9Y04vdIKYR/dY6X1EZHad6+ICroKPoMYpLFkxoQj3wX
	XgmrpxkXw2bkyCipXWZy8eIFV6y6Ipa4nqURJJnfFa1NEQyIyBlWzlIPqb4FT2DQYseO
	asUA==
X-Gm-Message-State: AOUpUlHZa88Q7Gh1/59OEZwpAWTh6Zwr4KvVyCQ7Cznb36maRbgU4BX1
	nhqBtZ0gH64ydxa90CvE+30qm7ZF
X-Google-Smtp-Source: AA+uWPz0Wjy3kkOWQkaM914EK+MVHMAj0iK+cEmuzzOw+JMKXoClehMTVGnnPQVYnd4rJqUhvh9gvQ==
X-Received: by 2002:a63:bc0a:: with SMTP id
	q10-v6mr4417705pge.60.1534485897553; 
	Thu, 16 Aug 2018 23:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm2036724pfj.72.2018.08.16.23.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 23:04:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 23:04:47 -0700
Message-Id: <20180817060447.23683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] powerpc: Remove pie flags from compiler cmdline
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
X-List-Received-Date: Fri, 17 Aug 2018 06:04:57 -0000

Original approach to add -no-<pie> flags cause link time behavior changes
where packages start to lose the -fPIC -DPIC in compiler cmdline and this
list keeps growing as we build more and more packages,

Instead lets just remove the options we dont need from SECURITY_CFLAGS
this makes it more robust and less intrusive

This also means we do not need to re-add pic options as we started to do
for affected packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 52e1e4ebc5..4e20a4d0f8 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,13 +28,10 @@ SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
-SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc_powerpc = ""
-SECURITY_CFLAGS_append_powerpc_pn-libdrm = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-libinput = " -fPIC -DPIC"
-SECURITY_CFLAGS_append_powerpc_pn-at-spi2-core = " -fPIC -DPIC"
 GCCPIE_powerpc = ""
 GLIBCPIE_powerpc = ""
+SECURITY_CFLAGS_remove_powerpc = "${SECURITY_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
-- 
2.18.0


