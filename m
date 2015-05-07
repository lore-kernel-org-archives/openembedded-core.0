Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B175473EF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 06:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t476rOf6018892; Thu, 7 May 2015 07:53:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fAmefpPKb9Mi; Thu,  7 May 2015 07:53:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t476rAak018889
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 May 2015 07:53:22 +0100
Message-ID: <1430981590.8074.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 May 2015 07:53:10 +0100
In-Reply-To: <000AAC87-CE74-45DC-A006-D4704D8841D8@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
	<4ffe99f25368e8b65df327fb9120ebca1c29e925.1430895556.git.raj.khem@gmail.com>
	<1430899916.8074.20.camel@linuxfoundation.org>
	<000AAC87-CE74-45DC-A006-D4704D8841D8@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
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
X-List-Received-Date: Thu, 07 May 2015 06:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-05-06 at 23:47 -0700, Khem Raj wrote:
> > On May 6, 2015, at 1:11 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > But we build gcc-cross-arm once. This will cause it to rebuild depending
> > on which machine you target? Worse, it likely will now do this for all
> > architectures, not just arm.
> 
> only when float ABI changes which may be common across a subset of architectures.
> 
> although, I think its going to become a severe usability issue. Look
> at the archives there are so many issues reported in various forums which end up exactly to this problem, since users expect
> that once they installed the SDK it works out of box for the default architecture which is not
> the case. It just seems wrong build optimization to make it common per arch it if we can’t have user expectations met.

To be honest I haven't seen that many reports of the problem. We do ship
an environment file and in that file we have the options gcc needs to
work, the sysroot, the other cflags and the float abi. Unless we go back
to a setup of hardcoding the cflags into gcc and have a gcc per set of
cflags, this isn't going to work since it solves part of the problem but
not all of it.

Our other alternative is to wrap gcc with a script (preferred in PATH)
which ensures the right cflags are present. I'd obviously prefer not to
do that but it is an option if we believe people can't cope with the
environment script.

Cheers,

Richard



