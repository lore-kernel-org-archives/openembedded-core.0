Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TIhZg-00012s-Pz
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 17:06:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q91ErOFT011137
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Oct 2012 07:53:24 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 1 Oct 2012 07:53:23 -0700
Message-ID: <5069AE63.7020807@windriver.com>
Date: Mon, 1 Oct 2012 09:53:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1348963477.git.mark.hatle@windriver.com>
	<81b24042824b81344141c7dcaffbfe74354bc635.1348963477.git.mark.hatle@windriver.com>
	<1349096953.15753.97.camel@ted>
In-Reply-To: <1349096953.15753.97.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/12] bb.utils.explode_dep_versions: Update to ensure we avoid duplicate deps
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
X-List-Received-Date: Mon, 01 Oct 2012 15:06:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/12 8:09 AM, Richard Purdie wrote:
> On Sat, 2012-09-29 at 19:19 -0500, Mark Hatle wrote:
>> Due to a recent change in bb.utils.explode_dep_version, we need to make
>> sure that we do not have any duplicates in things that use
>> explode_dep_versions.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/insane.bbclass      |   55 +++++++++++++++++++++++++++++++++-
>>   meta/classes/kernel.bbclass      |   20 +++++++-----
>>   meta/classes/libc-common.bbclass |   13 ++++++--
>>   meta/classes/package.bbclass     |   20 ++++++++++--
>>   meta/classes/package_rpm.bbclass |   61 +++++++++++++++++++++-----------------
>>   5 files changed, 125 insertions(+), 44 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 1fb8970..17d887a 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -114,7 +114,7 @@ def package_qa_get_machine_dict():
>>
>>   # Currently not being used by default "desktop"
>>   WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
>> -ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>> +ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
>>
>>   ALL_QA = "${WARN_QA} ${ERROR_QA}"
>>
>> @@ -659,6 +659,54 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
>>
>>       return sane
>>
>> +def package_qa_check_deps(pkg, pkgdest, skip, d):
>> +    sane = True
>> +
>> +    # Copied from package_ipk.bbclass
>> +    # boiler plate to update the data
>> +    localdata = bb.data.createCopy(d)
>> +    root = "%s/%s" % (pkgdest, pkg)
>> +
>> +    localdata.setVar('ROOT', '')
>> +    localdata.setVar('ROOT_%s' % pkg, root)
>
>
> Nothing here uses ROOT or root so these can be removed?
>
>> +    pkgname = localdata.getVar('PKG_%s' % pkg, True)
>> +    if not pkgname:
>> +        pkgname = pkg
>> +    localdata.setVar('PKG', pkgname)
>
> Again, these look surplus to requirements?
>
>> +    localdata.setVar('OVERRIDES', pkg)
>> +
>> +    bb.data.update_data(localdata)
>> +

I'll get this fixed and resubmitted.

--Mark

> Cheers,
>
> Richard
>



