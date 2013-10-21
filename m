Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D31096D280
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 02:42:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9L2gMtc016473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Oct 2013 19:42:23 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 20 Oct 2013 19:42:22 -0700
Message-ID: <526494B8.5040808@windriver.com>
Date: Mon, 21 Oct 2013 10:43:04 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1382082297.git.Qi.Chen@windriver.com>
	<83310635c381d335c132da1665c5568515dff386.1382082297.git.Qi.Chen@windriver.com>
	<1382108236.29912.552.camel@ted>
In-Reply-To: <1382108236.29912.552.camel@ted>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image_types.bbclass: add --numeric-owner option to tar command
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
X-List-Received-Date: Mon, 21 Oct 2013 02:42:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2013 10:57 PM, Richard Purdie wrote:
> On Fri, 2013-10-18 at 15:47 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <qi.chen@windriver.com>
>>
>> If the same username exists on both target and the build host, but
>> the uids differ, and we start target via NFS, then the uid for the
>> user will be incorrect on target.
>>
>> For example, if postfix's uid on host is 119 and on target is 1024,
>> then if we start target via NFS, the uid for postfix will be 119.
>>
>> The root cause is that when we use runqemu-extract-sdk to generate
>> the NFS rootfs for later use, the tar command will respect the username
>> instead of uid. So if PSEUDO_PASSWD environment is not set correctly,
>> the host /etc/passwd will be used, resulting in wrong uids.
>>
>> The situation for gid is completely analogous to that of uid.
>>
>> It's almost impossible for the runqemu-extract-sdk to guess the correct
>> location of the needed password file merely based on the target tarball
>> name.
>>
>> This patch solves this problem by adding the '--numeric-owner' option
>> to the tar command so that the username/groupname is not recorded in
>> the tarball. In this situation, we'll always get the correct uid/gid
>> after extracting the tarball.
>>
>> [YOCTO #5364]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/image_types.bbclass |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Er, isn't the right fix to fix runqemu-extract-sdk to use numeric IDs
> then rather than butcher all the tarballs we create?
>
> Cheers,
>
> Richard
>
>
>

Thanks for pointing it out.
V2 has been sent out.

Best Regards,
Chen Qi

