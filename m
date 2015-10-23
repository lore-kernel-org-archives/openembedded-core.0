Return-Path: <avery.brian@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0025F6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 16:23:59 +0000 (UTC)
Received: by ioll68 with SMTP id l68so130084639iol.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 09:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=dUzOOowv1OkaUIO+PDhy/X8PW14DIOND5wGY4dKb/ew=;
	b=v21aphoVCoFg8JFc2MOjDVubLYlMcM8v3R8GIzBG98ZUgTKHQiEy2hYCTcA5sLw2O9
	lIvFz1PukHU3TmGwlT8/atva+RGz1JCci7FChmcAn5tvMp0WEDdR60u+l8FzYf56qtEK
	8Kvvu40cXw5bM3fVCrbRDCEpG3RDmGLfN4r5r2Qd4slDfpOy3jlmYTvdaT5hZxX2JarG
	tdwuAOZBvQLykJjkB6vSupQNw7mmyDI5doX8AyYXINRiY71JX0hd7mBhkTatK5jQg5jg
	5WJHve55wf4wYNxqeBdAj3dr5eV8e9Og4sRH8GzeWfqpdYt5mx0kACO8CX9DT+fgL4GU
	SU0g==
MIME-Version: 1.0
X-Received: by 10.107.31.138 with SMTP id f132mr3589601iof.84.1445617439315;
	Fri, 23 Oct 2015 09:23:59 -0700 (PDT)
Received: by 10.64.221.74 with HTTP; Fri, 23 Oct 2015 09:23:59 -0700 (PDT)
In-Reply-To: <1445615841.985.69.camel@linux.intel.com>
References: <1445553911-12721-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<1445553911-12721-2-git-send-email-benjamin.esquivel@linux.intel.com>
	<D24EB9A9.3F537%brian.avery@intel.com>
	<1445615841.985.69.camel@linux.intel.com>
Date: Fri, 23 Oct 2015 09:23:59 -0700
Message-ID: <CAKV_0egOKq1uo+JD+LJHTj9cpBP-g23EMTZVUCvQg845iFAk-w@mail.gmail.com>
From: Brian Avery <avery.brian@gmail.com>
To: benjamin.esquivel@linux.intel.com
Cc: "Witt, Randy E" <randy.e.witt@intel.com>, "Avery,
	Brian" <brian.avery@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemd: test target boot time against unit timeout
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
X-List-Received-Date: Fri, 23 Oct 2015 16:24:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 8:57 AM, Benjamin Esquivel
<benjamin.esquivel@linux.intel.com> wrote:
> This reminds me I haven't been able to parse your logs to check your
> data. If what you say is true, that the failure is presented when the
> system (kernel + userspace) booted in less than 90 secs, then I can
> make 2 observations:
>
> 1. your data and Randy's diverge, Randy's data has every systemd
> failure tied to a timeout message and a boot time greater than the
> unit's timeout. I would happily investigate further, if you send me
> your logs.
I'll stick them in dropbox and send you a link sometime today. they are lar=
ge.

iirc, Randy saved the failures; I saved the failures and successes.
My main point with respect to the time data was that a number of the succes=
ses
also had log boot times.

-b

