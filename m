Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5F1A713EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 08:50:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s848nwha022146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Sep 2014 01:49:58 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 01:49:57 -0700
Message-ID: <540827B3.50509@windriver.com>
Date: Thu, 4 Sep 2014 16:49:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409813992.git.liezhi.yang@windriver.com>	
	<030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
	<1409819233.12482.25.camel@ted>
In-Reply-To: <1409819233.12482.25.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Thu, 04 Sep 2014 08:50:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2014 04:27 PM, Richard Purdie wrote:
> On Thu, 2014-09-04 at 00:05 -0700, Robert Yang wrote:
>> Update the sstate file's timestamps after it is installed, it will be
>> very useful for removing the old sstate file, especially, it's not easy
>> to remove when use the shared SSTATE_DIR, we can easily remove them with
>> this change, for example:
>>
>> $ find state-cache -type f -ctime +10 -exec rm -f {} \;
>>
>> Will remove the sstate file which isn't used by recent 10 days.
>>
>> We can use the -atime, but it is not always available, for example,
>> when mounted with "-o noatime".
>>
>> The touch is a very light weight action, and the
>> scripts/sstate-cache-management.sh also requires this.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/sstate.bbclass |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index ead829e..885912d 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -618,6 +618,7 @@ sstate_unpack_package () {
>>   	mkdir -p ${SSTATE_INSTDIR}
>>   	cd ${SSTATE_INSTDIR}
>>   	tar -xmvzf ${SSTATE_PKG}
>> +	touch --no-dereference ${SSTATE_PKG}
>>   }
>>
>>   BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
>
> At the very least we need to consider read only files here...

Hello, did you mean the SSTATE_MIRRORS ? I thought that I had
considered it since I used the "touch --no-dereference",
make a clear check is reasonable if I understand correctly,
so updated the code in the repo: (The --no-dereference is not
need any more since the "test -w" follows symlink).

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..7cb43b1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -618,6 +618,8 @@ sstate_unpack_package () {
         mkdir -p ${SSTATE_INSTDIR}
         cd ${SSTATE_INSTDIR}
         tar -xmvzf ${SSTATE_PKG}
+       # Use "! test -w ||" to return true for read only files
+       [ ! test -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
  }

// Robert

>
> Cheers,
>
> Richard
>
>
>

