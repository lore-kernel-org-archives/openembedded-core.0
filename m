Return-Path: <sstncr@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id F187A60CFC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jun 2014 12:39:10 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id b13so3672937wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Jun 2014 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dXGIwSNZocGYCdzq0IvBqbnZgJnCwdFU637LPTUrK7Y=;
	b=iKA4Y7grc9Alad1S1yNcReVBKiuL7vewI5gI134FjExoijEqG6wCnarD+o4ZhzEXg/
	7i1Z5TOxeG229khhqhtPbzG8rvslMTIcwp9f23Y3MwAbwX4pa9pOwng6UDpaosyli7S8
	MRtHCQri4tlL0fIahS4InYJK29nOQ/P/Zn45P/XOmj8lhp7ASX24bXAiKNWbZQdyDWIX
	8wN+1DSgeT5x/RcV6yohqBzIspGHZ7HFewZUw0nBcW2EsGqjb/AfBXW7Fpoj1T+t0RKA
	OyAWZmhCtWLMsxEOlGAqdeJXPLS3N/VwNiyddzxLEkaOvWAZ1Y7bWr1eNKeOAAlCQU/C
	HmnA==
MIME-Version: 1.0
X-Received: by 10.180.184.198 with SMTP id ew6mr5183271wic.13.1402144751030;
	Sat, 07 Jun 2014 05:39:11 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Sat, 7 Jun 2014 05:39:10 -0700 (PDT)
In-Reply-To: <CANr+NRtrdE5Rn7LEkPTUrJxRXmYRazcZzzscCawu8r=ERbxLyA@mail.gmail.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
	<1402082078-10826-7-git-send-email-corneliux.stoicescu@intel.com>
	<CANr+NRtrdE5Rn7LEkPTUrJxRXmYRazcZzzscCawu8r=ERbxLyA@mail.gmail.com>
Date: Sat, 7 Jun 2014 15:39:10 +0300
Message-ID: <CANr+NRvJd=vo=BOA+iXimFqeLb6_aarniLMA8ciZ38BxZ0rGVg@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/7] controllers/masterimage.py: Make testimage kernel naming pattern universal
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
X-List-Received-Date: Sat, 07 Jun 2014 12:39:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jun 7, 2014 at 1:54 PM, Stefan Stanacar <sstncr@gmail.com> wrote:
>
> On Jun 6, 2014 8:11 PM, "Corneliu Stoicescu" <corneliux.stoicescu@intel.com>
> wrote:
>>
>> YB: #6254
>>
>> The QemuTargetControl class does not specify any kernel naming but the
>> runqemu script it uses uses the " KERNEL_IMAGETYPE + MACHINE + '.bin' "
>> naming scheme.
>> Modifying the other major target controller class,
>> MasterImageHardwareTarget, to use the same kernel naming scheme.
>>
>
> You can't do that because not all targets (bbb, nuc, etc) use a bin
> kernel...
>
Ah, misunderstood... right, there is .bin link too

>> This is usefull also to outside scripts that want to anticipate the kernel
>> file name for all target controllers.
>
> And what's wrong with the link? Bitbake will always take care of that and
> point to the real file why can't the script dereference that?
>
> Cheers,
> Stefan
>
>>
>> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
>> ---
>>  meta/lib/oeqa/controllers/masterimage.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/controllers/masterimage.py
>> b/meta/lib/oeqa/controllers/masterimage.py
>> index b03c5bf..311f0cf 100644
>> --- a/meta/lib/oeqa/controllers/masterimage.py
>> +++ b/meta/lib/oeqa/controllers/masterimage.py
>> @@ -52,7 +52,7 @@ class
>> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
>>          # test rootfs + kernel
>>          self.image_fstype = self.get_image_fstype(d)
>>          self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
>> d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
>> -        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
>> d.getVar("KERNEL_IMAGETYPE"))
>> +        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
>> d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
>>          if not os.path.isfile(self.rootfs):
>>              # we could've checked that IMAGE_FSTYPES contains tar.gz but
>> the config for running testimage might not be
>>              # the same as the config with which the image was build, ie
>> --
>> 1.8.3.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

