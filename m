Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Rxq8P-0004nj-7W
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 02:27:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1G1JUB9003067
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Feb 2012 17:19:30 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 15 Feb 2012 17:19:30 -0800
Message-ID: <4F3C59A8.209@windriver.com>
Date: Thu, 16 Feb 2012 09:19:36 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com> <4F38E8CB.6090101@windriver.com>
	<4F3A9118.8050806@linux.intel.com> <4F3BCE0C.10400@linux.intel.com>
In-Reply-To: <4F3BCE0C.10400@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q1G1JUB9003067
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Source Archiver Class
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
X-List-Received-Date: Thu, 16 Feb 2012 01:27:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B402=E6=9C=8815=E6=97=A5 23:23, Saul Wold wrote:
>
> Xiaofeng,
>
> I replied last night to your IRC, but was not sure if you saw it, I am=20
> adding it to this email.
>
> (11:05:36 PM) sgw: xiaofeng, you around?
> (11:08:22 PM) sgw: zlib is a bad example, since there are no patches!
> (11:08:38 PM) sgw: Let's use "at" since it is a simple recipe and has=20
> patches
> (11:09:27 PM) sgw: if you start with bitbake -c cleanall at, so we=20
> have a fresh start.
> (11:12:26 PM) sgw: bitbake -c unpack at, will give you the upacked=20
> source in at-3.1.12-r7/at-3.1.12/..., this will give you a base to=20
> build from
> (11:15:12 PM) sgw: "bitbake -c patch at" will then patch the above=20
> sources and create the patches directory with the series file. So=20
> given that info, you be able to add a do_patch[prefunc] to first tar=20
> the unpatched directory and then a do_patch[postfunc] to tar the=20
> patches directory into the tar file from the first tar.
> (11:16:32 PM) sgw: Does this make sense?
> (11:17:49 PM) sgw: Something else we will want to consider is creating=20
> one tarball of all the gnu source and patches in one large tarball.
>
>
Hi Saul,

