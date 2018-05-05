Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF67B74D87
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o76so18609496pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EFX1ar+1wpkjGK2hy4+ZXhxFM6AEDNJXgrkAWgfIWOA=;
	b=VA4x5l3p3p9bYNNIvg8Rr3V3eOzoOkJ8W8bfCRFTH9Q0QF2Ms4PfuXbSxoON7S5/Mw
	F8RzeZDoYreO6O16DgN0t+RRB2xlSyYy9yUzWTVcnOHDYb0WdIGXLarvIG+T8FSysiZ1
	SrG2Syy2C4H0O+GsnMAlqWlp/JSobcaf7xeysjTN8a5KnBvC/3smArahkMn+MCcuyauM
	bCMZIB2s3ox6FqlWWogMqMbKoDIbKkqSZjaWvuU6qD9NJ0pm+bvNI8YcbmyovxIZ6jFX
	Si7sSda9H1vtOOtMegL0D3hQoJvTsDP6KonHMvVgO8IZlXfiKIKCR593oT2lGrcPF2gr
	r78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EFX1ar+1wpkjGK2hy4+ZXhxFM6AEDNJXgrkAWgfIWOA=;
	b=LQ/THV6+XNQ2m7qV/Gy1aLqxAU35iAhV7NZQ6yUawoz1C1XlNwC7ucFueDlDKzmHqP
	bgPfBbfi1xdZGiXo+ebmZLbUvahcGKxCCqm2Bqaf9SCUDtphLIL6RM8wN9OOl84+k4GQ
	WVPuRiuAmwgZMMVbU/lZ9bSWUC/vYaW74/bHJqW+4fn6auNgFcZrFijkQmyjjsGyiIxY
	6d/TnU7lWhpoR1LLA8aakbyYSXGrmtoGKQV+QJVhud6c8f4m/XbfzyGjWLv+Hk0xANK1
	X454CHvim/3DntrR6autDGCVklMhxeIOPNO3oYIhiEB2T6qxt9ULzU+zL+Y9MCjoCZd/
	hlEw==
X-Gm-Message-State: ALQs6tDDRKxCNTD8untUCXGXaQ1FJXM9/AKsjYMF/pRZi0EZdWiW7yxC
	gi2HmfOpqBGqAj3Y89YZrRqL5g==
X-Google-Smtp-Source: AB8JxZpZ/i10/3vjzqQSFv6fwwCsQi0D6uBOmpSgowcQB1NryIGMuYtwnZltXHUmxW2hq8DsTC0htw==
X-Received: by 10.98.70.155 with SMTP id o27mr28515117pfi.124.1525479280202;
	Fri, 04 May 2018 17:14:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:09 -0700
Message-Id: <3e09e546b68d596525e691c9eb01e9d3e476634e.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 15/27] xinetd: Use libtirpc even on glibc
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
X-List-Received-Date: Sat, 05 May 2018 00:14:40 -0000

We dropped in-tree obsoleted rpc from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 1beb5456e1..6e43f5be6f 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/xinetd-org/xinetd"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
-DEPENDS = ""
-DEPENDS_append_libc-musl = " libtirpc "
+DEPENDS += "libtirpc"
 PR = "r2"
 
 # Blacklist a bogus tag in upstream check
@@ -42,8 +41,8 @@ EXTRA_OECONF="--disable-nls"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
-LDFLAGS_append_libc-musl = " -ltirpc "
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
 
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
-- 
2.17.0