> 2. my test would not be really as effective as I think to catch the
> condition.
>
> Things to take into account:
>
> A. I'm using Randy's data to compare against yours because you both
> used the same method. I have my data that I obtained with a different
> method that supports my point too.
> B. (Randy/Brian)'s method and Benjamin's method threw data that they 3
> assume is the condition that made the autobuilder's fail, while I don't
> say they are wrong, this is not data coming out of the actual failures
> of the autobuilder. Having that said, I would not disprove your
> nice/ionice change nor adding this test to check if it can be a single
> trap for the systemd errors which right now have too many faces.
>
> Benjamin
>
> On Thu, 2015-10-22 at 23:10 +0000, Avery, Brian wrote:
>> The problem with this is one of the runs I did had a lot of systemd
>> timeout failures but the stats were like:
>>
>> Fails:
>> min startup time: 54 sec
>> avg startup time: 114 sec
>> max startup time: 260 sec
>>
>> Successes:
>> min startup time: 46 sec
>> avg startup time: 110 sec
>> max startup time: 266 sec
>>
>> so I=C2=B9m not sure that the time is a good indicator.
>>
>> These numbers are pulled from the jounalctl line in the
>> ssh_target_log
>> file that looks like:
>>
>> Oct 21 11:19:40 qemux86 systemd[1]: Startup finished in 42.255s
>> (kernel) +
>> 3min 10.075s (userspace) =3D 3min 52.331s.
>>
>>
>> -b
>>
>>
>>
>> On 10/22/15, 3:45 PM, "Benjamin Esquivel"
>> <benjamin.esquivel@linux.intel.com> wrote:
>>
>> > the new test:
>> > oeqa.runtime.systemd.SystemdJournalTests.test_systemd_boot_time
>> > will query the target boot time from journactl and will
>> > compare it against the default systemd's unit start timeout:
>> > (TimeoutStartSec)
>> >
>> > if the boot time is greater than the timeout, it will fail
>> >
>> > the reason is because once the boot time exceeds the unit start
>> > timeout then it is uncertain that the systemd units are able to
>> > properly come up and function
>> >
>> > when this test fails, the rest of the systemd units (services)
>> > should be
>> > skipped
>> >
>> > this test also prints the startup time in the test log like:
>> > ...
>> > test_systemd_boot_time (oeqa.runtime.systemd.SystemdJournalTests)
>> > ...
>> > Startup finished in 6.922s (kernel) + 52.089s (userspace) =3D
>> > 59.011s.
>> > ...
>> >
>> > [YOCTO#8141]
>> >
>> > Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com
>> > >
>> > ---
>> > meta/lib/oeqa/runtime/systemd.py | 73
>> > ++++++++++++++++++++++++++++++++++++++++
>> > 1 file changed, 73 insertions(+)
>> >
>> > diff --git a/meta/lib/oeqa/runtime/systemd.py
>> > b/meta/lib/oeqa/runtime/systemd.py
>> > index c74394c..251d06e 100644
>> > --- a/meta/lib/oeqa/runtime/systemd.py
>> > +++ b/meta/lib/oeqa/runtime/systemd.py
>> > @@ -21,6 +21,33 @@ class SystemdTest(oeRuntimeTest):
>> >         self.assertEqual(status, expected, message)
>> >         return output
>> >
>> > +    def journalctl(self, args=3D'',l_match_units=3D[]):
>> > +        """
>> > +        Request for the journalctl output to the current target
>> > system
>> > +
>> > +        Arguments:
>> > +        -args, an optional argument pass through argument
>> > +        -l_match_units, an optional list of units to filter the
>> > output
>> > +        Returns:
>> > +        -string output of the journalctl command
>> > +        Raises:
>> > +        -AssertionError, on remote commands that fail
>> > +        -ValueError, on a journalctl call with filtering by
>> > l_match_units that
>> > +        returned no entries
>> > +        """
>> > +        query_units=3D""
>> > +        if len(l_match_units):
>> > +            query_units =3D ['_SYSTEMD_UNIT=3D'+unit for unit in
>> > l_match_units]
>> > +            query_units =3D " ".join(query_units)
>> > +        command =3D 'journalctl %s %s' %(args, query_units)
>> > +        status, output =3D self.target.run(command)
>> > +        if status:
>> > +            raise AssertionError("Command '%s' returned non-zero
>> > exit \
>> > +                    code %d:\n%s" % (command, status, output))
>> > +        if len(output) =3D=3D 1 and "-- No entries --" in output:
>> > +            raise ValueError("List of units to match: %s, returned
>> > no
>> > entries"
>> > +                    % l_match_units)
>> > +        return output
>> >
>> > class SystemdBasicTests(SystemdTest):
>> >
>> > @@ -99,3 +126,49 @@ class SystemdJournalTests(SystemdTest):
>> >     def test_systemd_journal(self):
>> >         (status, output) =3D self.target.run('journalctl')
>> >         self.assertEqual(status, 0, output)
>> > +
>> > +    @skipUnlessPassed('test_systemd_basic')
>> > +    def test_systemd_boot_time(self, systemd_TimeoutStartSec=3D90):
>> > +        """
>> > +        Compare the target boot time from journalctl against
>> > TimeoutStartSec
>> > +
>> > +        Arguments:
>> > +        -systemd_TimeoutStartSec, an optional argument containing
>> > systemd's
>> > +        unit start timeout
>> > +        """
>> > +
>> > +        expr_items=3D["Startup finished","kernel",
>> > "userspace","\.$"]
>> > +        try:
>> > +            output =3D self.journalctl(args=3D"-o cat --reverse")
>> > +        except AssertionError:
>> > +            self.fail("Error occurred while calling journalctl")
>> > +        if not len(output):
>> > +            self.fail("Error: unable to obtain the startup time
>> > from\
>> > +                    systemd journal")
>> > +
>> > +        # check for the regular expression items that match the
>> > startup
>> > time
>> > +        for line in output.split('\n'):
>> > +            check_match =3D
>> > "".join(re.findall(".*".join(expr_items),
>> > line))
>> > +            if check_match: break
>> > +        # put the startup time in the test log
>> > +        if check_match:
>> > +            print "\n%s" % check_match
>> > +        else:
>> > +            self.fail("Error while obtaining the boot time from
>> > journalctl")
>> > +        boot_time_sec =3D 0
>> > +
>> > +        # get the numeric values from the string and convert them
>> > to
>> > seconds
>> > +        # same data will be placed in list and string for
>> > manipulation
>> > +        l_boot_time =3D check_match.split(" ")[-2:]
>> > +        s_boot_time =3D " ".join(l_boot_time)
>> > +        # Obtain the minutes it took to boot
>> > +        if l_boot_time[0].endswith('min') and
>> > l_boot_time[0][0].isdigit():
>> > +            boot_time_min =3D s_boot_time.split("min")[0]
>> > +            # convert to seconds and accumulate it
>> > +            boot_time_sec +=3D int(boot_time_min) * 60
>> > +        # Obtain the seconds it took to boot and accumulate
>> > +        boot_time_sec +=3D float(l_boot_time[1].split("s")[0])
>> > +        #Assert the target boot time against systemd's unit start
>> > timeout
>> > +        msg =3D "Target boot time %s exceeds systemd's
>> > TimeoutStartSec %s"\
>> > +                %(boot_time_sec, systemd_TimeoutStartSec)
>> > +        self.assertTrue(boot_time_sec < systemd_TimeoutStartSec,
>> > msg =3D
>> > msg)
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

