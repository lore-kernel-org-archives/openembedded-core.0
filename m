Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfwc5-0001H9-I5
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:48:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4HYZkk026953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Dec 2012 09:34:35 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 4 Dec 2012 09:34:33 -0800
Message-ID: <50BE342E.1070401@windriver.com>
Date: Tue, 4 Dec 2012 11:34:38 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
	<20121204170432.GH14870@jama.jama.net>
In-Reply-To: <20121204170432.GH14870@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Tue, 04 Dec 2012 17:48:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/12 11:04 AM, Martin Jansa wrote:
> On Tue, Dec 04, 2012 at 11:14:35AM -0600, Mark Hatle wrote:
>> When using update-alternatives, there should be a runtime dependency on
>> update-alternatives.  Without this, it's possible to get into a situation
>> where the package is not installable.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/update-alternatives.bbclass |    6 ++++++
>>   1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
>> index 4e1ff27..e432506 100644
>> --- a/meta/classes/update-alternatives.bbclass
>> +++ b/meta/classes/update-alternatives.bbclass
>> @@ -304,6 +304,12 @@ python populate_packages_prepend () {
>>               alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
>>
>>           if alt_setup_links:
>> +            # RDEPENDS setup
>> +            bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
>> +            rdepends = d.getVar('RDEPENDS_%s' % pkg, True) or ""
>> +            rdepends += ' ' + d.getVar('MLPREFIX') + 'update-alternatives'
>> +            d.setVar("RDEPENDS_%s" % pkg, rdepends)
>> +
>
> I guess you should use VIRTUAL-RUNTIME_update-alternatives here

I believe what I have here is correct.  We don't care which update-alternatives 
we use, just that one is used.

recipes-devtools/dpkg/dpkg.inc:RPROVIDES_update-alternatives-dpkg += 
"update-alternatives"
recipes-devtools/opkg/opkg.inc:RPROVIDES_update-alternatives-cworth += 
"update-alternatives"

If I use the ${VIRTUAL-RUNTIME_update-alternatives} that has the effect or hard 
coding which specific version of update-alternatives we're going to use.. (-dpg 
vs -cworth)  I'm not sure this is really the desired behavior in this case -- if 
it is, it's easy enough to change of course.

--Mark

> Cheers,
>
>>               bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
>>               bb.note('%s' % alt_setup_links)
>>               postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



