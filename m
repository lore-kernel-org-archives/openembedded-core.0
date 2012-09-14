Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCYWp-0006YV-Kv for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:14:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EG1Nwe012573;
	Fri, 14 Sep 2012 17:01:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11740-04; Fri, 14 Sep 2012 17:01:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EG1EQY012567
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 17:01:15 +0100
Message-ID: <1347638477.13596.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 14 Sep 2012 17:01:17 +0100
In-Reply-To: <5052617D.7080206@linux.intel.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<22844638.2V3OiWsK3u@helios> <5052617D.7080206@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
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
X-List-Received-Date: Fri, 14 Sep 2012 16:14:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-13 at 15:43 -0700, Saul Wold wrote:
> On 09/13/2012 03:31 PM, Paul Eggleton wrote:
> > On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
> >> Make sure to find -package, this was causing a failure
> >> in the multi-lib build license generation during rootfs.
> >>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> ---
> >>   meta/classes/license.bbclass |    2 +-
> >>   1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> >> index 29fe938..b29067c 100644
> >> --- a/meta/classes/license.bbclass
> >> +++ b/meta/classes/license.bbclass
> >> @@ -88,7 +88,7 @@ license_create_manifest() {
> >>   	# list of installed packages is broken for deb
> >>   	for pkg in ${INSTALLED_PKGS}; do
> >>   		# not the best way to do this but licenses are not arch dependant iirc
> >> -		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
> >> +		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
> >>   		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
> >>
> >>   		# exclude locale recipes
> >
> > Surely this could end up matching a the wrong file when one package name is a
> > substring of another?
> >
> I am open to ideas here, I tried the ${MLPREFIX}, but it seems to be 
> empty when rootfs runs, that did not help, I thought about adding the 
> '-', but that would fail in the non-multilib case, how can I determine 
> what the prefix will be to get a more accurate match?

I would observe here that this probably works for ipk and multilib and
only breaks for multilib+rpm. The reason is that rpm collapses the
namespace when it creates the package list so "lib32-bash" becomes bash.
I think this might be an error in however we generate the INSTALLED_PKGS
list and we might need to revisit the rpm mechanism and ensure the
multilib prefixes get added.

Cheers,

Richard



