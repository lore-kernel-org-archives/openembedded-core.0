Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CBC136D684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:19:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAEDJIs3000826; Thu, 14 Nov 2013 13:19:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3pYrIbS9gQoi; Thu, 14 Nov 2013 13:19:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAEDJDoc000816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 14 Nov 2013 13:19:15 GMT
Message-ID: <1384435150.6460.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 14 Nov 2013 13:19:10 +0000
In-Reply-To: <20131114124302.GA7503@lpalcu-linux>
References: <cover.1383742507.git.laurentiu.palcu@intel.com>
	<0dcafa1bce7a6ae871ee0f6b20eab8834860b334.1383742507.git.laurentiu.palcu@intel.com>
	<20131114124302.GA7503@lpalcu-linux>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Thu, 14 Nov 2013 13:19:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-14 at 14:43 +0200, Laurentiu Palcu wrote:
> Even though this was in the last C-pull, for some reason, it didn't end
> up in master... Didn't see any comments on it either. Or maybe I missed
> them...

In the target case, M4 should be compiled in as ${bindir}/m4 and there
should be no need of a wrapper. Can someone confirm this is the case? Is
the OEMAKE command only used for compilation and not built into the
target?

Cheers,

Richard


> Thanks,
> Laurentiu
> 
> On Wed, Nov 06, 2013 at 03:07:58PM +0200, Laurentiu Palcu wrote:
> > Flex needs m4 to run (see below) and, since the create_wrapper
> > introduces a bash dependency on target, give the path to m4 binary in
> > the configure command line.
> > 
> > Snippet from the flex documentation:
> > "The macro processor m4 must be installed wherever flex is installed.
> > <...>
> > m4 is only required at the time you run flex."
> > 
> > [YOCTO #5329]
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/recipes-devtools/flex/flex.inc |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> > index 43f1dda..96d5de5 100644
> > --- a/meta/recipes-devtools/flex/flex.inc
> > +++ b/meta/recipes-devtools/flex/flex.inc
> > @@ -13,6 +13,9 @@ inherit autotools gettext
> >  M4 = "${bindir}/m4"
> >  M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
> >  
> > +EXTRA_OECONF += "ac_cv_path_M4=${M4}"
> > +EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
> > +
> >  do_install_append_class-native() {
> >  	create_wrapper ${D}/${bindir}/flex M4=${M4}
> >  }
> > @@ -20,3 +23,5 @@ do_install_append_class-native() {
> >  do_install_append_class-nativesdk() {
> >  	create_wrapper ${D}/${bindir}/flex M4=${M4}
> >  }
> > +
> > +RDEPENDS_${PN} += "m4"
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



