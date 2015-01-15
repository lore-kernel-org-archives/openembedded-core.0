Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D379D72207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:41:14 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id z107so12224540qgd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pP/tBcovdEp3p66LvefHqb0uKytVz10i03b0iGJs4t8=;
	b=Lp0BoQPwqDTqb7p0p565CDRcrsDLqmgxybnyTvESJ4HdiJytnKFamXFbwD2fH34CuL
	EmoIUHxVSyy4ExHcuU0/M8dLJXmR3Ve1TNjnpevGLeYJe27ERBtVwOYh+Y9Mr6ja0cw6
	BduN+hD2FulQEjknrTMeKBddTx1Tjhptq0HytI0Xj/hB/khqEh4iCIjaJzzFrj1bhB1q
	7R08iHktRhaR5TgYTlL63ElRTKleHg1GFqK+obdmMj+qU5kJK2kjF4QGPQEGU3+KGiO9
	DpQGNDB5n4GuYlhdWDLpZVwfliR9qJezfelK8nWt0Yh9GZw8u2pHDbtpBAQQamNOV/XI
	R4cQ==
MIME-Version: 1.0
X-Received: by 10.140.96.195 with SMTP id k61mr15783325qge.104.1421336474867; 
	Thu, 15 Jan 2015 07:41:14 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Thu, 15 Jan 2015 07:41:14 -0800 (PST)
In-Reply-To: <54B7D574.9030606@linux.intel.com>
References: <CACS+7ZQe+N6mWE8uPR2nmE8dcEtFjmzH8NfGfX_iVVgsp8y6eQ@mail.gmail.com>
	<54B7D574.9030606@linux.intel.com>
Date: Thu, 15 Jan 2015 09:41:14 -0600
Message-ID: <CACS+7ZTzADHseekU1d46B_iNM_dQCJwC008oxdR04rXh8Go8Jg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 15 Jan 2015 15:41:23 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Force dpkg to use "tar" on the target.

The dpkg configure script looks for gnutar, gtar, and
tar in order. If it finds gnutar or gtar on the host
it expects to use that as its tar program on the target.
Without this, if gtar exists (as it does on my system) then
dpkg will consistently fail on the target with an error about
gtar not being found.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
b/meta/recipes-devtools/dpkg/dpkg.inc
index c3c51eb..11d0eea 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -36,6 +36,8 @@ EXTRA_OECONF = "\
  --without-selinux \
  "

+EXTRA_OECONF_append_class-target = " TAR=tar"
+
 do_configure () {
     echo >> ${S}/m4/compiler.m4
     sed -i -e 's#PERL_LIBDIR=.*$#PERL_LIBDIR="${libdir}/perl"#' ${S}/configure
-- 
2.1.0

