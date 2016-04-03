Return-Path: <max.oss.09@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 268B37680A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 22:51:28 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id fp4so85012009obb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=VuIg1b/mwJu29T5o134M53KF/OKkjuAk0MclbuGZkjw=;
	b=Wz7yfd8HuXMlHi3m+CvJQfIhLn1BE5cM9JjbuQoNULcPhxy/U2rVvb2xR+lCduBsJD
	ELIRh6BeXdE25/28EALY2v7JpBMDAwqqq2mDABFq8Fmd/8ZKnEo414LRllR3xCqfVpN0
	U4juJI+9ARHsYGm++ThkmPGrk+RoJdv8tB98kCuhWJ/kqDQxFnRINpX65FHpfXHcXHju
	pxPvCO2H3IqHi4ojLRvNQ/Q7nS0Wd0CbQCb3GXmLX62g6PxBmgIjfUfp9/UIu1IOaSDH
	ynPXwb1Tiahugd23kALM1Dgql/sD6JJwO4Gce9/9aNWTb/VTnws5gkFHMdpWYk/1IpYf
	fmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=VuIg1b/mwJu29T5o134M53KF/OKkjuAk0MclbuGZkjw=;
	b=cRysGBawX3V/K9UR8iUAEK5pKizdocycuVsLqS3TQ0anQfHs6Yze/hQU3oX5KimS9J
	2qfVg142duunuw3jt2KsB4Sl5/65Pvc2TX9CVuyNgKxzwPR7iN8AncWG6WKOd6fWhHHY
	FY3CGleKfFEVdytU6y/f4rfI91JXW9sGbNLutdw63KFyyh0OBt45J4vmKQNaJbF8mboT
	xh08uRiNtma4xM59NyL3xfljIZ6LnK8VmONQuxSknH5FyoG3HKKRuakRUizAxR6DOl1f
	V8/08GKRXIrIG9u6UbWLyT1HIHT1qJjCAVrZdUf1+tkgJSPtby2Nx8ZUdV28yr+oS7vK
	LGvg==
X-Gm-Message-State: AD7BkJJYIo1ZiLg8i7hHrAuV5L0WQYvMvzY+PKy4Y7d83FPMh4xHrC43c70Dkakfixf3SIDUKQaSkUCnkDDnNA==
MIME-Version: 1.0
X-Received: by 10.60.129.166 with SMTP id nx6mr2649582oeb.13.1459723889316;
	Sun, 03 Apr 2016 15:51:29 -0700 (PDT)
Received: by 10.157.5.203 with HTTP; Sun, 3 Apr 2016 15:51:29 -0700 (PDT)
In-Reply-To: <1459719934.7348.141.camel@linuxfoundation.org>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
Date: Mon, 4 Apr 2016 00:51:29 +0200
Message-ID: <CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 22:51:31 -0000
Content-Type: text/plain; charset=UTF-8

2016-04-03 23:45 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
>> Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
>>
>> Source files deployed with the *-dbg packages are owned by the user
>> running bitbake leading to warnings as the one below.
>>
>> WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc
>> -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid
>> 1000, which is the same as the user running bitbake. This may be due
>> to host contamination
>> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h
>> is owned by uid 1000, which is the same as the user running bitbake.
>> This may be due to host contamination
>> glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is
>> owned by uid 1000, which is the same as the user running bitbake.
>> This may be due to host contamination
>> ...
>>
>> The files are copied as part of the do_package task.
>> The patch chowns all file in packages/usr/src after cpio copied them
>> into the
>> package directory.
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> ---
>>
>>
>>  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass
>> b/meta/classes/package.bbclass
>> index bdbe96d..d9ef62c 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
>>      # and copied to the destination here.
>>
>>      import stat
>> +    import subprocess
>>
>>      sourcefile = d.expand("${WORKDIR}/debugsources.list")
>>      if debugsrcdir and os.path.isfile(sourcefile):
>> @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
>>          if retval:
>>              bb.fatal("debugsrc symlink fixup failed with exit code
>> %s (cmd was %s)" % (retval, cmd))
>>
>> +        # cpio --no-preserve-owner does not create the destination
>> files with
>> +        # owner root even when run under pseudo, chown them
>> explicitely.
>
> How about passing --owner=0:0 to cpio?

That was my first try, it didn't help.
I'm also not sure if do_package() is executed under pseudo by default.
Also since the command is a pipeline, I don't know if pseudo is
propagated from one command to the next.
Actually I feel a bit as a sorcerer apprentice when it comes to
python/pseudo/packaging.

>
> I'm a little worried about why I don't see this failure on my own local
> builds.
I added some text to bugzilla. The gist is: In poky the sources are
not deployed.
No source files, no wrong ownership.

What I did is doing a repo setup of angstrom master.

Removed the following from bblayers.conf because of parsing errors:
  ${TOPDIR}/sources/meta-uav
  ${TOPDIR}/sources/meta-kde4
  ${TOPDIR}/sources/meta-edison
  ${TOPDIR}/sources/meta-atmel
  ${TOPDIR}/sources/meta-minnow
  ${TOPDIR}/sources/meta-altera

And then:
. setup-environment qemux86
bitbake core-image-minimal

Regards
Max

>
> We have a few cases where things sometimes seem to work out and
> sometimes don't and I'd love to get to the bottom of how to reproduce
> it and to understand why its different for different people.
>
> Cheers,
>
> Richard

