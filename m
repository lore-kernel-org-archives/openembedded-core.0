Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UVg8I-00082J-Mg
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:44:02 +0200
Message-ID: <517A5647.5000800@communistcode.co.uk>
Date: Fri, 26 Apr 2013 11:26:15 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1366970771-9959-1-git-send-email-ml@communistcode.co.uk>
	<20130426101627.GM5538@jama.dyndns-home.com>
In-Reply-To: <20130426101627.GM5538@jama.dyndns-home.com>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: make tist functionallity a PACKAGECONFIG option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 10:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/04/13 11:16, Martin Jansa wrote:
> On Fri, Apr 26, 2013 at 11:06:11AM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>
>> Runtime tested on beaglebone armv7a, with and without tist PACKAGECONFIG
>>
>>   meta/recipes-connectivity/connman/connman.inc | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
>> index 589ece8..eb9d145 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -20,10 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>>               ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>>               "
>>   
>> -INC_PR = "r19"
>> -
>> -TIST = "--enable-tist"
>> -TIST_powerpc = ""
>> +INC_PR = "r20"
>>   
>>   EXTRA_OECONF += "\
>>       ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
>> @@ -32,8 +29,8 @@ EXTRA_OECONF += "\
>>       --enable-threads \
>>       --enable-loopback \
>>       --enable-ethernet \
>> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
>> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
>> +    ${@base_contains('DISTRO_FEATURES', 'wifi', '--enable-wifi', '--disable-wifi', d)} \
>> +    ${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluetooth', '--disable-bluetooth', d)} \
>>       ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disable-ofono', d)} \
>>       --enable-tools \
>>       --enable-test \
>> @@ -43,6 +40,10 @@ EXTRA_OECONF += "\
>>       ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
>>   "
>>   
>> +PACKAGECONFIG ??= ""
>> +
>> +PACKAGECONFIG[tist] = "--enable-tist,,"
> would you mind to convert wifi, bluetooth and 3g also to PACKAGECONFIGs?
>
>> +
>>   INITSCRIPT_NAME = "connman"
>>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>>   
>> -- 
>> 1.8.2.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Something like:

PACKAGECONFIG ??= " \
${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)}\
                   "

PACKAGECONFIG[wifi] = "--enable-wifi,--disable-wifi,"


Or were you thinking of another method?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



