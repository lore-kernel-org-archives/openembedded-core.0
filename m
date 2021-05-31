Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.41794.1622451062282111937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 01:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Ftpsv5w3mz5tlJ;
	Mon, 31 May 2021 10:50:59 +0200 (CEST)
Date: Mon, 31 May 2021 10:50:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] switching some legacy bbclass stuff to use "noexec"
Message-ID: <20210531085057.ndae2r4ay2abqa77@qschulz>
References: <79429a39-6f7f-8a9b-7b4b-18d791685d7@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <79429a39-6f7f-8a9b-7b4b-18d791685d7@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sun, May 30, 2021 at 04:31:24PM -0400, Robert P. J. Day wrote:
> 
>   am i right in assuming that stuff like this in ptest.bbclass:
> 
>   do_configure_ptest() {
>       :
>   }
> 
> can be replaced by using the "noexec" flag?
> 

No.

[noexec] effectively disables the whole task while the code snippet
above allows to _prepend, _append, overrides for a given
machine/distro/target/native.

Also, I assume that you need a tak to be defined in order to addtask it
and then noexec it?

>   if so, then this in base.bbclass looks a bit strange:
> 
>   do_build[noexec] = "1"
>   do_build[recrdeptask] += "do_deploy"
>   do_build () {
>         :
>   }
> 

Don't know if it actually makes sense, but this defines a build task,
which can then be "noexec"-ed. One can then decide to exec it and
add code to the function.

Since do_build is the task that is called when you do bitbake <recipe>
(and probably many other scenarios, e.g. EXTRA_IMAGEDEPENDS?) it should
always be defined even though it is just basically the root node of the
task dependency tree.

Cheers,
Quentin
