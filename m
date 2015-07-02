Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCB9265C89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 02:43:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t622hvP0028643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jul 2015 19:43:57 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Jul 2015 19:43:57 -0700
Message-ID: <5594A56C.8090509@windriver.com>
Date: Thu, 2 Jul 2015 10:43:56 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1435804351-5018-1-git-send-email-rongqing.li@windriver.com>
	<5594A482.4080104@windriver.com>
In-Reply-To: <5594A482.4080104@windriver.com>
Subject: Re: [PATCH] archiver: set permissions for backup files of patch
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
X-List-Received-Date: Thu, 02 Jul 2015 02:43:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月02日 10:40, Robert Yang wrote:
>
>
> On 07/02/2015 10:32 AM, rongqing.li@windriver.com wrote:
>> From: Jian Liu <jian.liu@windriver.com>
>>
>> For the program patch with version before 2.6, backup files
>> for nonexisting files are created with mode 0. During making
>> tarball for these files, this will cause permission error.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> ---
>>   meta/classes/archiver.bbclass | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/archiver.bbclass
>> b/meta/classes/archiver.bbclass
>> index 7b5274d..f5cdb77 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -224,7 +224,7 @@ def create_tarball(d, srcdir, suffix, ar_outdir,
>> pf=None):
>>       """
>>       create the tarball from srcdir
>>       """
>> -    import tarfile
>> +    import tarfile, subprocess, errno
>>
>>       bb.utils.mkdirhier(ar_outdir)
>>       if pf:
>> @@ -239,7 +239,21 @@ def create_tarball(d, srcdir, suffix, ar_outdir,
>> pf=None):
>>       os.chdir(dirname)
>>       bb.note('Creating %s' % tarname)
>>       tar = tarfile.open(tarname, 'w:gz')
>> -    tar.add(basename)
>> +    # For patch before 2.6 backup files for
>> +    # nonexisting files are created with mode 0.
>> +    # Change the permission of backup files.
>> +    # In future, this can be deleted if patch-2.6 and above
>> +    # is used widely.
>> +    try:
>> +        tar.add(basename)
>> +    except IOError as exc:
>> +        if exc.errno == errno.EACCES:
>> +            # Make sure the probable back up patches have read
>> permission
>> +            subprocess.call('chmod a+r -R %s/.pc* >/dev/null 2>&1 |
>> true' %
>
> The '|' should be '||' ?
>
> // Robert

Thanks, I will fix it

-Roy

>
>> +                            basename, shell=True)
>> +            tar.add(basename)
>> +        else:
>> +            raise IOError("I/O error({0}): {1}".format(exc.errno,
>> exc.strerror))
>>       tar.close()
>>
>>   # creating .diff.gz between source.orig and source
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

