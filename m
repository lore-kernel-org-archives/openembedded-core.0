Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 56E436B5D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 13:05:25 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id o15so4044844qap.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 05:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hWTYTlgJb+GlNqdvWmTyBCsOHv8HcfiaPZ8QLLBbvCk=;
	b=Hi4pJrCwDi+cVIn8IBF5SjJFAa6D5cwx0358hkQslww8HmG7LmIXHbrmR675JMYbbr
	WYr0qLadv62D9mk969J7j73S2BgJ8A19misQ1C60hhRAwv3QMRwNozjWGl/NIf7JIEHq
	5Ri3RoumYnmPEObiS0vJzKvJ/4NRQn7O2cGaNeZx/UwkbBh01KLdCIGLsLaYBsr+40vs
	fXK+V9ltYsmeqEhhDG5ssUebh29EgjWWnSH8LOO4LY8IuxHXI4jaw//V4htU4JNrZo5W
	QFbbKYynTFzeVaxDRZQ/pwSIo7vqBT8mbODCJYUja0R5qWl6gIzzcA6AVSf02PQAiwsS
	QXZA==
X-Gm-Message-State: ALoCoQkSugxdLZMd8wBQjvMHYWNN4nH0MH29m9mj3n7cs/1ymitJI2lrOdAm+IA9ZOzK+WaCSt8B
X-Received: by 10.224.98.139 with SMTP id q11mr16285362qan.64.1393506326572;
	Thu, 27 Feb 2014 05:05:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 27 Feb 2014 05:05:06 -0800 (PST)
In-Reply-To: <cover.1393256563.git.liezhi.yang@windriver.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 13:05:06 +0000
Message-ID: <CAJTo0Lb=a40bP3R-YtSoxeixcKaPjASwiXU8617cfMSqx4cKMw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5 V2] refactor the archiver*.bbclass
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
X-List-Received-Date: Thu, 27 Feb 2014 13:05:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Having a look at this and playing with my own toy archiver makes me
think that this shouldn't be using the postfuncs at all.

The main task, deploy_archives, should depend on the subtasks that it
needs and be simply ordered before do_build.  I see that your code
does this but changes it to be before do_rootfs if the recipe is an
image: I'm not sure I understand why this is as do_rootfs is just a
task that executes before do_build so this shouldn't need
special-casing.

Why did you implement the subtasks as postfuncs instead of normal
tasks?  This has the effect of causing more work to be done if the
archiver needs to run: for example do_ar_unpacked() is a postfunc on
do_unpack so either enabling/disabling the archiver or editing the
archiver class causes the do_unpack hash to change, so everything
afterwards (do_patch, do_configure, do_compile, ...) has to
re-execute.

My toy archiver was implemented as a new task which is after do_fetch
but before do_build.  This means that it executes after fetch has
completed but is outside of the
fetch->patch->configure->compile->install sequence.

https://github.com/rossburton/meta-ross/blob/master/classes/rearchiver.bbclass

(it also has a way of archiving the original sources in a way that
actually archives the original sources)

Ross

