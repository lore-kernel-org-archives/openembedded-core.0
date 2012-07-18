Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrIl0-00079J-TQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 03:08:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 17:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123673665"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jul 2012 17:57:29 -0700
Message-ID: <500609F9.3040609@linux.intel.com>
Date: Tue, 17 Jul 2012 17:57:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <5005DFF1.3050304@linux.intel.com>
	<500602C8.6090805@linux.intel.com>
	<20120718003850.GF22569@jama.jama.net>
	<20120718005221.GG22569@jama.jama.net>
In-Reply-To: <20120718005221.GG22569@jama.jama.net>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"yocto-builds@yoctoproject.org" <yocto-builds@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: Glib-2.0 cross-compile issue Was: Master Failures
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
X-List-Received-Date: Wed, 18 Jul 2012 01:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 05:52 PM, Martin Jansa wrote:
> On Wed, Jul 18, 2012 at 02:38:50AM +0200, Martin Jansa wrote:
>> On Tue, Jul 17, 2012 at 05:26:48PM -0700, Saul Wold wrote:
>>> On 07/17/2012 02:58 PM, Saul Wold wrote:
>>>>
>>>> Folks,
>>>>
>>>> I am seeing a crop of failures on Master, this is not any failure I have
>>>> seen recently on any of my MUT builds. It appears to be 2 failures,
>>>> possibly related.
>>>
>>> Not related, I just confirmed this.
>>>
>>> The "ls: cannot access" are coming from license.bbclass, seems to be a
>>> timing issue related to the last patch here, not sure what triggered it
>>> here (I am not seeing it on other builds!)
>>>
>>> Paul's Change:
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=sgw%2Fstage&qt=grep&q=license
>>>
>>>>
>>>> First seems to be missing pkgdata/runtime files, followed by a failed
>>>> dependency by libglib-2.0-utils on the native python (from the native
>>>> sysroot).
>>>>
>>> This seems to be related to the glib update and package split out of the
>>> gdbus-codegen, looks like an auto tools substitution is happening for
>>> @PYTHON@ in the script and getting the native sysroot python.
>>
>> gdbus-codegen was in separate package before I've just moved package
>> definition from .bb to .inc.
>>
>> And buildhistory diff doesn't show anything weird:
>> http://git.shr-project.org/git/?p=buildhistory.git;a=commitdiff;h=00de88a123842b159de1d206e3d0d5775ed90a1e#patch2
>>
>> I don't see it here, but I'm not using RPM packaging with this check..
>>
>> Will try more tomorrow..
>
> It's probably caused by this
> http://permalink.gmane.org/gmane.comp.gnome.svn/604029
>
> which isn't very cross-compile friendly.. maybe we can just add patch
> reverting this change in 2.32.4?
>
Yup, that the change, I was just digging deeper, maybe just doing a sed 
in a configure_prepend to change it the $(PYTHON) -> "/usr/bin/env 
python" in the Makefile.am would be better

We have seen that kind of code before.

Sau!


> Cheers,
>
>>
>> Cheers,
>>
>>>
>>> Martin's 2 changes may need so work:
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=85a930188300152bc9a1bbf640a2441f3177e26f
>>>
>>> and
>>> http://git.openembedded.org/openembedded-core/commit/?id=b070eb22372ad1ef5b21162d832772e560184cf8
>>>
>>> Please look at the autobuild failures and see if they can help you fix
>>> these issues.
>>>
>>> Thanks
>>> 	Sau!
>>>
>>>> I am just starting to dig into it, but if anyone has better ideas:
>>>>
>>>> Thanks
>>>>       Sau!
>>>>
>>>>
>>>>> | ls: cannot access
>>>>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/pkgdata/*/runtime/dbus-1:
>>>>> No such file or directory

<snip>

>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>



