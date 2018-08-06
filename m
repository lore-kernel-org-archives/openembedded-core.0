Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF9167600A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 01:40:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w761ekem019404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2018 18:40:46 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 18:40:45 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1533284788.git.Qi.Chen@windriver.com>
	<23da175826ae4960e8690951576b356dd16fe338.1533284788.git.Qi.Chen@windriver.com>
	<968ef9a18a9c944956d251cbbc604aae9912292f.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f01cc0de-ffda-ce47-24e1-d324fb3d5f62@windriver.com>
Date: Mon, 6 Aug 2018 09:44:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <968ef9a18a9c944956d251cbbc604aae9912292f.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] oe_syslog.py: fix for syslog-ng
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
X-List-Received-Date: Mon, 06 Aug 2018 01:40:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2018 12:40 AM, Richard Purdie wrote:
> On Fri, 2018-08-03 at 16:27 +0800, Chen Qi wrote:
>> When using syslog-ng as the syslog provider, oe_syslog test case
>> fails
>> because it cannot find the syslog daemon. This is because it greps
>> for
>> 'syslogd' but syslog-ng's daemon is 'syslog-ng'. So fix the grep
>> command
>> to also consider syslog-ng.
>>
>> Also, when the test case fails, what I get is:
>>> AssertionError: 1 != 0 : No syslogd process; ps output:
>> <empty here>
>>
>> This does not help user. The output is actually from the 'PS | GREP'
>> command.
>> And when the 'PS | GREP' command fails, the output is always empty.
>> So also
>> fix it to actually output the ps information. After the change, it
>> looks like:
>>> AssertionError: 1 != 0 : No syslogd process; ps -ef output:
>>> UID        PID  PPID  C STIME TTY          TIME CMD
>>> root         1     0 28 07:35 ?        00:00:19 /sbin/init
>>> root         2     0  0 07:35 ?        00:00:00 [kthreadd]
>>> root         3     2  0 07:35 ?        00:00:00 [kworker/0:0]
>> ...
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oeqa/runtime/cases/oe_syslog.py | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py
>> b/meta/lib/oeqa/runtime/cases/oe_syslog.py
>> index 935f10f..23abae3 100644
>> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
>> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
>> @@ -10,9 +10,10 @@ class SyslogTest(OERuntimeTestCase):
>>       @OETestDepends(['ssh.SSHTest.test_ssh'])
>>       @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-
>> ng"])
>>       def test_syslog_running(self):
>> -        cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
>> -        status, output = self.target.run(cmd)
>> -        msg = "No syslogd process; ps output: %s" % output
>> +        cmd = '%s  | grep -iE "[s]yslogd|[s]yslog-ng"' %
>> self.tc.target_cmds['ps']
>> +        status, _ = self.target.run(cmd)
>> +        _, output = self.target.run(self.tc.target_cmds['ps'])
>> +        msg = "No syslogd process; %s output:\n%s" %
>> (self.tc.target_cmds['ps'], output)
>>           self.assertEqual(status, 0, msg=msg)
> Rather than getting the output of "ps" again if the test failed (which
> may then be different), could we just get the output of ps and then
> test for the presence of syslog using python, sharing the output of ps
> if the match isn't found?
>
> Cheers,
>
> Richard
>
Yes, it is better. I'll send out V2.

Best Regards,
Chen Qi



