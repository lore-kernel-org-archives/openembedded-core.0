Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2387.1596650373523367844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075HwkuR013861
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Aug 2020 10:59:07 -0700
Received: from mt-manjaro (128.224.72.53) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug
 2020 10:58:53 -0700
References: <20200805171547.2515-1-matthew.zeng@windriver.com>
 <202cd662179307a24cd3c55bbaca2a4b91c48f26.camel@linuxfoundation.org>
User-agent: mu4e 1.4.12; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] ltp: make copyFrom scp command non-fatal
In-Reply-To: <202cd662179307a24cd3c55bbaca2a4b91c48f26.camel@linuxfoundation.org>
Message-ID: <877dudht44.fsf@windriver.com>
Date: Wed, 5 Aug 2020 13:58:51 -0400
MIME-Version: 1.0
X-Originating-IP: [128.224.72.53]
Content-Type: text/plain


Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2020-08-05 at 13:15 -0400, Mingde (Matthew) Zeng wrote:
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
>> index 090b40a814..e891a4bbfa 100644
>> --- a/meta/lib/oeqa/core/target/ssh.py
>> +++ b/meta/lib/oeqa/core/target/ssh.py
>> @@ -50,7 +50,7 @@ class OESSHTarget(OETarget):
>>      def stop(self, **kwargs):
>>          pass
>>
>> -    def _run(self, command, timeout=None, ignore_status=True):
>> +    def _run(self, command, timeout=None, ignore_status=True, ignore_error=False):
>>          """
>>              Runs command in target using SSHProcess.
>>          """
>> @@ -62,8 +62,11 @@ class OESSHTarget(OETarget):
>>                   "" % (status, time.time() - starttime))
>>
>>          if status and not ignore_status:
>> -            raise AssertionError("Command '%s' returned non-zero exit "
>> -                                 "status %d:\n%s" % (command, status, output))
>> +            if ignore_error:
>> +                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
>> +            else:
>> +                raise AssertionError("Command '%s' returned non-zero exit "
>> +                                     "status %d:\n%s" % (command, status, output))
>>
>>          return (status, output)
>>
>> @@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
>>          """
>>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>>          scpCmd = self.scp + [remotePath, localDst]
>> -        return self._run(scpCmd, ignore_status=False)
>> +        return self._run(scpCmd, ignore_error=True)
>>
>>      def copyDirTo(self, localSrc, remoteDst):
>>          """
>
> That isn't what I meant, I mean something like:
>
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index 090b40a8143..cbc56f2e0ad 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
>              scpCmd = self.scp + [localSrc, remotePath]
>              return self._run(scpCmd, ignore_status=False)
>
> -    def copyFrom(self, remoteSrc, localDst):
> +    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
>          """
>              Copy file from target.
>          """
>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>          scpCmd = self.scp + [remotePath, localDst]
> -        return self._run(scpCmd, ignore_status=False)
> +        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
> +        if warn_on_failure and not status:
> +            self.logger.warning("Copy X returned non-zero exit status %d:\n%s" % (XXX, status, output))
> +        return (status, output)
>
>      def copyDirTo(self, localSrc, remoteDst):
>          """
>
> so that we enable this in the specific case og the copy we might accept failure for.

This works too, my implementation is not as specific as this, however it enables warning when the optional parameter ignore_error=True, which is only specified in the copyFrom function.

I'll adjust my patch.

>
> Cheers,
>
> Richard


--
Mingde (Matthew) Zeng
