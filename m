Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-09.prod.phx3.secureserver.net
	(p3plsmtpa12-09.prod.phx3.secureserver.net [68.178.252.238])
	by mail.openembedded.org (Postfix) with ESMTP id 0449F65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 00:03:41 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-09.prod.phx3.secureserver.net with 
	id E03c1p0010BVjqb0103cQx; Mon, 10 Nov 2014 17:03:38 -0700
Message-ID: <54615257.30903@pabigot.com>
Date: Mon, 10 Nov 2014 18:03:35 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1415647839.git.pab@pabigot.com>
	<18b73e0cfd55891ca28f46e17ce4af9ca1535245.1415647839.git.pab@pabigot.com>
	<20141110232028.GE2440@jama>
In-Reply-To: <20141110232028.GE2440@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 06/14] pulseaudio: switch to virtual/bluez
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
X-List-Received-Date: Tue, 11 Nov 2014 00:03:43 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2014 05:20 PM, Martin Jansa wrote:
> On Mon, Nov 10, 2014 at 03:13:03PM -0600, Peter A. Bigot wrote:
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
>> ---
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> index db144a9..f06b15c 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> @@ -31,7 +31,7 @@ EXTRA_OECONF = "\
>>                   ac_cv_header_valgrind_memcheck_h=no \
>>   "
>>   
>> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez', '', d)} \
> This has to be wrong.

Indeed.  Make that:

-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 
'bluez4', '', d)} \
+BLUEZ = "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual/bluez', 
'bluez5', 'bluez5', 'bluez4', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 
'${BLUEZ}', '', d)} \

Branch updated.  Thanks.

Peter
>
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> -- 
>> 1.8.5.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


