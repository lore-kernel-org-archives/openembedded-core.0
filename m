Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id CC7FD60FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:49:02 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id x18so2135941lbi.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CdpyyQQvSIWng2MVowqYNt73Gq1qx695N9KpOq9a2i8=;
	b=eTSlQ56ziql6B6nB9LKS6aDktNpo9vJI4a2tkCha45L9XPEoT8G11KkD6StM0GFKXO
	pCSIkoF4iuoyU8Fo2TMjEv5LYW3++ZKEEGcledA3JOJsMQgM2gzRpDQonV4RciSUFBxo
	fwoL2DshdE4YYT9jGDx7mWV5IvOt3n11TeUn0OYxa7yp8QEsp0bLIhg/QOcnRZvoS3fo
	VtnwWmcEpnnUYowoNUUVq3EZuMl24uX7J/tnK5PPo+nOzJPGccG0MsUnVb7LAtgwB/ob
	i+EVr3DFsoqqgXykeodUxsCgap0YkfUyb68J7G2hfRLMbnrgs95GfGaHdr7hXl0kaexO
	ORUA==
MIME-Version: 1.0
X-Received: by 10.112.156.74 with SMTP id wc10mr336077lbb.44.1379080142354;
	Fri, 13 Sep 2013 06:49:02 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 13 Sep 2013 06:49:02 -0700 (PDT)
In-Reply-To: <1628869.GrtJx7trgC@helios>
References: <1379054574-8526-1-git-send-email-sgw@linux.intel.com>
	<20130913084724.GC11500@jama> <1628869.GrtJx7trgC@helios>
Date: Fri, 13 Sep 2013 09:49:02 -0400
Message-ID: <CADkTA4PZJt_qT3UcSrTZLuruBkj4XEy0Z7gZVhhndTLRYc11Tw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: bjorn.arnelid@xdin.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Fix typo for KERNEL_FEATURES
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
X-List-Received-Date: Fri, 13 Sep 2013 13:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 13, 2013 at 5:19 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 13 September 2013 10:47:24 Martin Jansa wrote:
>> On Thu, Sep 12, 2013 at 11:42:54PM -0700, Saul Wold wrote:
>> > Thans to Bjorn Arnelid for finding this
>> >
>> > Cc: bjorn.arnelid@xdin.com
>> >
>> > [YOCTO #5173]
>> >
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> > ---
>> >
>> >  meta/conf/machine/include/qemu.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/machine/include/qemu.inc
>> > b/meta/conf/machine/include/qemu.inc index a78622d..8557777 100644
>> > --- a/meta/conf/machine/include/qemu.inc
>> > +++ b/meta/conf/machine/include/qemu.inc
>> > @@ -26,4 +26,4 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>> >
>> >  EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
>> >
>> >  # Provide the nfs server kernel module for all qemu images
>> >
>> > -KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
>> > +KERNEL_FEATURES_append_pn_linux-yocto = " features/nfsd/nfsd-enable.scc"
>>
>> Wait a minute, isn't _pn-foo correct override?
>
> It is. Bjorn and I discussed this on IRC already, this patch shouldn't be
> applied. He's switched back to the linux-yocto 3.2 kernel and I guess that
> feature is not available/working there, thus this change did fix his build
> failure as it effectively disabled the line. Perhaps we should fix the
> underlying bug instead? Bruce, any suggestions?

Outside of that there's no underlying bug or at least it is something
that is working
as it should ?

Linux yocto 3.2 didn't have that underlying feature, so combining the
master/1.5 qemu.inc
that is looking for that feature with the older tree will cause that
to warn and then
stop the build before some missing functionality is silently dropped.

To get around it, the KERNEL_FEATURES can be cleared (via a finalize handler
as an example), the same kernel feature can be provided by an update to that
kernel's meta-data, or as a userspace feature (but the feature
relative path will
be the issue). I have something for this in the 1.6 planning.

Anyway, rather than trying to be to fancy or complex and speed up 1.6 work, my
suggestion is to just clear the variable in a bbappend if working on
the 3.2 kernel
with this .inc

and again, by clear, I mean something like the following .. which I just happen
to have kicking around:

---------------------------------------------
# This handler has the ability to clear KERNEL_FEATURES, but should
# be used carefully since clearing KERNEL_FEATURES breaks the "contract"
# between layers and what the kernel provides
python kernfeatures_handler () {
    if not isinstance(e, bb.event.RecipeParsed):
        return

    kernfeatures_clear = e.data.getVar( 'KERNEL_FEATURES_CLEAR' )
    if kernfeatures_clear:
          e.data.setVar('KERNEL_FEATURES', "")

    kernfeatures_force = e.data.getVar( 'KERNEL_FEATURES_FORCE' )
    if kernfeatures_force:
          e.data.setVar('KERNEL_FEATURES', kernfeatures_force )
}
addhandler kernfeatures_handler
---------------------------------------------

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

