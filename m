Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 47BCC6AC56;
	Sat,  2 May 2015 21:55:25 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so59559642igb.0;
	Sat, 02 May 2015 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+VH2Lx+9GfqjkZoCiGB7/qEbMJSgeZt62nXc2GqGAF4=;
	b=qGoGE90Qx7l7lBmiDftx/AajiMXnoNAFQFUaNACChOcmqaGPshKgpRffT7grO9JOWH
	9dhIbpGWAXIYxqGHHIqb4L+v5xqKnhhwkmxiKcTDc/L8gRN9HQgNstzHaFffjJo39UOu
	Sr7tYaf/oNLYCIZiNOVWAn54NwDLCjG0OzMje5TLk/3yfhmVn058RLe7MMzyA48bTA3x
	nzcWPiW3Fg9rcjdQkzFJpeComrBRY7+gqJGTyr2kblX9H84o6Ck0cijoFN+o37Q9i7KH
	a5KedlmXA/UireP4Jh3EzXSI02jLITWlG+XQ0H0qdPRv92HXTPQ/WzT61jYPHGwzRwrf
	uwLQ==
MIME-Version: 1.0
X-Received: by 10.107.164.209 with SMTP id d78mr20000237ioj.73.1430603726608; 
	Sat, 02 May 2015 14:55:26 -0700 (PDT)
Received: by 10.36.3.206 with HTTP; Sat, 2 May 2015 14:55:26 -0700 (PDT)
In-Reply-To: <20150501160602.GA5885@denix.org>
References: <20150501160602.GA5885@denix.org>
Date: Sat, 2 May 2015 23:55:26 +0200
Message-ID: <CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Sat, 02 May 2015 21:55:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Hi,
>
> Has anyone ever seen this message during <image>.do_rootfs task?
>
> Collected errors:
>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
>  * opkg_install_cmd: Cannot install package <package>.
>
> We started seeing it on random packages inside the <image> few weeks ago on
> different machines. At the time we had switched to bitbake 1.26. But even
> trying different bitbake versions still occasionally caused the same error, so
> the culprit is still unknwon. Using oe-core/daisy for now.
>
> Any comments or suggestions to where start looking would be appreciated!
> Thanks.
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Hi,
yes, I have seen this during multimachine builds.
My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populated
from sstate.

Configuring packagegroup-base.
Collected errors:
  * opkg_install_pkg: Package update-rc.d md5sum mismatch. Either the
opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package psplash.
 * opkg_install_pkg: Package update-rc.d md5sum mismatch. Either the
opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package packagegroup-base-extended.
 * opkg_install_pkg: Package run-postinsts md5sum mismatch. Either the
opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package run-postinsts.
 * opkg_install_pkg: Package update-rc.d md5sum mismatch. Either the
opkg or the package index are corrupt. Try 'opkg update'.
 * opkg_install_cmd: Cannot install package packagegroup-core-boot.
ERROR: Function failed: do_rootfs

I retried right now after reboot (clean tmpdir) but this time it didn't happen.
Once/if I find the way to reproduce it I'll open a bug.

Cheers

Andrea

