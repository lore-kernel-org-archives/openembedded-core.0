Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjIrG-0000KB-7m
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:05:59 +0100
Received: by pbcc11 with SMTP id c11so1029367pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=A/f64b6PDuwDyg0PY75luqrlBqewacTShWbSS+ojlf0=;
	b=Ag8xsWvHAHjbonO+iius1z3/PwpDt8mL18LLHrO6PSUmdHPWsp7qcNpvZjeyEM59yS
	92xMjj/2xFvhwOib0iLxvjQtOVk/N72uQzAAJecRtryKj1TQRxTktq/ap5bGwmLh5T2E
	NARymty1xJ5oqabn5g1QGKUms+dMAIL05+8tI=
MIME-Version: 1.0
Received: by 10.68.72.69 with SMTP id b5mr18525700pbv.120.1325890712737; Fri,
	06 Jan 2012 14:58:32 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 6 Jan 2012 14:58:32 -0800 (PST)
In-Reply-To: <1325847433.20759.80.camel@ted>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com> <4F03982D.1080601@linux.intel.com>
	<CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
	<CAAQYJAvu-n9eyXV8kj3=34_wzhdfec5Nit9uUy_ar=jFK1tFaQ@mail.gmail.com>
	<1325766615.20759.67.camel@ted> <4F0633EB.9030708@linux.intel.com>
	<CAAQYJAtV9moez4thDcRtbm_0w=b+F_q2ag344PiUytRe_g-ysg@mail.gmail.com>
	<1325847433.20759.80.camel@ted>
Date: Fri, 6 Jan 2012 23:58:32 +0100
Message-ID: <CAAQYJAtSA1qXybLaVqjavWi7PeSy+q12iaAhJx39OK7YHcekrQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Fri, 06 Jan 2012 23:05:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 11:57 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-01-06 at 02:00 +0100, Andrea Adami wrote:
>> On Fri, Jan 6, 2012 at 12:36 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>> >
>> >
>> > On 01/05/2012 04:30 AM, Richard Purdie wrote:
>> >> On Thu, 2012-01-05 at 01:05 +0100, Andrea Adami wrote:
>> >>> I'd say we have to test for the in-existence of the file instead of
>> >>> blindly touching it.
>> >>> Smthg like
>> >>>
>> >>> if [! -e ${IMAGE_ROOTFS}/init]; then
>> >>> touch ${IMAGE_ROOTFS}/init
>> >>> fi
>> >
>> > Why? Touch creates it if it doesn't exist and updates the modtime if it
>> > does. It doesn't modify the content of the file if it exists. What is
>> > the motivation for testing for it's existence?
>> >
>> touch fails with Permission denied because one package in my rootfs
>> already created the symlink
>>
>> >>>
>> >>>
>> >>> Now, repeating that block for all 4 cpio images is a bit ugly... better ideas?
>> >>
>> >> Make it a shell function we call? I'd also check for
>> >> ${base_sbindir}/init first too?
>> >
>> > Why check for that? So we can link to it instead of creating an empty file?
>>
>> Nonsense, kernel looks for /init
>> ( http://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
>> )
>
> Yes, please ignore my comment about /sbin/init, I'm misremembering
> something. We should deal with the symlink case though.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

ok, I think the issue is the behavior of touch when trying to change
the timestamp of a symlink.

http://fossplanet.com/f13/bug-7122-touch-gnu-coreutils-7-4-no-way-touch-symlink-57418/

Using 'touch -h' seems solving the issue and the image is built.
However, the timestamp of the /init symlink now differs from the
timestamp of the binary.

Regards

Andrea


