Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6fYj-00082N-D1
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 12:03:58 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so4583070oag.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 02:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LxuSm3sqB0WigG4XpMmYNSziu2Nbox5c7x3KeMyZnGg=;
	b=CfBGDA+L53yt6mzHtnfUWnKYCE12SMJFfRAh82QrVKV1UBUoL1rhlahtlLYbYS/fA9
	FEZkYvCGCls/EmFeXt0HjtYfRCTglM+RdDOivg9UeDBkRbs66eoRoFBLth2EJ6K+6F8H
	+tbUjcuSMIsNP79hYPLtjpIKx4eNGxsMOIwaxd8nC5bNIz3HZ0gzsJRTmavpXEggmZ9k
	b7wt80pI+VcPtjBqd2h5V5HXnFtVToZqmsmdxU5G1A2XubxwQL0BxfvALkcXe2g+D0xZ
	kOlyJ/AfYB68FUbwbHahvfTG6ZCvmBtqolG3T/dC/PXLbA9KMrEyV4JNj4KsWCbr3Koz
	E09g==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr3469150oec.42.1361011671324;
	Sat, 16 Feb 2013 02:47:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 16 Feb 2013 02:47:51 -0800 (PST)
In-Reply-To: <1361006114.31795.19.camel@ted>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
Date: Sat, 16 Feb 2013 08:47:51 -0200
X-Google-Sender-Auth: 35VQfvNtnvG2aZIJdJSYulVhHaQ
Message-ID: <CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 11:03:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 16, 2013 at 7:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-02-15 at 19:19 +0100, Enrico Scholz wrote:
>> it would be nice when the decision to make the init manager a distribution
>> feature will be reverted to the old oe-meta mechanism.
>>
>> Being a distribution feature means, that packages are created in such a
>> way that it is impossible to split off unwanted and heavy weighted
>> functionality at image creation time.
>>
>> E.g. on most of my systems, I create two kinds of images: a full
>> featured, systemd based one and a very minimal rescue system with
>> busybox and some filesystem utilities.  With recent systemd packaging
>> change, the rescue image size grow up from 5.9 MiB to 27 MiB because
>> systemd dependencies are hardcoded in mandatory packages.
>>
>> Formerly, systemd dependencies could be avoided by adding the -systemd
>> packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
>> busybox-syslog-systemd rrecommend).
>>
>> I am aware that initscripts were always part of the main package.  But
>> sysvinit was very lightweighted and the extra space either negligible or
>> easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
>>
>> Hence my recommendation: make the init manager an image feature again
>> and create -systemd and -sysv packages with the corresponding scripts.
>> OpenEmbedded is still for embedded devices where size matters.
>>
>> Of course, systemd can be still a distribution feature to enable things
>> like socket activation as part of PACKAGE_CONFIG.  But dependencies on
>> init system packages should be RRECOMMENDS which can be overridden
>> easily at image creation time.
>
> The trouble is that by making it an "image feature", people will expect
> *everything* to work properly and to be able to have fully functional
> sysvinit and systemd variants of images. We already see this
> expectation. Trying to explain to people what the limitations are, what
> is expected to work and what isn't will be difficult. I know you
> understand this but going forward most people will simply not and I
> think it will be a nightmare for usability.

You said you already see it so what is the change? For me less
flexibility is more problem and the result are more ugly hacks. I've
been using the systemd system in meta-oe in product for long time and
it works fine. In same distro I build other product with is sysvinit
based and it also works fine.

Now I have a nightmare in upgrade path, a change in the way my
customer work and as a plus the need to make two different
distributions for same product. No sense to me.

Final result? This product won't go out of danny as I won't be able to
provide an usable upgrade path without forking OE or having an insane
amount of bbappend hacks.

> For that reason I'd rather see this done in a different way, for example
> blacklisting the problematic systemd dependencies at image generation
> time with some kind of stronger BAD_RECOMMENDS code. Yes, this means
> there would be some systemd config files lying around but you'd stop the
> main bulk of it coming in (and as you said, some small config files
> aren't an issue).

Check the amount of changes for do_install_append has sent today. This
was all not need with the code we had and which works fine. This is
just duplicated code all over recipes. Seriously the systemd
integration was done in complete wrong way in my POV. It broght up
problems we have fixed and do major improvements in meta-oe ... at no
profit.

I know it is not the better thing to read but I think it is nice when
we receive feedback as it allows for rethink of our path of work.

Regards,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


