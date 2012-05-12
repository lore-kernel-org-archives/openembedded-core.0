Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ST8yH-0005qw-FW
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 11:50:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4C9ehKP019228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 02:40:43 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sat, 12 May 2012 02:40:43 -0700
Message-ID: <4FAE3019.5050503@windriver.com>
Date: Sat, 12 May 2012 17:40:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
	<23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
	<4FAA84B3.1080108@windriver.com>
	<6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
	<4FAA8A03.50309@windriver.com>
	<033DD718-AA9D-4F09-9E06-13C14DBBB7AC@dominion.thruhere.net>
	<4FAB2459.6070205@windriver.com> <4FAD445A.9030103@linux.intel.com>
In-Reply-To: <4FAD445A.9030103@linux.intel.com>
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Sat, 12 May 2012 09:50:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2012 12:54 AM, Saul Wold wrote:
> On 05/09/2012 07:13 PM, Robert Yang wrote:
>>
>>
>> On 05/09/2012 11:24 PM, Koen Kooi wrote:
>>>
>>> Op 9 mei 2012, om 17:15 heeft Mark Hatle het volgende geschreven:
>>>
>>>> On 5/9/12 10:01 AM, Koen Kooi wrote:
>>>>>
>>>>> Op 9 mei 2012, om 16:52 heeft Mark Hatle het volgende geschreven:
>>>>>
>>>>>> On 5/9/12 3:50 AM, Koen Kooi wrote:
>>>>>>>
>>>>>>> Op 9 mei 2012, om 10:20 heeft Robert Yang het volgende geschreven:
>>>>>>>
>>>>>>>> Don't remove rpmlib when INC_RPM_IMAGE_GEN=1, otherwise the
>>>>>>>> list_installed_packages would get nothing in the second build.
>>>>>>>
>>>>>>> What happens when I do a build, enable INC_RPM_IMAGE_GEN and do
>>>>>>> another build?
>>>>>>
>>>>>> The intention is that only the packages that have been
>>>>>> changed/upgraded will be installed. Instead of the whole image
>>>>>> being generated from scratch each time.
>>>>>
>>>>> That's what INC_RPM_IMAGE_GEN does, yes. What I'm asking is how this
>>>>> patch addresses the sequence I outlined above.
>>>>
>>>> Explain what you mean by "build".
>>>>
>>>> Using the following:
>>>>
>>>> . ./oe-init-build-env build-test
>>>> <setup local.conf w/ rpm packaging and INC_RPM_IMAGE_GEN>
>>>> bitbake core-image-core
>>>> --- time passes, git pull pulls in changes ---
>>>> bitbake core-image-core
>>>>
>>>> The second "build", only the changed packages will be added to the
>>>> image.
>>>>
>>>> You you are using different build directories, then it doesn't re-use
>>>> anything. The purpose of this is incremental software development
>>>> within a single build directory.
>>>
>>> You are still missing my point. The patch is broken if you change
>>> INC_RPM_IMAGE_GEN
>>
>> Only the core-image-minimal has this problem, other images won't remove the
>> database, the core-image-minimal removes the database to save disk space (
>> only saves quite a little), and I don't know whether there is a better
>> solution
>> for the core-image-minimal, maybe move the database to ${T} rather than
>> remove
>> it, and move it back to the rootfs directory at the early stage of
>> do_rootfs, but I don't know whether this is worth or not since this is
>> just used for
>> saving the time at the development stage, as it had told:
>>
> Robert,
>
> The move might be the best solution since it will preserve it and make the
> behavior more predictable, ie if one starts with INC_RPM_IMAGE_GEN disabled and
> then enables it the package database will be available already. It would also
> preserve the space in the core-image-minimal by not keeping those database files
> in the image.
>

Thanks Saul, I will send a V2 for it.

// Robert

> Please respin this patch.
>
> Thanks
> Sau!
>
>
>
>> # Incremental rpm image generation, the rootfs would be totally removed
>> # and re-created in the second generation by default, but with
>> # INC_RPM_IMAGE_GEN = "1", the rpm based rootfs would be kept, and will
>> # do update(remove/add some pkgs) on it. NOTE: This is not suggested
>> # when you want to create a productive rootfs
>>
>> // Robert
>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>


