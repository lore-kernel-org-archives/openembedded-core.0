Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A468C60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 05:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7E5SmjS025205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 22:28:48 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 13 Aug 2013 22:28:48 -0700
Message-ID: <520B1595.3060909@windriver.com>
Date: Wed, 14 Aug 2013 13:28:53 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
In-Reply-To: <520A82BA.2070706@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Wed, 14 Aug 2013 05:28:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/14/2013 03:02 AM, Saul Wold wrote:
> On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
>> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
>> tar, but once other packages install the same file into sysroot, the
>> creating the archive file will fail with below error:
>>
>>      DEBUG: Executing shell function sstate_create_package
>>      tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed
>> as we read it
>>
>> This kind of error is harmless, use --ignore-failed-read to ignore it.
>>
> I am not sure it's so harmless, what if the file is corrupted, then we
> have a bad sstate tarball.  You have identified the part of the root
> cause being the hardlink, but what if the file actually does change
> (which would be a different bug potentially), then your packaging a
> differet set of macros (in this case) with the sysroot.
>
>
> Sau!


The file is not corrupted, and the file content is not changed,  "tar"
said xorg-macros.m4 file is changed, since the number of links of
xorg-macros.m4 has changed when other packages is doing configuration
and call autotools_copy_aclocal to make a hardlink to ${ACLOCALDIR}

If this fix can be accepted, I will rework the commit header.

-Roy


>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   meta/classes/sstate.bbclass |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index c1ca54b..3e2fedd 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -565,7 +565,7 @@ sstate_create_package () {
>>       TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>>       # Need to handle empty directories
>>       if [ "$(ls -A)" ]; then
>> -        tar -czf $TFILE *
>> +        tar --ignore-failed-read -czf $TFILE *
>>       else
>>           tar -cz --file=$TFILE --files-from=/dev/null
>>       fi
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

