Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id AEC90701E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 19:02:31 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 558D3F811E2; Fri, 25 Jul 2014 13:02:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2D84BF811DC;
	Fri, 25 Jul 2014 13:02:30 -0600 (MDT)
Message-ID: <53D2A9CD.9080205@mlbassoc.com>
Date: Fri, 25 Jul 2014 13:02:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1406085105.git.hongxu.jia@windriver.com>	<d36bfea1e3c7402098ff8913d473900c8b11eb71.1406085105.git.hongxu.jia@windriver.com>	<53D2930C.8090709@mlbassoc.com>
	<1406313325.27697.42.camel@ted>
In-Reply-To: <1406313325.27697.42.camel@ted>
Subject: Re: [PATCH 1/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 25 Jul 2014 19:02:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-25 12:35, Richard Purdie wrote:
> On Fri, 2014-07-25 at 11:25 -0600, Gary Thomas wrote:
>> On 2014-07-22 21:33, Hongxu Jia wrote:
>>> When adding patches or config files from bbappend files, it requires
>>> the use of FILESEXTRAPATHS, which has been an issue and failure point
>>> for people starting to work with bitbake and oe-core.
>>>
>>> We add checking to standardize how to use FILESEXTRAPATHS. Only the
>>> format of:
>>>     FILESEXTRAPATHS_append := ":${THISDIR}/Your_Files_Path" or
>>>     FILESEXTRAPATHS_prepend := "${THISDIR}/Your_Files_Path:"
>>> is acceptable.
>>>
>>> [YOCTO #5412]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>    meta/classes/insane.bbclass | 13 +++++++++++++
>>>    meta/classes/utils.bbclass  |  2 ++
>>>    meta/conf/bitbake.conf      |  2 ++
>>>    3 files changed, 17 insertions(+)
>>>
>>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>>> index b26216e..6b1c9ad 100644
>>> --- a/meta/classes/insane.bbclass
>>> +++ b/meta/classes/insane.bbclass
>>> @@ -1022,6 +1022,19 @@ python () {
>>>        # Check various variables
>>>        ###########################################################################
>>>
>>> +    # Checking ${FILESEXTRAPATHS}
>>> +    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
>>> +    if '__default' not in extrapaths.split(":"):
>>> +        msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
>>> +        msg += "type of assignment, and don't forget the colon.\n"
>>> +        msg += "Please assign it with the format of:\n"
>>> +        msg += "  FILESEXTRAPATHS_append := \":${THISDIR}/Your_Files_Path\" or\n"
>>> +        msg += "  FILESEXTRAPATHS_prepend := \"${THISDIR}/Your_Files_Path:\"\n"
>>> +        msg += "in your bbappend file\n\n"
>>> +        msg += "Your incorrect assignment is:\n"
>>> +        msg += "%s\n" % extrapaths
>>> +        bb.fatal(msg)
>>
>> It sure would have been nice (even polite?) to make this a warning when first
>> added.  As is, it's going to break a lot of builds and it will be very tedious
>> to fix since the parser will die on the first one it finds :-(
>
> Agreed, I'll change this to a warning.

Thanks :-)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

