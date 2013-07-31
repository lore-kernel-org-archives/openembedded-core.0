Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D2F036A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 12:15:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2013 05:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="378893669"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2013 05:15:15 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.83]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.49]) with mapi id
	14.03.0123.003; Wed, 31 Jul 2013 13:14:39 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] makedevs: Change numeric user/group ids to
	user/group names in device table
Thread-Index: AQHOjQmh/CaQ+cm71US4Icd73yiI8Zl9Py4AgAFwfLA=
Date: Wed, 31 Jul 2013 12:14:38 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF15E7FD67@IRSMSX101.ger.corp.intel.com>
References: <1375177516-9199-1-git-send-email-mihai.prica@intel.com>
	<51F7D42E.2010802@linux.intel.com>
In-Reply-To: <51F7D42E.2010802@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: Change numeric user/group ids to user/group names in device table
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
X-List-Received-Date: Wed, 31 Jul 2013 12:15:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, July 30, 2013 5:57 PM
> To: Prica, Mihai
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] makedevs: Change numeric user/group ids to
> user/group names in device table
>=20
> On 07/30/2013 02:45 AM, Mihai Prica wrote:
> > Full usernames and groupnames should be used instead  of numeric ids
> > in meta/files/device_table-minimal.txt.
> >
>=20
> I think this will uses the host's files not the target's rootfs, please v=
erify this.
>=20
> Thanks
> 	Sau!

I used strace and it seems it tries to use the files on the rootfs but they=
 don't exist=20
when the check is done so the files on the host are used instead. The base-=
passwd
package which installs the /etc/passwd and /etc/group files is installed la=
tter in the
rootfs generation process. I'll search for a solution to this problem or fo=
r another=20
approach.

