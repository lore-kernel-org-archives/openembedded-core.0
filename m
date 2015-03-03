Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E4C3D65DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 12:54:22 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id le20so6460637vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 04:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XhvdtWcQo0J1pjCfW5KATVD8L+U1qJ0VLtN7mAM25+4=;
	b=cR9skkRLpFs8xoEQII7/4+42lBnW6xhUti8ruyRTo5gHcmLxEjcaxw0B38ckzkJjXm
	q+kFSVm6ewSl7jqepjxhEJua0YVXDYxiA0UKgsj+cQTfADVWBE26FwTRbCX++kVRAgSo
	FRQ/RWZQVm9908BCbVvADUF8SaZrBOpwuPCxsTd47LNrgwL981NrQ56Tkwckq/QtCWEE
	2Tr/zuSm6rvQusac698ZC3HBQMPgvyFhjnoqSeS9g6bnAJBTAvo0LsX9b3WLW0jTz/o2
	SO509uPT1AOXlWnvNWP+42j8uA/Z9pKUG9zSZgXlN9PJ1GE3kqNlqPw/DICM3MfO1kkV
	JEeQ==
X-Gm-Message-State: ALoCoQlACRCEGufJFHxiD9XCKzxg/P4KemSq4zsThUJPc/EPYX653ZcmT2DRWDN/UWz4WKNyoYx6
MIME-Version: 1.0
X-Received: by 10.52.146.171 with SMTP id td11mr9022523vdb.48.1425387263666;
	Tue, 03 Mar 2015 04:54:23 -0800 (PST)
Received: by 10.52.124.76 with HTTP; Tue, 3 Mar 2015 04:54:23 -0800 (PST)
In-Reply-To: <1842926.0Cr3xtp9ZT@peggleto-mobl5.ger.corp.intel.com>
References: <alpine.LFD.2.11.1502271553110.8885@localhost>
	<1842926.0Cr3xtp9ZT@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 3 Mar 2015 12:54:23 +0000
Message-ID: <CAPhnLPBf86qXk_WSA8NcWu_5KdDu6BiUFfOHkMJXMEU+WeiRvA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: inconsistency with adding LICENSE lines to images
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
X-List-Received-Date: Tue, 03 Mar 2015 12:54:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 March 2015 at 11:25, Paul Eggleton <paul.eggleton@linux.intel.com> wro=
te:
> On Friday 27 February 2015 15:58:32 Robert P. J. Day wrote:
>>   just noticed the following ... in OE image definition files under
>> recipes-core:
>>
>> core-image-base.bb
>> core-image-minimal.bb
>> core-image-minimal-dev.bb
>> core-image-minimal-initramfs.bb
>> core-image-minimal-mtdutils.bb
>>
>> it *seems* to make sense that image definitions that require or
>> include other core image bb files don't need to add the line:
>>
>> LICENSE =3D "MIT"
>>
>> as they pick it up from the include'd or require'd file, but image
>> recipe files that
>>
>> inherit core-image
>>
>> *do* need to define their own license.
>>
>>   but if one then goes under recipes-extended/images, it looks a bit
>> strange as, for example, here's core-image-full-cmdline.bb:
>>
>> DESCRIPTION =3D "A console-only image with more full-featured Linux syst=
em \
>> functionality installed."
>>
>> IMAGE_FEATURES +=3D "splash ssh-server-openssh"
>>
>> IMAGE_INSTALL =3D "\
>>     packagegroup-core-boot \
>>     packagegroup-core-full-cmdline \
>>     ${CORE_IMAGE_EXTRA_INSTALL} \
>>     "
>>
>> inherit core-image
>>
>>   so ... what's the licensing there? this image inherits directly from
>> core-image, but doesn't define a license? am i misunderstanding the
>> need for a license?
>
> There shouldn't be a need to set this for image recipes whether they inhe=
rit
> image or core-image, since recipes don't generally distribute any files o=
ther
> than those that come from packages that they include (which have their ow=
n
> licenses) - it wouldn't be practical to list all of the licenses for all =
of
> the components of the image, that is what we produce the license manifest=
 for.
>
> On the other hand, if you re-enable do_fetch and add files to SRC_URI wit=
hin
> the image recipe (which should generally be avoided but is done in rare c=
ases
> - build-appliance-image is one example) then you probably ought to be
> concerned with the LICENSE value. Having said that I don't know if the li=
cense
> manifest logic actually looks at the LICENSE value for the image at all, =
I
> suspect it does not.

It doesn't. It actually should in this case (and probably all cases).
Once An=C3=ADbals patches that fix some of the performance issues we've
been seeing in license.bbclass hit master, let's fix that. That said,
there are other license manifest issues with build-appliance.

Example from the build-appliance recipe:

cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/

Right there, as we're not necessarily building out all those downloads
in that build run, we're not getting all of that captured within the
manifest. So, essentially, the manifest for ba is inaccurate unless
DL_DIR is completely empty.

I think build-appliance is going to have to be a very special case
when it comes to creating a manifest for it.

-b

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release

