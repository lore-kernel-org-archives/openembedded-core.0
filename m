Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S8YlP-0006si-3U
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:08:19 +0100
Received: by eaae1 with SMTP id e1so2001816eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=eJQH3kOz0I98bXp87I4bUW+8f42li2UMonvUcf05c6A=;
	b=tZryIS3IyhRG23mWx8Bx0UnYZ6VgQ/J2U2CIhZ8U8TujotxDqXGIj410ckQgsB0ON2
	/ymQfLYO54m9v+xTCQVUWpVWhSvqy34Nzj2Lk9EXd0ycNkXATyBLdu8glqcz4q/J0ReT
	xV9sH/V7FhI0I6Mocm1vL1BzVAjhjc0fXTH5hgrgHNweOhJNHX1pqsoANDemQ+4eqmI6
	8pOULHFP/DvJ48JkSObq8lpTRKcrmkVw9l+OmcWFu02r2+jgJEmjwivxixqkz0vQV+Ya
	EA43+T5fhJwzbkPPP21OB/KGPLVjuFEdQnpX41krH0dQJZkId+i6w2zD7ajLgOdaargh
	ldHQ==
Received: by 10.224.31.203 with SMTP id z11mr4019377qac.72.1331909970891; Fri,
	16 Mar 2012 07:59:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.103.147 with HTTP; Fri, 16 Mar 2012 07:59:10 -0700 (PDT)
In-Reply-To: <1798766.ZRL8z9Exog@helios>
References: <840A81C1B782724A8EB52725BD519EFF33809F54@MBX20.4emm.local>
	<1798766.ZRL8z9Exog@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 16 Mar 2012 07:59:10 -0700
X-Google-Sender-Auth: t4GDnWI_Pz4vi9MR39971FVd-gE
Message-ID: <CABcZANnAXXBa-UQYiMijWVvX7ggGEGh65bzQaFPNq-nFt4KbYQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: race condition... in cp?
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
X-List-Received-Date: Fri, 16 Mar 2012 15:08:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2012 at 4:35 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 16 March 2012 06:58:40 James Limbouris wrote:
>> Hi,
>>
>> I got a strange error when bitbaking two images after removing some file=
s in
>> the deploy/images folder. It looks a whole lot like the cp's from the
>> individual tasks were racing... I didn't know this sort of thing could
>> happen.
>>
>> bitbake rica-dev-image rica-release-example-image
>> <...>
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: multiple providers are available for runtime libssl
>> (openssl-nativesdk, openssl) NOTE: consider defining a PREFERRED_PROVIDE=
R
>> entry to match libssl NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> NOTE: Running task 3673 of 3692 (ID: 23,
>> /home/james/oe/meta-rica5/recipes/images/rica-release-example-image.bb,
>> do_rootfs) NOTE: Running task 3685 of 3692 (ID: 8,
>> /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs)
>> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Started
>> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Started
>> ERROR: Function failed: do_rootfs (see
>> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-i=
mag
>> e-1.0-r0/temp/log.do_rootfs.4011 for further information) ERROR: Logfile=
 of
>> failure stored in:
>> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-i=
mag
>> e-1.0-r0/temp/log.do_rootfs.4011
>> Log data follows:
>> | ERROR: Function failed: do_rootfs (see
>> | /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev=
-im
>> | age-1.0-r0/temp/log.do_rootfs.4011 for further information) cp: cannot
>> | create regular file
>> | `/home/james/oe/build/tmp-eglibc/deploy/images/rica5/README_-_DO_NOT_D=
ELE
>> | TE_FILES_IN_THIS_DIRECTORY.txt': File exists
>> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Failed
>> ERROR: Task 8 (/home/james/oe/meta-rica5/recipes/images/rica-dev-image.b=
b,
>> do_rootfs) failed with exit code '1' Waiting for 1 active tasks to finis=
h:
>> 0: rica-release-example-image-1.0-r0 do_rootfs (pid 4008)
>> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Succeed=
ed
>> NOTE: Tasks Summary: Attempted 3685 tasks of which 3683 didn't need to b=
e
>> rerun and 1 failed. pseudo: You must set the PSEUDO_PREFIX environment
>> variable to run pseudo. pseudo: You must set the PSEUDO_PREFIX environme=
nt
>> variable to run pseudo.
>>
>> Summary: 1 task failed:
>> =C2=A0 /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_ro=
otfs
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.
>>
>> Perhaps we should be using cp -f, or discarding the result?
>
> I tried to use -n originally, but apparently that's not a standard option=
 we
> can expect to be available everywhere so it had to be removed. I think in=
 this
> case the easiest thing to do is just ignore the failure since if it's gen=
uine
> it's not catastrophic and also it's highly unlikely you won't get a subse=
quent
> failure elsewhere. I'll prepare a fix.

I had a fix for this, but apparently I never got it merged. As you
say, the easiest way is to ignore failure. You can't use -f, because
of how cp does its checking - the failure still occurs. And of course
you can't check for existence first, as that's a race. The fix I had
just used shell redirections (>) instead of cp, as they don't care if
the file already exists.
--=20
Christopher Larson


