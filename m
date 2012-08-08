Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sz1LV-00010V-B2
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 10:10:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q787wZxN016157
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Aug 2012 00:58:36 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 8 Aug 2012 00:58:36 -0700
Message-ID: <50221C2A.5010303@windriver.com>
Date: Wed, 8 Aug 2012 15:58:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343124846.git.liezhi.yang@windriver.com>
	<7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
	<1343126992.22222.11.camel@ted>
	<20120806092903.GG3267@jama.jama.net>
	<1344358644.9756.293.camel@ted>
In-Reply-To: <1344358644.9756.293.camel@ted>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] package-index: inherit pythonnative
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
X-List-Received-Date: Wed, 08 Aug 2012 08:10:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/08/2012 12:57 AM, Richard Purdie wrote:
> On Mon, 2012-08-06 at 11:29 +0200, Martin Jansa wrote:
>> On Tue, Jul 24, 2012 at 11:49:52AM +0100, Richard Purdie wrote:
>>> On Tue, 2012-07-24 at 18:19 +0800, Robert Yang wrote:
>>>> The native python binary has been moved from usr/bin/python to
>>>> usr/bin/python-native/python, the recipe which needs python-native
>>>> should "inherit pythonnative", otherwise there would be errors when the
>>>> python script runs.
>>>>
>>>> [YOCTO #2822]
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   meta/recipes-core/meta/package-index.bb |    2 ++
>>>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> Which part of this recipe needs python-native? Shouldn't scripts which
>>> need pythonnative be using the path to the python interpreter
>>> explicitly?
>>
>> This fixes my opkg-utils related issues too
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026333.html
>>
>> The problem is that with pythonnative in opkg-utils it's still using
>> #!/usr/bin/env python
>> in tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
>>
>> And when python-index executes this:
>> | + [ -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/ ]
>> | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages
>> | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages.flock -c opkg-make-index -r /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/
>> | Traceback (most recent call last):
>>
>> It depends on PATH of package-index not opkg-utils.
>
> I think the right fix here is to remove the PYTHONPATH line in
> package-index.bb. We should no longer need that and that should fix the
> problems but its going to be a while before I can test this on a system
> showing the problem.
>

Hi Richard

I'd like to remove the PYTHONPATH and started testing package_rpm, package_deb
pacakge_ipk now (meta-toolchain-sdk and core-image-sato), I will send the
the patch if the testing is ok (tomorrow).

// Robert

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



