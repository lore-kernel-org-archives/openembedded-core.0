Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABE8C6A529
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 16:30:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4TGUSfk015822
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2013 09:30:28 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 09:30:27 -0700
Message-ID: <51A62D21.4010909@windriver.com>
Date: Wed, 29 May 2013 11:30:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-3-git-send-email-mark.hatle@windriver.com>
	<20130529155906.GO3192@jama>
In-Reply-To: <20130529155906.GO3192@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/21] Add directory information to the pkgdata files
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
X-List-Received-Date: Wed, 29 May 2013 16:30:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/13 10:59 AM, Martin Jansa wrote:
> On Wed, May 29, 2013 at 10:09:44AM -0500, Mark Hatle wrote:
>> Add S(ource) and B(uild) directory information to the recipe pkgdata files.
>> This allows external tools to find the appropriate information, and be able
>> to easily access the corresponding sources and build directories.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/package.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 02a1460..19b2b4c 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1124,6 +1124,8 @@ python emit_pkgdata() {
>>
>>       data_file = pkgdatadir + d.expand("/${PN}" )
>>       f = open(data_file, 'w')
>> +    f.write("S: %s\n" % d.expand("${S}"))
>> +    f.write("B: %s\n" % d.expand("${B}"))
>>       f.write("PACKAGES: %s\n" % packages)
>>       f.close()
>
> how does this interact with sstate? does setscene task create
> pkgdata with right paths?
>

The pkgdata is always current to the current build/work directory.  When the 
sstate-cache runs, and the associated pkgdata is dumped to the disk the S and B 
for the current directory is written.  But when sstate-cache is used, there is 
no extracted source (or build) components so those directories remain unresolved.

It's up to the tooling that are using these files to check if the directory 
exists, if it does not -- then using bitbake -c patch <recipe> will create it. 
(even in the sstate-cache case.)

--Mark

