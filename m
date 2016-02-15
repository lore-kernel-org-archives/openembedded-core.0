Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6AECB73196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 17:32:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 15 Feb 2016 09:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,451,1449561600"; d="scan'208";a="912844029"
Received: from besquive-mobl2.zpn.intel.com ([10.219.128.114])
	by orsmga002.jf.intel.com with ESMTP; 15 Feb 2016 09:32:02 -0800
Message-ID: <1455557537.3118.7.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1sok60noEfj_ZywoN+2Z4QkcMfZrzXbRdrQharg-ZYSX7w@mail.gmail.com>
References: <1454341995-18859-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAMKF1sok60noEfj_ZywoN+2Z4QkcMfZrzXbRdrQharg-ZYSX7w@mail.gmail.com>
Organization: Intel Corporation
Date: Mon, 15 Feb 2016 11:32:17 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runtime/systemd: Fix for boot time string parse error
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
X-List-Received-Date: Mon, 15 Feb 2016 17:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 10:48 -0800, Khem Raj wrote:
> On Mon, Feb 1, 2016 at 7:53 AM, Benjamin Esquivel
> <benjamin.esquivel@linux.intel.com> wrote:
> > boot time string can change its format of the output of the amount
> > of time
> > it took to boot. It is required to handle graceful fail of the
> > parsing
> > errors that it provokes
> > 
> > [YOCTO #8889]
> > 
> > Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com
> > >
> > ---
> >  meta/lib/oeqa/runtime/systemd.py | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/runtime/systemd.py
> > b/meta/lib/oeqa/runtime/systemd.py
> > index 03c56ef..2b2f10d 100644
> > --- a/meta/lib/oeqa/runtime/systemd.py
> > +++ b/meta/lib/oeqa/runtime/systemd.py
> > @@ -145,8 +145,7 @@ class SystemdJournalTests(SystemdTest):
> >          except AssertionError:
> >              self.fail("Error occurred while calling journalctl")
> >          if not len(output):
> > -            self.fail("Error: unable to obtain the startup time
> > from\
> > -                    systemd journal")
> > +            self.fail("Error, unable to get startup time from
> > systemd journal")
> > 
> >          # check for the regular expression items that match the
> > startup time
> >          for line in output.split('\n'):
> > @@ -156,20 +155,23 @@ class SystemdJournalTests(SystemdTest):
> >          if check_match:
> >              print "%s" % check_match
> >          else:
> > -            self.fail("Error while obtaining the boot time from
> > journalctl")
> > +            self.skipTest("Error at obtaining the boot time from
> > journalctl")
> >          boot_time_sec = 0
> > 
> >          # get the numeric values from the string and convert them
> > to seconds
> >          # same data will be placed in list and string for
> > manipulation
> >          l_boot_time = check_match.split(" ")[-2:]
> >          s_boot_time = " ".join(l_boot_time)
> > -        # Obtain the minutes it took to boot
> > -        if l_boot_time[0].endswith('min') and
> > l_boot_time[0][0].isdigit():
> > -            boot_time_min = s_boot_time.split("min")[0]
> > -            # convert to seconds and accumulate it
> > -            boot_time_sec += int(boot_time_min) * 60
> > -        # Obtain the seconds it took to boot and accumulate
> > -        boot_time_sec += float(l_boot_time[1].split("s")[0])
> > +        try:
> > +            # Obtain the minutes it took to boot
> > +            if l_boot_time[0].endswith('min') and
> > l_boot_time[0][0].isdigit():
> > +                boot_time_min = s_boot_time.split("min")[0]
> > +                # convert to seconds and accumulate it
> > +                boot_time_sec += int(boot_time_min) * 60
> > +            # Obtain the seconds it took to boot and accumulate
> > +            boot_time_sec += float(l_boot_time[1].split("s")[0])
> 
> is float right to use here I wonder,
float is what the seconds are expressed in at the journal, like in:

systemd[1]: Startup finished in 1.616s (kernel) + 13.561s (initrd) +
3.195s (userspace) = 26.632s
 
> > +        except ValueError:
> > +            self.skipTest("Error when parsing time from boot
> > string")
> >          #Assert the target boot time against systemd's unit start
> > timeout
> >          if boot_time_sec > systemd_TimeoutStartSec:
> >              print "Target boot time %s exceeds systemd's
> > TimeoutStartSec %s"\
> > --
> > 2.5.1
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

