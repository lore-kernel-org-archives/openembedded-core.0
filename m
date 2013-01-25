Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TylB6-00031R-U2 for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:26:56 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PFFMll002171; Fri, 25 Jan 2013 15:15:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ww7rnOzhalPP; Fri, 25 Jan 2013 15:15:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PFFFXn002148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 15:15:18 GMT
Message-ID: <1359126654.13917.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 15:10:54 +0000
In-Reply-To: <CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 15:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 15:04 +0000, Burton, Ross wrote:
> On 25 January 2013 14:59, Radu Moisan <radu.moisan@intel.com> wrote:
> > +# "multi-user" vs "graphical"
> > +SYSTEMD_DEFAULT_TARGET ?= "multi-user"
> 
> Default to "graphical", so we're not regressing and just introducing a
> warning if someone doesn't set this and doesn't have X.
> 
> > @@ -95,6 +95,11 @@ do_install() {
> >         install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
> >
> >         install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> > +
> > +
> > +       if [ -n ${SYSTEMD_DEFAULT_TARGET} ]; then
> > +               ln -s ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET}.target ${D}${sysconfdir}/systemd/system/default.target
> > +       fi
> 
> This will have to happen at image construction time and not package
> generation time, as different images may have different targets but
> share the same systemd package.
> 
> A rootfs-time postinstall script would work, but isn't very nice.  I
> wonder if there's a better solution, hooking into the image creation
> should work.
> 
> (thinks)

The point here is that images shouldn't give errors at runtime. Nothing
above does anything to address that. There is something going to have to
happen at image creation time so that systemd is correctly configured in
the current scheme of things.

Cheers,

Richard





