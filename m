Return-Path: <krirobo@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5471F601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 10:30:53 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wm4so256116obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QepkgB+qP6LPUoA1qaUpwZdjbOn1CiOvLasgin5FoaY=;
	b=HS9XWGqYj6dQrVV7obbivLEx8dfh6h7xbAxxQQ33w/PK6OumIwZk8IlUsY6bpOB8yl
	NrvJ+25WbXlKJXqcM7orzLUJ2TkpUOIZm8q13pytRotmlJMdO8XCZCtb8T+b7vByQoHV
	bswdjXmT3pUzt24ckpPxsckVXuCZHG04O/3fkEKo5Qk1UJvgrCX6Uw94082uIeIwtGNW
	8sWmfsXgba30pbI2Aj5KZqwKhuT+URTIon2T9DdRk+Af0LsBZPwwCk4gGQ5xTUorDmWO
	6W/JLBs2LjYAmfLFIxIFsyChoI/u5YLIjkWakGP9E+ZNjKV3WhDTINUAig1uVSXt0d5o
	FDQw==
MIME-Version: 1.0
X-Received: by 10.202.86.82 with SMTP id k79mr1669975oib.58.1414492253650;
	Tue, 28 Oct 2014 03:30:53 -0700 (PDT)
Received: by 10.76.150.38 with HTTP; Tue, 28 Oct 2014 03:30:53 -0700 (PDT)
In-Reply-To: <1414450784.7967.112.camel@ted>
References: <1398958819.30460.86.camel@ted>
	<CAFgGSN7et4nS+yD39199rF+7mgHkfApmQ5E9M4u=Zvzw-gGSkg@mail.gmail.com>
	<1414450784.7967.112.camel@ted>
Date: Tue, 28 Oct 2014 11:30:53 +0100
Message-ID: <CAFgGSN6xBxoQpF3wSJMNnyeAnOQ-MDTAr4DqJ4adXb9MgEnEpw@mail.gmail.com>
From: Kristof Robot <krirobo@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-common: Only apply fpu settings to target gcc
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
X-List-Received-Date: Tue, 28 Oct 2014 10:30:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 27, 2014 at 11:59 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-10-27 at 20:54 +0100, Kristof Robot wrote:
>> Richard, all,
>>
>> After bisecting, I found that, since this patch, my toolchain is being
>> built with soft floating point support, while it should be built with
>> hard floating point support:
>>
[snip]
>> I am using DEFAULTTUNE = "cortexa7hf-neon-vfpv4", resulting in
>> following build configuration parameters:
>>     TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard vfpv4 cortexa7"
>>     TARGET_FPU        = "vfp-vfpv4-neon"
>
> When building in OE, we always pass in the correct flags to gcc to
> ensure the correct thing gets built. The option you're changing with the
> revert just changed the default used by gcc if no option is specified on
> the commandline, so the change of the above test isn't a surprise.
>
> What is the real world problem you're seeing due to this? Is it caused
> by some compiler flags not being passed in somewhere?

The real world problem is a compilation of the meta-ros libfreenect
library [1] for a Cubieboard2 [2] - this build fails because the
compiler fails to find <gnu/stubs-hard.h> (only gnu/stubs-soft.h is
available).
In other words, somehow libfreenect (correctly) expects hard floating
point, but then runs into troubles as the toolchain is (incorrectly)
compiled using soft floating point.
See also [3], which describes a similar problem, and [4], which seems
to provide relevant info.

More generally, I would actually assume that everything is being built
hard floating point, as a result of the provided DEFAULTTUNE =
"cortexa7hf-neon-vfpv4".

Isn't this the correct way to force hard floating point?

Thanks!

Kristof

[1] https://github.com/bmwcarit/meta-ros/blob/master/recipes-extended/libfreenect/libfreenect_0.2.1.bb
[2] http://cubieboard.org/2013/06/19/cubieboard2-is-here/
[3] https://gcc.gnu.org/ml/gcc-help/2013-02/msg00141.html
[4] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61796

