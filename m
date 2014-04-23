Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id BCC3760DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:29:17 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id lh14so880212vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=dk3tmwHqhsQoujcjmnu7EaQPsNIhTa3VVTJp5xiJkDc=;
	b=Z4dNs2ZyGfObTyoHbnS3dwMqQ3LxlD0dbkYNQ5TWMyv1EZXpEqkweWn7P7fzuu8nGa
	wQytXQJSHRp/AO0jl082eZzjg/TmfWf1wn7mV44SvrZznWPFfVsLcEx89n/yPpG6leob
	zOjuq3bM3aPn7/UfaHZXsOVUDLuWj6peDTwtYGRJwp9HlS6OxOCw+MShk69Azj19Vze/
	BxNr722OTuZzcXeU9SfnkOtIHGMPz8LNqV1MnrITKIqRl7OpKiB/FQRXujSpwe0uPcB0
	FluSbiXBX8xXDdcDPZWKy+85ijxBOYS6/xfTr7LWPlL0Q11y6UU6iDBsxOv1DulRKbYj
	spqQ==
X-Received: by 10.221.4.66 with SMTP id ob2mr2017487vcb.28.1398248957642; Wed,
	23 Apr 2014 03:29:17 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Wed, 23 Apr 2014 03:28:37 -0700 (PDT)
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
References: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 23 Apr 2014 11:28:37 +0100
X-Google-Sender-Auth: xHRynt6_aDUJNsesX6BdXNAZEVk
Message-ID: <CANyK_8cBY=H2vGYH9B7=5AdjCHoiP1AY_xk0o80+YcCuL8zG5g@mail.gmail.com>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest developer oriented improvements
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
X-List-Received-Date: Wed, 23 Apr 2014 10:29:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 April 2014 10:26, Stoicescu, CorneliuX
<corneliux.stoicescu@intel.com> wrote:
> Hello,
>
> During the 1.6 development/testing cycle we introduced and used oe-selfte=
st more and more for QA purposes to identify various issues in the master b=
ranch. For those who don't know yet what is oe-selftest, it is a python uni=
t test based testing framework designed to simulate poky external usage pat=
terns. What we basically do is translate test case steps into python classe=
s and methods. This is useful both in reducing QA workload and the coverage=
 of our tests. For more information please visit the oe-selftest wiki page:=
 https://wiki.yoctoproject.org/wiki/Oe-selftest
>
> What we would like oe-selftest to be useful with as well is helping devel=
opers quickly test their patches before submission. With this in mind, we c=
ame up with some ideas but we also encourage everyone to contribute with th=
eirs.
>
> Test suites can be created from existing automated tests and accessed usi=
ng command-line options. For example, using 'oe-selftest --test-suite type=
=3Drecipe target=3Dman' would test the recipe man and 'oe-selftest --test-s=
uite type=3Dclass target=3Dbuildhistory' would test the buildhistory class.
>
> 1)   Testing recipes updates or new recipes
>
> Even though we cannot test every single scenario or the functionality of =
a recipe, we could create a test suite that would:
> - build the recipe with all major architectures(qemux86, qemux86-64, qemu=
arm, qemuppc, qemumips)
> - rebuild the recipe from sstate(with or without a sstate file for the re=
cipe)
> - perform cleaning operations on the recipe(cleansstate)
> - force all major tasks on the recipe (bitbake -C <task> <recipe>)
> - selectively use each combination of .bbappend files with the recipe; al=
l the combinations should not break the recipe build.
> - we could also create mini test suites just for some of these tests like=
 testing only the rebuild from sstate.
> (any experience from common recipe build fails can be helpful here)
>

I'd really like to see this, it could cut down on cases where
something works for one developer but then hits an edge case when sent
to the autobuilder.

I can also see 'type=3Dpackage' being useful, to check that a generated
package installs cleanly in an image. For example, if package x
contains a file which clashes with something already installed on
core-image-minimal, 'bitbake x' won't show this but 'bitbake
core-image-minimal' with 'IMAGE_INSTALL +=3D x' set will do.

Taking that a step further, that image could then be booted in qemu
and the relevant ptest suite ran. I'm not sure how that would be
automated myself or how the ptest log and results would be pulled off
the qemu image but if it is possible I think it would be a very useful
option.

I also think it would be helpful to have options for a 'quick' test
and a 'full' test. For some of my projects I have recipes which aren't
pushed upstream to oe-core, meta-oe, etc and have a fairly restricted
use-case. A quick test that just targets the current value of MACHINE
and maybe skips some tests which would be expected to take a longer
time could be very helpful.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

