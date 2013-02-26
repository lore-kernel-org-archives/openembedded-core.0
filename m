Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UAIgD-00046y-V4
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 12:27:13 +0100
Message-ID: <512C981C.3090001@communistcode.co.uk>
Date: Tue, 26 Feb 2013 11:10:20 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
	<512BF975.90206@linux.intel.com>
	<512C7F88.8030907@communistcode.co.uk>
	<969F26A8BAB325438E7EB80D3C3134FB162063D2@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB162063D2@IRSMSX102.ger.corp.intel.com>
Subject: Re: [PATCH V2] connman: enable connman client
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
X-List-Received-Date: Tue, 26 Feb 2013 11:27:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/13 10:38, Iorga, Cristian wrote:
> Hello all,
>
> So, what is the general agreement here?
>
> I placed connmanctl in the same package as connman because it is a very valuable tool, which should go in by default if connman is present also.
> It should not belong to connman-test, because it is used to control connman, not test it.
> If you want it to be in a connman-ctl package, just let me know and I will do the changes, re-test, and re-send the patch.

I think it is best to be defined as a separate package connman-client 
within the current connman recipe. My reasoning for this is that connman 
is widely used as an embedded network manager and its main interface is 
dbus rather than the 'helper' program connmanctl.

>
> Regards,
> Cristian
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Jack Mitchell
> Sent: Tuesday, February 26, 2013 11:25 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH V2] connman: enable connman client
>
> On 25/02/13 23:53, Saul Wold wrote:
>> On 02/25/2013 12:51 AM, Iorga, Cristian wrote:
>>> Changes from V1:
>>>      - connman client is explicitly enabled
>>>      - ${B} is used instead of ${S} (in this specific case are the
>>> same, it will be changed later on)
>>>
>> Please add these to a proper commit message.
>>
>> Also, there was some discussion prior about putting the connmanctl in
>> a separate package, that does not seem to have happened here.
>>
>> It could go into the -tools packages that already exists or it's own
>> package connman-ctl?
>>
>> I know Jack M. mentioned looking into this also, so let's be sure to
>> coordinate this.
> Yes, that was my suggestion. I'm blocked at the moment by a binutils failure I can't shift, so currently unable to contribute. I would suggest putting it in a new connman-client package which is a 2 minute change and test.
>
>> Thanks
>>      Sau!
>>
>>> I know Jack M. mentioned looking into this also, so let's be sure to
>>> coordinate this. -----Original Message-----
>>> From: Iorga, Cristian
>>> Sent: Monday, February 25, 2013 10:49 AM
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Iorga, Cristian
>>> Subject: [PATCH V2] connman: enable connman client
>>>
>>> connmanctl is now included when connman is installed
>>>
>>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>>> ---
>>>    meta/recipes-connectivity/connman/connman.inc |    5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>>> b/meta/recipes-connectivity/connman/connman.inc
>>> index b61e2af..b0ede60 100644
>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>> @@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>>>                ${@base_contains('DISTRO_FEATURES', '3g','ofono', '',
>>> d)} \
>>>                "
>>>
>>> -INC_PR = "r17"
>>> +INC_PR = "r18"
>>>
>>>    TIST = "--enable-tist"
>>>    TIST_powerpc = ""
>>> @@ -38,7 +38,7 @@ EXTRA_OECONF += "\
>>>        --enable-tools \
>>>        --enable-test \
>>>        --disable-polkit \
>>> -    --disable-client \
>>> +    --enable-client \
>>>        --enable-fake \
>>>        ${@base_contains('DISTRO_FEATURES', 'systemd',
>>> '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \  "
>>> @@ -73,6 +73,7 @@ do_install_append() {
>>>        install -d ${D}${bindir}
>>>        install -m 0755 ${S}/tools/*-test ${D}${bindir}
>>>        install -m 0755 ${S}/tools/wispr ${D}${bindir}
>>> +    install -m 0755 ${B}/client/connmanctl ${D}${bindir}
>>>
>>>        # We don't need to package an empty directory
>>>        rmdir ${D}${libdir}/connman/scripts
>>> --
>>> 1.7.10.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



