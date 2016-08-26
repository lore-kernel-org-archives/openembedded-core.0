Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B00FE731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 09:40:56 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7Q9evFw020882; Fri, 26 Aug 2016 04:40:57 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016082604405759-200268 ;
	Fri, 26 Aug 2016 04:40:57 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <066B71BA-5F46-44D5-B23F-8077F6848E2B@gmail.com>
References: <20160824122236.26445-1-adrian.ratiu@ni.com>
	<066B71BA-5F46-44D5-B23F-8077F6848E2B@gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Fri, 26 Aug 2016 12:39:39 +0300
Message-ID: <87lgzjdg2s.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/26/2016 04:40:57 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/26/2016 04:40:57 AM,
	Serialize complete at 08/26/2016 04:40:57 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-26_06:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: package carl9170 separately
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
X-List-Received-Date: Fri, 26 Aug 2016 09:40:58 -0000
Content-Type: text/plain

On Wed, 24 Aug 2016, Khem Raj <raj.khem@gmail.com> wrote:
> [ Unknown signature status ]
>
>> On Aug 24, 2016, at 5:22 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>> 
>> carl9170 is an atheros-based firmware, the succesor of ar9170 which is
>> deprecated and its driver (ar9170) was removed from the kernel tree.
>> carl9170 comes both as a binary blob and also with free sources; the
>> sources are deleted in linux-firmware.bb to avoid depeding on bash/etc.
>> 
>> Package the carl9170 binary firmware separately because it is needed
>> by various usb dongles and installing whole linux-firmware is overkill.
>
> while you are at it. Can you also scrutinize the license needs for this firmware ?
> should it require packaging a license file explicitly into rootfs or some such

The carl9170 firmware license is GPLv2, sources are also included in the
linux-firmware tree besides the binary. I don't think we need to do
anything special for it.

>
>> 
>> Also we should keep ar9170 as is because OOT drivers might still use it.
>> 
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>> meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> index 948dfa8..1657445 100644
>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>> @@ -226,7 +226,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>              ${PN}-vt6656-license ${PN}-vt6656 \
>>              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
>>              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm4354 \
>> -             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
>> +             ${PN}-atheros-license ${PN}-ar9170 ${PN}-carl9170 ${PN}-ath6k ${PN}-ath9k \
>>              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
>>              \
>>              ${PN}-iwlwifi-license ${PN}-iwlwifi \
>> @@ -255,6 +255,9 @@ FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
>> FILES_${PN}-ar9170 = " \
>>   /lib/firmware/ar9170*.fw \
>> "
>> +FILES_${PN}-carl9170 = " \
>> +  /lib/firmware/carl9170*.fw \
>> +"
>> FILES_${PN}-ath6k = " \
>>   /lib/firmware/ath6k \
>> "
>> @@ -266,6 +269,7 @@ FILES_${PN}-ath9k = " \
>> "
>> 
>> RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
>> +RDEPENDS_${PN}-carl9170 += "${PN}-atheros-license"
>> RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
>> RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
>> 
>> --
>> 2.9.3
>> 
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

