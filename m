Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Swc5U-00085q-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 18:48:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71GaGqF001533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 09:36:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.39) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 09:36:16 -0700
Message-ID: <50195AFF.1070507@windriver.com>
Date: Wed, 1 Aug 2012 11:36:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
In-Reply-To: <CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
Subject: Re: static busybox?
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
X-List-Received-Date: Wed, 01 Aug 2012 16:48:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/12 11:21 AM, Stuart Yoder wrote:
> On Tue, Jul 31, 2012 at 3:07 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>>>
>>>> We are doing some work with LXC (containers) and one of the templates
>>>> is for busybox.  For LXC, the busybox package needs to be built statically
>>>> and
>>>> there is a config option for this.
>>>>
>>>> A couple possible approaches:
>>>>
>>>>      -create a new 'busybox_static' recipe that the lxc package
>>>>       depends on that turns on the needed build options.   Pretty
>>>>       straightforward, but now there are 2 variants of the busybox
>>>>       package.
>>>>
>>>>      -somehow propagate some configuration options through to
>>>>       the standard busybox recipe so it turns on the config
>>>>       option to build things statically.   Not sure how to
>>>>       do this, and seems like it could get pretty messy.
>>>>
>>>> Any thoughts?
>>>
>>>
>>> We've been talking about this as well..  I'm currently of the opinion that
>>> the kernel's config fragement processing be added to busybox.  This way
>>> someone can simply add a configuration fragment via a bbappend, or other
>>> approach and it'll pick it up.   That same can be used to specify how to
>>> enable other optional pieces of busybox.
>>
>> merge_config.pl can be yanked out of the kernel source tree (it's upstream) and
>> packaged as something for use by busy box.
>>
>> I wouldn't recommend all the scaffolding that the kernel has (it's
>> overkill, since
>> there are more configs, patches and git manipulations in play for the
>> kernel), but a\
>> simple scheme to collect the fragments from the SRC_URI and fire them through
>> merge_config.pl would be a pretty simple python routine.
>
> So how would this work from the user's point of view?   I somehow
> need to get busybox's CONFIG_STATIC config option set.   Does the lxc
> recipe somehow
> specify this?   Or does the lxc recipe reference a busybox-static
> dependency that sets the option?

You would be able to add a .bbappend that would have a configuration fragment in 
it.  This fragment would be added to the busybox configuration to override any 
built in items.

So you'd need to simply have a file that says:

CONFIG_STATIC = y

--Mark

> Stuart
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



