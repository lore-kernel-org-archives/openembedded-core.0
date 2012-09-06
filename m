Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T9aEy-0001vv-Dp
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 13:27:20 +0200
Received: by iaky10 with SMTP id y10so1975047iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=5j/vXlJQ/XL3NJT1EG7I7AYzyK4fMr3l+EI+vyxaguk=;
	b=ped+diYnEMxjkF++uXbuUne3TXC/0/G26p8QurtHET5HZwecUE6DFONpg4KQcbugRx
	UxzbybJ0JwLpiH1JOW4cYWELRgZFISL3wnz+OwrTy7dqHUEqRb6fRuDy48A2HOIlceJk
	ITG9gwDOvO6k8ZUMhD1HkytRJ28q0A2rXQNlgPH9+eFV7OPj51r5in3bncstgLBVUKiJ
	Iez/wrPEE6xVycWxOxYNXVp470JKiaC76s6VDh8qAicSBWyTv7lXIB90SAywYZDM1Rtg
	yyXgAQUECDHdRte6zeaRAB3mcfduiQR38tzw/5UqwGjZwn6MVXudM22nO8dKCLlvI9On
	g9Dg==
MIME-Version: 1.0
Received: by 10.50.15.202 with SMTP id z10mr2258301igc.50.1346930095640; Thu,
	06 Sep 2012 04:14:55 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 6 Sep 2012 04:14:55 -0700 (PDT)
In-Reply-To: <1346928461.2673.186.camel@phil-desktop>
References: <CALbNGRR0tpkqGtN6szJc5dLqYKPRFnyeaD2tyRAk6nV50aOT8w@mail.gmail.com>
	<1346928461.2673.186.camel@phil-desktop>
Date: Thu, 6 Sep 2012 13:14:55 +0200
Message-ID: <CALbNGRRpab2YJWZbVJvLyXV8npxGW9Gv4vajTmDQ_dJOzJXqiQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: PREFERRED_VERSION_virtual/..
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 11:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 6, 2012 at 12:47 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2012-09-06 at 12:45 +0200, Andreas M=FCller wrote:
>> In meta-gumstix I am working on a central include-file where I can
>> switch kernel-sources/-versions at one single place.
>>
>> For this I need PREFERRED_VERSION_virtual/... working.
>>
>> Is there a specific reason why this is not implemented or would it
>> cause huge efforts to implement?
>
> Well, it's inherently meaningless: virtuals don't have any version
> number, only concrete packages do, and it's entirely possible that the
> different providers for a given virtual might have unrelated (whether or
> not intersecting) version numbering schemes.
>
> Why exactly do you want this?
>
> p.
>
>
Since I spend lot of time testing different kernels, I would like to
have a single location where I can setup which kernel-source/-version
is compiled [1] simply (this file is included by my machine
configuration [2]). Alongside I want to ensure that the
linux-glibc-headers share same version as the kernel [3].

So for my case: I have

* linux-mainline_3.2.bbappend (3.2.19)
* linux-omap_3.5.bb (3.5.0)
* linux-omap_3.6.bb (3.6.0-rc3)
* linux-sakoman_3.2.bb (3.2.0)

Without PREFERRED_VERSION_virtual/.. I cannot select between
linux-omap_3.5.bb and linux-omap_3.6.bb. OK I can use
PREFERRED_VERSION_linux-omap (as I am doing in [2] currently) but if I
select to build linux-mainline, I get complaints that there is no
linux-omap-3.2.9.

Hope that explains what I would like to have this feature...

Andreas

[1] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/master/re=
cipes-kernel/linux/linux-versions-overo.inc
[2] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/master/co=
nf/machine/overo.conf
[3] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/master/re=
cipes-kernel/linux-libc-headers/linux-libc-headers_git.bb
Repl


