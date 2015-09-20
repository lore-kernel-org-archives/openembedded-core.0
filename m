Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4B172A78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 18:56:40 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so47940756igc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=s2z9AUd+1VzKjx4IEpJj6Ll+e1h9+qee9Gld9MP2Vl8=;
	b=uLIIRxhy5Z2t0lLPRM/7eZM7qtrMK1posN6t1Qw6dXkHfnbHUvmrJFm0MDr2vbY8Oh
	uPZ0PYVo27FCajj1y46poM+ARhRSSJbtWAtSyN9vaLcX3Eg32XrKqfCdRUoTkZDo4hsl
	+nZnioP+JWLNjNTWFPZSRLfxBkTj5mse5AIT3qG6DwTLUazzNEDE8UjpE9X1L97FYLBw
	T5c2s2g/2UJDkWnScSU3eQGP270ZqChi/6PJ/BP7ajYVtumKCbWRb2NB/F8FkfOVve6X
	3LYP8N2aW+xMjlSLg/Gxfe3aaoD/q0DaBi5w1CYKR3XQA+TLQw5P3NdUTYg1K6DZxBUp
	exbQ==
MIME-Version: 1.0
X-Received: by 10.50.80.6 with SMTP id n6mr2617893igx.78.1442775400477; Sun,
	20 Sep 2015 11:56:40 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Sun, 20 Sep 2015 11:56:40 -0700 (PDT)
In-Reply-To: <CALbNGRTZJYeAwLJteymkcTt7qjhG+3gq1RGk3HkG7DdXfSmzoA@mail.gmail.com>
References: <CALbNGRTZJYeAwLJteymkcTt7qjhG+3gq1RGk3HkG7DdXfSmzoA@mail.gmail.com>
Date: Sun, 20 Sep 2015 20:56:40 +0200
Message-ID: <CALbNGRQXjVqur0JbQ_4Kdrmwq+1HkZ3g-pghXdKKKpd6b-P=Vg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: First run postinst broken
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
X-List-Received-Date: Sun, 20 Sep 2015 18:56:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2015 at 12:30 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> on images build with current master the postinsts for first run on
> target are broken. Looking into
>
> 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service'
>
> I would expect
>
> '/etc/*-postinsts'
>
> in the image created for packets creating
>
>  '<package>.postinst returned 1, marking as unpacked only,
> configuration required on target.'
>
> in log.do_rootfs. I grepped around but could not find the place
> creating the files '/etc/*-postinsts'. Where are these files supposed
> to be created?
>
> Meanwhile I'll start a build with working configuration to find out
> where they are created...
>
This is interesting: On a system with working
target-first-run-postinst I have also no files/dirs matching
'/etc/*-postinsts'. After first start 'systemct status rub-postinsts'
reports

sh-4.3# systemctl status run-postinsts
=EF=BF=BD=EF=BF=BDrun-postinsts.service - Run pending postinsts
   Loaded: loaded (/lib/systemd/system/run-postinsts.service; enabled;
vendor preset: enabled)
   Active: inactive (dead)
Condition: start condition failed at Sat 2000-01-01 00:02:10 UTC; 15
years 8 months ago

Jan 01 00:02:10 varsomimx6q systemd[1]: Started Run pending postinsts.

Hoppla: systemd says that start condition is not met but start the
service at the same time?!?

The image with 'working' postinst has systemd 219 the 'nonworking'
225. Looking in systemd's commits/News did not give hints but I start
to think that run-postinsts.service was started accidently by a bug in
systemd which is fixed in systemd 225.

Still have some difficulties in understanding the role of
packet-manager and interception scripts. I don't think it is that easy
to remove

ConditionPathExistsGlob=3D#SYSCONFDIR#/*-postinsts

from 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.servi=
ce'

Packagemanager / interception scripts experts welcome..

Andreas

