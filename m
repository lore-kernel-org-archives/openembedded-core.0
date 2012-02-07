Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ruo5N-00013z-SX
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:40:07 +0100
Received: by lahc1 with SMTP id c1so4210757lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=zHbXLLl9vCMhjBBMM12StitPg6kl41Ppv+lBl7MTUHU=;
	b=GpCw7l+GIH9i+m+GVmQIilNVvNm5iPIBG3rBQETMnpuVO6GcGPG2VJEb8cW7cxH5Hc
	exWW1LWQ6+f+7j+0DLcBoUQWVHCjUUByfp4D1f/Z8R9oVe2X0FjPbC6hX2emp1QefKPa
	O3nQnqCFdcwSaxzCPMHILCyyqbncojoK7OaBQ=
Received: by 10.112.28.169 with SMTP id c9mr6467580lbh.42.1328632323284; Tue,
	07 Feb 2012 08:32:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 08:31:33 -0800 (PST)
In-Reply-To: <4F314FA2.6060708@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<633b2b23bbddb8cb2b0aa1d75ee82b9826d1de55.1328510188.git.raj.khem@gmail.com>
	<4F314FA2.6060708@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 08:31:33 -0800
Message-ID: <CAMKF1sqQQLVBUarw50B33DmD9G_YNrG7QpJj8-LgtygO8j3O+w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/20] pseudo: Wrap renameat and opendir
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
X-List-Received-Date: Tue, 07 Feb 2012 16:40:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 8:21 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/pseudo/pseudo/opendir.patch =C2=A0| =C2=A0 9=
2 ++++++++
>> =C2=A0meta/recipes-devtools/pseudo/pseudo/renameat.patch | =C2=A0227
>> ++++++++++++++++++++
>> =C2=A0meta/recipes-devtools/pseudo/pseudo_1.2.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A06 +-
>> =C2=A03 files changed, 323 insertions(+), 2 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.pat=
ch
>> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.pa=
tch
>>
>> diff --git a/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>> b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>> new file mode 100644
>> index 0000000..d20f717
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/pseudo/opendir.patch
>> @@ -0,0 +1,92 @@
>> +commit 162f2692c399b93311652201a940fdaf9c9e6924
>> +Author: Peter Seebach<peter.seebach@windriver.com>
>> +Date: =C2=A0 Thu Feb 2 11:45:42 2012 -0600
>> +
>> + =C2=A0 =C2=A0Make opendir/closedir stash and forget directory names.
>> +
>> + =C2=A0 =C2=A0The dirfd(DIR *) interface allows you to get the fd for a=
 DIR *,
>> + =C2=A0 =C2=A0meaning you can use it with openat(), meaning you can nee=
d its
>> + =C2=A0 =C2=A0path. =C2=A0This causes a segfault. =C2=A0Also gonna fix =
the base_path
>> + =C2=A0 =C2=A0code not to segfault in that case, but first fix the unde=
rlying
>> + =C2=A0 =C2=A0problem.
>> +
>
>
> Missing Upstream-Status: and Signed-off-by (yes I know we have an email
> header).

they are backports

