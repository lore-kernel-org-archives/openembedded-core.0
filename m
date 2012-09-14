Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TCd2S-0004Xo-Ls
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 23:03:01 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Sep 2012 13:50:23 -0700
Received: by qatn12 with SMTP id n12so251223qat.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 13:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=5NgMdomW2w0UpQSuMPjEeIaKwP4IJxAlaQRNz+98Ico=;
	b=VT+10wL95YeXoopbF2GuTfXrRYeT+79QuNsZS/StxD1dbi0GCTAtHvVKehT9GHdeFX
	b3tW6INDnSpoZM3W29dQiXUYe0f/XrHCXLCGsVuOWxJ2OJiUSMphUJ2h2+LjpJjTIjfy
	zQPI5ZDb5uOKYsfPsQEaCbAPtUix14v51CimKo5bNzXwvnGdbahbTgeJ+ClTjELeJU72
	xwaV4LQzbwueBqZPC6XvEdbK7jJwMO669LqZtwxBQg4ZnLk4P6GTwb3Q+YyvR/bb+9/f
	O+ZtB4Ur9IMWBEIASxHP2iajuAAsVeS48C5X8SXFup/J6qNxeUJAC1UKlCsoefCpwxAU
	rysA==
MIME-Version: 1.0
Received: by 10.224.42.78 with SMTP id r14mr10202288qae.19.1347655822182; Fri,
	14 Sep 2012 13:50:22 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Fri, 14 Sep 2012 13:50:22 -0700 (PDT)
In-Reply-To: <50535FC5.9040802@windriver.com>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<22844638.2V3OiWsK3u@helios> <5052617D.7080206@linux.intel.com>
	<1347638477.13596.21.camel@ted> <50535FC5.9040802@windriver.com>
Date: Fri, 14 Sep 2012 13:50:22 -0700
Message-ID: <CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQljoFDeeF5nDNpybrN+u5dWbxWGt5EgXR13wGG1ynAQ0yTCA8k7mEJn/PITFlHxkOjBb7N7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
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
X-List-Received-Date: Fri, 14 Sep 2012 21:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 14, 2012 at 9:48 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/14/12 11:01 AM, Richard Purdie wrote:
>>
>> On Thu, 2012-09-13 at 15:43 -0700, Saul Wold wrote:
>>>
>>> On 09/13/2012 03:31 PM, Paul Eggleton wrote:
>>>>
>>>> On Thursday 13 September 2012 12:26:19 Saul Wold wrote:
>>>>>
>>>>> Make sure to find -package, this was causing a failure
>>>>> in the multi-lib build license generation during rootfs.
>>>>>
>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>> ---
>>>>>    meta/classes/license.bbclass |    2 +-
>>>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/license.bbclass
>>>>> b/meta/classes/license.bbclass
>>>>> index 29fe938..b29067c 100644
>>>>> --- a/meta/classes/license.bbclass
>>>>> +++ b/meta/classes/license.bbclass
>>>>> @@ -88,7 +88,7 @@ license_create_manifest() {
>>>>>         # list of installed packages is broken for deb
>>>>>         for pkg in ${INSTALLED_PKGS}; do
>>>>>                 # not the best way to do this but licenses are not arch
>>>>> dependant iirc
>>>>> -               filename=`ls
>>>>> ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
>>>>> +               filename=`ls
>>>>> ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
>>>>>                 pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
>>>>>
>>>>>                 # exclude locale recipes
>>>>
>>>>
>>>> Surely this could end up matching a the wrong file when one package name
>>>> is a
>>>> substring of another?
>>>>
>>> I am open to ideas here, I tried the ${MLPREFIX}, but it seems to be
>>> empty when rootfs runs, that did not help, I thought about adding the
>>> '-', but that would fail in the non-multilib case, how can I determine
>>> what the prefix will be to get a more accurate match?

I'm not particularly happy with how we've been doing manifests for a
while now and have been hacking at a revamp of it for the past 2
months on and off.

We really shouldn't be relying on package data at all for license
manifests. As the manifests are relying on list_installed_packages,
they end up inaccurate anyway as list_installed_packages does exactly
that. List software installed via package. Not installed via the
package manager? Then you aren't in the manifest. This ends up missing
quite a few things necessary from a release engineering standpoint
(like, hey, modutils? The kernel? Not listed in the manifest. IMHO
this is wrong.)

As a release engineer, I kind of don't really care if the software on
my image was installed via the packaging system. I just want a list of
what is on the images so I can audit my images to ensure GPL
commitments.

One way I've been looking at fixing this is via event handlers. I'll
have some code for RFC on this hopefully soon, but a preview (which
may or may not work it's still a WIP) is at:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=eflanagan/license_manifest

One thing the patch I've been working on does other than creates
accurate manifests is it also tries to create a semi-compliant SPDX
1.0 manifest.

I know this is late in the cycle so it might not make 1.3, but this
may be something we want to look at to end up solving this issue once
and for all.

-b

>>
>>
>> I would observe here that this probably works for ipk and multilib and
>> only breaks for multilib+rpm. The reason is that rpm collapses the
>> namespace when it creates the package list so "lib32-bash" becomes bash.
>> I think this might be an error in however we generate the INSTALLED_PKGS
>> list and we might need to revisit the rpm mechanism and ensure the
>> multilib prefixes get added.
>
>
> RPM has internal mechanisms to tag both the filetypes and architectures as
> being different, unlike most of the other packaging formats which assume a
> package with the same name is the same.
>
> The way to deal with this is via the mapping actions.  You should be able to
> map from ML_PREFIX-${PN} to ${PN}.${ARCH} and of course the reverse...
>
> How it works....
>
> So during package generation we know the package arch is unique and just
> strip off the mlprefix.  To do the reverse iterate over all of the available
> MULTILIBS, there is code in rootfs_rpm.bbclass already to do this.  Then
> reconstruct the package name based on the multilib configuration.
>
> --Mark
>
>
>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


