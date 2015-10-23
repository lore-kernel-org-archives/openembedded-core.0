Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8C49575E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 15:57:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2015 08:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,187,1444719600"; d="scan'208";a="586731976"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.84])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2015 08:57:21 -0700
Message-ID: <1445615841.985.69.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Avery, Brian" <brian.avery@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D24EB9A9.3F537%brian.avery@intel.com>
References: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<1445553911-12721-2-git-send-email-benjamin.esquivel@linux.intel.com>
	<D24EB9A9.3F537%brian.avery@intel.com>
Organization: Intel Corporation
Date: Fri, 23 Oct 2015 10:57:21 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: "Witt, Randy E" <randy.e.witt@intel.com>
Subject: Re: [PATCH 1/2] systemd: test target boot time against unit timeout
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 15:57:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reminds me I haven't been able to parse your logs to check your
data. If what you say is true, that the failure is presented when the
system (kernel + userspace) booted in less than 90 secs, then I can
make 2 observations:

1. your data and Randy's diverge, Randy's data has every systemd
failure tied to a timeout message and a boot time greater than the
unit's timeout. I would happily investigate further, if you send me
your logs.
2. my test would not be really as effective as I think to catch the
condition.

Things to take into account:

A. I'm using Randy's data to compare against yours because you both
used the same method. I have my data that I obtained with a different
method that supports my point too.
B. (Randy/Brian)'s method and Benjamin's method threw data that they 3
assume is the condition that made the autobuilder's fail, while I don't
say they are wrong, this is not data coming out of the actual failures
of the autobuilder. Having that said, I would not disprove your
nice/ionice change nor adding this test to check if it can be a single
trap for the systemd errors which right now have too many faces. 

Benjamin