>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>> +diff --git a/ChangeLog.txt b/ChangeLog.txt
>> +index 4de488c..9625b38 100644
>> +--- a/ChangeLog.txt
>> ++++ b/ChangeLog.txt
>> +@@ -1,3 +1,7 @@
>> ++2012-02-02:
>> ++ =C2=A0 =C2=A0 =C2=A0* (seebs) stash dir name for DIR * from opendir u=
sing dirfd.
>> ++ =C2=A0 =C2=A0 =C2=A0* (seebs) add closedir.
>> ++
>> + 2011-11-02:
>> + =C2=A0 =C2=A0 =C2=A0 * (seebs) Call this 1.2 because the UNLOAD change=
 is moderately
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 significant, and so's the clone change.
>> +diff --git a/ports/unix/guts/closedir.c b/ports/unix/guts/closedir.c
>> +new file mode 100644
>> +index 0000000..1085361
>> +--- /dev/null
>> ++++ b/ports/unix/guts/closedir.c
>> +@@ -0,0 +1,20 @@
>> ++/*
>> ++ * Copyright (c) 2012 Wind River Systems; see
>> ++ * guts/COPYRIGHT for information.
>> ++ *
>> ++ * static int
>> ++ * wrap_closedir(DIR *dirp) {
>> ++ * =C2=A0 =C2=A0int rc =3D -1;
>> ++ */
>> ++ =C2=A0 =C2=A0 =C2=A0if (!dirp) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EFAULT;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0int fd =3D dirfd(dirp);
>> ++ =C2=A0 =C2=A0 =C2=A0pseudo_client_op(OP_CLOSE, 0, fd, -1, 0, 0);
>> ++ =C2=A0 =C2=A0 =C2=A0rc =3D real_closedir(dirp);
>> ++
>> ++/* =C2=A0 =C2=A0return rc;
>> ++ * }
>> ++ */
>> +diff --git a/ports/unix/guts/opendir.c b/ports/unix/guts/opendir.c
>> +index 8eaa71f..e69717e 100644
>> +--- a/ports/unix/guts/opendir.c
>> ++++ b/ports/unix/guts/opendir.c
>> +@@ -6,8 +6,25 @@
>> + =C2=A0* wrap_opendir(const char *path) {
>> + =C2=A0* =C2=A0 =C2=A0DIR * rc =3D NULL;
>> + =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0struct stat buf;
>> ++ =C2=A0 =C2=A0 =C2=A0int save_errno;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 rc =3D real_opendir(path);
>> ++ =C2=A0 =C2=A0 =C2=A0if (rc) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_errno =3D errno;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D dirfd(rc);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (real_fstat(fd,&bu=
f) =3D=3D -1) {
>>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pseudo_debug(1, "diropen (fd %d) succeeded, but
>> fstat failed (%s).\n",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd, strerror(errno));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pseudo_client_op_plain(OP_OPEN, PSA_READ, fd, -1,
>> path, 0);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pseudo_client_op_plain(OP_OPEN, PSA_READ, fd, -1,
>> path,&buf);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D save_errno;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> +
>> + /* =C2=A0 =C2=A0return rc;
>> + =C2=A0* }
>> +diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
>> +index e06e404..32250c4 100644
>> +--- a/ports/unix/wrapfuncs.in
>> ++++ b/ports/unix/wrapfuncs.in
>> +@@ -21,6 +21,7 @@ long pathconf(const char *path, int name);
>> + char *realpath(const char *name, char *resolved_name); /*
>> version=3D"GLIBC_2.3" */
>> + int remove(const char *path); /* flags=3DAT_SYMLINK_NOFOLLOW */
>> + DIR *opendir(const char *path);
>> ++int closedir(DIR *dirp);
>> + char *tempnam(const char *template, const char *pfx);
>> + char *tmpnam(char *s);
>> + int truncate(const char *path, off_t length);
>> diff --git a/meta/recipes-devtools/pseudo/pseudo/renameat.patch
>> b/meta/recipes-devtools/pseudo/pseudo/renameat.patch
>> new file mode 100644
>> index 0000000..74c8585
>> --- /dev/null
>> +++ b/meta/recipes-devtools/pseudo/pseudo/renameat.patch
>> @@ -0,0 +1,227 @@
>> +commit 795f2b44b7f692151556782f142a4a6e7d45d892
>> +Author: Peter Seebach<peter.seebach@windriver.com>
>> +Date: =C2=A0 Thu Feb 2 15:49:21 2012 -0600
>> +
>> + =C2=A0 =C2=A0Implement renameat()
>> +
>> + =C2=A0 =C2=A0After three long years, someone tried to use this. =C2=A0=
This was
>> impossibly
>> + =C2=A0 =C2=A0hard back when pseudo was written, because there was only=
 one dirfd
>> + =C2=A0 =C2=A0provided for. =C2=A0Thing is, now, the canonicalization h=
appens in
>> wrapfuncs,
>> + =C2=A0 =C2=A0so a small tweak to makewrappers to recognize that oldpat=
h should use
>> + =C2=A0 =C2=A0olddirfd if it exists is enough to get us fully canonical=
ized paths
>> + =C2=A0 =C2=A0when needed.
>> +
>> + =C2=A0 =C2=A0Also fix the crash if base_path gets called with an fd fo=
r which we
>> have
>> + =C2=A0 =C2=A0no path.
>> +
>> +diff --git a/ChangeLog.txt b/ChangeLog.txt
>> +index 9625b38..25bd463 100644
>> +--- a/ChangeLog.txt
>> ++++ b/ChangeLog.txt
>> +@@ -1,6 +1,9 @@
>> + 2012-02-02:
>> + =C2=A0 =C2=A0 =C2=A0 * (seebs) stash dir name for DIR * from opendir u=
sing dirfd.
>> + =C2=A0 =C2=A0 =C2=A0 * (seebs) add closedir.
>> ++ =C2=A0 =C2=A0 =C2=A0* (seebs) add initial pass at renameat()
>> ++ =C2=A0 =C2=A0 =C2=A0* (seebs) in base_path, don't try to strlen the r=
esult if
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_path() returns NULL.
>> +
>> + 2011-11-02:
>> + =C2=A0 =C2=A0 =C2=A0 * (seebs) Call this 1.2 because the UNLOAD change=
 is moderately
>> +diff --git a/makewrappers b/makewrappers
>> +index 20bbf2b..bf344d6 100755
>> +--- a/makewrappers
>> ++++ b/makewrappers
>> +@@ -211,12 +211,13 @@ class Function:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.flags =3D '0'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.port =3D port
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.directory =3D ''
>> +- =C2=A0 =C2=A0 =C2=A0self.version =3D 'NULL'
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.version =3D 'NULL'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # On Darwin, some functions are SECRETLY c=
onverted to
>> foo$INODE64
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # when called. =C2=A0So we have to look th=
ose up for real_*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.inode64 =3D None
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.real_func =3D None
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.paths_to_munge =3D []
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.dirfds =3D {}
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.hand_wrapped =3D None
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # used for the copyright date when creatin=
g stub functions
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.date =3D datetime.date.today().year
>> +@@ -239,6 +240,7 @@ class Function:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # * If the arg has a name ending in 'path'=
, we will canonicalize
>> it.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # * If the arg is named 'dirfd' or 'flags'=
, it becomes the
>> default
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 values for the dirfd and flags ar=
guments when
>> canonicalizing.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0# * If the name ends in dirfd, we do the s=
ame fancy stuff.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # * Note that the "comments" field (/* ...=
 */ after the decl)
>> can
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 override the dirfd/flags values.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args =3D ArgumentList(bits.group(2))
>> +@@ -246,7 +248,9 @@ class Function:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # ignore varargs, they never=
 get these special treatments
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if arg.vararg:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg.name =3D=3D 'dirfd'=
:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg.name[-5:] =3D=3D 'd=
irfd':
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(arg.nam=
e)> =C2=A05:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
self.dirfds[arg.name[:-5]] =3D True
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.dirfd =3D=
 'dirfd'
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg.name =3D=3D 'flags'=
:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.flags =3D=
 'flags'
>> +@@ -325,9 +329,13 @@ class Function:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 """create/allocate canonical paths"""
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 alloc_paths =3D []
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in self.paths_to_munge:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix =3D path[:-4]
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not prefix in self.dirfds:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix =3D ''
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print "for path %s: prefix<%=
s>" % ( path, prefix )
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alloc_paths.append(
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s =3D pseudo=
_root_path(__func__, __LINE__, %s, %s, %s);"
>> %
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path, self.di=
rfd, path, self.flags))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s =3D pseudo=
_root_path(__func__, __LINE__, %s%s, %s,
>> %s);" %
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path, prefix,=
 self.dirfd, path, self.flags))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 return "\n\t\t\t".join(alloc_paths)
