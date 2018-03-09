Return-Path: <kamensky@cisco.com>
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
	by mail.openembedded.org (Postfix) with ESMTP id 73E4A78953
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4166; q=dns/txt; s=iport;
	t=1520628956; x=1521838556;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=bDYrwCJCANCX28Rftsfr8Vti8UbmOCh+EcdPKz/gxik=;
	b=JxsBlpbo5E9MV4Z2aR4fhY6LtDA6Iq2dRzBK+cGG/ggjLhV4iG+l0mE0
	5TMK14FoIesZHaLZQiii5ym7+Rlqk49xG+zOlVqg5WtB5kOxMt3i+isa/
	XxDdvcMezEV700SWxmND+QKOSaZ7FjLVL8C/61oYgQSiyo16am15LpIqd I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AjAgCG9KJa/4cNJK1eGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQZm8ojmONA4FbKYEWlDSCFQofhQYCgxEhNhYBAgEBAQEBAQJ?=
	=?us-ascii?q?rJ4UjAQEBAwE4Aj8FCwsRAwECASMLTwgGE4URCK8siGOCGoU3gi6DcYJDNosMB?=
	=?us-ascii?q?I1xdotuCYZJjASENIhKiXmHJwIECwITAYEsJAExgVJNIxWCfQmCWoIGHzeLDAE?=
	=?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.47,447,1515456000"; d="scan'208";a="81781353"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 20:55:55 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w29Kts77012777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Mar 2018 20:55:54 GMT
Date: Fri, 9 Mar 2018 12:55:54 -0800 (PST)
From: Victor Kamensky <kamensky@cisco.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <6da3d33d-8c32-a49d-0b61-70b360232f12@linux.intel.com>
Message-ID: <alpine.LRH.2.00.1803091243390.27538@sjc-ads-6991.cisco.com>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
	<6da3d33d-8c32-a49d-0b61-70b360232f12@linux.intel.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/5] systemtap adding sysroot, cross compiling of user land related scripts
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
X-List-Received-Date: Fri, 09 Mar 2018 20:55:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hi Alex,

On Tue, 6 Mar 2018, Alexander Kanavin wrote:

> On 03/06/2018 07:50 PM, Victor Kamensky wrote:
>> I am a fan of SystemTap and big fan of OE. Systemtap and OE use case I have
>> on my mind is the following:
>
> Hello Victor,
>
> even though I'm listed as the maintainer of systemtap, I do not actually use 
> it or know anything about it - my responsibility ends with keeping it up to 
> date and fixing build errors.

Fair enough. It is understood.

> So I can't comment on the essence of these 
> patches. I do suggest however that you first get as many patches as possible 
> into the upstream, as carrying them in oe-core adds a significant maintenance 
> burden.

Yes, it is understood. I am actively working, as we speak,
with SystemTap folks on putting sysroot related patches into SystemTap.

> Also, if it's possible to merge systemtap-utils into the main systemtap 
> recipe (as a binary package),

I've set to write response why systemtap-utils is really
needed and ended up doing below :). Does it look acceptable
direction to you?

From 808fbe3c4b64c734258da08e92fb367a8a20939b Mon Sep 17 00:00:00 2001
From: Victor Kamensky <kamensky@cisco.com>
Date: Wed, 7 Mar 2018 18:33:33 -0800
Subject: [PATCH 08/11] systemtap: create translator packageconfig

For cases when systemap module compilation happens on host in
cross-compilation mode, and it is desirable to minimize systemtap
presense on target we need to have just smallest possible set of
utilties that are required to run compiled modules.

Introduce new "translator" PACKAGECONFIG, if it is not set
it would mean that just minimal set of run-time utilities will
be included in the package.

For run-time only systemtap build variant use
PACKAGECONFIG_pn-systemtap = "" or
PACKAGECONFIG_pn-systemtap = "monitor"

Suggested-by: Taras Kondratiuk <takondra@cisco.com>
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
  meta/recipes-kernel/systemtap/systemtap_git.bb | 15 +++++++++++----
  1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 475b207..b280f58 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://sourceware.org/systemtap/"

  require systemtap_git.inc

-DEPENDS = "boost elfutils"
-
-RDEPENDS_${PN} += "python3-core bash perl"
+DEPENDS = "elfutils"

  EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
              --without-nss --without-avahi --without-dyninst \
@@ -18,7 +16,8 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"

  EXTRA_OECONF += "${STAP_DOCS} "

-PACKAGECONFIG ??= "sqlite monitor python3-probes"
+PACKAGECONFIG ??= "translator sqlite monitor python3-probes"
+PACKAGECONFIG[translator] = "--enable-translator,--disable-translator,boost,python3-core bash perl"
  PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
  PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
  PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
@@ -26,4 +25,12 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,

  inherit autotools gettext pkgconfig distutils3-base

+do_install_append () {
+   if [ ! -f ${D}${bindir}/stap ]; then
+      # translator disabled case, need to leave only minimal runtime
+      rm -rf ${D}${datadir}/${PN}
+      rm ${D}${libexecdir}/${PN}/stap-env
+   fi
+}
+
  BBCLASSEXTEND = "nativesdk"
-- 
2.7.4

> and merge together crosstap and crosstap2,  please do that.

I added code into crosstap2 to provide backward compatible
crosstap legecy invocation interface. I plan to post new crosstap2 code
as total backward compatible replacement of crosstap with superseding 
functionality.

The only controvercial item left from my original ask is
IMAGE_GEN_COMBINED_DEBUGFS build option that is supposed to
build rootfs-dbg containing combined target and debug symbols.

Thanks,
Victor

> Alex
>

