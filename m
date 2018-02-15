Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5545978423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 15:07:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1FF7Kcs003920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Feb 2018 15:07:21 GMT
Message-ID: <1518707240.24236.157.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 15 Feb 2018 15:07:20 +0000
In-Reply-To: <CALatG=7Fxnseh+qrNYuO0q85_H7y3eZkv9FaKsMMQ-_819FZvA@mail.gmail.com>
References: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
	<1518701655.24236.146.camel@linuxfoundation.org>
	<CALatG=7Fxnseh+qrNYuO0q85_H7y3eZkv9FaKsMMQ-_819FZvA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass: set do_bootimg recrdeptask on do_populate_lic
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
X-List-Received-Date: Thu, 15 Feb 2018 15:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-15 at 15:11 +0100, Ming Liu wrote:
> I observed this issue on rocko branch, but I think upstream also
> needs it. Since even recrdepends handling had been changed in
> bitbake, the problem here is the "recrdepends" is missing between
> do_bootimg and do_populate_lic, actually there was a bug record for
> it, see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9446, but
> the fix only considered the missing recrdepends of do_image, but
> looking into get_deployed_dependencies->get_boot_dependencies, the
> do_bootimg also needs a similar fix.

I've looked at this and this patch is not appropriate to be merged, its
a hack, piled on top of other hacks which still don't actually solve
the real problem.

do_bootimg is added before do_image_complete, after do_image, along
with a number of other image processing tasks. Either:

a) license.bbclass requires the do_image dependencies for license
processing.

b) license.bbclass requires the do_image_complete dependencies and
includes the tools used to produce the image.

There is no "in between" state. Creating some kind of mismash of
including some image tasks in the dependency list is simply not
appropriate, its defined as one or the other.

There is already "get_boot_dependencies" in license.bbclass which sets
of alarm bells. Your problem is clearly that you're not getting the
dependencies recursively.

Also, the license deploy manifest creation step is based on do_image
time, *not* do_image_complete. Its thereby defined as the manifest of
the things *in* the image, not the tools used to build the image.
Perhaps it should be at do_image_complete? If it were we might be able
to drop some of these other hacks too...

Cheers,

Richard





