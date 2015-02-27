Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7F7718DD
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 18:13:41 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so19026787lbv.0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=geJ5r/VxAg8D75FvkIZ7bBimRCV5sad+w+qEyNRN/qw=;
	b=OK0Kigjw6y21Vir3KctESn8Dv2olU54hnyynwHPC0nXV7TYkEWHWjy9QVJa9fM/iEq
	zpMN9ShT10UhnqP78qNTuY3gjrdvb9TYK92UHwZi/Dj/cUOsE72zDuO0vMpRKc5/UmUd
	4dNDUhdcOiCgmgizeu9gbxhVFvaXxD0nhFGItYG0pZrchRAdMJU6c99rbE8kMhg7DfdM
	XEd/bgG1SsFyGJQXpjvMW945f81gWD4+PZJZrJNOOBAA3u6JFDogvwfVjOBF5IVY6yBn
	FJK2sWH0VzXgSQ9BfiEtn/pe0OqV36tsT843pK80otvwniIPIHvG5nKznZltwDFITSRf
	eJdQ==
MIME-Version: 1.0
X-Received: by 10.152.87.178 with SMTP id az18mr14194478lab.122.1425060821803; 
	Fri, 27 Feb 2015 10:13:41 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Fri, 27 Feb 2015 10:13:41 -0800 (PST)
In-Reply-To: <BN3PR0501MB1090B6DA7D327EEE4D86FA72BB150@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090B6DA7D327EEE4D86FA72BB150@BN3PR0501MB1090.namprd05.prod.outlook.com>
Date: Fri, 27 Feb 2015 13:13:41 -0500
Message-ID: <CADkTA4MBgcCvdUbDr_Zo9Aj0bBJ+t3oguWvYWEUUB2qvZ9WbZQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Build error on Fedora 21: "Unsupported version of git (2.1.0)"
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
X-List-Received-Date: Fri, 27 Feb 2015 18:13:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 12:17 PM, Bryan Evenson <bevenson@melinkcorp.com> wrote:
> All,
>
> I'm transitioning to a new laptop and I've installed Fedora 21 on the new one.  I'm trying to build for the first time and I'm running into some issues.
>
> I'm still on the dylan branch.  I have an image that is based on core-image-minimal with a few additional packages.  When I attempt to build my image, it fails when attempting to patch the Linux kernel.  The failure message in log.do_patch says:
>
>         Unsupported version of git (2.1.0)
>         [ERROR] unable to complete push
>         pending patches are:
>         Unsupported version of git (2.1.0)
>         ERROR. could not update git tree
>         ERROR. Could not apply patches for at91sam9x5ek.
>
> So I'm assuming what happened was the build system's version of Git was used for the initial kernel checkout but the host's version of Git is being used in the do_patch step.  However, I haven't a clue what to do about it.  Any ideas?

That older set of kern tools used guilt to push / maintain the kernel patch
queue. guilt unfortunately has a version check, and if the version hasn't
been added, it aborts.

So you'd need to patch guilt to add that version into its case statement (and
then hope that no other behaviours have changed to break the commands
guilt is running).

Bruce

>
> Thanks,
> Bryan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

