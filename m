Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.3159.1596652491042199493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 11:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075IYCYi015353
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Aug 2020 11:34:22 -0700
Received: from mt-manjaro (128.224.72.53) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug
 2020 11:34:02 -0700
References: <20200805181025.6361-1-matthew.zeng@windriver.com>
 <83a3c9a961bec6ed39fb48d67a3c615e13d05fa3.camel@linuxfoundation.org>
User-agent: mu4e 1.4.12; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv3] ltp: make copyFrom scp command non-fatal
In-Reply-To: <83a3c9a961bec6ed39fb48d67a3c615e13d05fa3.camel@linuxfoundation.org>
Date: Wed, 5 Aug 2020 14:33:58 -0400
Message-ID: <873651hrhl.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.72.53]
Content-Type: text/plain


Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2020-08-05 at 14:10 -0400, Matthew wrote:
>> [YOCTO #13802]
>>
>> Make the scp failure non-fatal so the ltp tests continue to run and
>> the rest of the logs will be available to see afterwards.
>>
>> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>> ---
>>  meta/lib/oeqa/core/target/ssh.py   | 7 +++++--
>>  meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
>> index 090b40a814..aefb576805 100644
>> --- a/meta/lib/oeqa/core/target/ssh.py
>> +++ b/meta/lib/oeqa/core/target/ssh.py
>> @@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
>>              scpCmd = self.scp + [localSrc, remotePath]
>>              return self._run(scpCmd, ignore_status=False)
>>
>> -    def copyFrom(self, remoteSrc, localDst):
>> +    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
>>          """
>>              Copy file from target.
>>          """
>>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>>          scpCmd = self.scp + [remotePath, localDst]
>> -        return self._run(scpCmd, ignore_status=False)
>> +        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
>> +        if warn_on_failure and status:
>> +            self.logger.warning("Copy returned non-zero exit status %d:\n%s" % (status, output))
>> +        return (status, output)
>>
>>      def copyDirTo(self, localSrc, remoteDst):
>>          """
>> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
>> index 6dc5ef22ad..da529ce482 100644
>> --- a/meta/lib/oeqa/runtime/cases/ltp.py
>> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
>> @@ -78,7 +78,7 @@ class LtpTest(LtpTestBase):
>>              # copy nice log from DUT
>>              dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
>>              remote_src = "/opt/ltp/results/%s" % ltp_group
>> -            (status, output) = self.target.copyFrom(remote_src, dst)
>> +            (status, output) = self.target.copyFrom(remote_src, dst, True)
>>              msg = 'File could not be copied. Output: %s' % output
>>              self.assertEqual(status, 0, msg=msg)
>
> The idea of this change is so "the ltp tests continue to run" yet if I
> understand that code, a copy failure will throw the assertEqual and
> hence stop the test so we don't get all the other logging information?

When warn_on_failure=True, so is ignore_status. Then 'status and not ignore_status' evaluates to false, and 'raise AssertionError("Command '%s' returned non-zero exit ...)' will not run.

>
> Cheers,
>
> Richard
>
> 


--
Mingde (Matthew) Zeng
