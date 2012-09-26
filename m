Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TGlwg-000600-Qw
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 09:22:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2012 00:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,488,1344236400"; d="scan'208";a="226861387"
Received: from unknown (HELO [10.252.122.30]) ([10.252.122.30])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2012 00:09:04 -0700
Message-ID: <5062AA0F.3050604@intel.com>
Date: Wed, 26 Sep 2012 10:09:03 +0300
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
X-List-Received-Date: Wed, 26 Sep 2012 07:22:11 -0000
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
>> the image. No issues so far - seems you have done a great job -
>> Thanks!
>>
> Aargh I really would like to consider this done but I found suspicious
> when browsing on the machine with the new image (hicolor- and
> gnome-icon-theme installed):
> 
> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
> * /usr/share/icons/hicolor/icon-theme.cache is there but it has the
> date of 01.01.2000 (have no rtc backup on the machine). I would expect
> this file to have build host's date.
> 
> So I checked the contents on the build machine in image's rootfs:
> 
> * in the folder /usr/share/icons/gnome *no* icon-theme.cache is found
> * /usr/share/icons/hicolor/icon-theme.cache is there but has only
> 64,5KB (the version on the machine is 2,3MB!!).
Did you have any chance to debug the issue on your setup? I tried to
replicate your environment but I failed. Lots of build errors, so I gave
up. It would have taken me more time to make your setup work than
debugging the real problem.

Another alternative would be for you to prepare a tarball with all the
repos and configs that you use and put it somewhere where I can take it.
It would be easier for me to directly start debugging your issue.

Thanks,
Laurentiu
> 
> 
> Andreas
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


