Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RET6u-0003qe-J0
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 23:46:40 +0200
Received: by bkat8 with SMTP id t8so1189048bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 14:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uJlnX2UgdXnvuR/QD5+1H1JwLVe1e+44GmL9j08Sphk=;
	b=AMCMylJrv9QAP+jSI/vsBg0RcOXiq9vmCcbgB7NFdYVTpxkV5q+RlhEgG/b2FGGcIi
	Ig2JfOGO2qRp1ZmkMbLlRgADHc/NJlDyboSjvhGfGC9Rht9h10ErSlN2K/4xHmjE/yGY
	L1GTQqagrZKeGFZOYPEkprFa85oPx5p0NUZQ4=
Received: by 10.204.135.65 with SMTP id m1mr4296099bkt.85.1318542056350;
	Thu, 13 Oct 2011 14:40:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm5563923bkq.11.2011.10.13.14.40.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 14:40:55 -0700 (PDT)
Date: Thu, 13 Oct 2011 23:40:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Message-ID: <20111013214048.GA3542@jama.jama.net>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
	<20110930184603.GI7364@jama.jama.net>
	<CA+chaQcSHh=j9rGCYehU4ce4iQw_ZCoL_oaqxH7kWFZB16NqyQ@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E0BCEAC0@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E0BCEAC0@orsmsx504.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Thu, 13 Oct 2011 21:46:40 -0000
X-Groupsio-MsgNum: 10949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 01:09:15PM -0700, Kamble, Nitin A wrote:
> Martin,
>   I am fixing the python 2.7.2 recipe, and I need to update the generate-=
manifest-2.7.py script slightly, to get more files included in the python-c=
ore package.

great, I was debuging it a bit more today and found out that the problem
seems to be in python-native, because with python-native-2.7.2 when I
try to build old python-2.6.6 it's also tring to link extra modules to
-native libpython2.7 and fails:
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/lib/libpython2.7.so: file not re=
cognized: File format not recognized

but even after comparing sysroots/builddirs/logs from 2.6.6 and 2.7.2=20
I still don't see why it picked right libpython2.6 before and now it fails.
I've tried it without multilib support and partially reverted=20
changes in patches from 2.6.6 and still it fails :/

btw: there seems to be also issue in runtime
SHR root@gjama ~ $ python -v
Could not find platform independent libraries <prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
# installing zipimport hook
import zipimport # builtin
# installed zipimport hook
ImportError: No module named site
# clear __builtin__._
# clear sys.path
# clear sys.argv
# clear sys.ps1
# clear sys.ps2
# clear sys.exitfunc
# clear sys.exc_type
# clear sys.exc_value
# clear sys.exc_traceback
# clear sys.last_type
# clear sys.last_value
# clear sys.last_traceback
# clear sys.path_hooks
# clear sys.path_importer_cache
# clear sys.meta_path
# clear sys.flags
# clear sys.float_info
# restore sys.stdin
# restore sys.stdout
# restore sys.stderr
# cleanup __main__
# cleanup[1] zipimport
# cleanup[1] signal
# cleanup[1] exceptions
# cleanup[1] _warnings
# cleanup sys
# cleanup __builtin__
# cleanup ints: 5 unfreed ints
# cleanup floats

> BTW how to run this script ? some documentation of it in the script would=
 be useful.

just execute it and it prints manifest, so something like this:
openembedded-core $ scripts/contrib/python/generate-manifest-2.7.py > meta/=
recipes-devtools/python/python-2.7-manifest.inc

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6XWuAACgkQN1Ujt2V2gBxTlQCgmondoFfgiF5W2h/aMon3BeHk
9fUAn0qdu9Tw1MkTN6fbzc3len2lLMb4
=yVDr
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
