Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1SuUON-0003Jb-0K
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:10:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJx7nc025374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:59:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24456-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:59:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJwpNV025365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:59:01 +0100
Message-ID: <1343332730.9574.4.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 20:58:50 +0100
In-Reply-To: <50118D35.6070105@windriver.com>
References: <D9D7124626ED1E43963D86B2657D5CCD03A69B7A@FRSNPREXC1.usr.ingenico.loc>
	<50117246.2030502@windriver.com>
	<CABcZAN=nH-rkHyVm8QwaFMyXmGPe=H3cAkM0kJkPsMLp82PEKw@mail.gmail.com>
	<50118D35.6070105@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SDK and external toolchain
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
X-List-Received-Date: Thu, 26 Jul 2012 20:10:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 13:32 -0500, Mark Hatle wrote:
> On 7/26/12 1:14 PM, Chris Larson wrote:
> > On Thu, Jul 26, 2012 at 9:37 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> >>> index 44284c3..f5fd4d7 100644
> >>> --- a/meta/classes/toolchain-scripts.bbclass
> >>> +++ b/meta/classes/toolchain-scripts.bbclass
> >>> @@ -136,7 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
> >>>    #we get the cached site config in the runtime
> >>>    TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
> >>>    TOOLCHAIN_CONFIGSITE_SYSROOTCACHE =
> >>> "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
> >>> -TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
> >>> +TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
> >>
> >>
> >> That is incorrect.. the CONFIGSITE_CACHE should be generated for the TCLIBC.
> >> If you don't do that, then you will be running the same configure steps --
> >> looking for basic glibc information over and over and over, causing a fairly
> >> expensive performance penalty.
> >
> > No, he's right, this is a bug in toolchain-scripts.bbclass. We could
> > work around it in the recipe via RPROVIDES_${PN}, but
> > TOOLCHAIN_NEED_CONFIGSITE_CACHE feeds directly into task 'depends', so
> > it's pulling in ${TCLIBC} explicitly rather than the more accurate
> > 'virtual/libc'.
> >
> 
> The config site file though isn't called "virtual/libc".  My understanding what 
> that all that variable did was set the list of config site files, but didn't 
> directly affect the dependency mapping.  If it does, then there is a definite 
> issue w/ dependency vs file mappings.

The trouble as I understand it is we need to know both the dependency
name and the config/site cache name.

We'll probably have to change siteconfig.bbclass to generate libc_config
instead of ${PN}_config (create an intermediate variable the libc
recipes override).

We can then specify something like virtual/libc:libc in
TOOLCHAIN_NEED_CONFIGSITE_CACHE. Of course that probably still won't
work if you actually try and build meta-toolchain, we might just have to
skip things that don't exist...

Cheers,

Richard 



