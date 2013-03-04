Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCUTL-0005CK-06 for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 13:26:27 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24CHZN5032030; Mon, 4 Mar 2013 12:17:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Uzvi0TdB94St; Mon,  4 Mar 2013 12:17:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r24CHTvX032026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Mar 2013 12:17:32 GMT
Message-ID: <1362398976.29587.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 04 Mar 2013 12:09:36 +0000
In-Reply-To: <20130304114815.GH3268@jama>
References: <1362393439-23933-1-git-send-email-laurentiu.palcu@intel.com>
	<CA+chaQe3c3aYV6xEYsScoMWTMexe9rR4UiKCAszTjG-xrad59Q@mail.gmail.com>
	<1362394572.29587.10.camel@ted> <20130304111337.GG3268@jama>
	<513487B9.8000502@intel.com> <20130304114815.GH3268@jama>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Patches, about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: consider postinstall dependencies too
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
X-List-Received-Date: Mon, 04 Mar 2013 12:26:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 12:48 +0100, Martin Jansa wrote:
> On Mon, Mar 04, 2013 at 01:38:33PM +0200, Laurentiu Palcu wrote:
> > 
> > 
> > On 03/04/2013 01:13 PM, Martin Jansa wrote:
> > > On Mon, Mar 04, 2013 at 10:56:12AM +0000, Richard Purdie wrote:
> > >> On Mon, 2013-03-04 at 11:51 +0100, Martin Jansa wrote:
> > >>> Shouldn't this list be defined in layer.conf like
> > >>> SIGGEN_EXCLUDERECIPES_ABISAFE, so that other layers can extend that
> > >>> list?
> > >>
> > >> I'm hoping we only have very small list of these problematic
> > >> dependencies. If we end up with a large number of them then yes, we'd
> > >> need to abstract it but I'd prefer to avoid that unless proven
> > >> necessary.
> > >>
> > >> Is there a specific case you have in mind?
> > > 
> > > Isn't systemd-systemctl-native another candidate to be included?
> > > 
> > It looks like it should be in the list... I'll resend a new version.
> 
> what about all u-a-native implementations?

Its worth noting that not everything has to be in this list. If the
dependencies get pulled into the rootfs construction by some other
means, we don't need the code here. In this case image.bbclass does:

DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"

so those aren't strictly needed in the list.

Cheers,

Richard