>> +
>> + =C2=A0 =C2=A0 def free_paths(self):
>> +diff --git a/ports/unix/guts/renameat.c b/ports/unix/guts/renameat.c
>> +index c8203b7..f13cd1e 100644
>> +--- a/ports/unix/guts/renameat.c
>> ++++ b/ports/unix/guts/renameat.c
>> +@@ -1,15 +1,111 @@
>> + /*
>> +- * Copyright (c) 2008-2010 Wind River Systems; see
>> ++ * Copyright (c) 2008-2012 Wind River Systems; see
>> + =C2=A0* guts/COPYRIGHT for information.
>> + =C2=A0*
>> + =C2=A0* static int
>> + =C2=A0* wrap_renameat(int olddirfd, const char *oldpath, int newdirfd,=
 const
>> char *newpath) {
>> + =C2=A0* =C2=A0 =C2=A0int rc =3D -1;
>> + =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0pseudo_msg_t *msg;
>> ++ =C2=A0 =C2=A0 =C2=A0struct stat oldbuf, newbuf;
>> ++ =C2=A0 =C2=A0 =C2=A0int oldrc, newrc;
>> ++ =C2=A0 =C2=A0 =C2=A0int save_errno;
>> ++ =C2=A0 =C2=A0 =C2=A0int old_db_entry =3D 0;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0pseudo_diag("help! unimplemented renameat [%s -> =
=C2=A0%s].\n",
>> oldpath, newpath);
>> ++ =C2=A0 =C2=A0 =C2=A0pseudo_debug(2, "renameat: %d,%s->%d,%s\n",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0olddirfd, oldpath ? o=
ldpath : "<nil>",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newdirfd, newpath ? n=
ewpath : "<nil>");
>> ++
>> ++#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> ++ =C2=A0 =C2=A0 =C2=A0if (olddirfd !=3D AT_FDCWD || newdirfd !=3D AT_FD=
CWD) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOSYS;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++#endif
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0if (!oldpath || !newpath) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EFAULT;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0save_errno =3D errno;
>> ++
>> ++#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>> ++ =C2=A0 =C2=A0 =C2=A0newrc =3D real_lstat(newpath,&newbuf);
>> ++ =C2=A0 =C2=A0 =C2=A0oldrc =3D real_lstat(oldpath,&oldbuf);
>> ++#else
>> ++ =C2=A0 =C2=A0 =C2=A0oldrc =3D real___fxstatat(_STAT_VER, olddirfd, ol=
dpath,&oldbuf,
>> AT_SYMLINK_NOFOLLOW);
>> ++ =C2=A0 =C2=A0 =C2=A0newrc =3D real___fxstatat(_STAT_VER, newdirfd, ne=
wpath,&newbuf,
>> AT_SYMLINK_NOFOLLOW);
>>
>> ++#endif
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0errno =3D save_errno;
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0/* newpath must be removed. */
>> ++ =C2=A0 =C2=A0 =C2=A0/* as with unlink, we have to mark that the file =
may get deleted
>> */
>> ++ =C2=A0 =C2=A0 =C2=A0msg =3D pseudo_client_op_plain(OP_MAY_UNLINK, 0, =
-1, newdirfd,
>> newpath, newrc ? NULL :&newbuf);
>> ++ =C2=A0 =C2=A0 =C2=A0if (msg&& =C2=A0msg->result =3D=3D RESULT_SUCCEED=
)
>>
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_db_entry =3D 1;
>> + =C2=A0 =C2=A0 =C2=A0 rc =3D real_renameat(olddirfd, oldpath, newdirfd,=
 newpath);