I saw the reply in IRC yesterday.
Thanks very much. I will also realize a function to include all of gnu=20
sources and patches in one tarball in archiver.bbclass.
> On 02/14/2012 08:51 AM, Saul Wold wrote:
>> On 02/13/2012 02:41 AM, Xiaofeng Yan wrote:
>>> Hi Saul,
>>>
>>> I have some issues when I writing design document. The following
>>> description is my understanding. I take package "zlib" for example .
>>>>
>>>>
>>>> This is a progression list of what the source archives should includ=
e:
>>>>
>>>> 1 - Original Upstream Archive & Patches
>>>> - 2 archives (tarballs)
>>> $ls zlib-orgsource
>>> zlib-1.2.5.tar.bz2(after do_fetch)
>>> zlib-patches.tar.bz2( the patches come from
>>> meta/recipes-core/zlib/zlib-1.2.5)
>>
>> Almost correct, I believe that the work Bruce and Chris have done
>> recently will allow you to get the patches.
>>
>> I am not sure we want to just tar up the
>> meta/recipes-core/zlib/lib-1.2.5 directory since it might contain othe=
r
>> file or patches that we don't actaully use. We need to get the patches
>> that are actually applied.
>>
>>>> 2 - Original Source code & Patches
>>>> - could include additional code
>>> Please give me more detailed information
>> One tarball with the patches extracted in the patches directory with t=
he
>> series file (possibly a script to apply the patches).
>>
>>>> - post unpack
>>>> - 1 archive
>>> $ls zlib-orgsource
>>> zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this
>>> package.)
>>>
>>> No patch in this directory.
>> Need to add the patches via patch mechanism to the source tarball, but
>> without actually applying the patches.
>>
>> So, this is just one tarball.
>> zlib-1.2.5-prepatch.tar.bz2
>>>>
>>>> 3 - Original Source code & Patches & temp (scripts & logs)
>>>> - Could possibly include the .bb and .inc files
>>>> - 2 archives (from #2 & temp tarball)
>>> $ls zlib-orgsource
>>> zlib-1.2.5.tar.bz2(after do_unpack, patches are not included in this
>>> package.)
>>> zlib-patches.tar.bz2( the patches come from
>>> meta/recipes-core/zlib/zlib-1.2.5)
>>
>> Again see above, we need to get only the patches that will actually be
>> applied.
>>
>>> zlib-scripts-logs.tar.bz2(include zlib_1.2.5.bb,zlib.inc and tmp/log_=
*)
>>>
>>> So there are 3 tarballs in this directory.
>> Yes
>>
>>>> 4 - Patched source code
>>>> - original source code could be removed
>>>> - post do_patch
>>> $ls zlib-source
>>> zlib-1.2.5.tar.bz2(after do_patch)
>> Correct
>> Maybe better zlib-1.2.5-patched.tar.bz2
>>
>>>> 5 - Patched source code & temp
>>>> - 2 archives (from #4 & temp tarball)
>>> $ls zlib-source
>>> zlib-1.2.5.tar.bz2(after do_patch)
>>> zlib-logs.tar.bz2(include tmp/log_*)
>> Correct
>> Same as #4 change the tarball name
>>
>>>> 6 - Configured Source
>>>> - post do_configure
>>> $ls zlib-source
>>> zlib-1.2.5.tar.bz2(after do_configure)
>> zlib-1.2.5-configured.tar.bz2
>>
>>>> 7 - SRPM format of Original Source & Patches
>>>> - rpm will apply the patches
>>>> - internally contains #2 above
>>> $ls zlib-srpm
>>> zlib-1.2.5.src.rpm
>>>
>>> zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patch=
es
>>> are not included in this package.) and zlib-patches.tar.bz2
>>>> 8 - SRPM various of #3 above
>>> $ls zlib-srpm
>>> zlib-1.2.5.src.rpm
>>>
>>> zlib-1.2.5.src.rpm includes zlib-1.2.5.tar.bz2(after do_unpack, patch=
es
>>> are not included in this package.) ,zlib-patches.tar.bz2 and
>>> zlib-scripts-logs.tar.bz2
>>>
>>> Do you have any suggestion about the above description?
>>>
>> Just the naming and where the patches come from we need to provide the
>> mechanism (series file) for how to apply the patches also.
>>
>> Sau!
>>
>>> Thanks
>>> Yan
>>>
>>>
>>>> ...
>>>> 100 - Buildable SRPM
>>>> - can actually build, this is way future!
>>>>
>>>> (Patches =3D patch files & series list)
>>>>
>>>> Each of these build on the previous in some way, the key being that =
we
>>>> generate a tarball for the source from the existing state of the
>>>> WORKDIR, a challenge maybe to create the source snapshot after the=20
>>>> build
>>>> has already occurred.
>>>>
>>>> The SPDX License info could also be included in any of these
>>>>
>>>> After talking with Richard, we think we have a novel approach to mak=
e
>>>> this work. It would entail using the postfuncs feature similar to th=
e
>>>> way that Shared State does it's work. The existing copyleft_complian=
ce
>>>> class functionality can be folded into this as a filter. Additional
>>>> flags could be passed from individual classes to a core set of metho=
ds
>>>> in an archiver class defining the type of data (source, patches, tem=
p,
>>>> env, recipe info, ...) and format (tar, sprm, ...)
>>>>
>>>> I noted that recipe type code might be better suited as generic=20
>>>> code, as
>>>> I believe there are other places that could benefit from that code.
>>>>
>>>> The sourcepkg class seems to be a basic archiver and differ that
>>>> includes the metadata/environment (as dumpdata), this could be=20
>>>> replaced
>>>> by the new approach. While the src_distribute class copies the
>>>> downloaded archive and then creates a link, into LICENSE directories
>>>> along with the patches. The src_distribute by default seems to move
>>>> files and create links (incorrectly btw!). This work can be done by=20
>>>> the
>>>> archiver class.
>>>>
>>>> The Nugget: Create a new core "archiver" class that implements a=20
>>>> general
>>>> functions that can archive the original tarball or workdir at variou=
s
>>>> states along task list with additional metadata (recipe info, temp=20
>>>> dir,
>>>> environment). This class would be inherited by a set of classes=20
>>>> that use
>>>> the postfunc (similar to sstate) that setup what level of archive is
>>>> needed (based on the list above).
>>>>
>>>> Thoughts, Comments?
>>>>
>>>> Thanks
>>>>
>>>>
>>>>
>>>
>>>
>>
>



