Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGm-0000sx-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:39 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so5676758pbc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=gFJkh3nYH+tx927zQh3eK3tPCMLbS1Lq55kRICYIfKI=;
	b=LqMjKwcIa3UJAHWome9VBeP18jvgm43OLBq0jbspPeROOiF7Stc70C8qqfBpG+/VB+
	NXjQyMuuOPjKtJImnOTg5xr/eJo/28J8fMTq+eUBWLrjdbz+rxTHCJTQm/zvJ7L3NLaQ
	w0nL+KdMD/7Jo2BfOI70ssH4s/AIb8wdhKjhlm03mQ1gqcFqQ2vm7XEuIyht9R0r5Kzr
	EOCL7EHMMMRU2LTlYlUnEfPD8yBLiKqB2uorGMD6Ha5GY6dIRXPyu8Q7USkeKZfE8uIH
	xua40ZCzFnNDNw/pDHNY+KiE7bcrJM9TlirMzOUywTa5Qbz7LZNA7cnrq1olt/VrDD5u
	znyw==
X-Received: by 10.66.74.197 with SMTP id w5mr7969314pav.60.1359061679845;
	Thu, 24 Jan 2013 13:07:59 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.58
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:32 -0800
Message-Id: <fa5f9321c7e2c65b6af75cef2b777d5c94554de5.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 11/11] gawk: Add missing dependency on readline
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 21:23:42 -0000

building from shared state often ends up with

|
/b/kraj/angstrom/build/tmp-angstrom_next-uclibc/work/i586-angstrom-linux-uclibc/gawk/4.0.1-r1/gawk-4
.0.1/debug.c:4135: undefined reference to `rl_reset_terminal'
|
/b/kraj/angstrom/build/tmp-angstrom_next-uclibc/work/i586-angstrom-linux-uclibc/gawk/4.0.1-r1/gawk-4
.0.1/debug.c:4138: undefined reference to `rl_get_screen_size'
| debug.o: In function `unserialize':

Adding the missing readline dependency to fix such cases
where readline has not been populated in sysroot via some
other dependency and gawk would then use it or bail out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gawk/gawk_4.0.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_4.0.1.bb b/meta/recipes-extended/gawk/gawk_4.0.1.bb
index fcd7619..38ad25b 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.1.bb
@@ -9,6 +9,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+DEPENDS += "readline"
+
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
 PR = "r1"
-- 
1.7.9.5



