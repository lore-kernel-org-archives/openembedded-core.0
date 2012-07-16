Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SqlZ0-000287-Dp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 15:42:14 +0200
Received: by qcad10 with SMTP id d10so2944789qca.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=I9fgX1WNoTlluy+01Tu0QFh8s9oBcyD6eW5UT4o0C1Q=;
	b=Gj+O3oG8Top1jSdkeMWYY/Nshi96XzDxCx9s0h3y32wuAio6WkSQp/P7woppiNbbZF
	lqD91BTadO0yiyU+IgoUJmHgRXY9Juz5BxbJDSQiLrdEw715kd67hr9HgXNqBDR5uvI1
	ERGes6F4AfdNZf7e0XoGj8ztfcDSrcc1R2EE3SMuDbZj/Gc5LxCY6294EEK0K6xlXf4M
	PNTfcXUAoU+HJwU/HyTLzc0oIHoxKjaFMJuxf4SO/QS2SETF/hzo9XJx503G5PhlnI2z
	BXWzmzOUVtp2JKnOkK6INaslg1Pfynf4Nb4MJSVFtnn0y0ujEc4x6l4RuHiRh6cvjj5Y
	pbLg==
MIME-Version: 1.0
Received: by 10.229.137.141 with SMTP id w13mr6015665qct.102.1342445455840;
	Mon, 16 Jul 2012 06:30:55 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Mon, 16 Jul 2012 06:30:55 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207160844430.29289@oneiric>
References: <alpine.DEB.2.02.1207160844430.29289@oneiric>
Date: Mon, 16 Jul 2012 09:30:55 -0400
Message-ID: <CADkTA4NC4EtDMPdSdZG98z0yXo4JVwvbMXx4688w1grgx28sQw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: apparently superfluous 'do_kernel_checkout[dirs] = "${S}"'
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
X-List-Received-Date: Mon, 16 Jul 2012 13:42:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 16, 2012 at 8:49 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   yes, more pedantry ... just to make sure i'm (again) not missing
> anything subtle, but it seems that this line in kernel-yocto.bbclass:
>
>   do_kernel_checkout[dirs] = "${S}"
>
> is unnecessary since kernel_checkout() explicitly removes and
> recreates that directory anyway.  no, i'm not going to submit a patch
> for that :-), just want to know that i'm understanding this correctly.
>
>   i guess the same could be said for the line below that:
>
>   do_kernel_configme[dirs] = "${S} ${B}"
>
> since that step happens after the kernel checkout and one would think
> that at least ${S} must exist at that point or something's gone
> horribly wrong.

These are required. git is your friend on these ones, they are all related
to making sure that the right directories always exist for sstate, and other
task ordering problems. Richard and Saul added most of them to fix
various corner cases .. so it's not a matter of unnecessary, it's a matter of
safety, and they do no harm .. so I won't touch them with a 10 foot pole :)

Cheers,

Bruce



>
>   back to proofreading ...
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


