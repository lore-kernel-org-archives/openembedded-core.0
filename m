Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDEB2731D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 00:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u050GabI016481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jan 2016 16:16:36 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jan 2016 16:16:35 -0800
To: Matthias Schiffer <mschiffer@universe-factory.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<f8b6e0a67be1bede97cded62d1ee42aae8b8977b.1451778497.git.mschiffer@universe-factory.net>
	<568AF96A.50302@windriver.com> <568B0443.5090407@universe-factory.net>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <568B0B5D.8000209@windriver.com>
Date: Mon, 4 Jan 2016 18:16:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <568B0443.5090407@universe-factory.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Tue, 05 Jan 2016 00:16:38 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 1/4/16 5:46 PM, Matthias Schiffer wrote:
> On 01/04/2016 11:59 PM, Mark Hatle wrote:
>> On 1/2/16 5:53 PM, Matthias Schiffer wrote:
>>> These directories conflict with the symlinks created for merged-usr setups.
>>>
>>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>>> ---
>>> v2: create both ${base_libdir} and ${nonarch_base_libdir}
>>>
>>>  meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> index b71d5c5..2af7ecd 100644
>>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> @@ -33,8 +33,8 @@ INHIBIT_DEFAULT_DEPS = "1"
>>>  docdir_append = "/${P}"
>>>  dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>>>  dirs2775 = ""
>>> -dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
>>> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
>>> +dirs755 = "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/default \
>>> +           ${sysconfdir}/skel ${base_libdir} ${nonarch_base_libdir} /mnt /proc ${ROOT_HOME} /run ${base_sbindir} \
>>>             ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
>>>             ${libdir} ${sbindir} ${datadir} \
>>>             ${datadir}/common-licenses ${datadir}/dict ${infodir} \
>>>
>>
>> I agree this new set looks correct.. but I'd like to see the corresponding
>> change to fs-perms that sets the permissions and such for each of these new
>> locations.
>>
>> --Mark
>>
> 
> The current meta/files/fs-perms.txt doesn't mention any of /bin, /sbin
> or /lib, and seemingly never did. I guess they could be added, but that
> could also be done in a separate patch (and as I mentioned in another
> mail, I'm not exactly a fan of the fs-perms concept, so I don't really
> care.)

Actually it does:

# Note: all standard config directories are automatically assigned "0755 root
root false - - -"

Actual definition is buried in the code itself, meta/classes/package.bbclass:

    # By default all of the standard directories specified in
    # bitbake.conf will get 0755 root:root.
    target_path_vars = [    'base_prefix',
                'prefix',
                'exec_prefix',
                'base_bindir',
                'base_sbindir',
                'base_libdir',
                'datadir',
                'sysconfdir',
                'servicedir',
                'sharedstatedir',
                'localstatedir',
                'infodir',
                'mandir',
                'docdir',
                'bindir',
                'sbindir',
                'libexecdir',
                'libdir',
                'includedir',
                'oldincludedir' ]

The problem is people have added 'additional' standard directories since that
time and have NOT updated the table.

So likely the following needs to be added (based on the current bitbake.conf):

nonarch_base_libdir
systemd_unitdir
systemd_system_unitdir
nonarch_libdir
systemd_user_unitdir


As mentioned before.. the problem being solved is: If you don't have the table
of system directories and permission.. and you build a package that uses a
standard system directory.. what owner/group/permission does that directory get?

Answer? depends on the package, package manager and other misc things.. this is
a really really bad case on non-deterministic behavior.  If we run through a
table of operations (this internal table and the one in the fs-perms.txt and
other files, if added) then we can synchronize -all- packages in a build with
the configured system setup.

Note, with the way this was designed.. if /bin should NOT be a directory, the
fs-perms.txt (or additional files provided by a configuration) can simply
declare it as a symlink and the original entry goes away.

A distribution definition is a combination of the distro config file, matching
fs-perms settings, and other associated files.  People miss the fs-perms, I
don't know if they don't realize it's there and why it's there or if they assume
it's a one size fits all default configuration.  (The default does fit many
configurations, but not all....)

--Mark


> Matthias
> 


