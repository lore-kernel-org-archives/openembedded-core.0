Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 787476AC93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:43:01 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wm4so524955obc.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 19:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gEhnRYG5vviXDZ4H3OSraYPxZaGUHEkTy3VrD3cOtek=;
	b=VD/F/3yqX3e8RWF2Jypmmz4pKfZdtSCeXxLt3DNTSjxNojnwmKnY1J8NHa2lj2p/4O
	J9u9mRtSDGxLa5FNJY4Lv2R5vpAZD1uA4vbNlXisEF+/+SPL8qj4lgqqzdbU6icrxOHM
	Ejprjn/O+dHAc+Vgyw38Tu58cJ5U1rQNAU5HQ2+9C4ElyFL8hDVoZ1z1CTRTlNNOlROq
	8o/QNTzhtdbmophcRwzTKAmxdWIFKJkYbHJ3nZJIhoaKPljNI0G3uwfJtmO+dRZ0egiF
	33MHKACZvMaE+UBDi4INZek9Br2YENEpT/BAIc16iFFI4L6Lk2YQmJLrgxrWBoDViA/1
	fnQA==
MIME-Version: 1.0
X-Received: by 10.60.76.41 with SMTP id h9mr39860802oew.13.1405046582217; Thu,
	10 Jul 2014 19:43:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Thu, 10 Jul 2014 19:43:02 -0700 (PDT)
In-Reply-To: <1404936934.15985.48.camel@ted>
References: <1404936934.15985.48.camel@ted>
Date: Thu, 10 Jul 2014 23:43:02 -0300
X-Google-Sender-Auth: SJMbU85XpFx1bqTCL4bI58v1s0A
Message-ID: <CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 02:43:05 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

(added meta-freescale mailing list as it is related to meta-fsl-arm)

On Wed, Jul 9, 2014 at 5:15 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Its possible to run the package QA checks as a separate task rather than
> as part of the do_package task. This offers more parallelism but the
> fact that made me propose this is that ideally we'd like to access
> pkgdata to help add new tests and to do that, we need to run later in
> the task list. We also need to add in RDEPENDS to the task which apply
> to do_package_write_* but not do_package. See the subsequent patches
> for why this is desireable.
>
> If we split into a separate task, we need to add in calls to read
> the sub package data, build the cache structure used by do_package and
> cover the task with sstate (which is empty and just acts as a stamp
> saying it passed package QA). We also need to handle our own
> dependencies.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

When I see a RFC serie I expect people to wait some days /for
comments/. I learned today those are already merged and /no comment
time/ has been given.

The problem I found is that running the QA checks in another task
seems to break some use-cases.

In the libfslcodec (it is a binary blob provided by Freescale for
multimedia) we have:

...
python populate_packages_prepend() {
    ...
    # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
    # the source we cannot fix it. Disable the insane check for now.
    for p in d.getVar('PACKAGES', True).split():
        d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")

        if p == 'libfslcodec-test-bin':
            # FIXME: includes the DUT .so files so we need to deploy those
            d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel libdir")
        else:
            d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel")
    ...
}

In this case the INSANE_SKIP var is not being set on time. If we check
the value it is being set but it seems to be too late.

How we can address it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

