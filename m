Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THGCk-0000FF-Ji for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:40:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RFRqFQ032567;
	Thu, 27 Sep 2012 16:27:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32240-03; Thu, 27 Sep 2012 16:27:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RFRfib032560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 27 Sep 2012 16:27:43 +0100
Message-ID: <1348759663.8493.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 27 Sep 2012 16:27:43 +0100
In-Reply-To: <1348748538.32611.18.camel@phil-desktop>
References: <1348748538.32611.18.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8RFRqFQ032567
Cc: openembedded-core@lists.openembedded.org
Subject: Re: overuse of bitbake flags considered harmful
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 15:40:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-27 at 13:22 +0100, Phil Blundell wrote:
> I was mildly amused to discover, the other day, that the output of
> "bitbake -e rpm | grep PACKAGECONFIG" is not quite as one might na=C3=AF=
vely
> expect. =20
>=20
> I guess the right response to this is perhaps that bitbake ought
> nowadays to find some other way to store its own internal state, since
> the idiom of using flags is pretty well established in oe-core.

For those who don't realise what's going on here, the output is:

python PACKAGECONFIG () {
db bzip2 zlib beecrypt openssl libelf python}

since "python" is a flag bitbake uses to identify python functions too.

I suspect the better solution would be to use "_python" internally since
we already have a convention within bitbake of prefixing internally used
flags with "_".

http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/data_smar=
t.py?id=3D49bc007c80e429090c4db51e30c5ce27e8a72558
http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/data_smar=
t.py?id=3D980d658f3f1e6c5b459f741385533a11d35009ca

This would mean the metadata shouldn't use that namespace but I think we
can live with that.

Cheers,

Richard





