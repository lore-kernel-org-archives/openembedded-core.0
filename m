Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD356B6C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 14:58:06 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VKUoy-00057C-AR from Muhammad_Shakeel@mentor.com ;
	Fri, 13 Sep 2013 07:58:08 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 13 Sep 2013 07:58:08 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Fri, 13 Sep 2013 15:58:06 +0100
Message-ID: <52332851.4020009@mentor.com>
Date: Fri, 13 Sep 2013 19:59:29 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
References: <1379073002-19032-1-git-send-email-muhammad_shakeel@mentor.com>
	<52330B60.6000008@linux.intel.com>
In-Reply-To: <52330B60.6000008@linux.intel.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 13 Sep 2013 14:58:08.0315 (UTC)
	FILETIME=[A87290B0:01CEB091]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Fix EXTRA_OECONF
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
X-List-Received-Date: Fri, 13 Sep 2013 14:58:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2013 05:56 PM, Jukka Rissanen wrote:
> Hi Muhammad,
>
> On 13.09.2013 14:50, Shakeel, Muhammad wrote:
>> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>
>> - --enable-threads and --enable-fake are obsolete, unrecognized options
>> now.
>> - --enable-bluetooth,wifi,ofono just build these technologies as plugins
>> and these plugins need to be installed explicitly. Our intention here
>> is to make these technologies available by default, if enabled. For
>> this we need --enable-bluetooth,wifi,ofono=builtin.
>> - If bluetooth is getting disabled then disable dundee as well, which
>> is enabled by default.
>>
>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc |    8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc 
>> b/meta/recipes-connectivity/connman/connman.inc
>> index 37ce3ec..71ecce2 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -21,14 +21,12 @@ EXTRA_OECONF += "\
>>       ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
>>       ac_cv_path_PPPD=${sbindir}/pppd \
>>       --enable-debug \
>> -    --enable-threads \
>>       --enable-loopback \
>>       --enable-ethernet \
>>       --enable-tools \
>>       --enable-test \
>>       --disable-polkit \
>>       --enable-client \
>> -    --enable-fake \
>
> Ack to this part, those options can be removed.
>
>>       ${@base_contains('DISTRO_FEATURES', 'systemd', 
>> '--with-systemdunitdir=${systemd_unitdir}/system/', 
>> '--with-systemdunitdir=', d)} \
>>   "
>>
>> @@ -42,9 +40,9 @@ PACKAGECONFIG ??= "wispr \
>>   # local.conf or distro config
>>   # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
>>
>> -PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>> -PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, 
>> bluez4"
>> -PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>> +PACKAGECONFIG[wifi] = "--enable-wifi=builtin, --disable-wifi, 
>> wpa-supplicant"
>> +PACKAGECONFIG[bluetooth] = "--enable-bluetooth=builtin, 
>> --disable-bluetooth --disable-dundee, bluez4"
>> +PACKAGECONFIG[3g] = "--enable-ofono=builtin, --disable-ofono, ofono"
>
> There is no need to say builtin here as that is the default and those 
> plugins are always builtin anyways.
>
Hi Jukka,
I did this change because I was trying to enable wifi, bluetooth and 
ofono through connman and I was getting this (for all these options):
connmanctl> enable ofono
Error ofono: Method "SetProperty" with signature "sv" on interface 
"net.connman.Technology" doesn't exist

I shared this on connman channel and what I got from there was:
"connman plugins have not been installed. if you do --enable-bluetooth, 
bluetooth functionality is built as plugins and these plugins need to be 
installed. if you do --enable-bluetooth=builtin, the functionality is 
built into connman. if you specify nothing (as there is no reason to 
specify anything anyway), the functionality will be built into connman"

and --enable-*=builtin worked for me. So either we should not mention 
anything or we have to use builtin otherwise (seems more intuitive). Do 
you think it should have worked without builtin and it was something 
else which was incorrect? has anyone else seen this error?

> About the dundee disabling, it would probably be better to have this 
> check in upstream connman. This would mean that if bluetooth is 
> disabled, then dundee would be automatically disabled (tweak 
> Makefile.plugins in ConnMan).
> Could you send patch for this to connman ml?
>
yes, I can do this but we need it for at least this version of connman.
>
>>   PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>>   PACKAGECONFIG[openvpn] = "--enable-openvpn 
>> --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
>>   PACKAGECONFIG[vpnc] = "--enable-vpnc 
>> --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
>>
>
>
> Cheers,
> Jukka
>


