Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SBCAI-0005YL-3N
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 22:36:54 +0100
Received: from mail39-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Mar 2012 21:12:41 +0000
Received: from mail39-ch1 (localhost [127.0.0.1])	by mail39-ch1-R.bigfish.com
	(Postfix) with ESMTP id B9A1980534	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 21:12:40 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail39-ch1 (localhost.localdomain [127.0.0.1]) by mail39-ch1
	(MessageSwitch) id 133253715858995_10496;
	Fri, 23 Mar 2012 21:12:38 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail39-ch1.bigfish.com (Postfix) with ESMTP id
	0AD6EE005B for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 21:12:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Mar 2012 21:12:37 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 23 Mar 2012 16:12:44 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] useradd.bbclass: retry useradd/groupadd
	commands to avoid lock race issues
Thread-Index: AQHNCTmwlhCVlApWhk+Dd53Fllpzjw==
Date: Fri, 23 Mar 2012 21:12:43 +0000
Message-ID: <CAEsOVNdspSnSngMvuqfpuczM8OKmO9405oWVcGsz6SO+fRcr=Q@mail.gmail.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
	<1e1a2ceb4c6afa22a71d3c902b7a3b18cdee10cf.1332453478.git.scott.a.garman@intel.com>
In-Reply-To: <1e1a2ceb4c6afa22a71d3c902b7a3b18cdee10cf.1332453478.git.scott.a.garman@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 2/2] useradd.bbclass: retry useradd/groupadd commands to avoid lock race issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 23 Mar 2012 21:36:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <546122470749B44E84568FFBF92CF57D@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

This should go in our edison 1.1.2 release as well.

-M

On Thu, Mar 22, 2012 at 11:43 PM, Scott Garman <scott.a.garman@intel.com> w=
rote:
> A race condition can occur when adding users and groups to the
> passwd and group files, causing errors like the following:
>
> =A0ERROR: Function 'useradd_sysroot' failed
> =A0Tried to access "/etc/group" but this was locked.
>
> This fix will cause the useradd code to retry the useradd and
> groupadd commands up to 10 times (with a 1s sleep in between
> attempts) before failing.
>
> This fixes [YOCTO #1794]
>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
> =A0meta/classes/useradd.bbclass | =A0 36 ++++++++++++++++++++++++++++++++=
++--
> =A01 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 7981a68..0bbb371 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -45,7 +45,23 @@ if test "x$GROUPADD_PARAM" !=3D "x"; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0groupname=3D`echo "$opts" | awk '{ print $=
NF }'`
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0group_exists=3D`grep "^$groupname:" $SYSRO=
OT/etc/group || true`
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "x$group_exists" =3D "x"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eval $PSEUDO groupadd =A0$O=
PT $opts
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count=3D1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while true; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eval $PSEUD=
O groupadd $OPT $opts || true
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 group_exist=
s=3D`grep "^$groupname:" $SYSROOT/etc/group || true`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test "x$=
group_exists" =3D "x"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 # File locking issues can require us to retry the command
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 echo "WARNING: groupadd command did not succeed. Retrying..."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 sleep 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 break
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count=3D`ex=
pr $count + 1`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test $co=
unt =3D 11; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 echo "ERROR: tried running groupadd command 10 times without success, =
giving up"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 exit 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "Note: group $groupna=
me already exists, not re-creating it"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> @@ -70,7 +86,23 @@ if test "x$USERADD_PARAM" !=3D "x"; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0username=3D`echo "$opts" | awk '{ print $N=
F }'`
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0user_exists=3D`grep "^$username:" $SYSROOT=
/etc/passwd || true`
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "x$user_exists" =3D "x"; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eval $PSEUDO useradd $OPT $=
opts
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count=3D1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while true; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eval $PSEUD=
O useradd $OPT $opts || true
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 user_exists=
=3D`grep "^$username:" $SYSROOT/etc/passwd || true`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test "x$=
user_exists" =3D "x"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 # File locking issues can require us to retry the command
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 echo "WARNING: useradd command did not succeed. Retrying..."
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 sleep 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 break
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count=3D`ex=
pr $count + 1`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test $co=
unt =3D 11; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 echo "ERROR: tried running useradd command 10 times without success, g=
iving up"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 exit 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "Note: username $user=
name already exists, not re-creating it"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