>> ++ =C2=A0 =C2=A0 =C2=A0save_errno =3D errno;
>> ++ =C2=A0 =C2=A0 =C2=A0if (old_db_entry) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D -1) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* since we failed, that wasn't really unlinked --
>> put
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * it back.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pseudo_client_op_plain(OP_CANCEL_UNLINK, 0, -1,
>> newdirfd, newpath,&newbuf);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* confirm that the file was removed */
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pseudo_client_op_plain(OP_DID_UNLINK, 0, -1,
>> newdirfd, newpath,&newbuf);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D -1) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and we're done. */
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D save_errno;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0save_errno =3D errno;
>> ++ =C2=A0 =C2=A0 =C2=A0/* nothing to do for a "rename" of a link to itse=
lf */
>> ++ =C2=A0 =C2=A0 =C2=A0if (newrc !=3D -1&& =C2=A0oldrc !=3D -1&&
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newbuf.st_dev =3D=3D oldbuf.st_dev&=
&
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newbuf.st_ino =3D=3D oldbuf.st_ino)=
 {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0/* rename(3) is not mv(1). =C2=A0rename(file, dir=
) fails; you must
>> provide
>> ++ =C2=A0 =C2=A0 =C2=A0 * the corrected path yourself. =C2=A0You can ren=
ame over a directory
>> only
>> ++ =C2=A0 =C2=A0 =C2=A0 * if the source is a directory. =C2=A0Symlinks a=
re simply removed.
>> ++ =C2=A0 =C2=A0 =C2=A0 *
>> ++ =C2=A0 =C2=A0 =C2=A0 * If we got here, the real rename call succeeded=
. =C2=A0That means
>> newpath
>> ++ =C2=A0 =C2=A0 =C2=A0 * has been unlinked and oldpath has been linked =
to it.
>> ++ =C2=A0 =C2=A0 =C2=A0 *
>> ++ =C2=A0 =C2=A0 =C2=A0 * There are a ton of special cases to error chec=
k. =C2=A0I don't check
>> ++ =C2=A0 =C2=A0 =C2=A0 * for any of them, because in every such case, t=
he underlying
>> rename
>> ++ =C2=A0 =C2=A0 =C2=A0 * failed, and there is nothing to do.
>> ++ =C2=A0 =C2=A0 =C2=A0 * The only tricky part is that, because we used =
to ignore
>> symlinks,
>> ++ =C2=A0 =C2=A0 =C2=A0 * we may have to rename or remove directory tree=
s even though in
>> ++ =C2=A0 =C2=A0 =C2=A0 * theory rename can never destroy a directory tr=
ee.
>> ++ =C2=A0 =C2=A0 =C2=A0 */
>> ++ =C2=A0 =C2=A0 =C2=A0if (!old_db_entry) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* create an entry un=
der the old name, which will then be
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * renamed; this way,=
 children would get renamed too, if
>> there
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * were any.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (newrc =3D=3D 0) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (newbuf.st_dev !=3D oldbuf.st_dev) {
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oldbuf.st_dev =3D newbuf.st_dev;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oldbuf.st_ino =3D newbuf.st_ino;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_debug(1, "crea=
ting new '%s' [%llu] to rename\n",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0oldpath, (unsigned long long) oldbuf.st_ino);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_client_op_plai=
n(OP_LINK, 0, -1, olddirfd,
>> oldpath,&oldbuf);
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0/* special case: use 'fd' for olddirfd, because
>> ++ =C2=A0 =C2=A0 =C2=A0 * we know it has no other meaning for RENAME
>> ++ =C2=A0 =C2=A0 =C2=A0 */
>> ++ =C2=A0 =C2=A0 =C2=A0pseudo_client_op_plain(OP_RENAME, 0, olddirfd, ne=
wdirfd,
>> newpath,&oldbuf, oldpath);
>>
>> +
>> ++ =C2=A0 =C2=A0 =C2=A0errno =3D save_errno;
>> + /* =C2=A0 =C2=A0return rc;
>> + =C2=A0* }
>> + =C2=A0*/
>> +diff --git a/pseudo_client.c b/pseudo_client.c
>> +index 48607c2..4a30420 100644
>> +--- a/pseudo_client.c
>> ++++ b/pseudo_client.c
>> +@@ -988,6 +988,8 @@ base_path(int dirfd, const char *path, int
>> leave_last) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dirfd !=3D -1&& =
=C2=A0dirfd !=3D AT_FDCWD) {
>>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (dirfd>=3D 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basepath =3D fd_path(dirfd);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (basepath) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 baselen =3D strlen(basepath);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_diag("got *at() syscall for unkno=
wn
>> directory, fd %d\n", dirfd);
>> +@@ -1128,7 +1130,10 @@ pseudo_client_op(pseudo_op_t op, int access, int
>> fd, int dirfd, const char *path
>> + =C2=A0 =C2=A0 =C2=A0 if (path) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(2, " %s"=
, path);
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +- =C2=A0 =C2=A0 =C2=A0if (fd !=3D -1) {
>> ++ =C2=A0 =C2=A0 =C2=A0/* for OP_RENAME in renameat, "fd" is also used f=
or the
>> ++ =C2=A0 =C2=A0 =C2=A0 * second dirfd.
>> ++ =C2=A0 =C2=A0 =C2=A0 */
>> ++ =C2=A0 =C2=A0 =C2=A0if (fd !=3D -1&& =C2=A0op !=3D OP_RENAME) {
>>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(2, " [fd=
 %d]", fd);
>> + =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 if (buf) {
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.2.bb
>> b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
>> index f2ebc22..04bcbce 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_1.2.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_1.2.bb
>> @@ -1,10 +1,12 @@
>> =C2=A0require pseudo.inc
>>
>> -PR =3D "r4"
>> +PR =3D "r5"
>>
>> =C2=A0SRC_URI =3D
>> "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://oe-config.patch \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://static_sqlite.patch"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://static_sqlite.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opendir.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://renameat.patch"
>>
>> =C2=A0SRC_URI[md5sum] =3D "a2819084bab7e991f06626d02cf55048"
>> =C2=A0SRC_URI[sha256sum] =3D
>> "4749a22df687f44d24c26e97170d4781a1bd52d5ee092364a40877e4d96ff058"


