Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TyLMd-0007y0-UJ for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 12:53:19 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OBeeT6005293; Thu, 24 Jan 2013 11:41:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gA7bfSVD6GV8; Thu, 24 Jan 2013 11:41:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OBfRMZ005345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 24 Jan 2013 11:41:30 GMT
Message-ID: <1359027432.3616.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Jan 2013 11:37:12 +0000
In-Reply-To: <20130124103150.GA3012@jama>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
	<20130124103150.GA3012@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
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
X-List-Received-Date: Thu, 24 Jan 2013 11:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-24 at 11:31 +0100, Martin Jansa wrote:
> On Thu, Jan 24, 2013 at 04:16:45PM +0800, Qi.Chen@windriver.com wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > All recipes that need to tweak their directories need to inherit this
> > class and set VOLATILE_DIR, VOLATILE_LINK and VOLATILE_PKGS.
> > 
> > [YOCTO #3406]
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/classes/volatiles.bbclass |   11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 meta/classes/volatiles.bbclass
> > 
> > diff --git a/meta/classes/volatiles.bbclass b/meta/classes/volatiles.bbclass
> > new file mode 100644
> > index 0000000..f27e598
> > --- /dev/null
> > +++ b/meta/classes/volatiles.bbclass
> > @@ -0,0 +1,11 @@
> > +# This bbclass is for read-only-rootfs support. All recipes that may tweak their
> > +# own directories in order to run correctly in a read-only rootfs enviroment
> > +# should inherit this class and set VOLATILE_DIR, VOLATILE_LINK, VOLATILE_PKGS.
> > +
> > +# For each package, the net result is a read-only specific conf file generated
> > +# and packaged, which has the name of readonly-${VOLATILESPN}.
> > +
> > +# All these config files are then parsed by populate-volatile.sh to create proper
> > +# directories and links.
> > +
> > +inherit ${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvinit','',d)}
> 
> Does "inherit " work?
> 
> I mean empty inherit when DISTRO_FEATURES don't contain sysvinit? IIRC
> it will fail to parse.

The above syntax does now work. A plain "inherit " won't but something
with an expression in does get handled correctly. It did not used to
work with older bitbake versions.

Cheers,

Richard



