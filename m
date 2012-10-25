Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TRSgF-0006KR-Ea
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 21:01:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9PIlsCk021677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 11:47:55 -0700 (PDT)
Received: from msp-dhcp20.wrs.com (172.25.34.20) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 25 Oct 2012 11:47:52 -0700
Message-ID: <5089895D.8020901@windriver.com>
Date: Thu, 25 Oct 2012 13:47:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: Removal of Zypper, replace with SMART
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2012 19:01:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Working with Zypper over the last few releases of the Yocto Project has been a 
nightmare for me.  It simply hasn't worked the way I'd like (or sometimes at 
all), and it's been very difficult to try to correct the issues in it.  As such, 
I'd like to propose replacing Zypper with SMART.  Below is some background and 
details on what I am proposing.

(If you don't care about RPM packaging, images generated with RPM, or on-target 
software updates using RPM, you probably won't care about any of this.)

Zypper
------

Zypper is a software management framework by SuSE.  Zypper enables the ability
to identify and download updated software from a remote package feed.

Zypper is more then just a single application.  It is made up of a number of
components.  Above and beyond the base system requirements for RPM Zypper
requires: cmake, boost, curl, libxml2, libcheck, sat-solver, expat, openssl,
libproxy, libzypp, augeas, C++ support and readline

Of the above items, the biggest problem in the above list is 'boost'.  Boost is
a set of C++ libraries that provide a large number of templates, classes and
other components.  However, it's an unwieldy mess, and impossible to support if
something goes wrong.  This leads to huge potential support issues.

The other big problem, besides the C++, is that Zypper (and associated elements) 
have a large hard coded list of supported architectures.  We have some nasty 
hacks in both the libzypp and zypper recipes to write custom, machine specific 
configurations and compile them into the machine specific version of zypper. The 
problem with this approach is that it limits sharing between different 
BSP/machine configurations.

Zypper, and it's dependencies can add up to 44MB of additional code to a
filesystem.  19MB of the additional code is items that nothing else on a typical 
system will use.

In early 1.3 development, I attempted to upgrade Zypper, libzypp, and sat-solver 
to the newer version.  I was unsuccessful due to a combination of C++ issues, 
simple bugs upstream, and the hard coded lists of compatible machines that only 
matched SuSE behavior.

In addition, from discussing the issues w/ Richard and Paul in the past, between 
the quality, C++, boost and other requirements -- we're likely never to get a 
functional cross - image install using Zypper.  The necessary native recipes 
required is simply to difficult and complex to support properly.

This has lead to the current solution in the package_rpm.bbclass and
rootfs_rpm.bbclass that is a mess of hand coded package feed -- package
selection and resolution code.  The end result is a difficult to support and
maintain mess.


Alternatives?
-------------

This lead us to evaluate alternatives to Zypper.  The most well know alternative 
is YUM.  Yum is a package resolver supported primarily by Red Hat and Fedora.

The maintainer, Seth Vidal is actively hostile toward RPM5, the version of RPM
that we use.  Yum is also in the process of a refactoring that the maintainer
has publicly stated it will intentionally be written to not be compatible with
RPM5, as much as possible.  So YUM was excluded based on this.

(Note, there are basic YUM patches to support RPM5 available from community 
members, so this could be a backup plan if necessary.)


SMART (http://labix.org/smart/)
-------------------------------

The other choice we had is SMART.  At Wind River we've used SMART in the past
for basic system functionality.  Doing more recent research indicates that the
project itself is very stable.  There are a low number of recent changes, 
however the maintainer is still available and posts occasionally on the RPM5 
mailing lists.  The project has not been abandoned.

SMART is being used by a European Union research project, Mancoosi, as well as a 
number of small installations.  It was originally the framework used by
Connectiva, which was later merged into Mandriva.  It's unclear if it is still
used by Mandriva, but SMART is still able to manage that environment if 
necessary.  SMART also support Debian style and a few other style packages. 
While we don't plan to use this, it is a possibility if needed.

SMART is python based and has minimal dependencies.  It more or less requires
python and rpm's python-rpm module.  The Yocto Project components already have
these implemented.

SMART being implemented in python is an advantage to us.  It will be easier for 
people who are fluent in python to be able to identify and fix any issues found 
in SMART.

 From a basic implementation standpoint it took many days to cross compile and
implement the Zypper solution that we currently have, and many more days to
debug and make it minimally functional as we have it today.  SMART took approx 4 
hours to integrate and debug to the point it is working locally on a target
system.  This is significantly easier to integrate and use.

SMART, and it's dependencies can add up to 40MB of additional code to a
filesystem.  Only 1MB of the additional code is items that nothing else on a
typical system will use.  This makes smart significantly more attractive then
Zypper for embedded systems.

Note, it's still unclear how configuration, cross-image generation and such will 
work, but it seems to be dramatically easier to implement so far.

SMART is able to use the existing package feeds.  For RPM repositories local
database resolver, APT repositories, RPM-MD (yum style), Red Carpet
(Ximian/Novell), RPM Header List (Fedora / anaconda installer), RPM directory
(directory w/o indexing), and URPMI (Mandriva format) are all supported.  This
should be more then flexible enough for us and our users.

Zypper used the createrepo framework for indexing the package feeds.  SMART uses 
the same method and so at a minimum existing users of Zypper should be able to 
transition, assuming everything goes smoothly.  (We're not sure if there are any 
existing oe-core users of Zypper.)

There is however one capability that Zypper had, the ability to use 
'delta-rpms', that it does not appear that SMART currently supports.  From a 
basic investigation, it does not look like it would be difficult for someone to 
implement this behavior, should it be needed.

OE / Yocto Project community
----------------------------
The majority of the OE community does not use RPM support.  They default to IPK. 
  Many of the Yocto Project community does the same.  This means that the 
package feed support for RPM is likely limited to a smaller set of users.  Many 
of these end users have simply avoided field upgrade requirements so far -- and 
this has allowed what little Zypper support we have to be acceptable.

However, as the number of users and defects in the current rootfs_rpm increase,
it's become difficult and much slower for us to respond to problems.  Most of
this is caused by the hacky way we do feed resolution and installation, because
we're simply unable to use a package resolution framework during our cross installs.

In past conversations, pretty much nobody likes the existing implementation and 
everyone would like something better.  The key though is to fix up SMART, and 
the necessary bbclass integration and show that the feed mechanism can work as 
good or better then what we currently have.


The following attempts to explain the type of work that will need to be done to 
implement the above proposal.  The initial integration steps have been done and 
many of the investigative steps have started.  Assuming there are no significant 
objections to this, I expect to start sending patches to the list soon.

Expected work items
-------------------
* Implement SMART
     - Verify that the RPM recipe's python-rpm works properly
     - Integrate smartpm (python-smartpm) from smartpm.org
       - target
       - native
       - nativesdk
     - Document SMART configuration setup, feed setup, etc
     - Unit test using manual configuration and feeds
     - Check if SMART supports requirement hints
       - Add hinting (RPM_MISSINGOK) support if necessary (suggests/recommends)
* Remove Zypper
     - Remove Zypper, libzypp and sat-solver recipes
     - Investigate if any of the other dependencies should be removed
* Integrate SMART into RPM image generation
     - Automatically construct smart configuration files
     - Verify/extend smart to be able to pass necessary "root" parameter to RPM
     - Modify package_rpm.bbclass and rootfs_rpm.bbclass
       - Construct package feed
       - Use SMART to install from package feed
     - Unit test/verify image generation works the same as before (or better)


