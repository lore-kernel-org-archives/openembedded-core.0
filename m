Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB9Qa-0003zo-Fz for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:41:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NIWVrm030813
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:32:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30408-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:32:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NIWOgm030807
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 18:32:25 GMT
Message-ID: <1332527545.9740.473.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 18:32:25 +0000
In-Reply-To: <B02EB5DF-A881-4745-9434-80A817FCCF12@dominion.thruhere.net>
References: <1332520659-12233-1-git-send-email-obi@opendreambox.org>
	<1332520659-12233-2-git-send-email-obi@opendreambox.org>
	<6382DE52-47CF-478A-A10A-26F27EF1AE06@dominion.thruhere.net>
	<4F6CB9AF.8090809@opendreambox.org>
	<B02EB5DF-A881-4745-9434-80A817FCCF12@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] module.bbclass: sync pkg_post{inst, rm} with kernel.bbclass
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
X-List-Received-Date: Fri, 23 Mar 2012 18:41:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 19:20 +0100, Koen Kooi wrote:
> Op 23 mrt. 2012, om 18:58 heeft Andreas Oberritter het volgende geschreven:
> 
> > On 23.03.2012 18:20, Koen Kooi wrote:
> >> 
> >> Op 23 mrt. 2012, om 17:37 heeft Andreas Oberritter het volgende geschreven:
> >> 
> >>> * Run depmod when the rootfs gets generated.
> >>> 
> >>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >>> ---
> >>> meta/classes/module.bbclass |    9 +++++----
> >>> 1 files changed, 5 insertions(+), 4 deletions(-)
> >>> 
> >>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> >>> index 53c16b7..e370b24 100644
> >>> --- a/meta/classes/module.bbclass
> >>> +++ b/meta/classes/module.bbclass
> >>> @@ -37,15 +37,16 @@ module_do_install() {
> >>> }
> >>> 
> >>> pkg_postinst_append () {
> >>> -	if [ -n "$D" ]; then
> >>> -		exit 1
> >>> -	fi
> >>> +if [ -n "$D" ]; then
> >>> +	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> >>> +else
> >>> 	depmod -a
> >>> 	update-modules || true
> >>> +fi
> >> 
> >> That encodes host system paths into the package, which is not a good thing for tools like narcissus and hob.
> > 
> > So should we remove the same lines from kernel.bbclass?
> 
> I think so, I don't think we want to hand out binaries with scripts that say things like:
> 
> foo-linux-depmod -F /storage/openembedded-is-a-poopyhead/something

However note that the command is only run on the build system, not on
the target and avoids running postinstalls. I'm not taking a patch to
remove this unless there is some equivalent functionality added.

Cheers,

Richard



