Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QozIj-0003Xu-LP
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:53:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2011 07:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,317,1309762800"; d="scan'208";a="35798414"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 07:49:08 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 22:49:07 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Thu, 4 Aug 2011 22:49:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Thu, 4 Aug 2011
	22:49:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 22:49:05 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxSrK427eyEX9TDTFyrgIWm2d2wsgACBJmg
Message-ID: <1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
In-Reply-To: <4E3AA24A.7050400@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 14:53:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-04:
> On 08/04/2011 12:37 AM, Cui, Dexuan wrote:
> Please remember to include a description of the problem and the
> approach taken to fix it. This eliminates wasted time trying to
> decipher it later or by people unfamiliar with the history. This is impor=
tant even for simple changes.
> In this case something like:
>=20
> " The previous fix for a bug in Ubuntu 10.04 readlink, $COMMIT_ID,
> notified the user when a trailing slash was used. As there is no
> semantic difference, simply remove any trailing slashes and proceed
> without nagging the user. "
Thanks! I'll use the description.

>> diff --git a/scripts/oe-buildenv-internal
>> b/scripts/oe-buildenv-internal index 117b0c5..4a44174 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -28,14 +28,16 @@ if [ "x$BDIR" =3D "x" ]; then
>>      if [ "x$1" =3D "x" ]; then
>>          BDIR=3D"build"
>>      else
>> -        BDIR=3D`readlink -f "$1"` -        if [ -z "$BDIR"  ]; then -  =
=20
>>         if expr "$1" : '.*/$' >/dev/null; then -                echo
>> >&2 "Error: please remove any trailing / in the argument." -          =20
>> else -                PARENTDIR=3D`dirname "$1"` -                echo
>> >&2 "Error: the directory $PARENTDIR doesn't exist?" -            fi +=20
>>       BDIR=3D"$1" +        if [ "$BDIR" =3D "/" ]; then +            ech=
o
>> >&2 "Error: / is not supported as a build directory." +          =20
>> return 1 +        fi +        BDIR=3D`echo $BDIR | sed -re 's|/+$||'` + =
=20
>>      BDIR=3D`readlink -f "$BDIR"` +        if [ -z "$BDIR" ]; then +    =
=20
>>       PARENTDIR=3D`dirname "$1"` +            echo >&2 "Error: the
>> directory $PARENTDIR doesn't exist?"
>=20
> This shouldn't be a question. If the documented behavior of readlink
> is to return empty when the path doesn't exist, then assume this to be th=
e case.
The latest manual of readlink says readlink should ignore trailing slash.

> Also, it is a good idea to avoid contractions in printed error messages.
>=20
> 	echo >&2 "Error: the directory $PARENTDIR does not exist."
Ok, I'll change "doesn't" to "does not".

> Otherwise, this looks good to me.
Please review the new patch (I paste it at the end of the mail, too)
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/bug=
-671&id=3D593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb

Thanks!
-- Dexuan

commit 593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb
Author: Dexuan Cui <dexuan.cui@intel.com>
Date:   Thu Aug 4 14:53:20 2011 +0800

    scripts/oe-buildenv-internal: improve the error detecting for $BDIR

    Thanks a lot to Darren Hart and Paul Eggleton's suggestions!

    A description of this improvement from Darren is:
    "
    The previous fix for a bug in Ubuntu 10.04 readlink,
    be2a2764d8ceb398d81714661e6f199c8b11946c, notified the user when a trai=
ling
    slash was used. As there is no semantic difference, simply remove any
    trailing slashes and proceed without nagging the user.
    "

    Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 117b0c5..9988c9f 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -28,14 +28,22 @@ if [ "x$BDIR" =3D "x" ]; then
     if [ "x$1" =3D "x" ]; then
         BDIR=3D"build"
     else
-        BDIR=3D`readlink -f "$1"`
-        if [ -z "$BDIR"  ]; then
-            if expr "$1" : '.*/$' >/dev/null; then
-                echo >&2 "Error: please remove any trailing / in the argum=
ent."
-            else
-                PARENTDIR=3D`dirname "$1"`
-                echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
-            fi
+        BDIR=3D"$1"
+        if [ "$BDIR" =3D "/" ]; then
+            echo >&2 "Error: / is not supported as a build directory."
+            return 1
+        fi
+
+        # Remove possible trailing slash. This is used to work around
+        # buggy readlink of Ubuntu 10.04 that doesn't ignore trailing slas=
h
+        # and hence "readlink -f new_dir_to_be_created/" returns empty.
+        # See YOCTO #671 for details.
+        BDIR=3D`echo $BDIR | sed -re 's|/+$||'`
+
+        BDIR=3D`readlink -f "$BDIR"`
+        if [ -z "$BDIR" ]; then
+            PARENTDIR=3D`dirname "$1"`
+            echo >&2 "Error: the directory $PARENTDIR does not exist?"
             return 1
         fi
     fi


