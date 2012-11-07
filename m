Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TW2cw-0001h2-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 11:12:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA79x702011686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2012 01:59:07 -0800 (PST)
Received: from Marks-MacBook-Pro.local (128.224.18.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 7 Nov 2012 01:59:07 -0800
Message-ID: <509A30ED.2070905@windriver.com>
Date: Wed, 7 Nov 2012 10:59:09 +0100
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1352222654.13864.316.camel@phil-desktop>
In-Reply-To: <1352222654.13864.316.camel@phil-desktop>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 07 Nov 2012 10:12:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/12 6:24 PM, Phil Blundell wrote:
> Ping?

I do think we need this.  Having the textrel does prevent prelinking as well.

--Mark

> On Wed, 2012-10-03 at 11:24 +0100, Phil Blundell wrote:
>> Signed-off-by: Phil Blundell <pb@pbcl.net>
>> ---
>> This requires qa.elf.run_objdump() so needs to be applied after the
>> patch which adds that function.
>>
>>   meta/classes/insane.bbclass |   26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 5848ab4..ff35ed8 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -108,7 +108,7 @@ def package_qa_get_machine_dict():
>>
>>
>>   # Currently not being used by default "desktop"
>> -WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
>> +WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir textrel"
>>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
>>
>>   ALL_QA = "${WARN_QA} ${ERROR_QA}"
>> @@ -421,6 +421,30 @@ def package_qa_check_desktop(path, name, d, elf, messages):
>>           for l in output:
>>               messages.append("Desktop file issue: " + l.strip())
>>
>> +QAPATHTEST[textrel] = "package_qa_textrel"
>> +def package_qa_textrel(path, name, d, elf, messages):
>> +    """
>> +    Check if the binary contains relocations in .text
>> +    """
>> +
>> +    if not elf:
>> +        return
>> +
>> +    if os.path.islink(path):
>> +        return
>> +
>> +    phdrs = elf.run_objdump("-p", d)
>> +    sane = True
>> +
>> +    import re
>> +    textrel_re = re.compile("\s+TEXTREL\s+")
>> +    for line in phdrs.split("\n"):
>> +        if textrel_re.match(line):
>> +	   sane = False
>> +
>> +    if not sane:
>> +        messages.append("ELF binary '%s' has relocations in .text" % path)
>> +
>>   QAPATHTEST[ldflags] = "package_qa_hash_style"
>>   def package_qa_hash_style(path, name, d, elf, messages):
>>       """
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



