Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 31982745D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 15:22:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D86AB21BCB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 11:22:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Tue, 01 May 2018 11:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fBTmCQ
	Fl8XG4xXvsA0cQiygPt5JHchqS1kjmUGpM9ng=; b=Sd7OXlxv2PZxqwK1ftBrPM
	BjOE71g5CTPsMtoWrsJrv4qAADXZOae8h4s/dPyG0Vie4Srmyi/9Z061+/Tb2y/L
	tqB+pqooTrwA708vjt5X0qI1lLAKpa6vh9FiliabDY7up0ryBtw+0tgPighp7A3e
	eKcx+rWblmWh1KmMtdXtlwe0xuh+fqsf4JkiT3+UV3KDxXhFsakwORkgKxKU9d8u
	7fCvP2K7trRDnmedGmK1HCMaSqsF94hPY39ZIL69DJ1Sft6KRkQbHYMsszs8dYgP
	aB7Ea0YWs/w+2Ht2tRbevHKaNRSM4B2KTUN+LWndcXuWUt5o/VB3I9WAq2DqlSfw
	==
X-ME-Sender: <xms:GoboWtbUne2PpGeKuZROjhr0XsgKZkX6S9R3frl9IAzCV4uRmM7fdg>
Received: from laptop (unknown [192.40.95.32])
	by mail.messagingengine.com (Postfix) with ESMTPA id 40EF4E49E9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 11:22:02 -0400 (EDT)
Message-ID: <641dd87044093e52d52360394c5ac3f2a16b4beb.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 01 May 2018 18:22:00 +0300
In-Reply-To: <20180501113655.11666-1-mac@mcrowe.com>
References: <20180501113655.11666-1-mac@mcrowe.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] alsa-utils: Fix error when removing unwanted udev rules
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
X-List-Received-Date: Tue, 01 May 2018 15:22:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-05-01 at 12:36 +0100, Mike Crowe wrote:
> If alsa-utils configure is not passed a --with-udev-rules-dir option then
> it defaults to using /lib/udev/rules.d. This meant that the hard-coded use
> of ${D}/lib in do_install in 262e69c9c7acf0beb7bb6b96299e3c993c906434
> worked correctly to remove the unwanted rules.
> 
> Subsequently, 0a4372705a030ca54ed420cdfec33d46ab93499c changed do_install
> to use ${nonarch_base_libdir}, claiming to fix this in the usrmerge case.
> 
> This means that if udev is not present in PACKAGECONFIG and usrmerge is
> present in DISTRO_FEATURES then the alsa-utils build system will install
> the rules in ${D}/lib/udev/rules.d but do_install will attempt to remove
> ${D}/usr/lib, resulting in something like:
> 
>  rmdir: failed to remove '.../tmp-glibc/work/i586-oe-linux/alsa-utils/1.1.5-r0/image/usr/lib': No such file or directory
> 
> To fix this, let's just tell configure to install the rules in a specific
> known location when udev is disabled. This location can then easily be
> cleaned up in do_install.
> 
> Tested both with and without usrmerge in DISTRO_FEATURES.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Cc: Phil Blundell <pb@pbcl.net>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Looks good to me.

-- 
Tanu

https://liberapay.com/tanuk
https://www.patreon.com/tanuk

