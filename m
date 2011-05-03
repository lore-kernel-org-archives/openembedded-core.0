Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QHAkg-0002WY-Um
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 10:14:39 +0200
Received: by bwz5 with SMTP id 5so6130811bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to:x-pgp-key
	:user-agent; bh=Yb2GUrzo2AFpiwd3pnclpwgmpfApvnCqXC8h2K7MBwA=;
	b=csa9Y9jlunfNwV4cDWuIQq1U/VmUlhgIuUWKUYUMerogYwd7SezHqlzRfTzsLKZ/0v
	yXDZZVcLr2zP7zoX2j4WxDK9IfX8uOr7XmJTyJ/BDS10AlpNwi0deNm5S4EvJ98WubWU
	wXovnuwAKJrxNBE2NBqid3eKsTOwYu9SZd0GQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:x-pgp-key:user-agent;
	b=gjm5ajW1kzpAXSTmaikuKwJk5dr9adgXmMkTafQcCPFR3XYWPPqj9MJOJJjjXdJSXm
	5OVeze7MXp0A/II4OcZ67YHbqCnYs/TiV9J2shpH/I4Gu1Uldyn9BUXBw8CJueqXtYoQ
	2nAEcU7mY6BFtdiOY3u6CcAO17DOiZK7FP8bs=
Received: by 10.204.136.213 with SMTP id s21mr6241610bkt.0.1304410321795;
	Tue, 03 May 2011 01:12:01 -0700 (PDT)
Received: from becca.researchstudio.at ([62.218.44.194])
	by mx.google.com with ESMTPS id d11sm3755413bka.19.2011.05.03.01.12.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 01:12:01 -0700 (PDT)
Date: Tue, 3 May 2011 10:12:00 +0200
From: Michael Lippautz <michael.lippautz@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110503081159.GA29813@becca.researchstudio.at>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
	<9AB9810D-F908-4477-888F-056039505DCF@dominion.thruhere.net>
	<BANLkTik1anmE4n7fKMp4uV9ZSLK1Gx_C0g@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D86872CF@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94D86872CF@orsmsx504.amr.corp.intel.com>
X-PGP-Key: http://cs.uni-salzburg.at/~mlippautz/pub.asc
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Tue, 03 May 2011 08:14:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 02, 2011 at 09:57:18AM -0700, Kamble, Nitin A wrote:
> Michael,
>    This patch is invasive for python recipe but looks fine to me. How much testing have you done? We have few python extensions in yocto repo, and none of them were hit by this issue. So which python extensions are seeing the issue?

Basically any package that uses Python extensions [1] including C libraries
should suffer from this. The compilation of the package issues a cross-compile
warning, but the packaging should fail due to QA checks.

Background [once more]:
When building Python packages that contain C extensions, distutils has to figure
out the compiler/linker options. Distutils utilizes its own sysconfig module to
do so. However, this distutils.sysconfig module fetches the variables from the
sysrooted Makefile (of the target). Without this patch this results in
-I/usr/include and -L/usr/lib in the compiler/linker execution. (Python C
extension are linked against -lpython2.6 for various reasons.)

The patches shuffles the Makefiles (sysroot/target) around in a way that for
each bitbake step the right file is in place.

I did test this with some (private) packages and a gpsd build (2.96) that I have
not yet pushed somewhere. Everything works as expected so far.

> Thanks,
> Nitin
> 

Regards,
Michael

[1] http://docs.python.org/distutils/setupscript.html#describing-extension-modules


