Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SZfLl-0001iZ-AA
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 11:37:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4U9RWAF009576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2012 02:27:32 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 30 May 2012 02:27:31 -0700
Message-ID: <4FC5E801.7090303@windriver.com>
Date: Wed, 30 May 2012 17:27:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
	<17015f5456a8216f84817ef9183b83779537347d.1338302685.git.liezhi.yang@windriver.com>
	<CABcZANmqC4JZgJ6bMq+JNfQAoirngBxY_bSch+Ae=s4o48pqqQ@mail.gmail.com>
In-Reply-To: <CABcZANmqC4JZgJ6bMq+JNfQAoirngBxY_bSch+Ae=s4o48pqqQ@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 4/4] scripts: replace os.popen with subprocess.Popen
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
X-List-Received-Date: Wed, 30 May 2012 09:37:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/30/2012 01:30 AM, Chris Larson wrote:
> On Tue, May 29, 2012 at 7:53 AM, Robert Yang<liezhi.yang@windriver.com>  wrote:
>> Replace os.popen with subprocess.Popen since the older function would
>> fail (more or less) silently if the executed program cannot be found
>>
>> More info:
>> http://docs.python.org/library/subprocess.html#subprocess-replacements
>>
>> [YOCTO #2454]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   scripts/contrib/python/generate-manifest-2.7.py |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
>> index 7b43137..d139ab1 100755
>> --- a/scripts/contrib/python/generate-manifest-2.7.py
>> +++ b/scripts/contrib/python/generate-manifest-2.7.py
>> @@ -13,6 +13,7 @@
>>   import os
>>   import sys
>>   import time
>> +import subprocess
>>
>>   VERSION = "2.7.2"
>>
>> @@ -149,7 +150,7 @@ class MakefileMaker:
>>   if __name__ == "__main__":
>>
>>      if len( sys.argv )>  1:
>> -        os.popen( "rm -f ./%s" % sys.argv[1] )
>> +        subprocess.Popen("rm -f ./%s" % sys.argv[1], shell=True, stdout=subprocess.PIPE).stdout
>>          outfile = file( sys.argv[1], "w" )
>>      else:
>>          outfile = sys.stdout
>
> This seems like a candidate for subprocess.call, not subprocess.Popen,
> as the output isn't used. Better yet, just use os.unlink() and ignore
> exceptions from it.

Thanks, Chris, I will send the V2 sooner.

// Robert