Thanks,
Mihai
>=20
>=20
> > [YOCTO #1159]
> >
> > Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> > ---
> >   meta/files/device_table-minimal.txt                |   47 ++++++++++-=
---------
> >   .../makedevs/makedevs-1.0.0/makedevs.c             |   23 ++++++++--
> >   2 files changed, 43 insertions(+), 27 deletions(-)
> >
> > diff --git a/meta/files/device_table-minimal.txt
> > b/meta/files/device_table-minimal.txt
> > index 02ed534..41c6e0b 100644
> > --- a/meta/files/device_table-minimal.txt
> > +++ b/meta/files/device_table-minimal.txt
> > @@ -1,5 +1,5 @@
> > -#<path>	<type> <mode>	<uid>	<gid>	<major>	<minor>
> 	<start>	<inc>	<count>
> > -#/dev/mem    c      640      0       0       1       1       0        =
0        -
> > +#<path>	<type> <mode>	<username>	<groupname>	<major>
> 	<minor>	<start>	<inc>	<count>
> > +#/dev/mem    c      640      root       root       1       1       0  =
      0        -
> >   #
> >   #type can be one of:
> >   #    f	A regular file
> > @@ -8,24 +8,25 @@
> >   #    b	Block special device file
> >   #    p	Fifo (named pipe)
> >
> > -/dev		d	755	0	0	-	-	-	-	-
> > -/dev/initctl	p	600	0	0	-	-	-	-	-
> > -/dev/apm_bios	c	660	0	46	10	134	-	-
> 	-
> > -/dev/fb0	c	600	0	0	29	0	-	-	-
> > -/dev/hda	b	660	0	6	3	0	-	-	-
> > -/dev/hda	b	660	0	6	3	1	1	1	19
> > -/dev/kmem	c	640	0	15	1	2	-	-	-
> > -/dev/kmsg	c	600	0	0	1	11	-	-	-
> > -/dev/mem	c	640	0	15	1	1	-	-	-
> > -/dev/null	c	666	0	0	1	3	-	-	-
> > -/dev/ram	b	640	0	0	1	0	0	1	4
> > -/dev/tty	c	662	0	5	5	0	-	-	-
> > -/dev/tty	c	666	0	5	4	0	0	1	9
> > -/dev/ttyS	c	640	0	5	4	64	0	1	1
> > -/dev/ttySA	c	640	0	5	204	5	0	1	1
> > -/dev/zero	c	644	0	0	1	5	-	-	-
> > -/dev/mtd	c	660	0	6	90	0	0	2	8
> > -/dev/mtdblock	b	640	0	0	31	0	0	1
> 	8
> > -/dev/console	c	662	0	5	5	1	-	-
> 	-
> > -/dev/random	c	644	0	0	1	8	-	-
> 	-
> > -/dev/urandom	c	644	0	0	1	9	-	-
> 	-
> > +/dev		d	755	root	root	-	-	-	-
> 	-
> > +/dev/initctl	p	600	root	root	-	-	-	-	-
> > +/dev/apm_bios	c	660	root	plugdev	10	134	-
> 	-	-
> > +/dev/fb0	c	600	root	root	29	0	-	-	-
> > +/dev/hda	b	660	root	disk	3	0	-	-	-
> > +/dev/hda	b	660	root	disk	3	1	1	1	20
> > +/dev/kmem	c	640	root	kmem	1	2	-	-	-
> > +/dev/kmsg	c	600	root	root	1	11	-	-	-
> > +/dev/mem	c	640	root	kmem	1	1	-	-	-
> > +/dev/null	c	666	root	root	1	3	-	-	-
> > +/dev/ram	b	640	root	root	1	0	0	1	4
> > +/dev/tty	c	662	root    tty	5	0	-	-	-
> > +/dev/tty	c	666	root	tty	4	0	0	1	9
> > +/dev/ttyS	c	640	root	tty	4	64	0	1	1
> > +/dev/ttySA	c	640	root	tty	204	5	0	1	1
> > +/dev/zero	c	644	root	root	1	5	-	-	-
> > +/dev/mtd	c	660	root	disk	90	0	0	2	8
> > +/dev/mtdblock	b	640	root	root	0	31	0	0
> 	1	8
> > +/dev/console	c	662	root	root	5	1	-	-
> 	-
> > +/dev/random	c	644	root	root	1	8	-	-
> 	-
> > +/dev/urandom	c	644	root	root	1	9	-	-
> 	-
> > +
> > diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> > b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> > index 6c1f2fb..26bbe33 100644
> > --- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> > +++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> > @@ -13,6 +13,8 @@
> >   #include <libgen.h>
> >   #include <sys/types.h>
> >   #include <sys/stat.h>
> > +#include <pwd.h>
> > +#include <grp.h>
> >
> >   #define MINORBITS	8
> >   #define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
> > @@ -180,13 +182,15 @@ static void add_new_fifo(char *name, char *path,
> unsigned long uid,
> >   */
> >   static int interpret_table_entry(char *line)
> >   {
> > -	char *name;
> > -	char path[4096], type;
> > +	char *name;
> > +	char path[4096], username[32], groupname[32], type;
> >   	unsigned long mode =3D 0755, uid =3D 0, gid =3D 0, major =3D 0, mino=
r =3D 0;
> >   	unsigned long start =3D 0, increment =3D 1, count =3D 0;
> > +	struct passwd *pw;
> > +	struct group *gr;
> >
> > -	if (0 > sscanf(line, "%40s %c %lo %lu %lu %lu %lu %lu %lu %lu", path,
> > -		    &type, &mode, &uid, &gid, &major, &minor, &start,
> > +	if (0 > sscanf(line, "%40s %c %lo %s %s %lu %lu %lu %lu %lu", path,
> > +		    &type, &mode, &username, &groupname, &major, &minor,
> &start,
> >   		    &increment, &count))
> >   	{
> >   		return 1;
> > @@ -198,6 +202,17 @@ static int interpret_table_entry(char *line)
> >   	name =3D xstrdup(path + 1);
> >   	sprintf(path, "%s/%s", rootdir, name);
> >
> > +	pw =3D getpwnam(username);
> > +	if (pw =3D=3D NULL) {
> > +		error_msg_and_die("Username does not exist in the user
> database");
> > +	}
> > +	uid =3D pw->pw_uid;
> > +	gr =3D getgrnam(groupname);
> > +	if (gr =3D=3D NULL) {
> > +		error_msg_and_die("Groupname does not exist in the group
> database ");
> > +	}
> > +	gid =3D gr->gr_gid;
> > +
> >   	switch (type) {
> >   	case 'd':
> >   		mode |=3D S_IFDIR;
> >

