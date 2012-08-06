Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyMq7-00061c-Ue for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 14:55:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ChaKX027815
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 13:43:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23198-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 13:43:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ChTFp027809
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 13:43:30 +0100
Message-ID: <1344257012.9756.143.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 13:43:32 +0100
In-Reply-To: <132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
	<EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
	<132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 12:55:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-03 at 17:46 +0200, Koen Kooi wrote:
> Op 3 aug. 2012, om 15:19 heeft Ross Burton <ross.burton@intel.com> het
> volgende geschreven:
> 
> > On Friday, 3 August 2012 at 11:18, Koen Kooi wrote:
> >> libegl and libgles aren't built nowadays, so the problem is
> avoided. Noone has dared to touch this subject the past 2.5 years:
> http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3d96f8cb61225d515b5cb4fe863f0d50c3ced436
> >> 
> >> The best solution[1] is to disable egl/gles in the mesa-recipes and
> add a seperate recipe for them. That way you still get glu and other
> useful mesa bits needed for gnome/efl/xfce/etc, but you can skip the
> sysroot/shlib poisoning if needed.
> > After much digging I see that the Beagle PVR drivers only provide
> gles and egl, which is why you say that the problem was avoided.  Of
> course that's just one specific driver, for example the Cedar Trail
> EMGD driver does build libgl, libgles and libegl.
> > 
> > If the solution is "put the egl/gles bits in another package"
> 
> Recipe, not package. Big difference :)
> 
> > then I'm totally confused as to what the actual problem is.
> Considering there's numerous libegl libraries for the many variants of
> PVR on ARM, I'm struggling to understand exactly what is new here.
> > 
> > Can you explain clearly what the problem is, I'm obviously missing
> something.  Once I understand the problem I can help with a solution.
> 
> You need mesa for the !egl and !gles libs and evil vendor blob for egl
> and gles libs. In the emgd case you can get gl from the evil vendor as
> well. To build e.g. EFL I need mesa for the !egl and !gles bits, to
> build EFL with gles support I need mesa (again !egl, !gles) in
> addition to evil vendor blob for egl and gles. 
> We could make this work with MACHINE_FEATURES or something similar,
> but that would mean that a very large chunk of userspace now becomes
> machine specific. This is how clutter worked in the past and just look
> at the fit the canonical/linaro people threw when they started doing
> 'embedded' and clutter.
> 
> To compress the above: you need to build both the mesa and the
> evil-egl-binary *recipes* for things to work, so the egl bits should
> be a different recipe, not a subpackage of the mesa recipe. This is
> all assuming we care abou the binary blobs e.g. TI distributes for 3d
> support. If you don't, fine, merge this patchset.

Let me test this a little bit more. The binary blobs shipped by TI would
be machine specific and would be marked as such in the package feeds?
The mesa pieces would be marked as architecture specific and more
generic. In feeds, machine specific has priority so on the machines
where there is hardware support, the hardware optimised versions would
get installed?

If the above isn't the case, can we make it work like that?

Cheers,

Richard






