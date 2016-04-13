Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 59A07612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:38:40 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id c4so61596990vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=77NB/b68QwDspw0K+oRHxx0HPHbAlX7J00X3hx2xFg8=;
	b=Q/E1XxZCyNIuGptNGQAiraIQFKSSB8QOpsbEyVKe4kpgvEke/5IY+XnH9oeiV4CRvJ
	0XPhLXQ7aCHPsqYe1budA7DAcG3vRXg2eMFi2Rcodvas4+KOeeqBAFLyOghJTfZ0K48E
	ngj1tgjj1yw//5CNu+g4haRtRTExh8GgqERb6MkRs3fjLFK7NphAEIotKEfhg3wYnVqQ
	qp0wm6NOltHOFDuiYdiEbakW92K70+DmyuO2HncXw4g5sNY6RSbz+KyXGXou8/wAgZR/
	k7FR+52s+IxIafPXnFKaNe/boPNdU3jDKXQNFm4a3iTglkIRJ2nZM7GEE9s3PfGclMtA
	iksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=77NB/b68QwDspw0K+oRHxx0HPHbAlX7J00X3hx2xFg8=;
	b=E0geaFUhlop8hCMq+KZ/dKWBNECPxvF46qjdXY4WaFTDbjx74uM5txl/2rpsH4i618
	vWMmMxhRuAlJwphkbwSWD9OxKMB3vR9BTRxWbf+8cb7s6BD5FeL9T2BGBlZi0q9H16bl
	Oum9iuCWMQqs/pUH6IzZEh5EJraApAklIALOqsd/rJ3lpg87ACsh/ivXU4gbtCmOi4CW
	DDLou9H7Irc4tFzERt1ruuCLHe+6eXjzwMh7B+xQZ4p8imymcK5z6g1quGSp+Z0kgWq3
	kQ+jXxVR3a//hEZDxsq7QkWKCPXBRcPpBAm5gtPTsp14xs4QIgbfH6JgJ8ZFSbisHQCi
	uLvw==
X-Gm-Message-State: AOPr4FWb1BDS/swK4YHDFPQFtdE0Lrhtzfd6p7wvqYto+uTBy7GEwPgHx+2+VT0aciJ/JIYWSOkfcQJah/+aWg==
MIME-Version: 1.0
X-Received: by 10.31.149.78 with SMTP id x75mr4377937vkd.103.1460540321703;
	Wed, 13 Apr 2016 02:38:41 -0700 (PDT)
Received: by 10.103.102.6 with HTTP; Wed, 13 Apr 2016 02:38:41 -0700 (PDT)
In-Reply-To: <CAJTo0LbAA06bkAEwFx9N6m15WdsjCSiaepejoB_swXo2oYNudQ@mail.gmail.com>
References: <CAFkk2KSu80ndUE=KDJeVmU4_CLZTOpJXN7g9=-W=DEkn7Khs2g@mail.gmail.com>
	<CAJTo0LbAA06bkAEwFx9N6m15WdsjCSiaepejoB_swXo2oYNudQ@mail.gmail.com>
Date: Wed, 13 Apr 2016 11:38:41 +0200
Message-ID: <CAFkk2KSKY7BSWqGfXsffqUsNJvBJ8y1f2t+JS9q+e3n1f8GCuw@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:38:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 11:34 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 13 April 2016 at 10:07, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>>
>> The problem seems to be a race with building libbsd (and unlucky
>> timing in my build). Adding libbsd to DEPENDS fixes the problem.
>>
>> For some added context, libtdb uses a nonstandard ./configure from the
>> Samba project based on a configuration utility called Waf that I'm a
>> complete noob on. Perhaps there is some way to disable libbsd support
>> instead.
>
>
> This recipe is in meta-oe so this should be on the oe-devel list, not
> oe-core
>
> And yes, it looks like tdb has a floating dependency on libbsd.  Someone
> would need to determine if it's best to depend on libbsd always, or tell tbd
> to not use libbsd even if it can find it at build time.
>
> Ross

Okay, I'll send a copy to oe-devel.

Cheers,
Ulf

