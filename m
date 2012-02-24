Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S10CV-00087f-AL
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:49:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 63436315952F;
	Fri, 24 Feb 2012 19:40:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pWp96wFMn3LS; Fri, 24 Feb 2012 19:40:32 +0100 (CET)
Received: from [172.22.22.61] (drms-590c477b.pool.mediaWays.net [89.12.71.123])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 67FE63159516;
	Fri, 24 Feb 2012 19:40:32 +0100 (CET)
Message-ID: <4F47D99F.6040003@opendreambox.org>
Date: Fri, 24 Feb 2012 19:40:31 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F34729A.3020402@opendreambox.org>
	<4F47D6C6.6020507@linux.intel.com>
In-Reply-To: <4F47D6C6.6020507@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH/RFC] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 18:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.02.2012 19:28, Saul Wold wrote:
> On 02/09/2012 05:27 PM, Andreas Oberritter wrote:
>> * If 'x11' is not set in DISTRO_FEATURES, then skip all
>>    recipes using xorg-lib-common.inc instead of only those
>>    using libx11.inc.
>>
>> * One exception: pixman, which is not only used by xorg,
>>    but also by cairo.
>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>>   meta/recipes-graphics/xorg-lib/libx11.inc          |    5 -----
>>   meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    6 ++++++
>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc
>> b/meta/recipes-graphics/xorg-lib/libx11.inc
>> index 748a48c..9057edc 100644
>> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
>> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
>> @@ -49,8 +49,3 @@ do_compile_prepend() {
>>   # Multiple libx11 derivatives from from this file and are selected
>> by virtual/libx11
>>   # A world build should only build the correct version, not all of them.
>>   EXCLUDE_FROM_WORLD = "1"
>> -
>> -python () {
>> -       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True,
>> False, d):
>> -             raise bb.parse.SkipPackage("X11 not enabled for this
>> DISTRO")
>> -}
>> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
>> b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
>> index d106054..3d5d378 100644
>> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
>> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
>> @@ -14,3 +14,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>>   inherit autotools pkgconfig
>>
>>   EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no
>> --without-xmlto"
>> +
>> +python () {
>> +        whitelist = [ "pixman" ]
>> +        if not d.getVar('BPN', True) in whitelist and not
>> oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
>> +                raise bb.parse.SkipPackage("X11 not enabled for this
>> DISTRO")
>> +}
> 
> Merged into OE-core
> 
> Thanks
>     Sau!

Thanks! You've missed v2, though. See below for an incremental patch.

Regards,
Andreas

From ec3b779fdca465afade0f56140ab85ac4bfc9e61 Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 10 Feb 2012 02:10:15 +0100
Subject: [PATCH] xorg-lib: don't build libs unless requested by
 DISTRO_FEATURES (fix up)

* Improve error message as suggested by Koen.
  (This got lost when v1 was committed instead of v2)

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 3d5d378..73a4d1d 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -18,5 +18,5 @@ EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
 python () {
         whitelist = [ "pixman" ]
         if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
-                raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
+                raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
 }
-- 
1.7.5.4



