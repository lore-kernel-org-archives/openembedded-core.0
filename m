Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4170774E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 22:36:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w84MaVKJ002461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Sep 2018 23:36:32 +0100
Message-ID: <23275ba8a359cdc7edd4f0f85bcecda99bd60aaf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Tue, 04 Sep 2018 23:36:31 +0100
In-Reply-To: <CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Tue, 04 Sep 2018 22:36:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-04 at 13:19 -0700, Andre McCurdy wrote:
> On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.com>
> wrote:
> > From: Joshua Lock <joshua.g.lock@intel.com>
> > 
> > os-release (5) recommends that the os-release file be installed in
> > /usr/lib/os-release and that /etc/os-release be a relative symlink
> > to it.
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/os-release/os-release.bb
> > b/meta/recipes-core/os-release/os-release.bb
> > index f9887047561..c6e36001dc5 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -1,7 +1,7 @@
> >  inherit allarch
> > 
> >  SUMMARY = "Operating system identification"
> > -DESCRIPTION = "The /etc/os-release file contains operating system
> > identification data."
> > +DESCRIPTION = "The /usr/lib/os-release file contains operating
> > system identification data."
> >  LICENSE = "MIT"
> >  INHIBIT_DEFAULT_DEPS = "1"
> > 
> > @@ -42,6 +42,7 @@ python do_compile () {
> >  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> > 
> >  do_install () {
> > -    install -d ${D}${sysconfdir}
> > -    install -m 0644 os-release ${D}${sysconfdir}/
> > +    install -d ${D}${libdir}
> > +    install -m 0644 os-release ${D}${libdir}/
> > +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
> 
> This probably needs an "rm -f ${D}${sysconfdir}/os-release" too to
> prevent problems if install is run twice as lnr doesn't handle the
> case where the target already exists.

Doesn't do_install clean out ${D} each time it reruns though?

Cheers,

Richard

