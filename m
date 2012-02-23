Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S0OUd-0002H5-D5
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 03:33:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1N2OolT028935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Feb 2012 18:24:50 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Feb 2012 18:24:50 -0800
Message-ID: <4F45A34A.6010708@windriver.com>
Date: Thu, 23 Feb 2012 10:24:10 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com> <4F38E8CB.6090101@windriver.com>
	<4F3A9118.8050806@linux.intel.com>
	<4F3BCE0C.10400@linux.intel.com> <4F3C59A8.209@windriver.com>
	<4F3EE848.80703@linux.intel.com> <4F41EAD7.3030009@windriver.com>
	<4F43CD0C.8050700@linux.intel.com>
In-Reply-To: <4F43CD0C.8050700@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q1N2OolT028935
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
X-List-Received-Date: Thu, 23 Feb 2012 02:33:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 2012=E5=B9=B402=E6=9C=8822=E6=97=A5 00:57, Saul Wold wrote:
> On 02/19/2012 10:40 PM, Xiaofeng Yan wrote:
>> On 2012=E5=B9=B402=E6=9C=8818=E6=97=A5 07:52, Saul Wold wrote:
>>>

Hi Saul,

I have implemented the most functions but srpm functions. I will=20
complete the left work(merge functions from sourcepkg, src_distribute =20
to archiver.bbclass, implement srpm functions. )

>>> Xiaofeng & Community:
>>>
>>> We had a chat with Chris Larson and Mark Hatle here at ELC.
>>>
>>> We focused this issue down to a fewer number of options that meet the
>>> needs of the licenses. Please review this and let us know if there ar=
e
>>> any issues or concerns.
>>>
>>>
>> Hi Saul,
>>
>> I comment my understanding as follow:
>>> Best Practices:
>>> - Archive during build, we do not support nor recommend post archivin=
g
>>> - Original tarball and patches w/ordering file (maybe comment the
>>> series), grab non-patch files also.
>> for example:
>> file://a.patch
>> file://b.config.in
>> we also archive b.config.in.
>
> Yes, correct.
>
>>> - Unless requesting configured sources, which will just be the
>>> configured source tarball
>>> - Grab temp as postfunc of do_package - latest logs via links & pid
>>>
>> That means logs package include all of logs in temp. for example.
>> You has described a following function we will realize at the previous
>> email.
>> 3 - Original Source code & Patches & temp (scripts & logs)
>>
>> source codes and patches should be in the stage do_patch[postfunc] =3D=
 "
>> do_get_source"
>> logs should be in the stage do_package[postfunc] =3D " do_get_logs"
>> So logs file shouldn't be archived in do_patch[postfunc] =3D "=20
>> do_get_logs"
>> The logs in the stage of do_packge are more than do_patch.
>>
> Correct, you want to get the logs and scripts from temp when they are=20
> most complete (after do_package not after do_patch).
>
> As mentioned below, you would use the variable SOURCE_ARCHIVE_LOG in=20
> the do_package[postfunc] to determine if you need to archive the logs=20
> or not.
>
>
>>> For sstate Builds (LATER):
>>> - need to verify that fetch/patch/configure will get re-run for=20
>>> archiving
>>> - Add temp dir to sstate capture (without links)
>>>
>>> 3 Implementations classes
>>> - Filter in oe/lib/license.py
>>> - source_archive.bb
>>> - archives tarballs to ${BP}/...
>>> - reuse copyleft_compliance for patch handling
>>> - srpm
>>> - take output from above and create SRPM - (LATER)
>>>
>> We will do the archive work according the license . I will implement t=
wo
>> functions, one is for left, the other for right.
> I am not sure what you mean by one is for left and the other is for=20
> right?
>
> Can you explain your thoughts here.
I mean I need implement a function to select to archive the packages=20
from copyright(no free)or copyleft(free).
>
>
>>> 2 Configuration classes
>>> - uses prefunc/postfunc at correct place
>>> - Original Tarball / Patches
>>> - Post Configuration
>>>
>> We can define 8 classes to complete 8 kinds of archiving methods. ever=
y
>> class will inherit archiver.bbclass.
>
> I am not sure we need 8 classes anymore, that was the point of this=20
> email to simplify the needs.
>
> 2 Classes:
>
> source_patches.bbclass
>  - Original Tarball & Patches & Other files
>  - do_patch[postfunc] =3D <archive ${S}/patches with Original tarball>
>  - Included temp dir if enabled via SOURCE_ARCHIVE_LOG
>
> configured_source.bbclass
>  - Get the ${S} dir (or $S & any build dir) after do_configure
>  - do_configure[postfunc] =3D <archive configured source>
>  - Include temp dir if enabled via SOURCE_ARCHIVE_LOG
>
>
got it, thanks
>> and then realize do_stage[prefunc/postfunc] in this class.
>> stage include unpack, patch, configure, build package and so on.
>> for example. we want only to get original tarball, then we can define =
a
>> bbclass named "source.bbclass"
>> source.bbclass:
>> inherit archiver.bbclass
>> do_unpack[postfunc] =3D " do_get_source"
>>
>> if we want to get both original and patches tarball, then we can defin=
e
>> bbclass names "source_patches.bbclass"
>> source_patches.bbclass
>> inherit archiver.bbclass
>> do_unpack[postfunc] =3D " do_get_source_patches"
>>
>>> SOURCE_ARCHIVE_PACKAGE_TYPE =3D {tar, srpm}
>>> SOURCE_ARCHIVE_LOG =3D {True, False}
>>>
>>> Please let us know if you have any questions.
>>>
>>> Sau!
>>>
>> If my understanding don't meet your ideas, Please correct me.
>>
> I should be available via IRC in your afternoon, I will be away during=20
> your morning.
>
> Sau!
>
>> Thanks for your help very much.
>>
>> Thanks
>> Yan
>>> On 02/15/2012 05:19 PM, Xiaofeng Yan wrote:
>>>
>>
>



