Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qosau-000614-0h
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 09:43:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 00:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,315,1309762800"; d="scan'208";a="35679177"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 00:39:26 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 15:37:20 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Thu, 4 Aug 2011 15:37:20 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Thu, 4 Aug 2011
	15:37:19 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Phil Blundell <philb@gnu.org>, Paul
	Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 4 Aug 2011 15:37:19 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxSa8JTkzTQ7QbmTUyaFRkIavk52wADDkpg
Message-ID: <1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
In-Reply-To: <4E3A3562.1060907@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 04 Aug 2011 07:43:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-04:
> As for a patch, I'm on Jury duty all this week and only get to a very
> small percentage of my tasks. I would appreciate if you would try to
> put one together using the above source snippet, with the suggested
> changes from Paul of course. Then just send it to the list with Paul
> and myself on CC. We'll review and provided additional Acked-by's to
> confirm we're all happy with the end result.
I made a patch according to your and Paul's suggestions.
Please review the patch (I also pasted at the end of this mail):
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/bug-67=
1&id=3D13cd1538bc5be078039be2054f117610e2425951
Please note I use sed to remove any trailing slash since ${BDIR%/} can only=
 remove one trailing slash and this can cause issue, e.g., if $1 is /tmp/bu=
ild_new//, *on Ubuntu 10.04*, we would get a weird msg "Error: the director=
y /tmp doesn't exist?"

> I would suggest you include a patch to first revert the previous patch
> that was applied to address this issue.
I'm trying to patch the first patch to save a revert commit... :-)

Thanks,
-- Dexuan

commit 13cd1538bc5be078039be2054f117610e2425951
Author: Dexuan Cui <dexuan.cui@intel.com>
Date:   Thu Aug 4 14:53:20 2011 +0800

    scripts/oe-buildenv-internal: improve the error detecting for $BDIR

    Thanks a lot to Darren Hart and Paul Eggleton's sugestion!

    Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 117b0c5..4a44174 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -28,14 +28,16 @@ if [ "x$BDIR" =3D "x" ]; then
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
+        BDIR=3D`echo $BDIR | sed -re 's|/+$||'`
+        BDIR=3D`readlink -f "$BDIR"`
+        if [ -z "$BDIR" ]; then
+            PARENTDIR=3D`dirname "$1"`
+            echo >&2 "Error: the directory $PARENTDIR doesn't exist?"
             return 1
         fi
     fi



