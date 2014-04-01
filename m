Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD9A6EA1C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:41:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s31Df29t000793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 06:41:02 -0700 (PDT)
Received: from [128.224.170.220] (128.224.170.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 06:41:01 -0700
Message-ID: <533AC1EF.7090600@windriver.com>
Date: Tue, 1 Apr 2014 16:41:03 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>	<1396349467.1432.4.camel@ted>	<969F26A8BAB325438E7EB80D3C3134FB1CE76D4F@IRSMSX105.ger.corp.intel.com>	<533AB0A2.1000608@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E2B@IRSMSX105.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E47@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1CE76E47@IRSMSX105.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 13:41:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 04:27 PM, Iorga, Cristian wrote:
> Hello,
> I meant, of course, BlueZ5, connman is ready for BlueZ5.
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Iorga, Cristian
> Sent: Tuesday, April 1, 2014 4:23 PM
> To: Sarbu, Florin-Ionut (Wind River)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
>
> Hmm,
>
> I am quite sure that connman is ready for BlueZ4 for some time.
> I am not sure about libpcap, to be honest, did not investigate that.
> Can you please provide some facts related to your statements?
Well, as far as I see it, these 2 packages (connman and libpcap) are 
aware only of bluez4 at the moment.
connman.inc has:

PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"

which will add a build dependency on bluez4.

And speaking of which, it seems that doing:

RDEPENDS_${PN} = "\
              dbus \
              ${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', 
'', d)} \

is superfluous as it may be achieved by changing the PACKAGECONFIG live 
above to something like:

PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, 
bluez4, bluez4"

to achieve the same thing.

Be it as it may, it looks like at this point, having bluetooth in 
DISTRO_FEATURES drags in bluez4 and no configurable way to use bluez5.

Florin
> Regards,
> Cristian
>
> -----Original Message-----
> From: Florin Sarbu [mailto:florin.sarbu@windriver.com]
> Sent: Tuesday, April 1, 2014 3:27 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org; Richard Purdie
> Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
>
> Please see inline.
>
> On 04/01/2014 02:23 PM, Iorga, Cristian wrote:
>> Hi all,
>>
>> I would also say that is an important change, with some possible unforeseen consequences.
>> The YP is in the stabilization phase for 1.6 release.
>> In my opinion, the support for and change to BlueZ (overall) should be postponed to 1.7.
>> Also, this not the proper solution, because, in the end, if BlueZ4 will still be around in 1.7 (which is not my intention, to be honest), this will be worked out with a Bluetooth stack provider (which can be BZ4 or, preferably, BZ5).
>>
>> I vote against this patch.
> The idea was that people could just have bluetooth in DISTRO_FEATURES and things would be unchanged, as in use bluez4 like now, and if somebody else wants bluez5, just add bluez5 to PACKAGECONFIG in some .bbappend's and not rely on the bluetooth DISTRO_FEATURE until bluez5 supersedes bluez4.
> At the moment, one cannot use bluez5 as connman and libpcap explicitly depend on bluez4.
>> Regards,
>> Cristian Iorga
>> YP
>> Intel Corporation
>>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Tuesday, April 1, 2014 1:51 PM
>> To: Sarbu, Florin-Ionut (Wind River)
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support
>> for bluez5
>>
>> On Tue, 2014-04-01 at 13:09 +0300, Florin Sarbu wrote:
>>> Currently connman can only RDEPEND on bluez4.
>>> This patch adds support for having bluez5 in PACKAGECONFIG and get
>>> connman RDEPEND on bluez5 if desired.
>>>
>>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>>> ---
>>>    meta/recipes-connectivity/connman/connman.inc | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>>> b/meta/recipes-connectivity/connman/connman.inc
>>> index b3147c9..53a6a4f 100644
>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>> @@ -32,7 +32,7 @@ EXTRA_OECONF += "\
>>>
>>>    PACKAGECONFIG ??= "wispr \
>>>                       ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
>>> -                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
>>> +                   ${@base_contains('DISTRO_FEATURES',
>>> + 'bluetooth','bluez4', '', d)} \
>>>                       ${@base_contains('DISTRO_FEATURES', '3g','3g',
>>> '', d)} \  "
>>>
>>> @@ -42,6 +42,7 @@ PACKAGECONFIG ??= "wispr \
>>>
>>>    PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>>>    PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
>> You renamed the option above but didn't here and hence broke bluez4.
>> This is not the quality of patch expected at -rc time for a release :(.
> Sorry, I overlooked the change in that one and the others remaining after that.
>> Cheers,
>>
>> Richard
>>
>>> +PACKAGECONFIG[bluez5] = "--enable-bluetooth, --disable-bluetooth, bluez5"
> Also, to not get it disable bluetooth when using bluez4, the above line should look something like:
>
> +PACKAGECONFIG[bluez5] = "--enable-bluetooth, , bluez5"
>
> Want me to send another patch or we just drop it and people just do what they need in their own .bbappend's in order to have bluez5 in?
>
> Thank you,
> Florin
>
>>>    PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>>>    PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>>>    PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
>>> @@ -114,6 +115,7 @@ RPROVIDES_${PN} = "\  RDEPENDS_${PN} = "\
>>>         dbus \
>>>         ${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '',
>>> d)} \
>>> +     ${@base_contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
>>>         ${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>>>         ${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>>>         xuser-account \
>>> --
>>> 1.9.1
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


