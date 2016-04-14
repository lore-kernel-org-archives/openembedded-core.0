Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9E76011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3E8EtWO028953; Thu, 14 Apr 2016 09:14:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kb-7lkMmOsMc; Thu, 14 Apr 2016 09:14:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3E8Eprt028950
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 Apr 2016 09:14:52 +0100
Message-ID: <1460621691.9308.162.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Apr 2016 09:14:51 +0100
In-Reply-To: <CAJ86T=VDX8QpecxVbjEJNyxiymp9CeqcqYXV2-ARTML4ZdiAjw@mail.gmail.com>
References: <CAJ86T=VDX8QpecxVbjEJNyxiymp9CeqcqYXV2-ARTML4ZdiAjw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Warnings from autotools_copy_aclocals()
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
X-List-Received-Date: Thu, 14 Apr 2016 08:14:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-13 at 16:58 -0700, Andre McCurdy wrote:
> Does anyone else see these type of warnings from
> autotools_copy_aclocals()? I don't remember exactly when they started
> (a few months ago at least, maybe more).
> 
>   WARNING: gmp-4.2.1-r0 do_configure:
> /.../build-dcx960-debug/tmp/sstate-control/manifest-dcx960-debug
> -glibc-initial.populate_sysroot
> not found
>   WARNING: gmp-4.2.1-r0 do_configure:
> /.../build-dcx960-debug/tmp/sstate-control/manifest-dcx960-debug
> -libgcc-initial.populate_sysroot
> not found

Yes, I also do have a rough idea of the cause.

They happen in builds from sstate where the system has decided that for
whatever reason, a given dependency isn't needed. The aclocal
dependency traversal code looks down the full dependency list and warns
when these things aren't present.

Examples of sstate's decisions would be skipping libgcc-initial when
libgcc is available, same for glibc-initial and glibc.

Somehow we need to reconcile the two views. sstate is clearly correct
or there would be failures. The question is how to make the aclocal
code have the same understanding (which will then limit the number of
aclocal macros copied in).

Cheers,

Richard

