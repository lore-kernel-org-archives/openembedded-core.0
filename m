Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFDA61EE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 02:07:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7J27Yfg015617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2013 19:07:34 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 18 Aug 2013 19:07:32 -0700
Message-ID: <52117DD7.7010701@windriver.com>
Date: Mon, 19 Aug 2013 10:07:19 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1376377523.git.wenzong.fan@windriver.com>
	<27b0ee9bd74b6c95c3ddd11b673a56d8543cd5d6.1376377523.git.wenzong.fan@windriver.com>
	<520E5D4B.5020201@linux.intel.com>
In-Reply-To: <520E5D4B.5020201@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] oe/path.py: call /bin/cp directly
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
X-List-Received-Date: Mon, 19 Aug 2013 02:07:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2013 01:11 AM, Saul Wold wrote:
> On 08/13/2013 12:09 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> This avoids running cp with interactive mode if defined:
>>
>>      alias cp='cp -i'
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta/lib/oe/path.py |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
>> index da044ba..6933977 100644
>> --- a/meta/lib/oe/path.py
>> +++ b/meta/lib/oe/path.py
>> @@ -97,7 +97,7 @@ def copyhardlinktree(src, dst):
>>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>>           if os.path.isdir(src):
>>               src = src + "/*"
>> -        cmd = 'cp -afl %s %s' % (src, dst)
>> +        cmd = '/bin/cp -afl %s %s' % (src, dst)
>
> As Richard points out in the Consolidated Pull, this is the wrong way to
> go about this, there are possibly other places that will have similar
> issues and we can't fix then all this way.
>
> A better solution is to add a sanity check and suggest that the user
> needs to fix their environment to ensure the build will succeed.

Ok, I will update the patch for this issue.

Thanks
Wenzong

>
> Sau!
>>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>>       else:
>>           copytree(src, dst)
>>
>

