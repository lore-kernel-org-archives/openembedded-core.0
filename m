Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA6061EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:26:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M5QfsD016230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2013 22:26:41 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.230]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Wed, 21 Aug 2013 22:26:41 -0700
From: "Sarbu, Florin-Ionut (Florin)" <Florin.Sarbu@windriver.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] procps: Add cgroup support
Thread-Index: AQHOlyy44f53JEd8IUiJuC6HTi2Y8Jmgwdh7
Date: Thu, 22 Aug 2013 05:26:41 +0000
Message-ID: <50D17BD22A23EE4A887974F6B58820389C64D740@ALA-MBA.corp.ad.wrs.com>
References: <1376292144-15493-1-git-send-email-jukka.rissanen@linux.intel.com>
In-Reply-To: <1376292144-15493-1-git-send-email-jukka.rissanen@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.169.187]
MIME-Version: 1.0
Subject: Re: [PATCH v2] procps: Add cgroup support
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
X-List-Received-Date: Thu, 22 Aug 2013 05:26:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This has been merged, but fails for me:=0A=
=0A=
ERROR: Command Error: exit status: 1  Output:=0A=
Applying patch procps-3.2.8-ps-cgroup.patch=0A=
patching file ps/output.c=0A=
Hunk #1 succeeded at 1092 with fuzz 2 (offset -7 lines).=0A=
Hunk #2 FAILED at 1326.=0A=
1 out of 2 hunks FAILED -- rejects in file ps/output.c=0A=
patching file ps/ps.1=0A=
Hunk #1 succeeded at 908 with fuzz 2 (offset 4 lines).=0A=
Patch procps-3.2.8-ps-cgroup.patch can be reverse-applied=0A=
ERROR: Function failed: patch_do_patch=0A=
=0A=
=0A=
Anybody else getting this?=0A=
=0A=
Florin=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Jukka Rissanen [jukka.rissanen@=
linux.intel.com]=0A=
Sent: Monday, August 12, 2013 12:22 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH v2] procps: Add cgroup support=0A=
=0A=
Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>=0A=
---=0A=
Hi,=0A=
=0A=
v2:=0A=
- added Upstream-Status to procps-3.2.8-ps-cgroup.patch file=0A=
=0A=
v1:=0A=
I have been using this patch in meta-eca but it might be useful=0A=
in oe-core.=0A=
=0A=
Cheers,=0A=
Jukka=0A=
=0A=
 .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      | 82 ++++++++++++++++++=
