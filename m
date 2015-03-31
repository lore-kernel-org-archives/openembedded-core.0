Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3D4473C86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 18:23:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2VIN1mt015119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 11:23:01 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Tue, 31 Mar 2015 11:23:01 -0700
Message-ID: <551AE604.6090804@windriver.com>
Date: Tue, 31 Mar 2015 13:23:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <87d23uibxw.fsf@email.parenteses.org>	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org>
In-Reply-To: <87wq1xgk2j.fsf@email.parenteses.org>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 18:23:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
> Hi Ross,
> 
> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
> 
>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>
>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>     However, its content has the right ownership.
>>
>> Looks like a bug in pseudo to me, can you file a bug for that?
> 
> Sure.  Filed #7554.

I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.

The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
function.  I don't know why 'foo' would be, but if it's a standard defined
variable -- or if 'directory walking' is enabled it could end up doing this as well.

The control file for this is in meta/files/fs-perms.txt (unless otherwise
defined by a distribution or other configuration file.)

Format of the file is:

# The format of this file
#
#<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
#
# or
#
#<path> link <target>
#
# <path>: directory path
# <mode>: mode for directory
# <uid>:  uid for directory
# <gid>:  gid for directory
# <walk>: recursively walk the directory?  true or false
# <fmode>: if walking, new mode for files
# <fuid>:  if walking, new uid for files
# <fgid>:  if walking, new gid for files
# <target>: turn the directory into a symlink point to target

The default is:

base_prefix	0755 root root false - - -
prefix		0755 root root false - - -
exec_prefix	0755 root root false - - -
base_bindir	0755 root root false - - -
base_sbindir	0755 root root false - - -
base_libdir	0755 root root false - - -
datadir		0755 root root false - - -
sysconfdir	0755 root root false - - -
servicedir	0755 root root false - - -
sharedstatedir	0755 root root false - - -
localstatedir	0755 root root false - - -
infodir		0755 root root false - - -
mandir		0755 root root false - - -
docdir		0755 root root false - - -
bindir		0755 root root false - - -
sbindir		0755 root root false - - -
libexecdir	0755 root root false - - -
libdir		0755 root root false - - -
includedir	0755 root root false - - -
oldincludedir	0755 root root false - - -

The easiest way to debug all of this is to edit meta/classes/package.bbclass,
find the following lines:

    # Debug -- list out in-memory table
    #for dir in fs_perms_table:
    #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))

remove the '#' from the 'for' and following lines, then inspect the table from
the build logs.

Similarly, you can trace the actual fixups, by searching for def fix_perms(path,
mode, uid, gid, dir):, and removing the comment from the two bb.note entries.

This should give you an idea if this code is replacing your value with it's own.

(I give this a VERY low probability that it's a bug in pseudo.)

--Mark

> Best wishes.
> Mario
> 