On Thu, 2015-10-22 at 23:10 +0000, Avery, Brian wrote:
> The problem with this is one of the runs I did had a lot of systemd
> timeout failures but the stats were like:
> 
> Fails:
> min startup time: 54 sec
> avg startup time: 114 sec
> max startup time: 260 sec
> 
> Successes:
> min startup time: 46 sec
> avg startup time: 110 sec
> max startup time: 266 sec
> 
> so I¹m not sure that the time is a good indicator.
> 
> These numbers are pulled from the jounalctl line in the
> ssh_target_log
> file that looks like:
> 
> Oct 21 11:19:40 qemux86 systemd[1]: Startup finished in 42.255s
> (kernel) +
> 3min 10.075s (userspace) = 3min 52.331s.
> 
> 
> -b
> 
> 
> 
> On 10/22/15, 3:45 PM, "Benjamin Esquivel"
> <benjamin.esquivel@linux.intel.com> wrote:
> 
> > the new test:
> > oeqa.runtime.systemd.SystemdJournalTests.test_systemd_boot_time
> > will query the target boot time from journactl and will
> > compare it against the default systemd's unit start timeout:
> > (TimeoutStartSec)
> > 
> > if the boot time is greater than the timeout, it will fail
> > 
> > the reason is because once the boot time exceeds the unit start
> > timeout then it is uncertain that the systemd units are able to
> > properly come up and function
> > 
> > when this test fails, the rest of the systemd units (services)
> > should be
> > skipped
> > 
> > this test also prints the startup time in the test log like:
> > ...
> > test_systemd_boot_time (oeqa.runtime.systemd.SystemdJournalTests)
> > ...
> > Startup finished in 6.922s (kernel) + 52.089s (userspace) =
> > 59.011s.
> > ...
> > 
> > [YOCTO#8141]
> > 
> > Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com
> > >
> > ---
> > meta/lib/oeqa/runtime/systemd.py | 73
> > ++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 73 insertions(+)
> > 
> > diff --git a/meta/lib/oeqa/runtime/systemd.py
> > b/meta/lib/oeqa/runtime/systemd.py
> > index c74394c..251d06e 100644
> > --- a/meta/lib/oeqa/runtime/systemd.py
> > +++ b/meta/lib/oeqa/runtime/systemd.py
> > @@ -21,6 +21,33 @@ class SystemdTest(oeRuntimeTest):
> >         self.assertEqual(status, expected, message)
> >         return output
> > 
> > +    def journalctl(self, args='',l_match_units=[]):
> > +        """
> > +        Request for the journalctl output to the current target
> > system
> > +
> > +        Arguments:
> > +        -args, an optional argument pass through argument
> > +        -l_match_units, an optional list of units to filter the
> > output
> > +        Returns:
> > +        -string output of the journalctl command
> > +        Raises:
> > +        -AssertionError, on remote commands that fail
> > +        -ValueError, on a journalctl call with filtering by
> > l_match_units that
> > +        returned no entries
> > +        """
> > +        query_units=""
> > +        if len(l_match_units):
> > +            query_units = ['_SYSTEMD_UNIT='+unit for unit in
> > l_match_units]
> > +            query_units = " ".join(query_units)
> > +        command = 'journalctl %s %s' %(args, query_units)
> > +        status, output = self.target.run(command)
> > +        if status:
> > +            raise AssertionError("Command '%s' returned non-zero
> > exit \
> > +                    code %d:\n%s" % (command, status, output))
> > +        if len(output) == 1 and "-- No entries --" in output:
> > +            raise ValueError("List of units to match: %s, returned
> > no
> > entries"
> > +                    % l_match_units)
> > +        return output
> > 
> > class SystemdBasicTests(SystemdTest):
> > 
> > @@ -99,3 +126,49 @@ class SystemdJournalTests(SystemdTest):
> >     def test_systemd_journal(self):
> >         (status, output) = self.target.run('journalctl')
> >         self.assertEqual(status, 0, output)
> > +
> > +    @skipUnlessPassed('test_systemd_basic')
> > +    def test_systemd_boot_time(self, systemd_TimeoutStartSec=90):
> > +        """
> > +        Compare the target boot time from journalctl against
> > TimeoutStartSec
> > +
> > +        Arguments:
> > +        -systemd_TimeoutStartSec, an optional argument containing
> > systemd's
> > +        unit start timeout
> > +        """
> > +
> > +        expr_items=["Startup finished","kernel",
> > "userspace","\.$"]
> > +        try:
> > +            output = self.journalctl(args="-o cat --reverse")
> > +        except AssertionError:
> > +            self.fail("Error occurred while calling journalctl")
> > +        if not len(output):
> > +            self.fail("Error: unable to obtain the startup time
> > from\
> > +                    systemd journal")
> > +
> > +        # check for the regular expression items that match the
> > startup
> > time
> > +        for line in output.split('\n'):
> > +            check_match =
> > "".join(re.findall(".*".join(expr_items),
> > line))
> > +            if check_match: break
> > +        # put the startup time in the test log
> > +        if check_match:
> > +            print "\n%s" % check_match
> > +        else:
> > +            self.fail("Error while obtaining the boot time from
> > journalctl")
> > +        boot_time_sec = 0
> > +
> > +        # get the numeric values from the string and convert them
> > to
> > seconds
> > +        # same data will be placed in list and string for
> > manipulation
> > +        l_boot_time = check_match.split(" ")[-2:]
> > +        s_boot_time = " ".join(l_boot_time)
> > +        # Obtain the minutes it took to boot
> > +        if l_boot_time[0].endswith('min') and
> > l_boot_time[0][0].isdigit():
> > +            boot_time_min = s_boot_time.split("min")[0]
> > +            # convert to seconds and accumulate it
> > +            boot_time_sec += int(boot_time_min) * 60
> > +        # Obtain the seconds it took to boot and accumulate
> > +        boot_time_sec += float(l_boot_time[1].split("s")[0])
> > +        #Assert the target boot time against systemd's unit start
> > timeout
> > +        msg = "Target boot time %s exceeds systemd's
> > TimeoutStartSec %s"\
> > +                %(boot_time_sec, systemd_TimeoutStartSec)
> > +        self.assertTrue(boot_time_sec < systemd_TimeoutStartSec,
> > msg =
> > msg)

