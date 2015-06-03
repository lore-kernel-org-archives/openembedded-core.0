Return-Path: <sbabic@denx.de>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jun 2015 09:51:54 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id CCFDA60024
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:51:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3m1ldc1CnBz3hj3K
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:42:28 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	by mail.mnet-online.de (Postfix) with ESMTP id 3m1ldc0DDPzvjDd
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:42:27 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id B49C24540854
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:42:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id RfVOvZ2SkDI9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:42:21 +0200 (CEST)
Received: from [192.168.178.20] (papero.fritz.box [192.168.178.20])
	by babic.homelinux.org (Postfix) with ESMTP id 84B784540155
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:42:21 +0200 (CEST)
Message-ID: <556ECBFD.5020203@denx.de>
Date: Wed, 03 Jun 2015 11:42:21 +0200
From: Stefano Babic <sbabic@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: ICU not working on powerpc (ppce500v2)
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
X-List-Received-Date: Wed, 03 Jun 2015 09:51:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I get an issue with icu (54.1, I am testing with Yocto-fido) on powepc
(I am testing with a p2020rdb from Freescale). Running icuinfo on target
I get:

 <icuSystemParams type="icu4c">
    <param name="copyright"> Copyright (C) 2014, International Business
Machines Corporation and others. All Rights Reserved. </param>
    <param name="product">icu4c</param>
    <param name="product.full">International Components for Unicode for
C/C++</param>
    <param name="version">54.1</param>
    <param name="version.unicode">7.0</param>
    <param name="platform.number">4000</param>
    <param name="platform.type">Linux</param>
    <param name="locale.default">en_US_POSIX</param>
    <param name="locale.default.bcp47">en-US-u-va-posix</param>
    <param name="converter.default">US-ASCII</param>
    <param name="icudata.name">icudt54b</param>
    <param name="icudata.path"></param>
  <!-- n="cldr.version" ERROR: U_MISSING_RESOURCE_ERROR -->
  <!-- n="tz.version" ERROR: U_MISSING_RESOURCE_ERROR -->
    <param name="tz.default">Universal</param>
    <param name="cpu.bits">32</param>
    <param name="cpu.big_endian">1</param>
    <param name="os.wchar_width">4</param>
    <param name="os.charset_family">0</param>
    <param name="os.host">powerpc-unknown-linux-gnuspe</param>
    <param name="build.build">x86_64-pc-linux-gnu</param>
    <param name="build.cc">powerpc-linux-gnuspe-gcc -m32 -mcpu=8548
-mabi=spe -mspe -mfloat-gprs=double
--sysroot=/opt/work/sbabic/eldk/p2020rdb/tmp/sysroots/generic-powerpc-e500v2</param>
    <param name="build.cxx">powerpc-linux-gnuspe-g++ -m32 -mcpu=8548
-mabi=spe -mspe -mfloat-gprs=double
--sysroot=/opt/work/sbabic/eldk/p2020rdb/tmp/sysroots/generic-powerpc-e500v2</param>
    <param name="uconfig.internal_digitlist">1</param>
    <param name="uconfig.have_parseallinput">1</param>
    <param name="uconfig.format_fastpaths_49">1</param>
 </icuSystemParams>


ICU Initialization returned: U_INVALID_FORMAT_ERROR
Plugin file is: /usr/lib/icu/icuplugins54.txt

cldr.version and tz.version report errors and even simple tests do not
work. If I copy all .res files (icu54 directory) and then I set ICU_DATA
to that directory, it works - that means there should be an issue by
generating libicudata with PowerPc, or at least with e500v2.

I did exactly the same tests with an ARM platform (i.MX6), everything
works as expected. I suspect some issue due to endianess, but checking
the header in the libicudata it looks correct ( at least the first bytes).

I saw :

commit f5205c568cb0d29059c4d8c2dc200e435787f5d8
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sat Feb 15 22:04:05 2014 +0000

    icu: Disable the default LDFLAGSICUDT for target compile


and, as it looks like ARM related, I have already tried to revert it,
without any success. Does anyone have a hint ?

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

