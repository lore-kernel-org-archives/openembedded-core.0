Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DFB3261604
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:44:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r858vnQb031865; Thu, 5 Sep 2013 09:57:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jEaqzSbXtRA2; Thu,  5 Sep 2013 09:57:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r858vjhE031860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 09:57:46 +0100
Message-ID: <1378370671.32427.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 05 Sep 2013 09:44:31 +0100
In-Reply-To: <5227D283.6050606@linux.intel.com>
References: <1378310230-20253-1-git-send-email-valentin.popa@intel.com>
	<52275B82.4040309@linux.intel.com> <5227D283.6050606@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH_V2] HOB: split live into iso and hddimg
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
X-List-Received-Date: Thu, 05 Sep 2013 08:44:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-04 at 17:38 -0700, Saul Wold wrote:
> Also the patch summary does not conform to your style, it should be 
> image*: split live into iso and hddimg for hob
> 
> tells us more that it's the image code, not hob code.
> 
> See additional comment below.
> 
> On 09/04/2013 09:10 AM, Saul Wold wrote:
> > On 09/04/2013 08:57 AM, Valentin Popa wrote:
> >> changes to split live into iso and hddimg without
> >> adding a new image type class.
> >>
> >
> > Will there be corresponding patches for the places that IMAGE_FSTYPES
> > use the "live" type?
> >
> > There may also be some doc's changes that are needed.
> >
> > Sau!
> >
> >> [YOCTO #3197]
> >> ---
> >>   meta/classes/image.bbclass       | 11 ++++++++++-
> >>   meta/classes/image_types.bbclass | 11 +++++++----
> >>   2 files changed, 17 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >> index ea59c36..3f76d80 100644
> >> --- a/meta/classes/image.bbclass
> >> +++ b/meta/classes/image.bbclass
> >> @@ -87,7 +87,16 @@ do_rootfs[depends] +=
> >> "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
> >>   do_rootfs[depends] +=
> >> "virtual/update-alternatives-native:do_populate_sysroot
> >> update-rc.d-native:do_populate_sysroot"
> >>   do_rootfs[recrdeptask] += "do_packagedata"
> >>
> >> -IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live",
> >> "empty", d)}'
> >> +NOISO = '${@base_contains("IMAGE_FSTYPES", "iso", "0", "1", d)}'
> >> +NOHDD = '${@base_contains("IMAGE_FSTYPES", "hddimg", "0", "1", d)}'
> >> +
> >> +def build_live(d):
> >> +    if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
> >> +        return "live"
> >> +    else:
> >> +        return "empty"
> >> +
> I think RP suggested a way to simplify this code.

Its not clear from this patch but I think NOISO and NOHDD are used as
triggers elsewhere in the code so this is probably reasonable.

Cheers,

Richard


