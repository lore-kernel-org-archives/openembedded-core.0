Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B604B605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 05:24:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4M5OX0o002968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 May 2014 22:24:33 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 21 May 2014 22:24:33 -0700
Message-ID: <537D8A0F.5010705@windriver.com>
Date: Thu, 22 May 2014 13:24:31 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Douglas Royds <douglas.royds@taitradio.com>
References: <1400482838-7751-1-git-send-email-rongqing.li@windriver.com>
	<537D55FE.8090603@taitradio.com>
In-Reply-To: <537D55FE.8090603@taitradio.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: fix for CVE-2010-5298
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
X-List-Received-Date: Thu, 22 May 2014 05:24:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/22/2014 09:42 AM, Douglas Royds wrote:
> On 19/05/14 19:00, rongqing.li@windriver.com wrote:
>> From: Yue Tao <Yue.Tao@windriver.com>
>>
>> Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
>> through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
>> attackers to inject data across sessions or cause a denial of service
>> (use-after-free and parsing error) via an SSL connection in a
>> multithreaded environment.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
>>
>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |   24
>> ++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644
>> meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>>
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>>
>> new file mode 100644
>> index 0000000..417a774
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>>
>> @@ -0,0 +1,24 @@
>> +openssl fix for CVE-2010-5298
>> +
>> +Upstream-Status: Backport
>> +
>> +Race condition in the ssl3_read_bytes function in s3_pkt.c in OpenSSL
>> +through 1.0.1g, when SSL_MODE_RELEASE_BUFFERS is enabled, allows remote
>> +attackers to inject data across sessions or cause a denial of service
>> +(use-after-free and parsing error) via an SSL connection in a
>> +multithreaded environment.
>> +
>> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-5298
>> +
>> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> +--- a/ssl/s3_pkt.c
>> ++++ b/ssl/s3_pkt.c
>> +@@ -1013,7 +1013,7 @@ start:
>> +                 {
>> +                 s->rstate=SSL_ST_READ_HEADER;
>> +                 rr->off=0;
>> +-                if (s->mode & SSL_MODE_RELEASE_BUFFERS)
>> ++                if (s->mode & SSL_MODE_RELEASE_BUFFERS &&
>> s->s3->rbuf.left == 0)
>> +                     ssl3_release_read_buffer(s);
>> +                 }
>> +             }
>
> This patch file appears to be orphaned in openssl-1.0.1e/, when the
> current version is 1.0.1g.
>
> Also, there is no file://openssl-CVE-2010-5298.patch entry in the SRC_URI.
>
> Was this deliberate? Am I missing something?


thank, I will fix it

-Roy
-- 
Best Reagrds,
Roy | RongQing Li

