Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id ED8F877253
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 21:49:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sS6341Sd7z3hk9r;
	Sun,  4 Sep 2016 23:49:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sS6341Csrzvk8V;
	Sun,  4 Sep 2016 23:49:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id qxXrjFl80caQ; Sun,  4 Sep 2016 23:49:50 +0200 (CEST)
X-Auth-Info: MJKpedVL6ocMM+WSEIAWcIBhc2cN1pl9BYxSYznCn1c=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun,  4 Sep 2016 23:49:49 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
Date: Sun, 4 Sep 2016 23:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473024487.20226.3.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Sun, 04 Sep 2016 21:49:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/04/2016 11:28 PM, Richard Purdie wrote:
> On Sun, 2016-09-04 at 18:21 +0200, Marek Vasut wrote:
>> The u-boot recipes share a couple of common variables, which makes
>> updating of the recipes error prone and a toil. Factor those common
>> bits into u-boot-common.inc so that they are in one place.
>>
>> No functional change.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot-common.inc          | 16
>> ++++++++++++++++
>>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb | 16 ++--------
>> ------
>>  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb  | 17 ++--------
>> -------
>>  meta/recipes-bsp/u-boot/u-boot.inc                 | 10 ++--------
>>  meta/recipes-bsp/u-boot/u-boot_2016.03.bb          |  7 -------
>>  5 files changed, 22 insertions(+), 44 deletions(-)
>>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-common.inc
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
>> b/meta/recipes-bsp/u-boot/u-boot-common.inc
>> new file mode 100644
>> index 0000000..403e316
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
>> @@ -0,0 +1,16 @@
>> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
>> +SECTION = "bootloaders"
>> +
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM =
>> "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>> +
>> +# This revision corresponds to the tag "v2016.03"
>> +# We use the revision in order to avoid having to fetch it from the
>> +# repo during parse
>> +SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
>> +
>> +PV = "v2016.03+git${SRCPV}"
>> +
>> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>> +
>> +S = "${WORKDIR}/git"
> 
> Since the common file you're creating is 2016.03 version specific, I'd
> be tempted to call it u-boot-common_2016.03.inc and then its clear its
> version specific...

Yes, except when new version of U-Boot comes out and we want to perform
update of the u-boot{,mkimage,fw-utils} recipes, with this current patch
as is, we'd only have to rename these recipes and change the version in
u-boot-common.inc . With your proposal, we'd have to not only rename the
recipes and tweak u-boot-common.inc, but also edit their content and
change the "require u-boot-common_20yy.mm.inc" bit, which adds some toil.

-- 
Best regards,
Marek Vasut

