Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71C4360116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 10:23:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u65ANe7i000830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jul 2016 03:23:40 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 03:23:39 -0700
To: oe-core <openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <577B8AA9.5040808@windriver.com>
Date: Tue, 5 Jul 2016 18:23:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: About pseudo's chmod
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
X-List-Received-Date: Tue, 05 Jul 2016 10:23:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When run "chmod 0444 <file>" under pseudo, it would always adds
write permission for real file (and w + x for dir), which means that
it runs as "chmod 0644 <file>". It does this on real file, not record
this on pseudo's database. Here are the code from pseudo:

/* Root can read and write files, and enter directories which have no
  * read, write, or execute permissions.  (But can't execute files without
  * execute permissions!)
  *
  * A non-root user can't.
  *
  * When doing anything which actually writes to the filesystem, we add in
  * the user read/write/execute bits.  When storing to the database, though,
  * we mask out any such bits which weren't in the original mode.
  */
#define PSEUDO_FS_MODE(mode, isdir) (((mode) | S_IRUSR | S_IWUSR | ((isdir) ? 
S_IXUSR : 0)) & ~(S_IWGRP | S_IWOTH))
#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0722) | ((user_mode & 
0722)))

It has a side effect for -dbg pkgs if the source files foo.c's mode is 0444:
1) bitbake foo
2) Edit rpm-native
3) bitbake foo

After the first bitake foo, we will see that foo.c in foo-dbg is 0444, but
after the second bitbake foo, foo.c in foo-dbg will be 0644, because the first
build has changed src file foo.c's mode to 0644, this is incorrect.

I have two suggestions on it:
1) Don't add more permissions when chmod(e.g., don't change 0444 -> 0644),
    The user can add it clearly if a file/dir really needs that.
2) This mainly affects do_package task AFAIK, the code is:
             if not cpath.islink(file):
                 os.link(file, fpath)
                 fstat = cpath.stat(file)
                 os.chmod(fpath, fstat.st_mode)
                 os.chown(fpath, fstat.st_uid, fstat.st_gid)

    Another solution is checking mode before run chmod, if we really need
    run chmod, then copy the file rather than link.

Any suggestion is appreciated.

The following recipes in oe-core have this issue:
blktool
coreutils
e2fsprogs
gnutls
guile
gzip
less
lsof
mtools
opensp
parted
screen
tcp-wrappers

-- 
Thanks

Robert

