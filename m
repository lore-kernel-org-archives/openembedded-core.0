Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.685.1596647530689999528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075HBV10012777
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Aug 2020 10:11:41 -0700
Received: from mt-manjaro (128.224.72.53) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug
 2020 10:11:21 -0700
References: <20200805155018.8076-1-matthew.zeng@windriver.com>
 <2b59e9a89d74ab2d63f014945403af113d374e8b.camel@linuxfoundation.org>
User-agent: mu4e 1.4.12; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ltp: make copyFrom scp command non-fatal
In-Reply-To: <2b59e9a89d74ab2d63f014945403af113d374e8b.camel@linuxfoundation.org>
Date: Wed, 5 Aug 2020 13:11:18 -0400
Message-ID: <87eeolhvbd.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.72.53]
Content-Type: text/plain


Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2020-08-05 at 11:50 -0400, Matthew wrote:
>> [YOCTO #13802]
>>
>> Make the scp failure non-fatal so the ltp tests continue to run and
>> the rest of the logs will be available to see afterwards.
>>
>> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>> ---
>>  meta/lib/oeqa/core/target/ssh.py | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
>> index 090b40a814..1b78e830d4 100644
>> --- a/meta/lib/oeqa/core/target/ssh.py
>> +++ b/meta/lib/oeqa/core/target/ssh.py
>> @@ -61,9 +61,12 @@ class OESSHTarget(OETarget):
>>          self.logger.debug("[Command returned '%d' after %.2f seconds]"
>>                   "" % (status, time.time() - starttime))
>>
>> -        if status and not ignore_status:
>> -            raise AssertionError("Command '%s' returned non-zero exit "
>> -                                 "status %d:\n%s" % (command, status, output))
>> +        if status:
>> +            if not ignore_status:
>> +                raise AssertionError("Command '%s' returned non-zero exit "
>> +                                     "status %d:\n%s" % (command, status, output))
>> +            else:
>> +                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
>>
>>          return (status, output)
>>
>> @@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
>>          """
>>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>>          scpCmd = self.scp + [remotePath, localDst]
>> -        return self._run(scpCmd, ignore_status=False)
>> +        return self._run(scpCmd, ignore_status=True)
>>
>>      def copyDirTo(self, localSrc, remoteDst):
>>          """
>
> I'm a little worried that these warnings may appear from places we
> don't expect them. I can run the test on the autobuilder and see if
> other tests trigger this I guess, I wondered if you'd looked into that?
>

You're right, the better way might be adding an additional optional parameter ignore_error, so it won't break any existing behavior.

I'll quickly create a new patch and let you have a look.

> An alternative may be to set ignore_status=True but check the return
> code at a higher level and issue the warning there?
>
> Cheers,
> Richard


--
Mingde (Matthew) Zeng
