Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6963A6AF21
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:54:45 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id jw11so1116246veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 08:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=/XIYRtLq56c0zgPXz9qQ5zUavpL/q5K/1bUaQEwk1Fs=;
	b=mbVmgCRj45Y/NQf04c6JWRv+TWS0DARIqJEdJOjAEZiAJYsdzEzarygqMjG92LFALM
	093Bv8akRkYlaJUXAnxHkOBsetr5f8ABttsTHgp7O/RGtFIPlqYGLciDpVE2K9IQbgGU
	9QxL6R50Wj8K/ITyBNPuAgMqH9ksvDYNSytsUbLfe8l/uRcWu6N6I+JOoMM6vCtu/CHX
	GiMPT+jefKxudgfZImkZsAZapGlxY5XbGmKTPLtGZoy/I8E7GDXv8jdx2dV1+cTJPDwY
	3vFhLHyLGI8+7429ubGqeMNx29boYo0hSYRN/dRh/RIv5r/ZKc7CSgE2sZMlk4tLMnj+
	0a7w==
X-Received: by 10.58.171.4 with SMTP id aq4mr3500124vec.26.1372953286094; Thu,
	04 Jul 2013 08:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 08:54:25 -0700 (PDT)
In-Reply-To: <51D5971D.3020103@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
	<CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
	<51D5971D.3020103@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 16:54:25 +0100
Message-ID: <CAJTo0Lb1OL_efxK_y04r_4r8RkqfrefP9hUT-FxWQ24oCOu1yw@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQnuPru+xm4w508EiduyJMnGXBBBXavHHD3sRZTKH6m/0LXV7DsuzZX+jtgnuF9MDB1/uy8B
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/5] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Thu, 04 Jul 2013 15:54:46 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 16:39, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> Doing this in postinst is pretty nasty,
> Nasty, in what way? How is this line different from the previous line in
> the same postinstall? That one is also using sed to change 'halt' to
> 'reboot' for qemuarm. Is it the sed you're worried about? This
> postinstall is executed on host anyway, at do_rootfs().

The existing sed to manipulate the exec line is arguably a better
solution to making this package machine-specific and special-casing
just qemuarm.  (I'm not sure why it special-cases qemuarm, and
751212d5effdceab91d95705e647cf07e6820940 where it was introduced
doesn't clarify matters, but we'll ignore that for now).  Arguably,
but I'm not sure I agree.  Anyway, you've a path that is known at
build time so we can fix it at build time.  Instead of using install,
you can use sed.  Just because we *can* run postinst scripts when
generating the rootfs doesn't mean we *should*, do_install is for
installing the files we're going to package, and postinst is for
runtime changes that can't happen at any other time.

>> instead change the desktop
>> file to contain something like @SBIN@ and run it through sed in
>> do_install.
> Even though the change you're proposing is OK, involves changing the
> desktop file to add the @SBIN@ pattern and move the sed line to
> do_install(). Compared to having one single line added in the
> postinstall... I would choose the latter, unless you elaborate on what
> do you actually mean by "nasty".

We're not being invoiced based on the number of patch hunks, and
changing /sbin to @SBIN@ and install to sed isn't exactly a massive
time sink.

Ross

