Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QbDPa-00066s-Td
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:07:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2011 08:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,432,1304319600"; d="scan'208";a="20594110"
Received: from unknown (HELO [10.255.13.66]) ([10.255.13.66])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2011 08:04:01 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2011 08:03:56 -0700
In-Reply-To: <4E077597.5090607@gmail.com>
References: <cover.1308592651.git.josh@linux.intel.com>
	<909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>
	<4E068312.5090507@linux.intel.com> <4E069A74.1070402@gmail.com>
	<1309109868.2120.3.camel@scimitar> <4E077597.5090607@gmail.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309187041.2121.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] sanity: implement network connectivity test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 15:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-26 at 11:08 -0700, Khem Raj wrote:
> On 06/26/2011 10:37 AM, Joshua Lock wrote:
> > On Sat, 2011-06-25 at 19:33 -0700, Khem Raj wrote:
> >> On 6/25/2011 5:53 PM, Saul Wold wrote:
> >>> On 06/20/2011 11:09 AM, Joshua Lock wrote:
> >>>> Sanity test to verify files can be fetched from the network using git,
> >>>> http
> >>>> and https fetchers point users at a page to help get set up in the
> >>>> case of a
> >>>> failure.
> >>>>
> >>>> Addresses [YOCTO #933]
> >>>>
> >>>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> >>>> ---
> >>>> meta/classes/sanity.bbclass | 34 ++++++++++++++++++++++++++++++++++
> >>>> 1 files changed, 34 insertions(+), 0 deletions(-)
> >>>>
> >>>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >>>> index bffa4f5..650df5f 100644
> >>>> --- a/meta/classes/sanity.bbclass
> >>>> +++ b/meta/classes/sanity.bbclass
> >>>> @@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
> >>>>
> >>>> # Check that TMPDIR isn't on a filesystem with limited filename length
> >>>> (eg. eCryptFS)
> >>>> testmsg = check_create_long_filename(tmpdir, "TMPDIR")
> >>>> + # Check that we can fetch from various network transports
> >>>> + testmsg = testmsg + check_connectivity(data)
> >>>> return testmsg
> >>>>
> >>>> def check_sanity_version_change(data):
> >>>> @@ -75,6 +77,38 @@ def check_create_long_filename(filepath, pathname):
> >>>> return "Failed to create a file in %s: %s" % (pathname, strerror)
> >>>> return ""
> >>>>
> >>>> +def check_connectivity(d):
> >>>> + # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
> >>>> using
> >>>> + # the same syntax as SRC_URI.
> >>>> + test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or
> >>>> "").split()
> >>>> + # If no URI's set, fallback to some default ones we know of
> >>>> + if len(test_uris) == 0:
> >>>> + test_uris = ["http://yoctoproject.org/about",
> >>>> +
> >>>> "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
> >>>>
> >>>> + "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
> >>>> + retval = ""
> >>
> >> imo this change is yocto specific doesnt belong to core
> >
> > Are you objecting to the feature (testing whether the fetchers can work
> > on a newly configured tmpdir) or the implementation (using
> > yoctoproject.org URI's)?
> 
> the latter
> >
> > I can change this patch to only run the check when the
> > CONNECTIVITY_CHECK_URI's and remove the default uri's. Would that make
> > the change less objectionable?
> 
> yes that would be better.
> >

Okey dokes. Expect a v3 soon.

Thanks,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



