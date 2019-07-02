Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 804FD7EA4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 07:56:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x627tlLJ001204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 00:56:28 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 00:56:21 -0700
To: Pierre Le Magourou <lemagoup@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190624094438.7596-1-lemagoup@gmail.com>
	<19369a4e-80ec-9659-faa0-fc0f5925aa87@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2baee5f7-f293-f9ce-447a-c2a6297a5529@windriver.com>
Date: Tue, 2 Jul 2019 16:08:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <19369a4e-80ec-9659-faa0-fc0f5925aa87@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH] cve-update-db: Use std library instead of urllib3
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
X-List-Received-Date: Tue, 02 Jul 2019 07:56:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I just tired to open the web but failed. The web seems down.

Regards,
Chen Qi

On 07/02/2019 03:39 PM, ChenQi wrote:
> A recent do_populate_cve_db failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1005/steps/7/logs/errors 
>
>
> Could you please help look at what's going on?
>
> Regards,
> Chen Qi
>
> On 06/24/2019 05:44 PM, Pierre Le Magourou wrote:
>> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
>>
>> urllib3 was used in this recipe but it was not set as a
>> dependency. As it is not specifically needed, rewrite the recipe with
>> urllib from the standard library.
>>
>> Signed-off-by: Pierre Le Magourou 
>> <pierre.lemagourou@softbankrobotics.com>
>> ---
>>   meta/recipes-core/meta/cve-update-db.bb | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-db.bb 
>> b/meta/recipes-core/meta/cve-update-db.bb
>> index 522fd23807..1f48820cc6 100644
>> --- a/meta/recipes-core/meta/cve-update-db.bb
>> +++ b/meta/recipes-core/meta/cve-update-db.bb
>> @@ -19,7 +19,7 @@ python do_populate_cve_db() {
>>       Update NVD database with json data feed
>>       """
>>   -    import sqlite3, urllib3, shutil, gzip, re
>> +    import sqlite3, urllib, shutil, gzip, re
>>       from datetime import date
>>         BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
>> @@ -33,16 +33,14 @@ python do_populate_cve_db() {
>>         initialize_db(c)
>>   -    http = urllib3.PoolManager()
>> -
>>       for year in range(YEAR_START, date.today().year + 1):
>>           year_url = BASE_URL + str(year)
>>           meta_url = year_url + ".meta"
>>           json_url = year_url + ".json.gz"
>>             # Retrieve meta last modified date
>> -        with http.request('GET', meta_url, preload_content=False) as r:
>> -            date_line = str(r.data.splitlines()[0])
>> +        with urllib.request.urlopen(meta_url) as r:
>> +            date_line = str(r.read().splitlines()[0])
>>               last_modified = re.search('lastModifiedDate:(.*)', 
>> date_line).group(1)
>>             # Compare with current db last modified date
>> @@ -50,7 +48,7 @@ python do_populate_cve_db() {
>>           meta = c.fetchone()
>>           if not meta or meta[0] != last_modified:
>>               # Update db with current year json file
>> -            with http.request('GET', json_url, 
>> preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
>> +            with urllib.request.urlopen(json_url) as r, 
>> open(JSON_TMPFILE, 'wb') as tmpfile:
>>                   shutil.copyfileobj(r, tmpfile)
>>               with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
>>                   update_db(c, jsonfile)
>
>


