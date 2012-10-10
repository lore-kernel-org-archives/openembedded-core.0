Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TLlbs-0006iR-7B
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 04:01:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9A1m9eb012655
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2012 18:48:09 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 9 Oct 2012 18:48:08 -0700
Message-ID: <5074D3F6.7040108@windriver.com>
Date: Wed, 10 Oct 2012 09:48:38 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@intel.com>
References: <cover.1349770454.git.kai.kang@windriver.com>
	<5638b12dc40290cff09fc211d14b472ef7c2c8c0.1349770454.git.kai.kang@windriver.com>
	<1349788232.15658.173.camel@ted>
	<1349791928.19865.6.camel@empanada>
	<1349830345.19865.27.camel@empanada>
In-Reply-To: <1349830345.19865.27.camel@empanada>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q9A1m9eb012655
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl: fix @INC
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
X-List-Received-Date: Wed, 10 Oct 2012 02:01:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B410=E6=9C=8810=E6=97=A5 08:52, Tom Zanussi wrote:
> On Tue, 2012-10-09 at 09:12 -0500, Tom Zanussi wrote:
>> On Tue, 2012-10-09 at 14:10 +0100, Richard Purdie wrote:
>>> On Tue, 2012-10-09 at 16:32 +0800, Kang Kai wrote:
>>>> perl @INC path includes native perl modules path. When run "perl -V"=
,
>>>> the output at the end is something like:
>>>>    @INC:
>>>>      /etc/perl
>>>>      /usr/lib/perl/site_perl/5.14.2/
>>>>      /usr/lib/perl/site_perl/5.14.2
>>>>      /usr/lib/perl/vendor_perl/5.14.2/
>>>>      /usr/lib/perl/vendor_perl/5.14.2
>>>>      /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc=
/usr/lib/perl/5.14.2/
>>>>      /usr/lib/perl/5.14.2
>>>>      /usr/local/lib/site_perl
>>>>      /usr/lib/perl/5.14.2
>>>>      .
>>>>
>>>> And this is caused by commit aeca6512f3a5468b8f65e2986024ab07d2ce45b=
4.
>>>> Because the native path is compiled into libperl.so that sed in
>>>> perl_package_preprocess() could NOT remove it. So revert the commit.
>>>>
>>>> [Yocto #3099]
>>>>
>>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>>> ---
>>>>   meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta=
/recipes-devtools/perl/perl-5.14.2/config.sh
>>>> index 0d4ca1c..dbfabb5 100644
>>>> --- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
>>>> +++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
>>>> @@ -68,7 +68,7 @@ api_version=3D'14'
>>>>   api_versionstring=3D'5.14.0'
>>>>   ar=3D'ar'
>>>>   archlib=3D'@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
>>>> -archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
>>>> +archlibexp=3D'@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
>>>>   archname64=3D''
>>>>   archname=3D'@ARCH@-thread-multi'
>>>>   archobjs=3D''
>>> I dislike fixing one bug at the expense of breaking another.
>>>
>>> Tom,
>>>
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Daeca6512f3a546=
8b8f65e2986024ab07d2ce45b4
>>>
>>> Any comments on this? How could we test the issue you originally fixe=
d?
>>>
>> The original purpose of that commit was to allow the perf build to use
>> ExtUtils::Embed to build the Perl language bindings for 'perf script'.
>>
>> perl_package_preprocess() was (I thought) supposed to prevent the
>> settings in config.sh from making it to the target - I'll have to look
>> into why they do for libperl.so.
>>
Hi Tom,

Thanks.
> I just submitted a patchset that gets rid of the @INC problem while
> still allowing perf scripting to work (rather than exiting with a
> 'scripting not supported' message).
I'll test perl with your patch.

Regards,
Kai

>
> Tom
>
>> Tom
>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