++++=0A=
 meta/recipes-extended/procps/procps_3.2.8.bb       |  1 +=0A=
 2 files changed, 83 insertions(+)=0A=
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-=
ps-cgroup.patch=0A=
=0A=
diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgro=
up.patch b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup=
.patch=0A=
new file mode 100644=0A=
index 0000000..1a29414=0A=
--- /dev/null=0A=
+++ b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patc=
h=0A=
@@ -0,0 +1,82 @@=0A=
+From e529ce0b53f6b73d8b760cd37b23e0397720cede Mon Sep 17 00:00:00 2001=0A=
+From: Daniel Novotny <dnovotny@fedoraproject.org>=0A=
+Date: Mon, 16 Feb 2009 12:22:20 +0000=0A=
+Subject: add cgroup support=0A=
+=0A=
+Rebased for 3.2.8: Andrei Gherzan <andrei.gherzan@windriver.com>=0A=
+=0A=
+Upstream-Status: Pending=0A=
+=0A=
+The patch was imported from the meta-ivi repository=0A=
+(git://git.yoctoproject.org/meta-ivi) as of commit id=0A=
+74b9624fe94b2b90810717a13d481b0db9d2d95a=0A=
+=0A=
+Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>=0A=
+=0A=
+Index: procps-3.2.8/ps/output.c=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+--- procps-3.2.8.orig/ps/output.c      2012-11-15 17:44:05.501337741 +0200=
=0A=
++++ procps-3.2.8/ps/output.c   2012-11-15 17:48:31.585328231 +0200=0A=
+@@ -1099,6 +1099,39 @@=0A=
+   return snprintf(outbuf, COLWID, "*");=0A=
+ }=0A=
+=0A=
++static int pr_cgroup(char *restrict const outbuf, const proc_t *restrict =
const pp){=0A=
++  char filename[48];=0A=
++  FILE *fd;=0A=
++  int counter =3D 0;=0A=
++  int c;=0A=
++  int is_cgroup =3D 0;=0A=
++=0A=
++  outbuf[0]=3D'\0';=0A=
++  snprintf(filename, sizeof filename, "/proc/%d/cgroup", pp->tgid);=0A=
++  fd =3D fopen(filename, "r");=0A=
++  if (likely(fd =3D=3D NULL)) goto fail;=0A=
++  while (( (c =3D fgetc(fd)) !=3D EOF) && (counter<665)) {=0A=
++    if (is_cgroup =3D=3D 0) {=0A=
++      if (c =3D=3D ':') {=0A=
++        is_cgroup =3D 1;=0A=
++        if (counter>0)=0A=
++          outbuf[counter++]=3D';';=0A=
++      }=0A=
++    }else=0A=
++      if ((c =3D=3D '\n') || (c =3D=3D '\0'))=0A=
++        is_cgroup =3D 0;=0A=
++      else=0A=
++        outbuf[counter++]=3Dc;=0A=
++  }=0A=
++  outbuf[counter]=3D'\0';=0A=
++  close(fd);=0A=
++  if (counter>0)=0A=
++    return counter;=0A=
++fail:=0A=
++  outbuf[0] =3D '-';=0A=
++  outbuf[1] =3D '\0';=0A=
++  return 1;=0A=
++}=0A=
+=0A=
+ /****************** FLASK & seLinux security stuff **********************=
/=0A=
+ // move the bulk of this to libproc sometime=0A=
+@@ -1293,6 +1326,7 @@=0A=
+ {"bsdtime",   "TIME",    pr_bsdtime,  sr_nop,     6,   0,    LNX, ET|RIGH=
T},=0A=
+ {"c",         "C",       pr_c,        sr_pcpu,    2,   0,    SUN, ET|RIGH=
T},=0A=
+ {"caught",    "CAUGHT",  pr_sigcatch, sr_nop,     9,   0,    BSD, TO|SIGN=
AL}, /*sigcatch*/=0A=
++{"cgroup",    "CGROUP",  pr_cgroup,   sr_nop,    35,   0,    LNX, PO|LEFT=
},  /* cgroups*/=0A=
+ {"class",     "CLS",     pr_class,    sr_sched,   3,   0,    XXX, TO|LEFT=
},=0A=
+ {"cls",       "CLS",     pr_class,    sr_sched,   3,   0,    HPU, TO|RIGH=
T}, /*says HPUX or RT*/=0A=
+ {"cmaj_flt",  "-",       pr_nop,      sr_cmaj_flt, 1,  0,    LNX, AN|RIGH=
T},=0A=
+Index: procps-3.2.8/ps/ps.1=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
+--- procps-3.2.8.orig/ps/ps.1  2012-11-15 17:44:50.845336117 +0200=0A=
++++ procps-3.2.8/ps/ps.1       2012-11-15 17:49:09.621326859 +0200=0A=
+@@ -904,6 +904,10 @@=0A=
+ displayed.  (alias\ \fBsig_catch\fR,\ \fBsigcatch\fR).=0A=
+ T}=0A=
+=0A=
++cgroup        CGROUP  T{=0A=
++display control groups to which the process belonges.=0A=
++t}=0A=
++=0A=
+ class CLS     T{=0A=
+ scheduling class of the process.  (alias\ \fBpolicy\fR,\ \fBcls\fR).=0A=
+ Field's possible values are:=0A=
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-ex=
tended/procps/procps_3.2.8.bb=0A=
index 8436d4a..e4b82e0 100644=0A=
--- a/meta/recipes-extended/procps/procps_3.2.8.bb=0A=
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb=0A=
@@ -10,6 +10,7 @@ SRC_URI +=3D "file://procmodule.patch \=0A=
             file://gnu-kbsd-version.patch \=0A=
             file://60_linux_version_init.patch \=0A=
             file://procps-3.2.7-top-remcpu.patch \=0A=
+            file://procps-3.2.8-ps-cgroup.patch \=0A=
            "=0A=
=0A=
 SRC_URI[md5sum] =3D "9532714b6846013ca9898984ba4cd7e0"=0A=
--=0A=
1.7.11.7=0A=
=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

