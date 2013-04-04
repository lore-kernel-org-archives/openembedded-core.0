Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNePI-0007bv-2v
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 09:16:34 +0200
Received: by mail-oa0-f46.google.com with SMTP id k1so2406320oag.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PFN1sGu9Zibbl1BVBhH1aCHJHcalXSeFDPUZTHvNIO8=;
	b=u49Tf6xbaDucvEVCVod1YWW671KNo2M4ttnoi4HH1jMZvPF3JQJFKqieUu3fk3rRUC
	5YqT+Ongx/RcWaA0o1GB58qYPGZ+WyfW3/TlszOKhRBwNmTAT22TH2t3b+ZedybcV96r
	A3yUgXPN7LyF2rIFusvrnG8JDlSCQgOxql3OyqpTsJvLOhx5jrqWt2xLKzXm8DgUhcmW
	zyPQ/UgPq98BIjggihoNpMd6Ze357oyuPspMHMRKLoSPXwa8WYq6R/LS7fdZP/bawcAI
	pJkGhB+fjiKe7MjS0nXq8mDn3AvzJI0hKtZagbyEakUpxUGTaTjKeAcQaiZHA0dEcaie
	3TUA==
MIME-Version: 1.0
X-Received: by 10.182.127.115 with SMTP id nf19mr3175278obb.49.1365058751259; 
	Wed, 03 Apr 2013 23:59:11 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Wed, 3 Apr 2013 23:59:11 -0700 (PDT)
In-Reply-To: <CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
Date: Thu, 4 Apr 2013 08:59:11 +0200
Message-ID: <CAGiJk9eHjN5mUAiyYx3n_0wVeNzPKkzc-y3cVruKSfw4S=8jTg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 04 Apr 2013 07:16:34 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/3 Burton, Ross <ross.burton@intel.com>:
> On 3 April 2013 15:51, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>> When we decide that we handle standard behavior different than the
>> rest of the world, then this patch is basically a fork of systemd.
>> Also we tell every affected software developer:
>> "No your software won't work with OE-core / Yocto Project without
>> adaption, we are incompatible with the systemd standard to make life
>> more comfortable for (some of) us"
>
> Changing the default target depending on the use of the image isn't
> really the same as forking systemd, and we're not making anything
> incompatible.

Please read above what I wrote to Richard.

>
>>> How would you implement this?  Register the alternative in systemd.bb
>>> defaulting to graphical, and then switch it in every image recipe in
>>> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
>>> shortly) session?
>>
>> If this works why not?
>> It sounds like a good idea, because this way would not break anything,
>> and we would be compatible with the standard systemd.
>
> Obviously the nuances of my sentiment were lost as it was transcribed to ASCII.
>
> I'm advocating changing the default target to multi-user and then
> patching the two recipes where X session scripts are packaged to also
> set the target to graphical.  People switching to systemd who don't
> use the standard X sessions (they roll their own, or don't use X, or
> whatever) will notice quickly that the default target needs to be
> changed, and can do it in their graphical startup recipes.
>
> You're suggesting leaving the default target as graphical and changing
> uncountable numbers of *image recipes* to override the default target,
> the alternative being errors in the log.

Image inheritance will hopefully reduce the number of required changes.

>
> So far "the community" disagrees on the approach here - we've had
> vocal objections to errors in the log for any image, changing the
> default target, and the other proposals.

The seen error is a warning IIRC.
Breaking something to fix a warning somewhere else seems like a bold move.
Being incompatible with systemd standards to archive this seems to be
a very odd compromise.

>
> We *do* need a way of changing the default target.  Do we at least all
> agree that update-alternatives is a logical way of changing it on a
> per-image basis?

Yes it is required to have the possibility to change the target where needed.
I guess update-alternatives will do the job.



--
Regards
Samuel


