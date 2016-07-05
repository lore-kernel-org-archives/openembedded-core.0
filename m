Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B3E1A60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 14:10:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u65EAgfI002663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jul 2016 07:10:43 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 07:10:42 -0700
To: Mark Hatle <mark.hatle@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <577BBFE0.9080705@windriver.com>
Date: Tue, 5 Jul 2016 22:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 05 Jul 2016 14:10:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/05/2016 09:10 PM, Mark Hatle wrote:
> On 7/5/16 5:23 AM, Robert Yang wrote:
>> Hi,
>>
>> When run "chmod 0444 <file>" under pseudo, it would always adds
>> write permission for real file (and w + x for dir), which means that
>> it runs as "chmod 0644 <file>". It does this on real file, not record
>> this on pseudo's database. Here are the code from pseudo:
>>
>> /* Root can read and write files, and enter directories which have no
>>    * read, write, or execute permissions.  (But can't execute files without
>>    * execute permissions!)
>>    *
>>    * A non-root user can't.
>>    *
>>    * When doing anything which actually writes to the filesystem, we add in
>>    * the user read/write/execute bits.  When storing to the database, though,
>>    * we mask out any such bits which weren't in the original mode.
>>    */
>> #define PSEUDO_FS_MODE(mode, isdir) (((mode) | S_IRUSR | S_IWUSR | ((isdir) ?
>> S_IXUSR : 0)) & ~(S_IWGRP | S_IWOTH))
>> #define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0722) | ((user_mode &
>> 0722)))
>>
>> It has a side effect for -dbg pkgs if the source files foo.c's mode is 0444:
>> 1) bitbake foo
>> 2) Edit rpm-native
>> 3) bitbake foo
>>
>> After the first bitake foo, we will see that foo.c in foo-dbg is 0444, but
>> after the second bitbake foo, foo.c in foo-dbg will be 0644, because the first
>> build has changed src file foo.c's mode to 0644, this is incorrect.
>>
>> I have two suggestions on it:
>> 1) Don't add more permissions when chmod(e.g., don't change 0444 -> 0644),
>>      The user can add it clearly if a file/dir really needs that.
>
> As noted above, we have to adjust the permissions to writable, or we can not
> make various changes later.  When working as the 'root' user, permissions are
> basically ignored.  So a non-writable file is still writable.  The only way to
> emulate this is to make the actual file writable.
>
> I don't understand how/why on a second run the 0644 is showing up though.
> Unless the pseudo database is wiped -- or the debug commands are not clearing
> the split directories before writing into them, it should be creating new files
> with the new pseudo database that follows the same semantics.
>

I had talked with Mark via IM, why it gets 0644 is because of the code.
fstat = cpath.stat(file) in package.bbclass, this command would get mode
from the real file rather than pseudo's database, and this is expected.
And in the second run, the file's mode had been changed from 0444 to 0644
in the first run, so it would get 0644.

The real problem might be that filesystem such as ext4 doesn't allow
different items of hardlinks have different permissions.

// Robert

>> 2) This mainly affects do_package task AFAIK, the code is:
>>               if not cpath.islink(file):
>>                   os.link(file, fpath)
>>                   fstat = cpath.stat(file)
>>                   os.chmod(fpath, fstat.st_mode)
>>                   os.chown(fpath, fstat.st_uid, fstat.st_gid)
>>
>>      Another solution is checking mode before run chmod, if we really need
>>      run chmod, then copy the file rather than link.
>>
>> Any suggestion is appreciated.
>>
>> The following recipes in oe-core have this issue:
>> blktool
>> coreutils
>> e2fsprogs
>> gnutls
>> guile
>> gzip
>> less
>> lsof
>> mtools
>> opensp
>> parted
>> screen
>> tcp-wrappers
>>
>
>

