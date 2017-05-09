Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2406671B04
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:23:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v499N4Av012317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 May 2017 02:23:04 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 9 May 2017 02:23:03 -0700
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1494321164.git.Qi.Chen@windriver.com>
	<ecb02fcc0cbe4c1ea8967c80b9d1e6d14586ed2e.1494321164.git.Qi.Chen@windriver.com>
	<1494321448.10021.1.camel@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <bbc28376-35a7-5e77-8abc-0d67d9f05516@windriver.com>
Date: Tue, 9 May 2017 17:25:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1494321448.10021.1.camel@linux.intel.com>
X-Originating-IP: [128.224.162.201]
Subject: Re: [PATCH 1/1] cve-check.bbclass: make warning contain CVE IDs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 09:23:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 05:17 PM, Joshua Lock wrote:
> On Tue, 2017-05-09 at 17:13 +0800, Chen Qi wrote:
>> When warning users about unpatched CVE, we'd better put CVE IDs into
>> the warning message, so that it would be more straight forward for
>> the
>> user to know which CVEs are not patched.
>>
>> So instead of:
>>    WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE, for
>> more information check /path/to/workdir/cve/cve.log.
>> We should have:
>>    WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE (CVE-
>> 2017-7869), for more information check /path/to/workdir/cve/cve.log.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/cve-check.bbclass | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
>> check.bbclass
>> index 0e4294f..496d744 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -234,7 +234,8 @@ def cve_write_data(d, patched, unpatched,
>> cve_data):
>>       cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
>>       nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
>>       write_string = ""
>> -    first_alert = True
>> +    has_unpatched_cve = False
>> +    unpatched_cves = []
>>       bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
>>   
>>       for cve in sorted(cve_data):
>> @@ -244,15 +245,17 @@ def cve_write_data(d, patched, unpatched,
>> cve_data):
>>           if cve in patched:
>>               write_string += "CVE STATUS: Patched\n"
>>           else:
>> +            unpatched_cves.append(cve)
>>               write_string += "CVE STATUS: Unpatched\n"
>> -            if first_alert:
>> -                bb.warn("Found unpatched CVE, for more information
>> check %s" % cve_file)
>> -                first_alert = False
>> +            has_unpatched_cve = True
>>           write_string += "CVE SUMMARY: %s\n" %
>> cve_data[cve]["summary"]
>>           write_string += "CVSS v2 BASE SCORE: %s\n" %
>> cve_data[cve]["score"]
>>           write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
>>           write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link,
>> cve)
>>   
>> +    if has_unpatched_cve:
> There's no need for the has_unpatched_cve variable, you can just test
> whether the unpatched_cves list is empty:
>
>>>> foo = []
>>>> bar = [1, 2, 3]
>>>> if foo:
> ...   print("foo")
> ...
>>>> if bar:
> ...   print("bar")
> ...
> bar
>
> Your conditional can just be:
>
>    + if unpatched_cve:

Thanks a lot.
I'll send out V2.

Best Regards,
Chen Qi

>> +        bb.warn("Found unpatched CVE (%s), for more information
>> check %s" % (" ".join(unpatched_cves),cve_file))
>> +
>>       with open(cve_file, "w") as f:
>>           bb.note("Writing file %s with CVE information" % cve_file)
>>           f.write(write_string)
>> -- 
>> 1.9.1
>>


