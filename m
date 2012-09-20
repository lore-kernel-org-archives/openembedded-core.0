Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TElTY-00078E-LA
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 20:27:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2012 11:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,455,1344236400"; d="scan'208";a="195140560"
Received: from unknown (HELO [10.252.121.243]) ([10.252.121.243])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2012 11:15:03 -0700
Message-ID: <505B5D26.5@intel.com>
Date: Thu, 20 Sep 2012 21:15:02 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
	<CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
	<CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
In-Reply-To: <CALbNGRST8C-p=M5V8KoVe5ug1MXwp5=7z2rUubEg_MxeR776Kw@mail.gmail.com>
Subject: Re: [RFC 0/7] Postinstall improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 18:27:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit



On 09/20/2012 07:12 PM, Andreas Müller wrote:
> On Thu, Sep 20, 2012 at 5:38 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>> On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>>
>>>
>>> On 09/19/2012 04:41 PM, Andreas Müller wrote:
>>>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
>>>> <laurentiu.palcu@intel.com> wrote:
>>>>> Hi,
>>>>>
>>>>> It's been quite a long time since I sent the first version of postinstall
>>>>> improvements which, after some debate, we decided it needed run-once
>>>>> support of postinst scriptlets on host. This patcheset (RFC actually) adds
>>>>> that.
>>>>>
>>>>> So, in order to achieve this goal I took advantage of
>>>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some postinst
>>>>> scriptlets is time consuming (even on host) and execute repeatedly,
>>>>> then we can postpone the running and run the scriplet just once. The idea is
>>>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory. When the
>>>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the scripts in
>>>>> this directory and execute them.
>>>>>
>>>>> This actual patchset does the above for the gtk icon cache generation which
>>>>> takes a very long time to run on target and even on some hosts.
>>>>>
>>>>> The people willing to give this patchset a test, are most than welcome. Also,
>>>>> please feel free to review.
>>>>>
>>>>> Thanks,
>>>>> Laurentiu
>>>>>
>>>> Thanks for taking care. I will give it a test tonight and hope to have
>>>> results tomorrow.
>>> It would be great if you could give it a try and let me know your results.
>>>
>> I removed gtk-native append in meta-oe, build from scratch and tested
Any special reason you removed it?

>> the image. No issues so far - seems you have done a great job -
>> Thanks!
>>
> Aargh I really would like to consider this done but I found suspicious
> when browsing on the machine with the new image (hicolor- and
> gnome-icon-theme installed):
Let's hope we'll have it done soon. Thanks a lot for testing it. Can you
instruct me what image did you use and give some more details in order
to debug it on my side?

> 
> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
> * /usr/share/icons/hicolor/icon-theme.cache is there but it has the
> date of 01.01.2000 (have no rtc backup on the machine). I would expect
> this file to have build host's date.
> 
> So I checked the contents on the build machine in image's rootfs:
> 
> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
That's weird... You could add some debug info in the intercept script
itself to see if it really scans the gnome directory and if there are
any errors.

> * /usr/share/icons/hicolor/icon-theme.cache is there but has only
> 64,5KB (the version on the machine is 2,3MB!!).
On my build machine (I used Sato image) the icon-theme.cache has 2.5MB.
There must be something wrong somewhere... At least this directory
should have been cached properly.

If you give all the details I asked above, I'll give it a try myself.
> 
> 
> Andreas
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


