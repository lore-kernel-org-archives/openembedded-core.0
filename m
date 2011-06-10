Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QV8QX-0005MO-Og
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 22:35:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5AKWBL9016467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 13:32:12 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 10 Jun 2011 13:32:08 -0700
Message-ID: <4DF27F48.5030601@windriver.com>
Date: Fri, 10 Jun 2011 15:32:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4DED00FB.4080205@windriver.com> <4DED475A.3050606@windriver.com>
In-Reply-To: <4DED475A.3050606@windriver.com>
Subject: Re: Directory Ownership - RFC
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
X-List-Received-Date: Fri, 10 Jun 2011 20:35:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

A follow-up with this.

For an RPM based system this should be fairly easy to implement.  However, after
doing investigation on deb and opkg (related), I'm not sure this is going to work.

From my investigation, deb formatted packages have no concept of directory
ownership.  Directories just "exist" in the system.  Whoever creates the
directories sets the permissions, owner and group.  In Debian they have a number
of helpers that ensure the permissions/owner/group of directories are
reasonable, and if there is a mismatch it indicates a bug in the two packages
that has to be corrected.

So at this point, I'm not exactly sure how to continue.  If we decide to take
the approach of the Debian systems, we need to likely add some type of QA/Sanity
checking for directories to avoid the "sudo" problem mentioned below, as well as
add some helper functionality to ensure the base directory set is reasonable at
all times.

We could also do a hybrid approach, use the mechanism mentioned below or
something similar when using RPM packaging, but fall back to just including
everything for Deb / opkg and resolving mismatches when found.

Right now I'm leaning toward the hybrid approach.

 * Add tooling that ensures base directories always match a distro policy
   - Likely a distro set of owned directories with their modes, owners and groups
   - This would likely need to also be used by the base-files package as well

 * Add RPM packaging exceptions that base directories are ignored when packaging
(except when specifically included)
   - We would only own directories not in the distro list mentioned above -- or
when the feature was disabled.
   - For RPM this helps the installer better order the installation based on
directory dependencies and also eliminates some of the metadata that has to be
carried around

Any comments, suggestions?

On 6/6/11 4:32 PM, Mark Hatle wrote:
> I've spoken to a few people on this..  Revision and comments below in-line...
> 
> On 6/6/11 11:31 AM, Mark Hatle wrote:
>> I'm starting to work on an enhancement that will allow (binary) packages
>> produced from the recipes to clearly own directories.  I'm trying to find a
>> simple enough solution that avoids having to change most recipes, while still
>> giving the developer and distribution designers flexibility to establish clear
>> lines of ownership and system/distribution policy.
>>
>> Problem
>> -------
>>
>> Currently directories are "owned" by whatever packages use them.  This works for
>> the most part, but can lead to problems when many different packages use the
>> same directory -- such as /bin, /sbin, /etc, /lib, /usr/lib, etc....
>>
>> When packaging (at least with RPM), the directory permissions, owners and groups
>> are automatically included into the package using the existing FILES_pkg globbing.
>>
>> The primary issue is that the first package that creates/uses the directory is
>> generally the one that sets the permissions, owner and group.  For many
>> directories 0755, root, root is perfectly fine, however other standard
>> directories may require specific modes, owners and groups...  (We recently had
>> an issue with sudo creating /var and /var/lib as 0700... which caused failures
>> in other packages.)
>>
>> This causes issues with consistency between recipes as well as potential
>> security implications on multi-user systems.
>>
>> Proposed solution
>> -----------------
>>
> 
> Remove the items below
> 
>> Add a new "DIRS" variable, similar to the existing "FILES", that will specify
>> the directories for a package to own.  By default DIRS = FILES, i.e. DIRS_${PN}
>> ?= FILES_${PN}
>>
>> The purpose of this is to automatically inherit the files list and walk the
>> directories in the same way that existing recipes do it.  Resulting in no change
>> to most recipes, but also giving a package a clear way to override the values
>> and specify select directories to own.
>>
>> A key difference in behavior between the DIRS and FILES methods would be any
>> directory specified with a "/" at the end of the name would avoid walking the
>> directory.  For example, DIRS = /usr/share/foo  would include "foo" and all of
>> the directories under it.  While DIRS = /usr/share/foo/ would simply include
>> "foo", and avoid walking the subdirectories.  Q: Is this confusing behavior?
>>
>> In addition to the above, a new way to exclude directories from being included
>> -- even if in the DIRS list is needed to keep things "simple".
> 
> Remove the items above
> 
> This is thought to be way too confusing, as DIRS is the same as FILES 99% of the
> time.  Instead, the portion below on the EXCLUDEDIRS would be modified to work
> like "FILES".  It would attempt to use globbing to walk directories and such.
> 
> So if you didn't want all of the directories in say ${mandir}, you would add:
> 
> ${mandir}/*
> 
> to the EXCLUDEDIRS.
> 
> This would have the effect of excluding all directories in and under the
> ${mandir} path.
> 
> The only difference in behavior between FILES and EXCLUDEDIRS is that
> directories specified w/o globbing at the end would be treated as just THAT
> directory.  If there is globbing as the last item (ending with a "*"), then
> whatever is found, and those directories contained within will be excluded from
> ownership as well.
> 
>> This requires adding a new variable that that will contain a list of directories
>> that should be ignored when processing the FILES_pkg.  This exclusion list only
>> covers the directories themselves, not the files that would normally be found
>> inside of them.
>>
>> The exclusion variable would be set, by default, to (based on base-files):
>>
>> /tmp ${localstatedir}/volatile/lock ${localstatedir}/volatile/tmp
>> /home ${prefix}/src ${localstatedir}/local
>> /bin /boot /dev ${sysconfdir} ${sysconfdir}/default
>> ${sysconfdir}/skel /lib /mnt /proc /home/root /sbin
>> ${prefix} ${bindir} ${docdir} /usr/games ${includedir}
>> ${libdir} ${sbindir} ${datadir}
>> ${datadir}/common-licenses ${datadir}/dict ${infodir}
>> ${mandir} ${datadir}/misc ${localstatedir}
>> ${localstatedir}/backups ${localstatedir}/lib
>> /sys ${localstatedir}/lib/misc ${localstatedir}/spool
>> ${localstatedir}/volatile ${localstatedir}/volatile/cache
>> ${localstatedir}/volatile/lock/subsys
>> ${localstatedir}/volatile/log
>> ${localstatedir}/volatile/run
>> /mnt /media /media/card /media/cf /media/net /media/ram
>> /media/union /media/realroot /media/hdd
>> /media/mmc1
>> /srv
>> ${prefix}/local ${prefix}/local/bin ${prefix}/local/games
>> ${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin
>> ${prefix}/local/share ${prefix}/local/src
>> /var/mail
>>
>> Assuming the variable is called "EXCLUDEDIRS" (I'm still looking for a good
>> variable name), a recipe would be able to override it for the recipe as a whole,
>> or for the split packages.  Almost all recipes would not need to ever override
>> the value.
>>
>> ----
>>
>> The net result is any existing package will continue to work.
>>
>> A new distribution wide set of directories that regular recipes should not own
>> can be created.
>>
>> And the few key packages that need to own directories can do so, and be sure
>> that they are the exclusive owners.
>>
>> Comments, Suggestions?
>>
>> --Mark
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



