Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BEFE178E44
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:40:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w73GeWDo010479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 3 Aug 2018 17:40:34 +0100
Message-ID: <968ef9a18a9c944956d251cbbc604aae9912292f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 03 Aug 2018 17:40:32 +0100
In-Reply-To: <23da175826ae4960e8690951576b356dd16fe338.1533284788.git.Qi.Chen@windriver.com>
References: <cover.1533284788.git.Qi.Chen@windriver.com>
	<23da175826ae4960e8690951576b356dd16fe338.1533284788.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Fri, 03 Aug 2018 16:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-03 at 16:27 +0800, Chen Qi wrote:
> When using syslog-ng as the syslog provider, oe_syslog test case
> fails
> because it cannot find the syslog daemon. This is because it greps
> for
> 'syslogd' but syslog-ng's daemon is 'syslog-ng'. So fix the grep
> command
> to also consider syslog-ng.
> 
> Also, when the test case fails, what I get is:
> > AssertionError: 1 != 0 : No syslogd process; ps output:
> 
> <empty here>
> 
> This does not help user. The output is actually from the 'PS | GREP'
> command.
> And when the 'PS | GREP' command fails, the output is always empty.
> So also
> fix it to actually output the ps information. After the change, it
> looks like:
> > AssertionError: 1 != 0 : No syslogd process; ps -ef output:
> > UID        PID  PPID  C STIME TTY          TIME CMD
> > root         1     0 28 07:35 ?        00:00:19 /sbin/init
> > root         2     0  0 07:35 ?        00:00:00 [kthreadd]
> > root         3     2  0 07:35 ?        00:00:00 [kworker/0:0]
> 
> ...
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> index 935f10f..23abae3 100644
> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> @@ -10,9 +10,10 @@ class SyslogTest(OERuntimeTestCase):
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>      @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-
> ng"])
>      def test_syslog_running(self):
> -        cmd = '%s  | grep -i [s]yslogd' % self.tc.target_cmds['ps']
> -        status, output = self.target.run(cmd)
> -        msg = "No syslogd process; ps output: %s" % output
> +        cmd = '%s  | grep -iE "[s]yslogd|[s]yslog-ng"' %
> self.tc.target_cmds['ps']
> +        status, _ = self.target.run(cmd)
> +        _, output = self.target.run(self.tc.target_cmds['ps'])
> +        msg = "No syslogd process; %s output:\n%s" %
> (self.tc.target_cmds['ps'], output)
>          self.assertEqual(status, 0, msg=msg)

Rather than getting the output of "ps" again if the test failed (which
may then be different), could we just get the output of ps and then
test for the presence of syslog using python, sharing the output of ps
if the match isn't found?

Cheers,

Richard

