Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TgfBa-0005tr-ER
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 18:24:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB6HA6dG010997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Dec 2012 09:10:07 -0800 (PST)
Received: from msp-dhcp50.wrs.com (172.25.34.50) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 09:10:06 -0800
Message-ID: <50C0D171.5010909@windriver.com>
Date: Thu, 6 Dec 2012 11:10:09 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1354674831-24287-1-git-send-email-mark.hatle@windriver.com>
	<1354795966.25268.178.camel@ted>
In-Reply-To: <1354795966.25268.178.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22 v2] update-alternatives.bbclass: Add missing runtime dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 17:24:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/12 6:12 AM, Richard Purdie wrote:
> On Tue, 2012-12-04 at 20:33 -0600, Mark Hatle wrote:
>> When using update-alternatives, there should be a runtime dependency on
>> ${VIRTUAL-RUNTIME_update-alternatives}.  Without this, it's possible to
>> get into a situation where the package is not installable.
>>
>> (If VIRTUAL-RUNTIME_update-alternatives is not defined, no requirement
>> is added.)
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/update-alternatives.bbclass |    8 ++++++++
>>   1 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
>> index 4e1ff27..96fd1e8 100644
>> --- a/meta/classes/update-alternatives.bbclass
>> +++ b/meta/classes/update-alternatives.bbclass
>> @@ -304,6 +304,14 @@ python populate_packages_prepend () {
>>               alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
>>
>>           if alt_setup_links:
>> +            # RDEPENDS setup
>> +            provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives', True)
>> +            if provider:
>> +                bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
>> +                rdepends = d.getVar('RDEPENDS_%s' % pkg, True) or ""
>> +                rdepends += ' ' + d.getVar('MLPREFIX') + provider
>> +                d.setVar("RDEPENDS_%s" % pkg, rdepends)
>> +
>>               bb.note('adding update-alternatives calls to postinst/postrm for %s' % pkg)
>>               bb.note('%s' % alt_setup_links)
>>               postinst = (d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)) or '#!/bin/sh\n'
>
> I'm afraid I don't like this patch. Firstly, do we really need a bb.note
> in there? We don't note every little thing we do, not least as it would
> kill performance.

There are very few instances of this, I'm surprised if performance would be 
impacted beyond the noise.  The next item has a similar bb.note as well.

> Secondly, why not simply do:
>
> d.appendVar('RDEPENDS_%s' % pkg, ' ' + d.getVar('MLPREFIX') + provider)

There was originally code in there to remove duplicates, when it got refactored 
out the rest was never changed.  I'll fix that up.

--Mark

> ?
>
> Cheers,
>
> Richard
>



