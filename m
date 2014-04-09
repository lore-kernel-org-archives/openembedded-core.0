Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id DE13E65E28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 16:18:16 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so1332952lbi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Apr 2014 09:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=YvnIWwhfA3cyiZvPHw4C+WCWHetN53jKXXUrVHEqqfQ=;
	b=aaPUgXlAhBM5tBVuMH/F/34POawusw8KIckTxX+qwnfluzIiqcnTQRqgT+gbojGhAt
	t1I7y6qI1RxrugrAUrK2ipuern909ZQ/+zUnGaJ4cXeB7Z+jF0h+0TqcK2d5V7Yl8HY6
	H/WIf0eZd8YzPdW/wdUnsRvFbfv4HX/00ahnJk6h5AVbByCBWYXas7yYpHhc1jFeb6rz
	04+FS6Vv2FFIQVAS4bA7dh0e1GII+NelRUp7NAQgjt++o5GCEQJQySXV4OIAc/2AgQS7
	cF9R48DS+kqEn2CYodCUXdgaWXvftTlkaJ+atYjYXxb82KZmqlEyW2ZOIiFltBwdoMrg
	JKAA==
X-Gm-Message-State: ALoCoQkzeIMUTB6LZjlM1Iu81QkIpI7CNOWBvP4rj4RScz3O8AOOm9rWWdgrPFfYMyyZRMzx4PUY
MIME-Version: 1.0
X-Received: by 10.152.43.70 with SMTP id u6mr8060756lal.3.1397060296563; Wed,
	09 Apr 2014 09:18:16 -0700 (PDT)
Received: by 10.112.145.229 with HTTP; Wed, 9 Apr 2014 09:18:16 -0700 (PDT)
In-Reply-To: <CABcZANmMZ4LDyk+iG=MveJZKi66JukS65o3W8Muo_HrFymgxWA@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
	<CAGNsrLC-RbVJd+uD15XTto9oYFQHrWckBnoGWBjLZ+k6bLvcsQ@mail.gmail.com>
	<CABcZANmMZ4LDyk+iG=MveJZKi66JukS65o3W8Muo_HrFymgxWA@mail.gmail.com>
Date: Wed, 9 Apr 2014 19:18:16 +0300
Message-ID: <CAGNsrLDUXVSukrJCg=rs8AuT6DTa6y_kfnZTUVroFm0-zb3qwQ@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Wed, 09 Apr 2014 16:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 April 2014 18:02, Chris Larson <clarson@kergoth.com> wrote:
>
> On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>
> wrote:
>>
>> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra <fathi.boudra@linaro.org>
>> > wrote:
>> >>  do_install() {
>> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
>> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
>> >> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>> >>  }
>> >
>> > can you explain/document this change
>>
>> sure. trace-cmd doesn't have a build system generated Makefile. It's
>> hand written.
>> To do the install properly, one has to pass prefix/plugin_dir.
>> In addition, the previous command in the recipe doesn't do the right
>> thing anymore (you'll end with duplicated prefix /usr/usr/).
>
>
> You don't need to avoid the use of oe_runmake to pass variables in, that's
> what EXTRA_OEMAKE is for :) See
> https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a version
> of this fix that uses it instead.

You don't need oe_runmake or EXTRA_OEMAKE to properly build and
install the files in the right path either :)
You can even drop inherit pkgconfig pythonnative since they aren't
used. My version is also slightly shorter to achieve the same goal.

All in all, I don't mind which version is taken as long as we update
the one in oe-core.

Cheers,
Fathi

