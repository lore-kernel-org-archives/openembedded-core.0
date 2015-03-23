Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 391976AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 22:33:42 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so200971378pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ufFb6/P1FJ8TGe961fJyhZeyVLAz0Q056tdQVfW0iKk=;
	b=MNAx7I5ise1yfvj19gK7oFORxjhjkkVvQpMxroTBdoBH4snC6G4jHVMqk2MzJ/zIS7
	TtU/sU0raeDOkf2lIJTyVSvs+3TXcpJMNx39Ob/hkHBd432pxlapI+p7CRBrQJKGykyE
	uoLRAemiyJr3+sczHNIRuDzCBrlu5AzCIYcKf6gWGxaLlkT8YbmSBGV+UzWrGrzp7UJe
	CV6r99/K6AI3Z0NZ+iBWsIleBUUE7u5RTtfYHIaKbm04ThP/x7hTmXaSK6mDl22FNL4N
	xinBHKPf05GmncSUOi3Iiou2MUaFNg4/6CPn7ur79uXXcwKNzYcdjhVd7fulSo49aiUn
	ccKw==
X-Received: by 10.70.48.37 with SMTP id i5mr2008548pdn.111.1427150023708;
	Mon, 23 Mar 2015 15:33:43 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id fk4sm1971780pbb.80.2015.03.23.15.33.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 15:33:42 -0700 (PDT)
Message-ID: <551094C1.8020507@gmail.com>
Date: Tue, 24 Mar 2015 09:33:37 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1427147834.3412.89.camel@intel.com>
In-Reply-To: <1427147834.3412.89.camel@intel.com>
Subject: Re: systemd + run-postinsts.service
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
X-List-Received-Date: Mon, 23 Mar 2015 22:33:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 24/03/2015 8:57 AM, Patrick Ohly wrote:
> Hello!
>
> I'm using systemd from OE-core master to boot core-image-minimal. I'm
> seeing a boot failure where "Run pending postinsts" (aka
> run-postinsts.service) gets stuck during booting under very specific
> circumstances:
>
>       1. The package has a pkg_postinst_${PN} which (intentionally)
>          failed during image building, thus delaying its execution to the
>          first boot.
>       2. The package uses "inherit systemd" to enable its own systemd
>          service.
>
> It seems to be "systemctl start <service name>" which is hanging,
> because I can reproduce the same behavior without systemd.bbclass in the
> following pkg_postinst:
>
> pkg_postinst_${PN} () {
> #!/bin/sh -e
>     # Cannot run during image building...
>     if [ x"$D" != "x" ]; then
>        exit 1
>     fi
>
>     # Do something on target during first boot.
>
>     systemctl enable foobar
>     systemctl start foobar # <====
> }
>
> It works without the last line. The actual recipe is a bit more complex,
> but I can try to create a dummy one if that would help.
>
> Any idea what could be causing this and, more importantly, how to fix
> it?
>
>
>
I am not sure how well systemd works with executing systemctl to 
manipulate services from within a service that is starting...

What is the definition of foobar.service?
foobar.service may depend on other services/mounts/targets to start 
before it but since "systemctl start" is blocking, those dependencies 
may not be satisfied yet until sometime after run-postinsts.service 
which can result in a circular dependency deadlock. See 
DefaultDependencies, After, Before in 
http://www.freedesktop.org/software/systemd/man/systemd.unit.html.

Things to try:
1. Refactor foobar.service and your image recipe to not require calling 
systemctl from within a systemd service
2. Change "systemctl start foobar" to "systemctl start --no-block 
foobar" to let the startup continue without waiting until foobar is started

Regards,
Jonathan



