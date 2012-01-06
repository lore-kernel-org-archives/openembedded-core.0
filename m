Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RiyRq-00022f-Bv
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 02:18:22 +0100
Received: by dake40 with SMTP id e40so553795dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 17:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6Zm4ovMVThjP4sxgLhVEy05Z6YnS/hkJBXAlPQBPwKg=;
	b=A+WYbyf5pw1ochZ7pfi2eCYMpXIwcMsPOzdLKU6du8oEmvT8YD8Svdt1bnxCX8ExIE
	th+nr6JN4BFspaTyRUbNCHTexDynbe8Ue/q5kNkx6FJNTlDvuocnw2JhFdsN+L7Q+rwy
	QD+TdGgxbh0tM9pA2+9KL4l5APBJ51R8OpKww=
MIME-Version: 1.0
Received: by 10.68.201.136 with SMTP id ka8mr10557893pbc.1.1325812254676; Thu,
	05 Jan 2012 17:10:54 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Thu, 5 Jan 2012 17:10:54 -0800 (PST)
In-Reply-To: <CAAQYJAtV9moez4thDcRtbm_0w=b+F_q2ag344PiUytRe_g-ysg@mail.gmail.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com> <4F03982D.1080601@linux.intel.com>
	<CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
	<CAAQYJAvu-n9eyXV8kj3=34_wzhdfec5Nit9uUy_ar=jFK1tFaQ@mail.gmail.com>
	<1325766615.20759.67.camel@ted> <4F0633EB.9030708@linux.intel.com>
	<CAAQYJAtV9moez4thDcRtbm_0w=b+F_q2ag344PiUytRe_g-ysg@mail.gmail.com>
Date: Fri, 6 Jan 2012 02:10:54 +0100
Message-ID: <CAAQYJAuYB9ChOe2bri=W_iT6DEasyXdCE0Xtp=wC34zwLayzkw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 01:18:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 2:00 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Jan 6, 2012 at 12:36 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 01/05/2012 04:30 AM, Richard Purdie wrote:
>>> On Thu, 2012-01-05 at 01:05 +0100, Andrea Adami wrote:
>>>> I'd say we have to test for the in-existence of the file instead of
>>>> blindly touching it.
>>>> Smthg like
>>>>
>>>> if [! -e ${IMAGE_ROOTFS}/init]; then
>>>> touch ${IMAGE_ROOTFS}/init
>>>> fi
>>
>> Why? Touch creates it if it doesn't exist and updates the modtime if it
>> does. It doesn't modify the content of the file if it exists. What is
>> the motivation for testing for it's existence?
>>
> touch fails with Permission denied because one package in my rootfs
> already created the symlink
>
Now I'm building from scratch and can't tell you which permission have
the binary and the symlink in my rootfs.

>>>>
>>>>
>>>> Now, repeating that block for all 4 cpio images is a bit ugly... better ideas?
>>>
>>> Make it a shell function we call? I'd also check for
>>> ${base_sbindir}/init first too?
>>
>> Why check for that? So we can link to it instead of creating an empty file?
>
> Nonsense, kernel looks for /init
> ( http://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
> )
>

Sorry if it wasn't clear , it was meant for RP comment about base_sbindir

>> Why check for that? So we can link to it instead of creating an empty file?
I think is best to let the recipe populate the initramfs as they want
and create themselves the symlink.

There are just many scenarios..

Cheers

Andrea

>>
>>
>> --
>> Darren
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> Regards
>
> Andrea


