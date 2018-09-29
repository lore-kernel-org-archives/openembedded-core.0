Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 36C6979982
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:40:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCeoxu026717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:40:51 +0100
Message-ID: <51d281559eb5f84b6df309e100eccf2034fd3c5a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:40:50 +0100
In-Reply-To: <a4a18433e51ef85e3beae67625eb477d078e5639.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<a4a18433e51ef85e3beae67625eb477d078e5639.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 07/10] opkg-utils/update-alternatives: not warn same priorities for multilib
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
X-List-Received-Date: Sat, 29 Sep 2018 12:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> update-alternatives is used to handle install file conflicts of
> multilib
> packages in multilib_script.bbclass. And the default priority is used
> for the alternatives which causes QA warning:
> 
> > WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-
> > image-minimal: found 1 warning message in the logfile
> > [log_check] Warn: update-alternatives: libtool has multiple
> > providers with the same priority, please check
> > .../core-image-minimal/1.0-
> > r0/rootfs/usr/lib/opkg/alternatives/libtool for details
> 
> The same priorities of alternatives are by design, so eliminate the
> warning for alternatives from multilib packages.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Sorry, no, this isn't right either :(

If we read the patch where multilib_scripts were introduced:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=e3497cc22b969e02efa54e4e54e087dbb91d8ced

it says "standardisation amongst the multilibs on how the alternatives
are named and prioritiesd. The priotitisation code needs to be added
but this change means there is somewhere to add it."

so the intent was to allow the user to define which multilib should be
the higher priority and add in some prioritisation code.

The correct way to fix these warning is to add such code, allowing the
user to specify the order of priorities of the multilibs.

Cheers,

Richard



