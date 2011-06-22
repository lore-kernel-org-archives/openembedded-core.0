Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZO6c-00018l-D0
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 16:08:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5ME4w91019990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 07:04:58 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 07:04:58 -0700
Message-ID: <4E01F689.5020002@windriver.com>
Date: Wed, 22 Jun 2011 09:04:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E00CA30.7020302@windriver.com>	<1308682643.3083.18.camel@lenovo.internal.reciva.com>	<4E00ED2C.1040708@windriver.com>	<1308693935.20015.37.camel@rex>	<4E0117A5.4070400@windriver.com>
	<4E0174B4.3020207@windriver.com>
In-Reply-To: <4E0174B4.3020207@windriver.com>
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Wed, 22 Jun 2011 14:08:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/21/11 11:51 PM, Mark Hatle wrote:
> On 6/21/11 5:13 PM, Mark Hatle wrote:

...

> Any comments.  I'm not sure I like this task approach, simply because it's more
> complicated.  But what I am testing now enables umask of 022 in:
> 
> do_install
> do_package
> do_rootfs
> rootfs_<pkg>_do_rootfs
> do_populate_sysroot
> adt-installer_1.0.bb: do_deploy
> linux-tools.inc: do_install_perf
> 
> I think that covers everywhere it will be needed...

Results from my over night build.

Just setting do_install and do_package isn't enough.  A lot of packages appear
to unpack, patch, configure, compile, and then in do_install copy, while
preserving permissions, from the build directory.  This leads to a number of
files with 0664 and directories with 0775 permissions (when the users umask is 002.)

I can certainly expand this to do_configure and do_compile.  But I'm really
concerned this will quickly grow out of control and end up being very complex...
 (I will attempt to do this and see if I get better results.)

--Mark

> --Mark
> 
>> On 6/21/11 5:05 PM, Richard Purdie wrote:
>>> On Tue, 2011-06-21 at 14:12 -0500, Mark Hatle wrote:
>>>> On 6/21/11 1:57 PM, Phil Blundell wrote:
>>>>> On Tue, 2011-06-21 at 11:43 -0500, Mark Hatle wrote:
>>>>>> Adjust the umask to 022.  This resolves the problem of dynamically generated
>>>>>> directories (mkdir -p) and specific files (touch foo) having odd permissions.
>>>>>>
>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=d8470b6a8efdbba04cef5d4dc1ce12720fe83621
>>>>>
>>>>> Are you confident that this isn't going to break anything like
>>>>> group-shared DL_DIRs?  I'm not entirely thrilled about forcing the umask
>>>>> to 022 for everything that bitbake does, although I can see that making
>>>>> it be so for particular tasks like do_install() might have some merit.
>>>>> Even in the latter case, though, I wonder whether we should just be
>>>>> paying more attention to recipe hygiene and using "install -m ..." with
>>>>> the permissions that we actually want.
>>>>
>>>> This is why I bring this up.. I'm a bit concerned that doing it generally will
>>>> have unintended consequences.  So far I am not aware of any.  Moving it to a
>>>> different place in the process may be better.  The only issue I've found so far
>>>> is that just coding int into "do_install" really isn't an option.  Between the
>>>> custom do_install components, various classes, etc.. it's difficult in the
>>>> current infrastructure to find a centralized location to set the value.
>>>>
>>>> (I'd love to be corrected if someone things of another way of doing it.)  The
>>>> setting of the umask is a very low cost operation, so doing it for certain steps
>>>> shouldn't cause a performance penalty... but until we figure that out this is
>>>> the best and easiest solution I've come up with.
>>>
>>> How about a umask flag for tasks?
>>>
>>> If bitbake sees it for a given task it would set the umask as indicated
>>> for the task. Cheap and easy and would only impact do_install tasks...
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



