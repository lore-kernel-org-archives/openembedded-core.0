Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06F5065CD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:05:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8FD5DH8017405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Sep 2014 06:05:13 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 06:05:12 -0700
Message-ID: <5416E407.4050703@windriver.com>
Date: Mon, 15 Sep 2014 21:05:11 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1410247971.git.liezhi.yang@windriver.com>
	<b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
	<CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
In-Reply-To: <CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and enable libxml2-python
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
X-List-Received-Date: Mon, 15 Sep 2014 13:05:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/15/2014 06:43 AM, Burton, Ross wrote:
> On 9 September 2014 08:34, Robert Yang <liezhi.yang@windriver.com> wrote:
>> We have libxml2-python for native and nativesdk, but don't have it for
>> target, and can't find the reason from the git log, libxml2-python is
>> widely used, after looked into it's configure.in, we can enable it
>> easily.
>
> It seems like adding a PACKAGECONFIG for Python would be a good idea,
> we don't want to force target Python to be built.

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/libxml2

commit ff4a9f5118f39d82fe1bb7fcc7870ef01a9cdb0b
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Mon Sep 8 20:24:38 2014 -0700

     libxml2: fix python path and add libxml2-python

     We have libxml2-python for native and nativesdk, but don't have it for
     target, and can't find the reason from the git log, libxml2-python is
     widely used, after looked into it's configure.in, we can add it
     by PACKAGECONFIG.

     The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
     acted as work becase it's conigure can check automatically, python is in
     ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
     ${PYTHON}.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-core/libxml/libxml2.inc 
b/meta/recipes-core/libxml/libxml2.inc
index bcf9a62..4d11c2b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -36,15 +36,14 @@ do_configure_prepend () {
         sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
  }

-do_configure_prepend_class-nativesdk () {
-       # Ensure we get the correct site-packages path
-       export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
-}
+export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"

+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = 
"--with-python=${PYTHON},--without-python,python,python-core"
  # WARNING: zlib is require for RPM use
-EXTRA_OECONF = "--without-python --without-debug --without-legacy 
--with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python 
--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python 
--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog 
--without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF_class-native = "--with-python=${PYTHON} --without-legacy 
--without-docbook --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF_class-nativesdk = "--with-python=${PYTHON} --without-legacy 
--without-docbook --with-c14n --without-lzma --with-zlib"
  EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy 
--with-docbook --with-c14n --without-lzma --with-zlib"

  # required for pythong binding

// Robert

>
> Ross
>
>

